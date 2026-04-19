import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:installed_apps/app_info.dart';

void main() => runApp(const MaterialApp(home: FolderManager(), debugShowCheckedModeBanner: false));

class FolderManager extends StatefulWidget {
  const FolderManager({super.key});
  @override
  State<FolderManager> createState() => _FolderManagerState();
}

class _FolderManagerState extends State<FolderManager> {
  List<AppInfo> allApps = [];
  List<String> selectedPackages = [];
  double _opacity = 0.6;

  @override
  void initState() {
    super.initState();
    _loadApps();
  }

  _loadApps() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true);
    setState(() => allApps = apps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Apps for Folder"), backgroundColor: Colors.black87),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            color: Colors.grey[200],
            child: Row(children: [
              const Text("Opacity:"),
              Expanded(child: Slider(value: _opacity, onChanged: (v) => setState(() => _opacity = v))),
            ]),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allApps.length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                  secondary: allApps[i].icon != null ? Image.memory(allApps[i].icon!, width: 40) : null,
                  title: Text(allApps[i].name ?? "Unknown"),
                  subtitle: Text(allApps[i].packageName ?? ""),
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
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white
              ),
              onPressed: () {
                print("Selected: $selectedPackages");
              },
              child: const Text("SAVE AND UPDATE WIDGET"),
            ),
          )
        ],
      ),
    );
  }
}
