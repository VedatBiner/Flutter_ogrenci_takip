import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  String mesaj = "İlk Uygulama";
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var ogrenciler = [
      "Vedat Biner",
      "Mehmet Biner",
      "Zeynep Biner",
      "Sevim Biner"
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  // Builder eleman sayısı kadar listeleme yapacak
                  itemCount: ogrenciler.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(ogrenciler[index]);
                  })),
          Center(
              child: ElevatedButton(
                  child: const Text("Sonucu Gör"),
                  onPressed: () {
                    var mesaj = sinavHesapla(55);
                    mesajGoster(context, mesaj);
                  })),
        ],
      ),
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
}

















