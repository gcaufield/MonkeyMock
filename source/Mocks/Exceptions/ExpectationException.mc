//! ExpectationException.mc
//!
//! Copyright Greg Caufield 2020


module MonkeyTest {
(:Mocks)
module Mocks{
  using MonkeyTest.Tests;

  class ExpectationException extends Tests.TestException {
    function initialize() {
      TestException.initialize("Expectation not met");
    }
  }
}
}

