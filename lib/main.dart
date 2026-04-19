import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: FolderSettings(),
    debugShowCheckedModeBanner: false,
  ));
}

class FolderSettings extends StatefulWidget {
  const FolderSettings({super.key});
  @override
  State<FolderSettings> createState() => _FolderSettingsState();
}

class _FolderSettingsState extends State<FolderSettings> {
  double _opacity = 0.7;
  Color _selectedColor = Colors.indigo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Folder Config"),
        backgroundColor: _selectedColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text("Widget Transparency"),
            Slider(
              value: _opacity,
              onChanged: (value) => setState(() => _opacity = value),
            ),
            const SizedBox(height: 20),
            const Text("Choose Background Color"),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Colors.black, Colors.indigo, Colors.teal, Colors.blueGrey].map((color) {
                return GestureDetector(
                  onTap: () => setState(() => _selectedColor = color),
                  child: CircleAvatar(backgroundColor: color, radius: 25),
                );
              }).toList(),
            ),
            const Spacer(),
            const Text("Apps list for scrolling folder will appear here", style: TextStyle(color: Colors.grey)),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              onPressed: () {},
              child: const Text("Apply Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
