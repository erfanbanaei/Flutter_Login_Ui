import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:fhasier/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white38,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: DeviceFrame(
              device: Devices.ios.iPhone13,
              screen: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(fontFamily: "Mulish"),
                home: const SplashPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
