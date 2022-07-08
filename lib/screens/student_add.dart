import 'package:flutter/material.dart';
import 'package:flutter_ogrenci_takip/validation/student_validator.dart';
import '../models/student.dart';

class StudentAdd extends StatefulWidget {
  List<Student> students;
  StudentAdd(this.students, {Key? key}) : super(key: key);

  @override
  _StudentAddState createState() => _StudentAddState(students);
}

class _StudentAddState extends State with StudentValidationMixin {
  // bu şekilde olabilir mi ?  : class _StudentAddState extends State<StudentAdd> {
  late List<Student> students; // Burası olmayabilir
  var student = Student.withoutInfo();
  // var student = Student ("", "", 0); bu şekilde de olabilir.
  var formKey = GlobalKey<FormState>();

  _StudentAddState(this.students);

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
        if(!formKey.currentState!.validate()){
          // true ise form içindeki onSaved olan her şeyi çalıştırıyor.
          formKey.currentState!.save();
          students.add(student);
          saveStudent();
          Navigator.pop(context);
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
