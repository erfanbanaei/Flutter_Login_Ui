import 'package:fhasier/pages/loginEmail_page.dart';
import 'package:fhasier/pages/loginPhoneNumber_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fhasier/constants/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final height = constraints.maxHeight;
          final width = constraints.maxWidth;

          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.1),
                  const Text(
                    "Fhasier",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      color: Fprimary,
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  const Text(
                    "Cashier app for your business",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: Fblack,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.4,
                    child:
                        Image.asset("assets/images/illustration-cashier.png"),
                  ),
                  SizedBox(height: height * 0.1),
                  const Text(
                    "Continue With",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: height * 0.05),
                  SizedBox(
                    width: width * 0.9,
                    height: height * 0.07,
                    child: OutlinedButton.icon(
                      onPressed: null,
                      icon: Image.asset("assets/images/ic_google.png"),
                      label: const Text(
                        "Google",
                        style: TextStyle(
                          fontSize: 16,
                          color: Fblack,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  SizedBox(
                    width: width * 0.9,
                    height: height * 0.07,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginEmailPage(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 16,
                          color: Fblack,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  RichText(
                    text: TextSpan(
                      text: "Or login with ",
                      style: const TextStyle(color: Fdarkgrey, fontSize: 14),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Phone Number",
                          style: const TextStyle(color: Fprimary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginphonenumberPage(),
                                ),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
