/* global pPath_sortCourseList, pCount_sortCourseList, pNothing */

var modMAX_COURSES_PER_SEMESTER = 3;
var modFAIL_SAFE_BREAK = 1000;

/**
 * Receives arrays with courses and returns a set of options for
 * completing the degree.
 * @param {Course[]} inputCourseReq List of courses to be taken
 * @param {Course[]} inputCourseSatisfied List of courses already satisfied
 * @returns {Array} options for completing the degree
 */
function modGenerateOpts(inputCourseReq, inputCourseSatisfied) {
    modCleanLists(inputCourseReq, inputCourseSatisfied);

    modEnsureNeededPrereqInRequiredList(inputCourseReq, inputCourseSatisfied);

    var output = [];

    var priorityAlgos = [pCount_sortCourseList, pPath_sortCourseList, pNothing];
    for (var i = 0; i < priorityAlgos.length; i++) {
        var workingCourseReq = modCopyList(inputCourseReq);
        var workingCourseSatisfied = modCopyList(inputCourseSatisfied);

        priorityAlgos[i](workingCourseReq, workingCourseSatisfied);

        option = []; //Array of semesters
        output.push(option);

        var completed = false;
        var failSafeCount = 0;
        do {
            failSafeCount++;
            if (failSafeCount > modFAIL_SAFE_BREAK) {
                console.log("ERROR LOOP OVERRUN");
                return output;
            }

            var semester = modCreateSemester(workingCourseReq, workingCourseSatisfied);
            if (semester.length !== 0) {
                modTransferCourses(semester, workingCourseReq, workingCourseSatisfied);
                option.push(semester);
            } else {
                if (workingCourseReq.length !== 0) {
                    console.log("ERROR workingCourseReq not empty. Length: " + workingCourseReq.length);
                    console.log("Remaining courses are: " + conArrayToString(workingCourseReq));
                    return output;
                } else {
                    completed = true;
                }
            }
        } while (!completed);
    }

    return output;
}

/**
 * Ensures that it is possible to finish the degree with the courses presently
 * in the required list. That is that there are no courses that the
 * prerequisites are not also on the list.
 *
 * @param {Course[]} inputList
 * @param {Course[]} satisfiedList
 * @returns {undefined}
 */
function modEnsureNeededPrereqInRequiredList(inputList, satisfiedList) {
    var addedCourses = false;
    for (var course of inputList) {
        if (!course.isPreReqMet(inputList) && !course.isPreReqMet(satisfiedList)) {
            for (var prereqOptionList of course.prereq) {
                // Check if this OptionList is met to see if any need to be registered at all
                var shouldAddOption = true;
                for (var prereqOption of prereqOptionList) {
                    if (
                            modHasCourseWithCode(prereqOption, inputList) ||
                            modHasCourseWithCode(prereqOption, satisfiedList)) {
                        shouldAddOption = false;
                        break;
                    }
                }

                // TODO: Notify user that courses needed to be added (Should be caught on
                // input screen instead. In preparation I've moved the code that clears the
                // input to after this method so that we can use an exception to stop it and
                // give the user choices as to how to deal with this
                if (shouldAddOption) {
                    // Just adding the first for now instead of all until we work out how this should be handled
                    inputList.push(Course(prereqOptionList[0]));
                    addedCourses = true;
                    console.log(prereqOptionList[0] + " NEEDED for " + course.courseCode + " but not in required courses addded to required courses");

//                    for (prereqOption of prereqOptionList) {
//                        inputList.push(modCreateCourse(prereqOption));
//                        console.log(prereqOption + " NEEDED for " + course.courseCode + " but not in required courses addded to required courses");
//                    }
                }
            }
        }
    }
    if (addedCourses) {
        conUserMsg("Some prereqes were added to the courses needed to be done");
    }
}

/**
 * Checkes a course code to see if a course requires this as a prereq
 *
 * @param {String} courseCode code to check for
 * @param {Course} courseToCheck course to check in
 * @returns {Boolean} true if courseCode is a prereq for courseToCheck
 */
function isPrereq(courseCode, courseToCheck) {
    for (var prereqOptions of courseToCheck.prereq) {
        for (var prereqOption of prereqOptions) {
            if (prereqOption === courseCode) {
                return true;
            }
        }
    }
    return false;
}

/**
 * Cleans input lists by removing items satisfied from reqList
 *
 * @param {Course[]} reqList list of required courses to be cleaned up
 * @param {Course[]} satisfiedList list of courses already satisfied
 * @returns {undefined}
 */
function modCleanLists(reqList, satisfiedList) {

    // Remove courses from Req if already satisfied
    for (var i = reqList.length - 1; i >= 0; i--)
    {
        var removed = false;
        for (var j = 0; j < satisfiedList.length && !removed; j++)
        {
            if (typeof satisfiedList[j] === "undefined") {
                // TODO: Remove debugging code
                console.log("Found an undefined at j = " + j);
            }
            if (typeof reqList[i] === "undefined") {
                // TODO: Remove debugging code
                console.log("Found an undefined at i = " + i);
            }
            if (satisfiedList[j].courseCode === reqList[i].courseCode) {
                reqList.splice(i, 1); // remove line
                removed = true;
            }
        }
    }

    // Remove Duplicates from reqList
    for (var i = 0; i < reqList.length; i++) {
        for (var j = reqList.length - 1; j > i; j--)
            if (reqList[j].courseCode === reqList[i].courseCode) {
                reqList.splice(j, 1); // remove line
            }
    }
}

/**
 * Create a Course[] from the string[] passed
 * @param {string[]} stringArray
 * @returns {Course[]}
 */
function modCreateCourseObjectArray(stringArray) {
    var result = [];
    for (var courseCode of stringArray) {
        result.push(Course(courseCode));
    }
    return result;
}

/**
 * Check arrayOfCourseObjects to see if courseCode is in it
 *
 * @param {String} courseCode value to search for
 * @param {Course[]} arrayOfCourseObjects array to search in
 * @returns {Boolean} true if courseCode is in arrayOfCourseObjects
 *      otherwise false
 */
function modHasCourseWithCode(courseCode, arrayOfCourseObjects) {
    var hasCourse = false;

    for (var i = 0; i < arrayOfCourseObjects.length; i++) {
        if (courseCode === arrayOfCourseObjects[i].courseCode) {
            hasCourse = true;
        }
    }
    return hasCourse;
}

/**
 * Copies and returns the list passed
 *
 * @param {Array} srcList list to be copied
 * @returns {Array} copy of the list passed
 */
function modCopyList(srcList) {
    var clonedArray = [];
    for (var i = 0; i < srcList.length; i++) {
        clonedArray[i] = srcList[i];
    }
    return clonedArray;
}

/**
 * Fills a semester from courseReq ensuring that prereqs are met
 * using courseSatisfied and that the semester is not over filled
 *
 * @param {Course[]} courseReq list of courses to be done
 * @param {Course[]} courseSatisfied list of courses already done / not needed to be done
 * @returns {Array} array of courses that satisfy the requirements
 */
function modCreateSemester(courseReq, courseSatisfied) {
    var result = []; // The semester to be returned

    for (var i = 0; (i < courseReq.length) && !modSemesterFull(result); i++) {
        if (courseReq[i].isPreReqMet(courseSatisfied)) {
            result.push(courseReq[i]);
        }
    }
    return result;
}

/**
 * Checks if the array constitutes a full semester
 *
 * @param {Array} semester list of courses for the semester
 * @returns {Boolean} true if the semester is full otherwise false
 */
function modSemesterFull(semester) {
    return semester.length >= modMAX_COURSES_PER_SEMESTER;
}

/**
 * Simulates a semester having been completed. It moves the courses from
 * courseReq to courseSatisfied
 *
 * @param {Array} semester array of courses done in that semester
 * @param {Course[]} courseReq courses remaining to be done
 * @param {Course[]} courseSatisfied courses already done
 * @returns {undefined}
 */
function modTransferCourses(semester, courseReq, courseSatisfied) {
    for (var i = 0; i < semester.length; i++)
    {
        for (var j = 0; j < courseReq.length; j++)
        {
            if (courseReq[j] === semester[i]) {
                courseSatisfied.push(semester[i]);
                courseReq.splice(j, 1);
            }
        }
    }
}