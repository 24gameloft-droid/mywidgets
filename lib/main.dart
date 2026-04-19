import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';

void main() => runApp(const MaterialApp(home: SmartFolderHome(), debugShowCheckedModeBanner: false));

class SmartFolderHome extends StatefulWidget {
  const SmartFolderHome({super.key});
  @override
  State<SmartFolderHome> createState() => _SmartFolderHomeState();
}

class _SmartFolderHomeState extends State<SmartFolderHome> {
  List<AppInfo> apps = [];
  
  @override
  void initState() {
    super.initState();
    _loadApps();
  }

  _loadApps() async {
    List<AppInfo> installedApps = await InstalledApps.getInstalledApps(true, true);
    setState(() => apps = installedApps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(title: const Text("Smart Folder Master"), backgroundColor: Colors.transparent),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("اختر تطبيقاتك للمجلد القابل للتمرير", style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: apps.length,
              itemBuilder: (context, i) => CheckboxListTile(
                title: Text(apps[i].name ?? "", style: const TextStyle(color: Colors.white)),
                secondary: apps[i].icon != null ? Image.memory(apps[i].icon!, width: 40) : null,
                value: true, // مؤقتاً للتجربة
                onChanged: (v) {},
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.cyanAccent, foregroundColor: Colors.black),
              onPressed: () {},
              child: const Text("تحديث المجلد على الشاشة الرئيسية"),
            ),
          )
        ],
      ),
    );
  }
}
