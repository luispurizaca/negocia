import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;


class PushNotificationProvider {

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  initNotifications() {
    _firebaseMessaging.requestPermission();

    _firebaseMessaging.getToken().then( (token) async {

      print('=========== FCM Token =============');
      print( token );


      final uri = 'http://negocialab.com/api/firebase/notification.php?tkn_device='+token!;
      http.Response response = await http.get(Uri.parse(uri));


    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      print('========== ONMESSAGE ==============');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {

        print(notification.title);

      }

    });


  }

}