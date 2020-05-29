class Teacher {
  final String uid;
  Teacher({this.uid});
}

class TeacherData {
  final String uid;
  final int attendance1;
  final int attendance2;
  final int attendance3;
  final int attendance4;
  final int attendance5;
  final int attendance6;
  final int attendance7;
  final String name;
  
  final String subject1;
  final String subject2;
  final String subject3;
  final String subject4;
  final String subject5;
  final String subject6;
  final String subject7;
  TeacherData(
      {this.uid,
      this.attendance1,
      this.attendance2,
      this.attendance3,
      this.attendance4,
      this.attendance5,
      this.attendance6,
      this.attendance7,
      this.name,
    
      this.subject1,
      this.subject2,
      this.subject3,
      this.subject4,
      this.subject5,
      this.subject6,
      this.subject7});
}
