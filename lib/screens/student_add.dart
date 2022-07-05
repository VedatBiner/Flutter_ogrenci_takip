import 'package:flutter/material.dart';

class StudentAdd extends StatefulWidget {
  const StudentAdd({Key? key}) : super(key: key);

  @override
  State<StudentAdd> createState() => _StudentAddState();
}

class _StudentAddState extends State<StudentAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yeni Öğrenci Ekle")
      ),
      body: const Center(
        child: Text("Öğrenci formu burada olacak"),
      ),
    );
  }

}
