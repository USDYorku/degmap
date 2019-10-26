/**
 * Retuns the Array of Faculties
 *
 * @returns {Array} Array of faculty objects
 */
function dbGetFaculties() {
    return [{id: 1, name: "Lassonde"}, {id: 2, name: "LAPS"}];
}

/**
 * Gets the programs for the specified faculty
 *
 * @param {String} facultyID Faculty ID of the faculty to return the programs for
 * @returns {Array} Array of program objects
 */
function dbGetPrograms(facultyID) {
    var result = [];
    if (facultyID === "1") {
        result = [
            {id: 1, name: "BACHELOR PROGRAM (BA) 2018-2019"},
            {id: 2, name: "Honours Major Program (Honours BA) 2018-2019"}
        ];
    } else if (facultyID === "2") {
        result = [
            {id: 3, name: "Accounting"},
            {id: 4, name: "Advocacy and Public Engagement Training Minor"},
            {id: 5, name: "African Studies"},
            {id: 6, name: "American Sign Language"}
        ];
    }
    return result;
}

/**
 * Returns the list of program requirements for the specified programID
 *
 * @param {String} programID The ID of the program to get the list for
 * @returns {Array} Array of program requirement objects
 */
function dbGetProgramRequirements(programID) {
    var result = [];
    if (programID === "1" || programID === "2") {
        result = [
            {id: 1, name: "Program Core", courses: dbGetCoursList(1), allRequired: true},
            {id: 2, name: "Alternates For Core", courses: dbGetCoursList(2), allRequired: false},
            {id: 3, name: "At least three credits from", courses: dbGetCoursList(3), allRequired: false},
            {id: 4, name: "At least three credits from", courses: dbGetCoursList(4), allRequired: false}
        ];
    }

    if (programID === "1") {
        result.push(
                {id: 5, name: "At least six additional credits from computer science courses at the 3000 level",
                    courses: dbGetCoursList(5), allRequired: false});
    }

    if (programID === "2") {
        result.push(
                {id: 6, name: "Additional Mandatory Courses",
                    courses: dbGetCoursList(6), allRequired: true});
        result.push(
                {id: 7, name: "At least 12 credits from computer science courses at the 4000 level",
                    courses: dbGetCoursList(7), allRequired: false});
        result.push(
                {id: 8, name: "At least 36 credits at the 3000 or higher level (18 either)",
                    courses: dbGetCoursList(8), allRequired: false});
        result.push(
                {id: 9, name: "At least 18 credits must be at the 4000 level",
                    courses: dbGetCoursList(9), allRequired: false});
    }

    result.push(
            {id: 99, name: "Other",
                courses: dbGetCoursList(99), allRequired: false});
    return result;
}

/**
 * Returns the list of courses that match the ID passed
 *
 * @param {Number} courseListID the ID for the list of courses desired
 * @returns {Array} Array of course objects
 */
function dbGetCoursList(courseListID) {
    var result = [];
    if (courseListID === 1) {
        result = [
            "EECS1001", "EECS1012", "EECS1019", "EECS1022", "EECS2001",
            "EECS2011", "EECS2021", "EECS2030", "EECS2031", "EECS3101",
            "EECS3311", "MATH1090", "MATH1300", "MATH1310"
        ];
    } else if (courseListID === 2) {
        result = ["MATH1013", "MATH1014", "MATH1021", "MATH2221"];
    } else if (courseListID === 3) {
        result = ["EECS3221", "EECS3215"];
    } else if (courseListID === 4) {
        result = ["EECS3401", "EECS3421", "EECS3461"];
    } else if (courseListID === 5) {
        result = dataGetCS("3");
    } else if (courseListID === 6) {
        result = ["MATH2030", "EECS3000"];
    } else if (courseListID === 7) {
        result = dataGetCS("4");
    } else if (courseListID === 8) {
        result = dataGetCS("34");
    } else if (courseListID === 9) {
        result = dataGetCS("4");
        //TODO: Needs to be extended to outside of ComSci for this one
    } else if (courseListID === 99) { //Other option for all programs
        result = ["MATH1025", "ITEC3220"];
    }
    return result;
}

/**
 * Searches the DB returns an object with the data from it
 * if found otherwise null
 *
 * @param {String} courseCode the course code to look for
 * @returns {Object | null}
 */
function dbGetCourse(courseCode) {
    return dataGetCourse(courseCode);
}