/**
 * Appends additional courses to the list of courses received
 *
 * @param {Array} data the array to add the course info to
 * @returns {undefined}
 */
function manAddMaunalCourses(data) {

    data.push({
        code: "MATH1300",
        name: "Differential Calculus with Applications",
        about: "Limits, derivatives with applications, antiderivatives, fundamental theorem of calculus, beginnings of integral calculus. Prerequisite: SC/MATH 1520 3.00 or SC/MATH 1710 6.00, or 12U Calculus and Vectors (MCV4U) or equivalent. Course credit exclusions: SC/MATH 1013 3.00, SC/MATH 1505 6.00, SC/MATH 1530 3.00, SC/MATH 1550 6.00, GL/MATH/MODR 1930 3.00, AP/ECON 1530 3.00; SC/ISCI 1401 3.00, SC/ISCI 1410 6.00.",
        credit: 3});

    data.push({
        code: "MATH1310",
        name: "Integral Calculus with Applications",
        about: "Transcendental functions, differential equations, techniques of integration, improper integrals, infinite series. Prerequisite(s): One of SC/MATH 1013 3.00, SC/MATH 1300 3.00, GL/MATH 1901, SC/ISCI 1401 3.00; for non-science students only, six credits from SC/MATH 1530 3.00 and SC/MATH 1540 3.00, SC/MATH 1550 6.00, AP/ECON 1530 3.00 and AP/ECON 1540 3.00. Course credit exclusions: SC/MATH 1014 3.00, SC/MATH 1505 6.00, GL/MATH/MODR 1940 3.00, SC/ISCI 1402 3.00, SC/ISCI 1410 6.00.",
        credit: 3});

    data.push({
        code: "MATH1090",
        name: "Introduction to Logic for Computer Science",
        about: "The syntax and semantics of propositional and predicate logic. Applications to program specification and verification. Optional topics include set theory and induction using the formal logical language of the first part of the course. Prerequisite: SC/MATH 1190 3.00 or SC/MATH 1019 3.00. Course credit exclusion: SC/MATH 4290 3.00.",
        credit: 3});

    data.push({
        code: "4UMATH",
        name: "HIGH SCHOOL MATH",
        about: "12U Calculus and Vectors (MCV4U) or equivalent",
        credit: 0});

    data.push({
        code: "MATH1013",
        name: "Applied Calculus I",
        about: "Introduction to the theory and applications of both differential and integral calculus. Limits. Derivatives of algebraic and trigonometric functions. Riemann sums, definite integrals and the Fundamental Theorem of Calculus. Logarithms and exponentials, Extreme value problems, Related rates, Areas and Volumes. Prerequisite: SC/MATH 1520 3.00, or 12U Calculus and Vectors (MCV4U) or equivalent. Course credit exclusions: SC/MATH 1300 3.00, SC/MATH 1505 6.00, SC/MATH 1530 3.00, SC/MATH 1550 6.00, GL/MATH/MODR 1930 3.00, AP/ECON 1530 3.00, SC/ISCI 1401 3.00 and SC/ISCI 1410 6.00.",
        credit: 3});

    data.push({
        code: "MATH1014",
        name: "Applied Calculus II",
        about: "Calculus in Polar Coordinates. Techniques of Integration. Indeterminate Forms. Improper Integrals. Sequences, infinite series and power series. Approximations. Introduction to ordinary differential equations. Prerequisite(s): One of SC/MATH 1013 3.00, SC/MATH 1300 3.00, GL/MATH 1901 3.00, or SC/ISCI 1401 3.00 ; for non-science students only, six credits from SC/MATH 1530 3.00 and SC/MATH 1540 3.00, SC/MATH 1550 6.00, AP/ECON 1530 3.00 and AP/ECON 1540 3.00. Course credit exclusions: SC/MATH 1310 3.00, SC/MATH 1505 6.00, GL/MATH/MODR 1940 3.00, SC/ISCI 1402 3.00, SC/ISCI 1410 6.00.",
        credit: 3});

    data.push({
        code: "MATH1021",
        name: "Linear Algebra I",
        about: "Systems of linear equations, matrix algebra, determinants and diagonalization, vector geometry, and the vector space R^n. Prerequisite: 12U Advanced Functions (MHF4U) or equivalent. Course credit exclusions: SC/MATH 1025 3.00, SC/MATH 2221 3.00, GL/MATH/MODR 2650 3.00.",
        credit: 3});

    data.push({
        code: "MATH2221",
        name: "Linear Algebra with Applications I",
        about: "Systems of linear equations, linear and affine subspaces of Euclidean n-space, the Gauss-Jordan algorithm, matrices and matrix algebra, determinants, vector space concepts for Euclidean n-space (linear dependence and independence, basis, dimension etc.), various applications. Prerequisite: A 12U mathematics course or OAC algebra or any university mathematics course. Course credit exclusions: SC/MATH 1021 3.00, SC/MATH 1025 3.00, SC/MATH 2021 3.00, GL/MATH/MODR 2650 3.00. Prior to Fall 2009: Course credit exclusions: AK/AS/SC/MATH 1021 3.00, AS/SC/MATH 1025 3.00, AS/SC/MATH 2021 3.00, GL/MATH/MODR 2650 3.00.",
        credit: 3});

    data.push({
        code: "MATH2030",
        name: "Elementary Probability",
        about: "Introduction to the theory of probability as preparation for further study in either mathematical or applied probability and statistics. Topics include probability spaces, conditional probability, independence, random variables, distribution functions, expectation, Chebyshev's inequality, common distributions, moment-generating functions and limit theorems. Prerequisite: One of SC/MATH 1014 3.00, SC/MATH 1310 3.00, SC/ISCI 1402 3.00, SC/ISCI 1410 6.00.",
        credit: 3});

    data.push({
        code: "MATH1025",
        name: "Applied Linear Algebra",
        about: "Topics include spherical and cylindrical coordinates in Euclidean 3-space, general matrix algebra, determinants, vector space concepts for Euclidean n-space (e.g. linear dependence and independence, basis, dimension, linear transformations etc.), an introduction to eigenvalues and eigenvectors. Prerequisites: 12U Advanced functions (MHF4U) or equivalent. Course credit exclusions: SC/MATH 1021 3.00, SC/MATH 2221 3.00, GL/MATH/MODR 2650 3.00.",
        credit: 3});

    data.push({
        code: "ITEC3220",
        name: "Using and Designing Database Systems",
        about: "An examination of databases, trends in database management systems and their application in a wide range of organizational areas. The course provides an overview of database processing in modern organizations and discusses current and emerging trends in database processing. Prerequisites: ITEC 1000 3.0, ITEC 1010 3.0, ITEC 1620 3.0, ITEC 2610 3.0, ITEC 2620 3.0, MATH 1190 3.0, MATH 2320 3.0, MATH 2565 3.0 Course credit exclusions: GL/CSLA/ITEC 3620 3.00, HH/HLST 3320 3.00, HH/NURS 3230 3.00. Prior TO FALL 2009: Prerequisites: General prerequisites. Course credit exclusions: AK/ITEC 3220 3.00, AK/AS ITEC 3421 3.00, AK/AS/SC/COSC 3421 3.00, GL/CSLA/ITEC 3620 3.00, AK/HLST 3320 3.00, AK/NURS 3230 3.00.",
        credit: 3});
}