
module MonkeyTest {
(:Tests)
module Tests {
class FailureList {
  private var _failures = [];

  public function addFailure(ex) {
    try {
      throw ex;
    }
    catch(e) {
      _failures.add(e);
    }
  }

  public function union(other) {
    _failures.addAll(other.getFailures());
  }

  public function hasFailure() {
    return _failures.size() > 0;
  }

  public function getFailures() {
    return _failures;
  }

  public function count() {
    return _failures.size();
  }
}
}
}
