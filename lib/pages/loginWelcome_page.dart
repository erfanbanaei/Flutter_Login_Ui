import 'package:fhasier/constants/constants.dart';
import 'package:fhasier/pages/login_page.dart';
import 'package:flutter/material.dart';

class LoginwelcomePage extends StatelessWidget {
  const LoginwelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Image.asset("assets/images/illustration-cashier.png"),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Yeay, Welcome",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                    color: Fblack,
                    fontFamily: "Gilroy",
                  ),
                ),
                const Text(
                  "You have successfully registered, managing your\n business is made easier with fasier",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Fdarkgrey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 374,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(Fprimary),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Finish",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
