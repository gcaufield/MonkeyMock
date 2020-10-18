//! TestRunner.mc
//!
//! Copyright Greg Caufield 2020
using Toybox.Lang;

module MonkeyTest {
(:Tests)
module Tests {
//! Runs a suite of tests from a test class
class TestRunner {

  //! Verifies an array of test suite
  //!
  //! @param logger A logger object for writing to the console.
  //! @param suites A Lang.Array of the ClassDefs of the test suites to run
  function runAllTestSuites(logger, suites) {
    var failedTests = [];

    var numTests = 0;
    for(var i = 0; i < suites.size(); i++) {
      numTests += suites[i].testList().size();
    }

    logger.debug("[==========] Running " +
                 numTests +
                 " tests from " +
                 suites.size() +
                 " test suites.");

    for(var i = 0; i < suites.size(); i++) {
      failedTests.addAll(runTestSuite(logger, suites[i]));
    }

    logger.debug("[==========] " +
                 numTests +
                 " tests from " +
                 suites.size() +
                 " test suites ran.");

    logger.debug("[  PASSED  ] " + (numTests - failedTests.size()) + " tests.");

    if(failedTests.size() > 0) {
      logger.error("[  FAILED  ] " + failedTests.size() + " tests, listed below:");

      for(var i = 0; i < failedTests.size(); i++) {
        logger.error("[  FAILED  ] " + failedTests[i]);
      }
    }

    if(failedTests.size() > 0) {
      // Throw an exception to force the simulator to fail with a non-zero error
      // code
      throw new Lang.Exception();
    }

    return true;
  }

  //! Verifies a single test suite
  //!
  //! @param logger A logger object for writing to the console.
  //! @param suiteDef the ClassDef of the test suite to run
  function runTestSuite(logger, suiteDef) {
    var testList = suiteDef.testList();
    var suiteName = suiteDef.name();

    var failedTests = [];

    logger.debug("[----------] " +
                 testList.size() +
                 " tests from " +
                 suiteName);

    for(var i = 0; i < testList.size(); i++) {
      var testTitle = suiteName + "." + testList[i].toString();
      logger.debug("[ RUN      ] " + testTitle);
      var test = new suiteDef();

      test.setUp();

      var failures = test.runTest(testList[i]);
      if(failures == null) {
        logger.debug("[       OK ] " + testTitle);
      }
      else {
        failures = failures.getFailures();
        logger.error(failures[0].getErrorMessage());
        failures[0].printStackTrace();
        logger.error("[  FAILED  ] " + testTitle);
        failedTests.add(testTitle);
      }

      test.tearDown();
    }

    logger.debug("[----------] " +
                 testList.size() +
                 " tests from " +
                 suiteName);

    return failedTests;
  }
}
}
}
