class Assignment {

  int id;
  String course;
  static const bool test = false;
  String name;
  String deadline;
  String workblocks; // uses DataTime in code but is a String in database
  int etc; // estimated time to complete
  bool priority;

  Assignment({int id, String course, String name, String deadline, String workblocks, int etc, bool priority});

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
