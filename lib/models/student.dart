class Student{
  late int id;
  String firstName;
  String lastName;
  int grade;

  //Constructor oluşturalım
  Student.withId(this.id, this.firstName, this.lastName, this.grade);

  // id vermeden Constructor oluşturalım
  Student(this.firstName, this.lastName, this.grade);

  // getter kullanılıyor
  String get getStatus{
    String message = "";
    if (grade >= 50) {
      message = "Geçti";
    } else if (grade >= 40) {
      message = "Bütünlemeye kaldı";
    } else {
      message = "Kaldı";
    }
    return message;
  }

}