import 'package:flutter/material.dart';
import 'models/student.dart';

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

  String seciliOgrenci = "abc";

  List<Student> students = [
    Student("Vedat", "Biner", 25),
    Student("Mehmet", "Biner", 65),
    Student("Zeynep", "Biner", 45),
    Student("Sevim", "Biner", 70)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: buildBody(context),
    );
  }

  String sinavHesapla(int puan) {
    String mesaj = "";
    if (puan >= 50) {
      mesaj = "Geçti";
    } else if (puan >= 40) {
      mesaj = "Bütünlemeye kaldı";
    } else {
      mesaj = "Kaldı";
    }
    return mesaj;
  }

  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: const Text("Sınav Sonucu"),
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
                    "https://cdn.pixabay.com/photo/2016/11/29/22/02/white-male-1871436_960_720.jpg"
                  ),
                ),
                title: Text(
                  "${students[index].firstName} ${students[index].lastName}"
                ),
                subtitle: Text(
                  "Sınavdan aldığı not : ${students[index].grade.toString()} [${students[index].getStatus}]"
                ),
                trailing: buildStatusIcon(students[index].grade),
                onTap: (){
                  setState((){
                    seciliOgrenci = "${students[index].firstName} ${students[index].lastName}";
                  });
                  print("${students[index].firstName} ${students[index].lastName}");
                },
              );
            }
          )
        ),
        Text("Seçili Öğrenci : " + seciliOgrenci),
        Center(
          child: ElevatedButton(
            child: const Text("Sonucu Gör"),
              onPressed: () {
                var mesaj = sinavHesapla(55);
                mesajGoster(context, mesaj);
              })),
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
