import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MaterialApp(home: FolderManager(), debugShowCheckedModeBanner: false));

class FolderManager extends StatefulWidget {
  const FolderManager({super.key});
  @override
  State<FolderManager> createState() => _FolderManagerState();
}

class _FolderManagerState extends State<FolderManager> {
  List<AppInfo> allApps = [];
  List<String> selectedPackages = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true);
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      allApps = apps;
      selectedPackages = prefs.getStringList('selected_apps') ?? [];
    });
  }

  _saveAndRefresh() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('selected_apps', selectedPackages);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Selection Saved! Now add the widget from Home Screen"))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Apps"), backgroundColor: Colors.black87),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: allApps.length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                  secondary: allApps[i].icon != null ? Image.memory(allApps[i].icon!, width: 40) : null,
                  title: Text(allApps[i].name ?? ""),
                  value: selectedPackages.contains(allApps[i].packageName),
                  onChanged: (bool? val) {
                    setState(() {
                      String pkg = allApps[i].packageName ?? "";
                      if (val == true) selectedPackages.add(pkg);
                      else selectedPackages.remove(pkg);
                    });
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 55), backgroundColor: Colors.blue),
              onPressed: _saveAndRefresh,
              child: const Text("CONFIRM SELECTION", style: TextStyle(color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
