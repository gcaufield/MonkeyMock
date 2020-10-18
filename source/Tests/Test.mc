//! Test.mc
//!
//! Copyright Greg Caufield 2020
module MonkeyTest {

(:Tests)
module Tests {
//! Base class of the Test Suite
class Test {
  private var _failures = [];

  //! Child classes are expected to override this and return the suite name
  public function name() {
    return "Unknown";
  }

  //! Child classes are expected to override this and return a dictionary
  //! mapping test symbols to thier names
  public function testList() {
    return {};
  }

  function setUp() {
  }

  function tearDown() {
  }

  function runTest(key) {
    method(key).invoke();

    if(_failures.size() == 0){
      return null;
    }

    return _failures;
  }

  function getFailures() {
    return _failures;
  }

  function expectEq(expected, actual) {
    if( actual != expected ) {
      captureException(
          new TestException("Expected equality. " + actual + " != " + expected));
    }
  }

  //! Throws an exception but catches it immediately and adds it to the
  //! failures. Ensures that we get a stack trace in the failure.
  function captureException(ex) {
    try {
      throw ex;
    }
    catch(e) {
      _failures.add(e);
    }
  }
}
}
}

