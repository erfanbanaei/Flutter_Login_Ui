import 'package:fhasier/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fhasier/constants/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -200,
            bottom: -200,
            child: Image.asset("assets/images/Ellipse-blur.png"),
          ),
          Positioned(
            top: -200,
            right: -200,
            child: Image.asset("assets/images/Ellipse-blur.png"),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Fhasier",
                  style: TextStyle(
                    fontFamily: "Gilroy",
                    color: Fprimary,
                    fontWeight: FontWeight.w900,
                    fontSize: 64,
                  ),
                ),
                Text(
                  "Cashier app for your business",
                  style: TextStyle(
                    fontFamily: "Mulish",
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                    color: Fblack,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
