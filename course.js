var cCache = {}; //Course object cache

/**
 * Creates a course object that matches the passed courseCode. Will
 * automatically retreive course details from DB if available
 *
 * @param {String} courseCode code of the course to be created
 * @returns {Course} created course object
 */
function Course(courseCode) {
    if (isUndefined(courseCode) || courseCode === "") {
        throw "No course code received";
    }
    var result = cGetCouseFromCache(courseCode);
    if (!isUndefined(result)) {
        return result;
    }

    //not found build new object
    result = {};
    result.courseCode = courseCode;
    result.courseName = "Info Not Found";
    result.prereq = [];
    result.prereqText = "";
    result.credits = 0;
    result.about = "Details not found";
    result.getDisplayText = function () {
        return this.courseCode + " - " + this.courseName;
    };

    result.getPreReqAsHTML = function () {
        if (this.prereq.length === 0) {
            return conWrapText("No Prerequisites");
        }
        var result = document.createElement("span");
        var firstPreReqSet = true;
        for (var prereqOptionList of this.prereq) {
            if (firstPreReqSet) {
                firstPreReqSet = false;
            } else {
                result.appendChild(conWrapText("<br/>AND<br/>"));
            }
            result.appendChild(conWrapText("("));
            var firstInList = true;
            for (var prereqOption of prereqOptionList) {
                if (firstInList) {
                    firstInList = false;
                } else {
                    result.appendChild(conWrapText(" or "));
                }
                result.appendChild(conWrapCoursePreReq(prereqOption));
            }
            result.appendChild(conWrapText(")"));
        }
        return result;
    };

    result.dependentCoursesAsHTML = function () {
        if (isUndefined(result.dependentCourses)) {
            return conWrapText("Info Missing");
        }

        if (this.prereq.length === 0) {
            return conWrapText("No courses have this course as a Prerequisite");
        }

        // TODO Make course codes clickable
        return conWrapText(result.dependentCourses);
    };

    result.toString = function () {
        return this.courseCode;
    };

    result.isPreReqMet = function (satisfiedList) {
        for (var prereqOptionList of this.prereq) {
            var met = false;
            for (var prereqOption of prereqOptionList) {
                if (modHasCourseWithCode(prereqOption, satisfiedList)) {
                    met = true;
                    break;
                }
            }
            if (!met) {
                return false;
            }
        }
        return true; // Loop sucessfully passed, all prereqes met
    };

    // Check DB to get info for course
    var infoFromDB = dbGetCourse(result.courseCode);
    if (infoFromDB) {
        result.courseName = infoFromDB.courseName;
        result.prereq = infoFromDB.prereq;
        result.prereqText = infoFromDB.prereqText;
        result.about = infoFromDB.about;
        result.credits = infoFromDB.credits;
    }

    // Add new object to cache
    cAddToCache(result);
    return result;
}

function cGetCouseFromCache(courseCode) {
    return cCache[courseCode];
}

function cAddToCache(course) {
    cCache[course.courseCode] = course;
}