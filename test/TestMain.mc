//! Test Main.mc
//!
//! Copyright Greg Caufield 2020

using Toybox.Lang;

using MonkeyTest.Tests;

var testSuites = [
  TestTest
];

(:test)
function runAllTests(logger) {
  if(!(new Tests.TestRunner().runAllTestSuites(logger, testSuites))) {
    throw new Lang.Exception();
  }
  return true;
}

