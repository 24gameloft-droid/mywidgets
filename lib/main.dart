import 'package:flutter/material.dart';
import 'package:device_apps/device_apps.dart';

void main() => runApp(const MaterialApp(home: FolderManager(), debugShowCheckedModeBanner: false));

class FolderManager extends StatefulWidget {
  const FolderManager({super.key});
  @override
  State<FolderManager> createState() => _FolderManagerState();
}

class _FolderManagerState extends State<FolderManager> {
  List<Application> allApps = [];
  List<String> selectedPackages = [];
  double _opacity = 0.5;

  @override
  void initState() {
    super.initState();
    _loadApps();
  }

  _loadApps() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
      includeAppIcons: true, includeSystemApps: true, onlyAppsWithLaunchIntent: true);
    setState(() => allApps = apps);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Apps for Folder")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              const Text("Transparency:"),
              Expanded(child: Slider(value: _opacity, onChanged: (v) => setState(() => _opacity = v))),
            ]),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: allApps.length,
              itemBuilder: (context, i) {
                return CheckboxListTile(
                  secondary: allApps[i] is ApplicationWithIcon ? Image.memory((allApps[i] as ApplicationWithIcon).icon, width: 30) : null,
                  title: Text(allApps[i].appName),
                  value: selectedPackages.contains(allApps[i].packageName),
                  onChanged: (bool? val) {
                    setState(() {
                      if (val == true) selectedPackages.add(allApps[i].packageName);
                      else selectedPackages.remove(allApps[i].packageName);
                    });
                  },
                );
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 60)),
            onPressed: () { /* حفظ الإعدادات */ },
            child: const Text("Save & Add to Home Screen"),
          )
        ],
      ),
    );
  }
}
