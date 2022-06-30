import 'package:flutter/material.dart';

void main() {

  runApp(MaterialApp(
    home: MyApp()
  ));

}

class MyApp extends StatelessWidget{
  String mesaj = "İlk Uygulama";
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mesaj),
      ),
      body: Center(
          child: ElevatedButton(
            child: const Text("Sonucu Gör"),
            onPressed: (){
              int puan = 15;
              String mesaj = "";
              if (puan >= 50){
                mesaj = "Geçti";
              } else if (puan >= 40){
                mesaj = "Bütünlemeye kaldı";
              } else {
                mesaj = "Kaldı";
              }
              var alert = AlertDialog(
                title: const Text("Sınav Sonucu"),
                content: Text(mesaj),
              );
              showDialog(
                  context: context,
                  builder: (BuildContext context) => alert);
            }
          )
      ),
    );
  }
}
