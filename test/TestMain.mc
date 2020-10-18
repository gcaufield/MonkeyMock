//! Test Main.mc
//!
//! Copyright Greg Caufield 2020

using MonkeyTest.Tests;

var testSuites = [
  TestTest
];

(:test)
function runAllTests(logger) {
  return new Tests.TestRunner().runAllTestSuites(logger, testSuites);
}

