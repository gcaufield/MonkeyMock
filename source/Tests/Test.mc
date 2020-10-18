//! Test.mc
//!
//! Copyright Greg Caufield 2020
module MonkeyTest {

(:Tests)
module Tests {
//! Base class of the Test Suite
class Test {
  private var _failures = new FailureList();

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

    if(!_failures.hasFailure()){
      return null;
    }

    return _failures;
  }

  function getFailures() {
    return _failures;
  }

  function expectEq(expected, actual) {
    if(!expected.equals(actual)) {
      _failures.addFailure(
          new TestException("Expected equality. " + actual + " != " + expected));
    }
  }

  function expectNe(expected, actual) {
    if(expected.equals(actual)) {
      _failures.addFailure(
          new TestException("Expected not equal. " + actual + " == " + expected));
    }
  }

  function expectInstanceOf(classDef, obj) {
    if(!(obj instanceof classDef)) {
      _failures.addFailure(
          new TestException("Expected instanceof."));
    }
  }

  function verifyMock(mock) {
    _failures.combine(mock.verifyAndClear());
  }
}
}
}

