import 'package:flutter/material.dart';
import 'package:negocia/src/providers/push_notifications_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

//INICIALIZAR PRIMERA VENTANA
void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  @override
  void initState(){
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      final pushProvider = new PushNotificationProvider();
      pushProvider.initNotifications();
    });

  }



  @override
  Widget build(BuildContext context){


    //runApp(const MyApp());|
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Negocia",
      home: Scaffold(
          appBar: AppBar(centerTitle: true, title: Text("Negocia"), backgroundColor: Colors.orange),
          body: WebView(
            initialUrl: "https://negocia.pe/login",
            javascriptMode: JavascriptMode.unrestricted,
          )),
    );


  }
}