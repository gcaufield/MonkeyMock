using MonkeyTest.Tests;

class TestTest extends Tests.Test {
  public function name() {
    return "TestTest";
  }

  public function testList() {
    return {
      :canExpectEq => "canExpectEq",
      :expectEqThrowsExceptionWhenNotEq => "expectEqThrowsExceptionWhenNotEq",
      :expectEqThrowsExceptionWhenDiffType => "expectEqThrowsExceptionWhenDiffType"
    };
  }

  function initialize() {
    Test.initialize();
  }

  function canExpectEq() {
    var test = new Test();
    test.expectEq(1, 2);

    expectEq(0, test.getFailures().size());
  }

  function expectEqThrowsExceptionWhenNotEq() {
    var test = new Test();
    test.expectEq(1, 0);

    expectEq(1, test.getFailures().size());
  }

  function expectEqThrowsExceptionWhenDiffType() {
    var test = new Test();
    test.expectEq(1, "test");

    expectEq(1, test.getFailures().size());
  }
}
