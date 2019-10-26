var pPath_DEFAULT_PRIORITY = 1;
var pPath_LEVELS = [4, 3, 2, 1];

// -----------------------------------------------------------------------------
// Public interface
// -----------------------------------------------------------------------------

/**
 * Sorts courseList based on "count" method of priority
 * @param {Course[]} courseList list of courses to be sorted
 * @returns {undefined}
 */
function pCount_sortCourseList(courseList) {
    pCount_addPriorityToCourses(courseList);
    pCount_sortCoursesAfterPrioritySet(courseList);
}

/**
 * Sorts courseList based on "longest path" method of priority
 * @param {Course[]} courseList list of courses to be sorted
 * @returns {undefined}
 */
function pPath_sortCourseList(courseList) {
    pPath_addYearPriority(courseList);
    pPath_addPreReqPriority(courseList);
    pPath_SortList(courseList);
}

// -----------------------------------------------------------------------------
// pCount Implimentation
// -----------------------------------------------------------------------------

/**
 * Adds priority attribute to courses passed based on "count" method
 * @param {Course[]} courseList courses to add priority to
 * @returns {undefined}
 */
function pCount_addPriorityToCourses(courseList) {
    for (var course of courseList) {
        var count = 0;
        course.dependentCourses = [];
        for (var otherCourse of courseList) {
            if (isPrereq(course.courseCode, otherCourse)) {
                count++;
                course.dependentCourses.push(otherCourse);
            }
        }
        course.pCount = count;
    }
}

/**
 * Sorts courses based on priority attribute previously set
 * @param {type} courseList list of courses to be sorted
 * @returns {undefined}
 */
function pCount_sortCoursesAfterPrioritySet(courseList) {
    for (var i = 1; i < courseList.length; i++) {
        var swap = courseList[i];
        for (var j = i - 1; (j >= 0) && (swap.pCount > courseList[j].pCount); j--) {
            courseList[j + 1] = courseList[j];
        }
        courseList[j + 1] = swap;
    }
}


// -----------------------------------------------------------------------------
// pPath Implimentation
// -----------------------------------------------------------------------------
/**
 * Addd the priority to the courses based based on the year of the course
 * @param {Course[]} courseList list of course to add the priority to
 * @returns {undefined}
 */
function pPath_addYearPriority(courseList) { //This function takes an array of course objects, checks the first number of the cCode, and assign default priority counters accordingly
    for (var i = 0; i < courseList.length; i++)
        courseList[i].yearPriority = pPath_readcCode(courseList[i].courseCode);
}

/**
 * This function accepts a cCode String attribute of a course object, and returns the level of the course
 * @param {string} code
 * @returns {number} The priority that should be assigned to the course based on the year of the course
 */
function pPath_readcCode(code) {
    return pPath_LEVELS[code.match(/\d/) - 1];
}

/**
 * This function accepts an array of course objects, and modifies the prereqPriority attribute of each object
 * @param {Course[]} courseList the list of course to assign the priority to
 * @returns {undefined}
 */
function pPath_addPreReqPriority(courseList) {
    for (var i = 0; i < courseList.length; i++) {
        var preReqInfo = pPath_addPreReqPriorityCourse(courseList[i], courseList);
        courseList[i].pPath = preReqInfo.count;
        courseList[i].preReqOfStrList = preReqInfo.preReqOfStrList;
    }
}

/*
 * Returns the number of courses that follow from this course via all branches
 * @param {type} course course to be checked
 * @param {type} courseList list of courses to check against
 * @returns {Number|pPath_DEFAULT_PRIORITY}
 */
function pPath_addPreReqPriorityCourse(course, courseList) {
    var result = {count: pPath_DEFAULT_PRIORITY, preReqOfStrList: course.courseCode + ","};
    var pathcount = 0;
    for (var i = 0; i < courseList.length; i++) {
        if (isPrereq(course.courseCode, courseList[i])) {
            pathcount++;
            var tmp = pPath_addPreReqPriorityCourse(courseList[i], courseList);
            result.count += tmp.count;
            result.preReqOfStrList += `${pathcount}{ ${tmp.preReqOfStrList}} `;
        }
    }
    return result;
}

/*
 * Does nothing used for comparison with the other methods
 * @returns {undefined}
 */
function pNothing() {}
;

/**
 * Sorts courses based on sum of priorities
 * @param {Course[]} courseList the course list to be sorted
 * @returns {undefined}
 */
function pPath_SortList(courseList) {
    courseList.sort(
            function (a, b) {
                a.sortVal = a.pPath + a.yearPriority;
                b.sortVal = b.pPath + b.yearPriority;


                var result;
                if (a.sortVal < b.sortVal)
                    result = 1;
                else if (a.sortVal === b.sortVal)
                    result = 0;
                else
                    result = -1;

                return result;
            }
    );
}
