
import 'package:flutter/material.dart';
import 'package:navigator/ExtraPage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
  
}

class MainPageState extends State<MainPage> {

  TextEditingController _controller = TextEditingController();
  String gelenVerii = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: _controller,
            ),

            SizedBox(height: 30),

            ElevatedButton(
              onPressed: (){
                goPageTwo(context);
              }, 
              child: Text(
                "Go Page Two"
                ),
              ),

              SizedBox(height: 30),

            Text(gelenVerii),
          ],
        ),
      ),
    );
  }

  void goPageTwo(BuildContext context){
    MaterialPageRoute pageRoad = MaterialPageRoute(builder: (BuildContext context){
      //göndermek istediğimiz değer içine yazılır
        return ExtraPage(_controller.text);
      },
    );
    //bu işlem gidilecek olan sayfayı eski sayfanın üzerine açar ve sol üst tarafa geri 
    //gelme oku ekler eğer ona basarsak ikinci sayfa yok edilir ve ana sayfayı tekrar görürürz
    //yani navigate işlemi sırasında önceki sayfa yok olmaz yeni sayfa üzerine açılır
    //eğer gidildikten sonra gidilen sayfa kapatılırsa then bloğu çalışır ve oradan 
    //gönderilen veriler alınabilir(pop ile gönderilen)
      Navigator.push(context, pageRoad).then((gelenVeri){
      if(gelenVeri != null){
        gelenVerii = gelenVeri;
        print(gelenVeri);
      }
    });
    
    

    //eğer pushReplacement kullanırsan önceki sayfayı yok eder yeni sayfayı ise onun yerine açar
    //Navigator.pushReplacement(context, pageRoad);
  }

}