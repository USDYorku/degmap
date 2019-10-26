/* global Course */

var lastOutput;
var currInput; // Kept synced using CheckBox onclick
var displayState = null; // Used to track what is currently being displayed
const conDISPLAY_STATE_INPUT = "I";
const conDISPLAY_STATE_OUTPUT = "O";
const conHIGH_SCHOOL_MATH_COURSE_CODE = "4UMATH";
window.onload = function () {
    $("facultySection").onchange = conSelectFacultySelect;
    $("programSelect").onchange = conSelectProgramSelect;
    $('coursesPerSemester').onchange = conSelectCoursePerSemester;
    $("reloadProgramBtn").onclick = conProgramBtnClick;
    $("generateOptionsBtn").onclick = conGenerateOptionsClick;
    $("clearCourseDetails").onclick = conClearCourseDetailsClick;
    $("userNotice").onclick = conUserNoticeClick;
    $("additionalControlsBtn").onclick = conAddCtrlsClick;
    $("saveOutputBtn").onclick = conSaveOutputClick;
    $("loadOutputBtn").onclick = conLoadOutClick;
    $("saveInputBtn").onclick = conSaveInputClick;
    $("loadInputBtn").onclick = conLoadInputClick;
    conLoadFaculties($("facultySelect"));
};

/*
 * Add the list of faculties to the passed element
 *
 * @param {select} facultySel the element to add the faculties to
 * @returns {undefined}
 */
function conLoadFaculties(facultySel) {
    var faculties = dbGetFaculties();
    for (var i = 0; i < faculties.length; i++) {
        var opt = document.createElement("option");
        opt.text = faculties[i].name;
        opt.value = faculties[i].id;
        facultySel.add(opt);
    }
}

/*
 * Removes all the elements from the main div
 *
 * @returns {undefined}
 */
function conClearMainContent() {
    conClearAllChildren(conGetMainContentContainer());
    displayState = null;
}

/**
 * Removes all the elements from the element passed
 * @param {Element} element the element to remove all children from
 * @returns {undefined}
 */
function conClearAllChildren(element) {
    while (element.hasChildNodes()) {
        element.removeChild(element.lastChild);
    }
}

/**
 * Event handler for when the faculty drop down is changed. Loads the program
 * drop down with the maching values and clears the courseList as the program
 * drop down will be changed to the default value
 *
 * @returns {undefined}
 */
function conSelectFacultySelect() {
    conClearMainContent();
    var programSelect = $("programSelect");
    conClearSelectOptions(programSelect);
    var selValue = conGetSelectedOptionValue(this);
    var programs = dbGetPrograms(selValue);
    for (var i = 0; i < programs.length; i++) {
        var opt = document.createElement("option");
        opt.text = programs[i].name;
        opt.value = programs[i].id;
        programSelect.add(opt);
    }
}

/*
 * Clears the all the options from the passed select except the default
 *
 * @param {select} select the select to clear the options for
 * @returns {undefined}
 */
function conClearSelectOptions(select) {
    var options = select.getElementsByTagName("option");
    for (var i = options.length - 1; i >= 0; i--) {
        if (conHasClass(options[i], "defDropDownOption"))
            options[i].selected = true;
        else
            select.remove(i);
    }
}

/**
 * Searched the passed select element and find the selected element otherwise -1
 *
 * @param {select} select The element to get find the selected option
 * @returns {Number} The selected value or if none selected -1;
 */
function conGetSelectedOptionValue(select) {
    var result = -1;
    var options = select.getElementsByTagName("option");
    for (var i = 0; i < options.length && result < 0; i++) {
        if (options[i].selected) {
            result = options[i].value;
        }
    }
    return result;
}

/**
 * Event handler for the program button click (Calls the onchange event handler
 * for the select)
 *
 * @returns {undefined}
 */
function conProgramBtnClick() {
    $("programSelect").onchange();
}

/**
 * Event handler for program select. Loads the courses for the selected program
 * into the courseList
 *
 * @returns {undefined}
 */
function conSelectProgramSelect() {
    var selValue = conGetSelectedOptionValue(this);
    var requirements = dbGetProgramRequirements(selValue);
    requirements = conConvertRequirementsToTwoCheckBoxFormat(requirements);

    conDisplayRequrements(requirements);
}

function conDisplayRequrements(requirements) {
    currInput = requirements;
    conClearMainContent();
    displayState = conDISPLAY_STATE_INPUT;
    var mainContentContainer = conGetMainContentContainer();
    for (var i = 0; i < requirements.length; i++) {
        var newContainer = conCreateContainerCourse(mainContentContainer,
                requirements[i].name, requirements[i].id);
        conAddCoursesToList(newContainer, requirements[i].coursesAndCheckboxValues);
    }
    conUpdateSelectedCounts();
}

function conConvertRequirementsToTwoCheckBoxFormat(requirements) {
    var uniqueID = 0; // Auto increment number to get Unique ID
    var result = [];
    for (var i = 0; i < requirements.length; i++) {
        var req = {};
        result.push(req);
        req.id = requirements[i].id;
        req.name = requirements[i].name;
        req.coursesAndCheckboxValues = [];
        for (j = 0; j < requirements[i].courses.length; j++) {
            function getID(RorS) {
                uniqueID++;
                return "" + requirements[i].id + requirements[i].courses[j] +
                        RorS + uniqueID;
            }
            var courseAndCheckBoxValue = {};
            req.coursesAndCheckboxValues.push(courseAndCheckBoxValue);
            courseAndCheckBoxValue.courseCode = requirements[i].courses[j];
            courseAndCheckBoxValue.R = requirements[i].allRequired;
            courseAndCheckBoxValue.S = false;
            courseAndCheckBoxValue.idR = getID("R");
            courseAndCheckBoxValue.idS = getID("S");
        }
    }
    return result;
}

/**
 * Add the courseList passed to the list passed
 *
 * @param {list} list the list to add the courses to
 * @param {Object[]} coursesAndCheckboxValues the courseCodes and CheckBox Values
 * @returns {undefined}
 */
function conAddCoursesToList(list, coursesAndCheckboxValues) {
    for (i = 0; i < coursesAndCheckboxValues.length; i++) {
        var li = document.createElement("li");
        li.id = coursesAndCheckboxValues[i].courseCode;

        li.appendChild(conCreateCheckBox("R", "REQUIRED", coursesAndCheckboxValues[i]));
        li.appendChild(conCreateCheckBox("S", "SATISFIED", coursesAndCheckboxValues[i]));

        // Add text for course
        li.appendChild(conWrapCourseText(
                "span",
                Course(coursesAndCheckboxValues[i].courseCode).getDisplayText(),
                coursesAndCheckboxValues[i].courseCode));

        list.appendChild(li);
    }
}

/**
 * Event handler for Generate Options Button
 * @returns {undefined}
 */
function conGenerateOptionsClick() {
    // TODO: Find a better way to deal with generate clicked repeatedly
    // Right now it just execpts out so nothing happens but this isn't an
    // ideal situation
    var lists = conGetCourseLists();
    var requiredCourses = lists.requiredCourses;
    var satisfiedCourses = lists.satisfiedCourses;

    console.log("Required Courses: " + requiredCourses);
    console.log("Satisfied Courses: " + satisfiedCourses);
    var options = modGenerateOpts(requiredCourses, satisfiedCourses);
    conDisplayOptions(options);
}

function conSelectCoursePerSemester() {
    // TODO: Remove temporary hack to change number of courses per semester
    modMAX_COURSES_PER_SEMESTER = parseInt(conGetSelectedOptionValue(this));
}

function conGetCourseLists() {
    // TODO: Might be easier and more logical to compose this from currInput instead
    var getlist = conGetMainContentContainer().getElementsByTagName("li");
    var requiredCourses = [];
    var satisfiedCourses = [];
    for (var i = 0; i < getlist.length; i++) {
        var checkboxRequired = getlist[i].getElementsByTagName("input")[0];
        var checkboxSatisfied = getlist[i].getElementsByTagName("input")[1];
        if (checkboxRequired.checked) {
            requiredCourses.push(getlist[i].id);
        }
        if (checkboxSatisfied.checked) {
            satisfiedCourses.push(getlist[i].id);
        }
    }

    //High shcool maths required to enter Lassonde so added by default
    satisfiedCourses.push(conHIGH_SCHOOL_MATH_COURSE_CODE);
    // TODO: Allow user to unselect high school maths

    var result = {};
    result.requiredCourses = modCreateCourseObjectArray(requiredCourses);
    result.satisfiedCourses = modCreateCourseObjectArray(satisfiedCourses);
    return result;
}

/**
 * Creates output from options passed
 * @param {Array} options
 * @returns {undefined}
 */
function conDisplayOptions(options) {
    lastOutput = options; // Save output in case user wants to save it
    conClearMainContent();
    displayState = conDISPLAY_STATE_OUTPUT;
    var mainContentContainer = conGetMainContentContainer();
    var summaryElement = $("optSummaryContent");
    conClearAllChildren(summaryElement);
    var optionCounter = 1;
    var semesterCounter;
    for (var otp of options) {
        var heading = `Option  ${optionCounter} (${otp.length} Semesters)`;
        var optionList = conCreateContainerCourse(mainContentContainer, heading);
        summaryElement.appendChild(conWrapText(heading, "p"));
        optionCounter++;

        semesterCounter = 1;
        for (var semester of otp) {
            var elementSemesterList = conCreateContainerCourse(
                    optionList, 'Semester ' + semesterCounter);
            semesterCounter++;
            for (var course of semester) {
                elementSemesterList.appendChild(conWrapCourseText(
                        "li", course.getDisplayText(), course.courseCode));
            }
        }
    }
}

/**
 * Event handler for text that display course info
 *
 * @returns {undefined}
 */
function conDisplayCourseInfoClick() {
    conSetCourseDetails(this.id);
}

/**
 * On click event handler for Clear Course Details button
 * @returns {undefined}
 */
function conClearCourseDetailsClick() {
    conSetCourseDetails("");
}

/**
 * Displays the details for the courseCode passed if assigned otherwise clears
 * the controls related to the course details
 * @param {String} courseCode the course code of the course to display
 * @returns {undefined}
 */
function conSetCourseDetails(courseCode) {
    var headingElement = $("sideContentHeading");
    var prepreqElement = $("prerequisiteContent");
    var descriptionElement = $("descriptionContent");
    var creditsElement = $("creditsContent");
    var dependentCoursesElement = $("dependentCoursesContent");

    conClearAllChildren(prepreqElement);
    conClearAllChildren(dependentCoursesElement);
    if (isUndefined(courseCode) || courseCode === "") {
        headingElement.innerHTML = "Supplementary Info";
        creditsElement.innerHTML = "";
        descriptionElement.innerHTML = "";
        $("outputPriorityContainer").className = " hidden";
    } else {
        var course = Course(courseCode);
        headingElement.innerHTML = course.getDisplayText();
        creditsElement.innerHTML = course.credits;
        descriptionElement.innerHTML = course.about;
        prepreqElement.appendChild(course.getPreReqAsHTML());
        if (displayState === conDISPLAY_STATE_OUTPUT
                && !isUndefined(course.pCount)
                && !isUndefined(course.pPath)
                && !isUndefined(course.dependentCourses))
        {
            $("outputPriorityContainer").className = "";
            $("countContent").innerHTML = course.pCount;
            $("pathContent").innerHTML = course.pPath;
            dependentCoursesElement.appendChild(course.dependentCoursesAsHTML());
        } else {
            $("outputPriorityContainer").className = " hidden";
        }
    }
}

/**
 * Create a checkbox from the parameters passed
 *
 * @param {String} RorS Identified if this is an R or S check box and is also displayed
 * @param {String} tooltipText the tooltip to be shown on hover over the
 *      displyed text
 * @param {Object} courseAndCheckboxValue The information for this check box
 * @returns {Element} the element containing the created checkbox and display
 */
function conCreateCheckBox(RorS, tooltipText, courseAndCheckboxValue) {
    var result = document.createElement("span");
    result.className += "checkBoxContainer";

    // Checkbox
    var checkBox = document.createElement("input");
    checkBox.id = courseAndCheckboxValue["id" + RorS];
    checkBox.RorS = RorS;
    checkBox.courseCode = courseAndCheckboxValue.courseCode;
    checkBox.type = "checkbox";
    checkBox.checked = courseAndCheckboxValue[RorS];
    checkBox.onclick = conCheckBoxClick;
    result.appendChild(checkBox);

    // Displayed Text
    var element = document.createElement("span");
    element.innerHTML = RorS;
    element.className += " tooltip";
    result.appendChild(element);

    // Tooltip
    var tooltip = document.createElement("span");
    tooltip.className += " tooltiptext";
    tooltip.innerHTML = tooltipText;
    element.appendChild(tooltip);

    return result;
}

function conCheckBoxClick() {
    conUpdateInput(this.courseCode, this.RorS, this);
}

function conUpdateInput(courseCode, RorS, checkBoxElement) {
    for (var i = 0; i < currInput.length; i++) {
        for (var j = 0; j < currInput[i].coursesAndCheckboxValues.length; j++) {
            if (currInput[i].coursesAndCheckboxValues[j].courseCode === courseCode) {
                currInput[i].coursesAndCheckboxValues[j][RorS] = checkBoxElement.checked;
                if (currInput[i].coursesAndCheckboxValues[j]["id" + RorS] !== this.id) {
                    $(currInput[i].coursesAndCheckboxValues[j]["id" + RorS]).checked = checkBoxElement.checked;
                }
            }
        }
    }
    conUpdateSelectedCounts();
}

function conUpdateSelectedCounts() {
    for (var i = 0; i < currInput.length; i++) {
        var sum = {reqCount: 0, reqCredits: 0, totCount: 0, totCredits: 0};
        for (var j = 0; j < currInput[i].coursesAndCheckboxValues.length; j++) {
            var course = Course(currInput[i].coursesAndCheckboxValues[j].courseCode);
            sum.totCount++;
            sum.totCredits += course.credits;
            if (currInput[i].coursesAndCheckboxValues[j].R) {
                sum.reqCount++;
                sum.reqCredits += course.credits;
            }
        }
        $(conGetBoxSummaryID(currInput[i].id)).innerHTML =
                conGetBoxSummaryText(
                        sum.reqCount, sum.reqCredits,
                        sum.totCount, sum.totCredits);
    }
}

/**
 * Method to unify display of message to user especially error messages
 *
 * @param {String} msg text to be displayed
 * @param {Number} duration in seconds to display message
 * @returns {undefined}
 */
var currentTimeoutID = -1;
function conUserMsg(msg, duration) {
    if (currentTimeoutID >= 0) {
        console.log("Clear Timeout: " + currentTimeoutID);
        clearTimeout(currentTimeoutID);
        currentTimeoutID = -1;
    }
    if (isUndefined(msg)) {
        msg = "";
    }
    $("userNotice").innerHTML = msg;
    console.log("USER MSG: '" + msg + "'");
    if (msg !== "") {
        $("userMsgDiv").className = "paddingForUserMsgToolTip";
        if (isUndefined(duration) || duration < 1) {
            duration = 15; //default duration (15 sec)
        }
        console.log("Set Timeout: " + duration);
        currentTimeoutID = setTimeout(function () {
            console.log("Cancel Called: " + currentTimeoutID);
            currentTimeoutID = -1;
            conUserMsg("");
        }, duration * 1000);
    } else {
        $("userMsgDiv").className = "";
    }
}

function conUserNoticeClick() {
    conUserMsg(""); // Clear current message
}

function conAddCtrlsClick() {
    var auxDiv = $("auxBtnsDiv");
    if (auxDiv.className === "") {
        auxDiv.className = "hidden";
    } else {
        auxDiv.className = "";
    }
}

function conSaveOutputClick() {
    if (isUndefined(lastOutput)) {
        conUserMsg("No output yet to save");
    } else {
        var fileContents = conFileSaveOptions(lastOutput);
        conDownload(fileContents, "LastOutput.json");
    }
}

function conLoadOutClick() {
    conLoadFile(function (content) {
        var options = conFileLoadOptions(content.target.result);
        conDisplayOptions(options);
    });
}

function conSaveInputClick() {
    if (isUndefined(currInput)) {
        conUserMsg("No input yet to save");
    } else {
        conDownload(JSON.stringify(currInput), "LastInput.json");
    }
}

function conLoadInputClick() {
    conLoadFile(function (content) {
        conDisplayRequrements(JSON.parse(content.target.result));
    });
}

function conFileSaveOptions(options) {
    var result = [];
    for (var otp of options) {
        var l1 = [];
        result.push(l1);
        for (var semester of otp) {
            var l2 = [];
            l1.push(l2);
            for (var course of semester) {
                l2.push(course.courseCode);
            }
        }
    }
    return JSON.stringify(result);
}

function conFileLoadOptions(fileContents) {
    var result = [];
    var objectFromFile = JSON.parse(fileContents);
    for (var otp of objectFromFile) {
        var l1 = [];
        result.push(l1);
        for (var semester of otp) {
            var l2 = [];
            l1.push(l2);
            for (var courseCode of semester) {
                l2.push(Course(courseCode));
            }
        }
    }
    return result;
}

function conLoadFile(func) {
    var element = document.createElement("input");
    element.type = "file";
    element.onchange = conHandleFiles;
    element.customFunc = func;
    element.click();
}

function conHandleFiles() {
    if (this.files.length <= 0) {
        conUserMsg("No files received");
    } else {
        var file = this.files[0];
        conUserMsg("Loading: '" + file.name + "'");
        const reader = new FileReader();
        reader.onload = this.customFunc;
        reader.readAsText(file);
    }
}

function conDownload(text, filename) {
    var element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
    element.setAttribute('download', filename);

    element.style.display = 'none';
    document.body.appendChild(element);

    element.click();

    document.body.removeChild(element);
}

/**
 * Checks if an element has a specified class
 *
 * @param {Element} element
 * @param {String} className
 * @returns {Boolean} true if element has className otherwise false
 */
function conHasClass(element, className) {
    return (' ' + element.className + ' ').indexOf(' ' + className + ' ') > -1;
}

/**
 * Returns the main container for the course elements
 *
 * @returns {Element} the main content container
 */
function conGetMainContentContainer() {
    return $("mainContent");
}

/**
 * Creates a container for courses
 *
 * @param {Element} outerContainer element to add the new container to
 * @param {String} name if set creates a heading for the container
 * @param {String} id the ID that should be set on the created controls
 * @returns {Element} the created container
 */
function conCreateContainerCourse(outerContainer, name, id) {
    // TODO: Add parameter to allow selection of differnt or no boarder

    if (isUndefined(id)) {
        id = "";
    }

    if (!isUndefined(name) && name !== "") {
        // Set heading
        var heading = document.createElement("h2");
        heading.innerHTML = name;
        heading.id = id;
        heading.className += " courseContainerHeading";
        outerContainer.appendChild(heading);

        if (id !== "") {
            // Set Summary
            var summary = document.createElement("h3");
            summary.innerHTML = conGetBoxSummaryText();
            summary.id = conGetBoxSummaryID(id);
            summary.className += " courseContainerHeading";
            outerContainer.appendChild(summary);
            // TODO: Add tooltip explaining summary
        }

    }

    // Create and configure container
    var result = document.createElement("ul");
    result.id = id;
    result.className += " containerBoarder courseContainerContent";
    outerContainer.appendChild(result);
    return result;
}

function conGetBoxSummaryText(reqCount, reqCredits, totalCount, totalCredits) {
    if (isUndefined(reqCount)) {
        reqCount = 0;
    }
    if (isUndefined(reqCredits)) {
        reqCredits = 0;
    }
    if (isUndefined(totalCount)) {
        totalCount = 0;
    }
    if (isUndefined(totalCredits)) {
        totalCredits = 0;
    }

    return `${reqCount} (${reqCredits}) / ${totalCount} (${totalCredits})`;
}

function conGetBoxSummaryID(reqID) {
    return "sum" + reqID;
}

/**
 * Creates an element to wrap the info for the course passed and returns a
 * clicable element that points to the info for the course represented
 *
 * @param {String} elementType the type of container element to create
 * @param {String} displayText the text to be displayed in the element
 * @param {String} id the ID of the course to link to
 * @returns {Element} the created element
 */
function conWrapCourseText(elementType, displayText, id) {
    var result = document.createElement(elementType);
    result.innerHTML = displayText;
    result.id = id;
    result.onclick = conDisplayCourseInfoClick;
    result.className += " clickableText";
    return result;
}

/**
 * Specifically for create prerequisite text. Wrapper for conWrapCourseText
 * @param {String} courseCode the course code to display and point to
 * @returns {Element} the created wrapper element
 */
function conWrapCoursePreReq(courseCode) {
    var result = conWrapCourseText("span", courseCode, courseCode);
    result.className += conGetCoursePreReqClass(courseCode);
    return result;
}

function conGetCoursePreReqClass(courseCode) {
    if (displayState !== conDISPLAY_STATE_INPUT) {
        return "";
    }

    // TODO: Inefficent but runs infrequently better analysis needs to be done
    // perhaps might be better to do in model instead of creating a new object
    var resultTrue = " prereqMet";
    var resultFalse = " prereqNotMet";

    var lists = conGetCourseLists();
    var requiredCourses = lists.requiredCourses;
    var satisfiedCourses = lists.satisfiedCourses;

    for (var i = 0; i < requiredCourses.length; i++) {
        if (requiredCourses[i].courseCode === courseCode) {
            return resultTrue;
        }
    }

    for (var i = 0; i < satisfiedCourses.length; i++) {
        if (satisfiedCourses[i].courseCode === courseCode) {
            return resultTrue;
        }
    }

    return resultFalse;
}

/**
 * Wrap non-course text in an element
 * @param {String} text the text to be displayed by the element created
 * @param {String} tag the type of element to create
 * @returns {Element} the created element
 */
function conWrapText(text, tag) {
    if (isUndefined(tag) || tag === "") {
        tag = "span";
    }
    var result = document.createElement(tag);
    result.innerHTML = text;
    return result;
}