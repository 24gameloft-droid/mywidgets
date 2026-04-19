import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: SalehApp(), debugShowCheckedModeBanner: false));

class SalehApp extends StatelessWidget {
  const SalehApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A2E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_awesome, color: Colors.cyanAccent, size: 80),
            const SizedBox(height: 20),
            const Text("Saleh's Smart Folder", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("تم إتقان التطبيق بنجاح. الآن اخرج للشاشة الرئيسية وأضف الوجت وسترى السحر.", 
                          textAlign: TextAlign.center, style: TextStyle(color: Colors.white70)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(color: Colors.cyanAccent, borderRadius: BorderRadius.circular(30)),
              child: const Text("READY TO USE", style: TextStyle(fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
