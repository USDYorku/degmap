/* global conHIGH_SCHOOL_MATH_COURSE_CODE */

// File currently full filling DB requirement. Expected to be removed once
// the DB is setup

var dataCourses;
// THIS SELF INVOKING FUNCTION RUNS AS SOON AS THE FILE IS LOADED POSSIBLY
// BEFORE THE ONLOAD AND HOPEFULLY THE DATA SHOULD BE READY BEFORE IT IS NEEDED
(function dataPulldataCoursesFromDBtoRAM() {
    dataGetFromLink("courses.json", dataFilldataCourses);
}());

/**
 * Receives the call back with the data then it calls manAddMaunalCourses to
 * add the manually added courses. Then passes the data through the parsing
 * alrorithm then sets it to the global variable.
 *
 * @param {type} data
 * @returns {undefined}
 */
function dataFilldataCourses(data) {
    manAddMaunalCourses(data);
    dataParse(data);
    dataCourses = data;
    console.log(dataCourses);
}

/**
 * Setups the call back to get data from a link
 * @param {String} link where to get the information from
 * @param {function} callback function to call when data is ready
 * @returns {undefined}
 */
function dataGetFromLink(link, callback) {
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            callback(JSON.parse(this.responseText));
        }
    };
    xmlhttp.open("GET", link, true);
    xmlhttp.send();
}

/**
 * Goes through the entries of the array passed and extracts the prerequisites
 *
 * @param {Array} data the datafile to be updated
 * @returns {undefined}
 */
function dataParse(data) {
    for (var i = 0; i < data.length; i++) {
        data[i].prereqText = dataGetPrereqText(data[i].about);
        data[i].prereq = dataGetPrereq(data[i].prereqText);
    }
}

/**
 * Extracts the prerequisite text from the string passed
 *
 * @param {String} aboutTxt the text to extract the prerequisite text from
 * @returns {String} extracted prerequisite text
 */
function dataGetPrereqText(aboutTxt) {
    var startIndex = aboutTxt.indexOf("Prerequisite");
    if (startIndex < 0) {
        startIndex = aboutTxt.indexOf("Pre-requisite");
        if (startIndex < 0) {
            console.log("No Prerequisite");
            return '';
        }
    }

    var result = aboutTxt.slice(startIndex);
    var endMarkers = [
        "revi", //previous
        "exclusion",
        "ormer", //formerly
        "oreq", //Corequisites
        "NCR" // Used in exclusions
    ];
    var changeMade = true;
    while (changeMade) {
        changeMade = false;
        for (var i = 0; i < endMarkers.length; i++) {
            var endIndex = result.lastIndexOf(endMarkers[i]);
            if (endIndex >= 0) {
                if ("revi" !== endMarkers[i] || endIndex !== result.lastIndexOf("reviously completed")) {
                    result = result.slice(0, endIndex + 1);
                    changeMade = true;
                }
            }
        }
    }

    return result;
}

/**
 * Takes prerequisite text and extracts the actual prerequisites in the format
 * needed by the application. Splits the text and sends the segments to be
 * extracted individually.
 *
 * @param {String} prereqText text to extract the prerequisites from
 * @returns {Array} extracted prerequisites
 */
function dataGetPrereq(prereqText) {
    var prereqStrList = prereqText.split(";");
    // TODO: Add split on "and"

    var result = [];
    for (var str of prereqStrList) {
        var prereq = dataGetPrereqFromStr(str);
        if (prereq.length > 0)
            result.push(prereq);
    }
    return result;
}

/**
 * Takes the text passed and finds the options avilable to fullfil this
 * this requirement
 *
 * @param {String} str expected to contain different options to fulfill
 *      the requirement
 * @returns {Array} options that can fulfill the requirement
 */
function dataGetPrereqFromStr(str) {
    var allowHighSchoolMath =
            str.indexOf("4U Math") >= 0 ||
            str.indexOf("MCV4U") >= 0 ||
            str.indexOf("MHF4U") >= 0;
    var result = str.match(/(\w{4}|\w{3}).\d{4}/g);
    if (!result) {
        if (allowHighSchoolMath) {
            return [conHIGH_SCHOOL_MATH_COURSE_CODE];
        } else {
            return [];
        }
    }

    if (allowHighSchoolMath) {
        result.push(conHIGH_SCHOOL_MATH_COURSE_CODE);
    }

    var INVALID_CODES = ["Fall", "the", "from"];
    function checkResultForInvalidCodes(value) {
        var result = false;
        for (var i = 0; i < INVALID_CODES.length && !result; i++) {
            result = value.indexOf(INVALID_CODES[i]) >= 0;
        }
        return result;
    }

    for (var i = result.length - 1; i >= 0; i--) {
        if (checkResultForInvalidCodes(result[i]))
            result.splice(i, 1); //Remove lines with invalid course codes
        else
            result[i] = result[i].replace(/\s+/g, '');
    }
    return result;
}

/**
 * Searches the in RAM array and returns an object with the data from it
 * if found otherwise null
 *
 * @param {String} courseCode the course code to look for
 * @returns {Object | null}
 */
function dataGetCourse(courseCode) {
    if (dataCourses) {
        for (var i = 0; i < dataCourses.length; i++) {
            if (dataCourses[i].code === courseCode) {
                return {
                    courseCode: courseCode,
                    courseName: dataCourses[i].name,
                    prereq: dataCourses[i].prereq,
                    prereqText: dataCourses[i].prereqText,
                    about: dataCourses[i].about,
                    credits: dataCourses[i].credit
                };
            }
        }
    } else {
        console.log("RAM Data not loaded yet");
    }

    console.log("No Data Found for " + courseCode);

    return null;
}

/**
 * Filters out the list of computer science courses that have the specified
 * level. Only EECS courses without 2nd digit 1-4 (5 may be used as elective
 * but is not a major credit)
 * 3000- and 4000-level EECS courses are divided into four areas as follows:
 * 1 - theory and numerical computation (second digit is 1),
 * 2 - systems (second digit is 2),
 * 3 - software development (second digit is 3) and
 * 4 -applications (second digit is 4)
 *
 * @param {String} level can be "3", "4" or "34" for 3000-, 4000- or both
 * @returns {Array}
 */
function dataGetCS(level) {
    var re = new RegExp("EECS[" + level + "][1-4]\\d\\d");
    var result = [];
    for (var i = 0; i < dataCourses.length; i++) {
        if (re.test(dataCourses[i].code)) {
            result.push(dataCourses[i].code);
        }
    }
    result.sort();
    return result;
}