class StudentValidationMixin{

  String? validateFirstName(String? value){
    // value kullanıcının girdiği değer
    if(value!.length < 3){
      return "İsim en az iki karakter olmalıdır.";
    }
    return value;
  }

  String? validateLastName(String? value){
    // value kullanıcının girdiği değer
    if(value!.length < 3){
      return "Soyadı en az iki karakter olmalıdır.";
    }
    return value;
  }

  String validateGrade(String? value){
    // value kullanıcının girdiği değer
    var grade = int.parse(value!);
    if(grade < 0 || grade > 100){
      return "not 0 - 100 arasında olmalıdır.";
    }
    return value;
  }

}