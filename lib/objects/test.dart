class Test {

  int id;
  String course;
  static const bool test = true;
  String name;
  String deadline;
  String workblocks; // uses DataTime in code but is a String in database
  int etc; // estimated time to complete
  bool priority;

  // Test({int id, String course, String name, String deadline, String workblocks, int etc, bool priority});

  Test(int id, String course, String name, String deadline, String workblocks, int etc, bool priority){
    this.id = id;
    this.course = course;
    this.name = name;
    this.deadline = deadline;
    this.workblocks = workblocks;
    this.etc = etc;
    this.priority = priority;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'course': course,
      'test': test,
      'name': name,
      'deadline': deadline,
      'workblocks': workblocks,
      'etc': etc,
      'priority': priority,
    };
  }

}