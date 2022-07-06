class Student{
  late int id;
  late String firstName;
  late String lastName;
  late int grade;

  //Constructor oluşturalım
  Student.withId(this.id, this.firstName, this.lastName, this.grade);

  // id vermeden Constructor oluşturalım
  Student(this.firstName, this.lastName, this.grade);

  //basit bir class hiç bir bilgi içermiyor.
  Student.withoutInfo(){
  }

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