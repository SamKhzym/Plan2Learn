import 'test.dart';
import 'assignment.dart';

class Course {

  String title;
  List<Assignment> assignments;
  List<Test> tests;

  Course(String title, List<Assignment> assignments, List<Test> tests) {

    this.title = title;
    this.assignments = assignments;
    this.tests = tests;

  }

  Course.fromTitle(String title) {

    this.title = title;
    this.assignments = [];
    this.tests = [];

  }

  void addAssignment(Assignment assmt) {
    this.assignments.add(assmt);
  }

  void addTest(Test test) {
    this.tests.add(test);
  }

}