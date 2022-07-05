class Student{
  String firstName;
  String lastName;
  int grade;
  // String _status;

  //Constructor oluşturalım
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