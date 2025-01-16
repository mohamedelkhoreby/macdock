import 'package:flutter/material.dart';
import 'widgets/dock_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: DockWidget(
                  items: const [
                    Icons.person,
                    Icons.message,
                    Icons.call,
                    Icons.camera,
                    Icons.photo,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

