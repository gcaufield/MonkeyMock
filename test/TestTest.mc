using MonkeyTest.Tests;

class TestTest extends Tests.Test {
  public function name() {
    return "TestTest";
  }

  public function testList() {
    return [
      :canExpectEq,
      :canExpectEqStringType,
      :expectEqFailsOnNotEq,
      :expectEqFailsOnDiffType,
      :canExpectNe,
      :canExpectNeStringType,
      :expectNeFailsOnEq,
      :canExpectInstanceOf,
      :expectInstanceOfFailsOnNotInstance,
    ];
  }

  function initialize() {
    Test.initialize();
  }

  function canExpectEq() {
    var test = new Test();
    test.expectEq(1, 1);

    expectEq(0, test.getFailures().count());
  }

  function canExpectEqStringType() {
    var test = new Test();
    test.expectEq("Test", "Test");

    expectEq(0, test.getFailures().count());
  }

  function expectEqFailsOnNotEq() {
    var test = new Test();
    test.expectEq(1, 0);

    expectEq(1, test.getFailures().count());
  }

  function expectEqFailsOnDiffType() {
    var test = new Test();
    test.expectEq(1, "test");

    expectEq(1, test.getFailures().count());
  }

  function canExpectNe() {
    var test = new Test();
    test.expectNe(0, 1);

    expectEq(0, test.getFailures().count());
  }

  function canExpectNeStringType() {
    var test = new Test();
    test.expectNe("Test", "Test1");

    expectEq(0, test.getFailures().count());
  }

  function expectNeFailsOnEq() {
    var test = new Test();
    test.expectNe(1, 1);

    expectEq(1, test.getFailures().count());
  }

  function canExpectInstanceOf() {
    var test = new Test();

    test.expectInstanceOf(Lang.Number, 1);

    expectEq(0, test.getFailures().count());
  }

  function expectInstanceOfFailsOnNotInstance() {
    var test = new Test();

    test.expectInstanceOf(Lang.String, 1);

    expectEq(1, test.getFailures().count());
  }
}
