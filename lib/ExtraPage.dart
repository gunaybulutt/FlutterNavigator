import 'package:flutter/material.dart';

class ExtraPage extends StatefulWidget {

  String _data;

  ExtraPage(this._data);

  @override
  State<StatefulWidget> createState() {
    return ExtraPageState(_data);
  }
  
}

class ExtraPageState extends State<ExtraPage> {

  String _data;

  ExtraPageState(this._data);

  @override
  Widget build(BuildContext context) {

    //PopScope -> butona tıklandığında yada ekran kaydırıldığında sayfa 
    //kapanmasın bizim belirlediğimiz işlev gerçekleşsin istiyorsak bu kullanılır
    //bizim kendi yaptığımız işlevler için etkili değildir
    //işletim sisteminin kendisinden gelen işlemlerde çalışır
    return PopScope(
      //canPop : Sistem tarafından oluşturulan geri butonuna tıklayınca sayfanın kapanıp 
      //kapanmayacağını belirliyoruz. true verirsek kapanır, false verirsek kapanmaz.
      canPop: false,
      //onPopInvoked : Geri butonuna tıklandığında yapılacak işlemi belirliyoruz. 
      //WillPopScope'ta olduğu gibi, sayfa kapansa da kapanmasa da çalışır.
      onPopInvoked: _returnButtonOk,
      
      child: Scaffold(
        appBar: AppBar(
          title: Text("ikinci sayfa"),
          //yukarı otomatik gelen (push) ok işaretini kapatır
          automaticallyImplyLeading: true,
        ),
        body: Center(
          
          child: Column(
      
              children: [
                SizedBox(height: 200),
      
                Text(_data),
      
                SizedBox(height: 50),
      
                ElevatedButton(
                  child: Text("GoFirstPage"),
                  onPressed: (){
                    //sayfayı kapatir(yok eder) aslında navige yok bu kapanınca arkada kalan 
                    //sayfaya geçiliyor
                    //ikinci parametre bu ekran yok olduğunda bu ekranı çağıran yada altta kalan 
                    //ekrana gönderilir
                      Navigator.pop(context,"ikinci sayfadan gelen veri");                 
                  }, 
                ),
              ],
            ),
        ),
      ),
    );
  }

  void _returnButtonOk(bool didPop){
    print("button ok");
  }

}