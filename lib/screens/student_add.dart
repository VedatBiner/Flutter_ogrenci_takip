import 'package:flutter/material.dart';
import 'package:flutter_ogrenci_takip/validation/student_validator.dart';
import '../models/student.dart';

class StudentAdd extends StatefulWidget {
  const StudentAdd({Key? key}) : super(key: key);

  @override
  _StudentAddState createState() => _StudentAddState();
}

class _StudentAddState extends State with StudentValidationMixin {
  var student = Student.withoutInfo();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text("Yeni Öğrenci Ekle")
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children:[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
              ]
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Öğrenci Adı",
        hintText: "Öğrencinin adını giriniz"
      ),
      validator: validateFirstName,
      onSaved: (String? value){
        student.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Öğrenci Soyadı",
        hintText: "Öğrencinin soyadını giriniz"
      ),
      validator: validateLastName,
      onSaved: (String? value){
        student.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Aldığı not",
        hintText: "Öğrencinin notunu giriniz (0 - 100)"
      ),
      validator: validateGrade,
      onSaved: (String? value){
        student.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: const Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState!.validate()){
          // true ise form içindeki onSaved olan her şeyi çalıştırıyor.
          formKey.currentState!.save();
          saveStudent();
        }
      },
    );

  }

  void saveStudent() {
    print(student.firstName);
    print(student.lastName);
    print(student.grade);
  }

}
