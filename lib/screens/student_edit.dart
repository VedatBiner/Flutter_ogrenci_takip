import 'package:flutter/material.dart';
import 'package:flutter_ogrenci_takip/validation/student_validator.dart';
import '../models/student.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit(this.selectedStudent, {Key? key}) : super(key: key);

  @override
  _StudentAddState createState() => _StudentAddState(selectedStudent);
}

class _StudentAddState extends State with StudentValidationMixin {
  Student? selectedStudent; // Orijinal kod : Student selectedStudent;
  // Student selectedStudent = Student.withId(0, "", "", 0);
  var formKey = GlobalKey<FormState>();
  _StudentAddState(Student selectedStudent){
    selectedStudent = selectedStudent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: const Text("Öğrenci Bilgilerini Güncelle")
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
      initialValue: selectedStudent?.firstName, // Orijinal Kod: initialValue: selectedStudent.firstName,
      decoration: const InputDecoration(
          labelText: "Öğrenci Adı",
          hintText: "Öğrencinin adını giriniz"
      ),
      validator: validateFirstName,
      onSaved: (String? value){
        selectedStudent?.firstName = value!; // selectedStudent.firstName = value!;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      initialValue: selectedStudent?.lastName, // Orijinal kod : initialValue: selectedStudent.lastName,
      decoration: const InputDecoration(
          labelText: "Öğrenci Soyadı",
          hintText: "Öğrencinin soyadını giriniz"
      ),
      validator: validateLastName,
      onSaved: (String? value){
        selectedStudent?.lastName = value!; // Orijinal Kod : selectedStudent.lastName = value!;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      initialValue: selectedStudent?.grade.toString(),  // Orijinal kod : initialValue: selectedStudent.grade.toString(),
      decoration: const InputDecoration(
          labelText: "Aldığı not",
          hintText: "Öğrencinin notunu giriniz (0 - 100)"
      ),
      validator: validateGrade,
      onSaved: (String? value){
        selectedStudent?.grade = int.parse(value!);  // Orijinal kod : selectedStudent.grade = int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: const Text("Kaydet"),
      onPressed: (){
        if(!formKey.currentState!.validate()){
          // true ise form içindeki onSaved olan her şeyi çalıştırıyor.
          formKey.currentState!.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent() {
    print(selectedStudent?.firstName); // Orijinal kod : print(selectedStudent.firstName);
    print(selectedStudent?.lastName); // Orijinal kod : print(selectedStudent.lastName);
    print(selectedStudent?.grade); // Orijinal kod : print(selectedStudent.grade);
  }

}
