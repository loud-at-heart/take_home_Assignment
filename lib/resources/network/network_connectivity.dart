import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class AppConnectivity {
  bool hasConnection = true;
  late var subscription;

  Future<bool> checkConnectivity(BuildContext context) async {
    hasConnection = await hasConnectivity();
    if (!hasConnection) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("No Internet Connection!")));
    }
    return hasConnection;
  }

  monitorConnectivity(GlobalKey<ScaffoldMessengerState> scaffoldKey) async {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        hasConnection = true;
      } else {
        hasConnection = false;
        scaffoldKey.currentState!.showSnackBar(
            new SnackBar(content: new Text("No Internet Connection!")));
      }
    });
  }

  stopMonitoringConnectivity() {
    subscription.cancel();
  }
}

var subscription = Connectivity();

Future<bool> hasConnectivity() async {
  var check = await subscription.checkConnectivity();
  if (check == ConnectivityResult.mobile || check == ConnectivityResult.wifi) {
    return true;
  } else {
    return false;
  }
}
