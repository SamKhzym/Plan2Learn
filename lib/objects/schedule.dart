import 'course.dart';
import 'test.dart';
import 'workblock.dart';

class Schedule {
  List<Course> courses;
  List<Test> tests;
  List<WorkBlock> workSessions;

  Schedule (courses, tests);

  List<WorkBlock> generateSchedule(){
    List<WorkBlock> studySessions = [];

    for (Test test in tests){
      // For each test, prepare 3 work blocks
      studySessions.add(new WorkBlock(test.deadline, test.deadline, test));
    }

    this.workSessions = studySessions;
    return studySessions;
  }
}