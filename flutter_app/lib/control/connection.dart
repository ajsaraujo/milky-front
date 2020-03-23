// to check internet connection
import 'package:connectivity/connectivity.dart';

class Connection {
  static const Map<String, String> headers = {"Content-type": "application/json"};
  
  static String hostname() {
    var location = 'cloud'; 
    
    switch (location) {
      case 'cloud':
        return 'https://milkyandbeyond.herokuapp.com'; 
      case 'nelson':
        return 'http://192.168.1.5:3000'; 
      case 'allan':
        return 'http://192.168.1.12:3000';
      case 'allanPhone':
        return 'http://172.16.5.67:3000'; 
      case 'shoppingJardins':
        return 'http://172.16.5.67:3000';
    }
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity()); 
    if (connectivityResult == ConnectivityResult.mobile) 
      return true; 
    if (connectivityResult == ConnectivityResult.wifi)
      return true; 
    return false; 
  }
}