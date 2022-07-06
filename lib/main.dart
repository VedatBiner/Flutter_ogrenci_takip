import 'package:flutter/material.dart';
import 'models/student.dart';
import 'screens/student_add.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mesaj = "Öğrenci Takip Sistemi";

  Student selectedStudent = Student.withId(0, "", "", 0);

  List<Student> students = [
    Student.withId(1, "Vedat", "Biner", 25),
    Student.withId(2, "Mehmet", "Biner", 65),
    Student.withId(3, "Zeynep", "Biner", 45),
    Student.withId(4, "Sevim", "Biner", 70)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: SafeArea(
        child: buildBody(context)
      ),
    );
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: const Text("İşlem Sonucu"),
      content: Text(mesaj),
    );
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
                // Builder eleman sayısı kadar listeleme yapacak
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn.pixabay.com/photo/2016/11/29/22/02/white-male-1871436_960_720.jpg"),
                    ),
                    title: Text(
                        "${students[index].firstName} ${students[index].lastName}"),
                    subtitle: Text(
                        "Sınavdan aldığı not : ${students[index].grade.toString()} [${students[index].getStatus}]"),
                    trailing: buildStatusIcon(students[index].grade),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                      print(selectedStudent.firstName);
                    },
                  );
                })),
        Text("Seçili Öğrenci : ${selectedStudent.firstName} ${selectedStudent.lastName}"),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent,
                  onPrimary: Colors.black,
                ),
                child: Row(
                  children: const [
                    Icon(Icons.add),
                    SizedBox(width: 5.0),
                    Text("Yeni Öğrenci"),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentAdd()));
                }
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amberAccent,
                    onPrimary: Colors.black,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.update),
                      SizedBox(width: 5.0),
                      Text("Güncelle"),
                    ],
                  ),
                  onPressed: () {
                    var mesaj = "Güncellendi";
                    mesajGoster(context, mesaj);
                  }),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 1,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.redAccent,
                    onPrimary: Colors.black,
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.delete),
                      SizedBox(width: 5.0),
                      Text("Sil"),
                    ],
                  ),
                  onPressed: () {
                    setState (() {
                      students.remove(selectedStudent);
                    });
                    var mesaj = "Silindi : ${selectedStudent.firstName} ${selectedStudent.lastName}";
                    mesajGoster(context, mesaj);
                  }),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 50) {
      return const Icon(Icons.done);
    } else if (grade >= 40) {
      return const Icon(Icons.album);
    } else {
      return const Icon(Icons.clear);
    }
  }
}
