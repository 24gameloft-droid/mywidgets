import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text("Smart Folder Setup"), backgroundColor: Colors.blueGrey),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 100),
          Text("App is Running Successfully!", style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => InstalledApps.openApp("com.android.settings"),
            child: Text("Test: Open Phone Settings"),
          )
        ],
      ),
    ),
  ),
  debugShowCheckedModeBanner: false,
));
