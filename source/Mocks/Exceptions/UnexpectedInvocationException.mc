//! UnexpectedInvocationException.mc
//!
//! Copyright Greg Caufield 2020


module MonkeyTest {
(:Mocks)
module Mocks {
  using MonkeyTest.Tests;

//! Exception for a function invocation that was not declared
class UnexpectedInvocationException extends Tests.TestException {
  function initialize(functionName) {
    TestException.initialize("");
    self.mMessage = "Unexpected Invocation of function " + functionName;
  }
}
}
}
