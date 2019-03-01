class Schedule {

  Course course;

  Schedule(
    this.course
  );

  Schedule.fromMap(Map<dynamic, dynamic> map) {
    //this.course = map;
  }
}

class Course {
  int course;
  Group group;
}
class Group {
  String group;
  List<Week> week;

  Group(this.group, this.week);

  Group.fromMap(Map<String, dynamic> map) {
    this.group = map['group'];
    this.week = map['week'];
  }
}
class Week {
  String week;
  List<Day> day;

  Week(this.week, this.day);

  Week.fromMap(Map<String, dynamic> map) {
    this.week = map[''];
    this.day = map[''];
  }
}
class Day {
  String day;
  List<Lesson> lesson;

  Day(this.day, this.lesson);

  Day.fromMap(Map<String, dynamic> map) {
    this.day = map['day'];
    this.lesson = map['lessons'];
  }
}

class Lesson {
  String time;
  String name;
  String room;
  
  Lesson(
    this.time, this.name, this.room,
  );
  Lesson.fromMap(Map<String, dynamic> map) {
    this.time = map['time'];
    this.name = map['name'];
    this.room = map['room'];
  }
}