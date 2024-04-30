class LateWork {
  late LateWork mLateWork = remeberValue();
  LateWork? mLateWorkNoLate;

  LateWork(String? lazy) {
    print("constructor invoke !!! ${lazy}");
  }

  LateWork remeberValue() {
    return LateWork('lazy');
  }

  static test() {
    var work = LateWork('');
    try {
      print("late var value  of 'mLateWork' access before ");
      print("late var value  of 'mLateWork' is : ${work.mLateWork}");
    } catch (e) {
    } finally {
      print("late var value  of 'mLateWork' access after ");
    }
    print("late var value  of 'mLateWork' is : ${work.mLateWorkNoLate}");
  }
}
