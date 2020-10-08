//! Test Main.mc
//!
//! Copyright Greg Caufield 2020

using MonkeyTest.Tests;

var testSuites = [
];

(:test)
function runAllTests(logger) {
  return new Tests.TestRunner().runAllTestSuites(logger, testSuites);
}
