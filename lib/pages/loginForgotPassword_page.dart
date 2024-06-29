import 'package:fhasier/constants/constants.dart';
import 'package:fhasier/pages/loginCheckMain_page.dart';
import 'package:fhasier/widgets/buttomBack.dart';
import 'package:flutter/material.dart';

class LoginforgotpasswordPage extends StatefulWidget {
  const LoginforgotpasswordPage({super.key});

  @override
  State<LoginforgotpasswordPage> createState() =>
      _LoginforgotpasswordPageState();
}

class _LoginforgotpasswordPageState extends State<LoginforgotpasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  bool _emailValid = false;
  void _checkFields() {
    setState(() {
      final email = _emailController.text;
      final emailValid =
          RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
      _emailValid = emailValid;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkFields);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -200,
            right: -200,
            child: Image.asset("assets/images/Ellipse-blur.png"),
          ),
          const Buttomback(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: Image.asset("assets/images/illustration-forgot.png"),
                  ),
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w100),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Don’t worry! It happens. Please enter the address \nassociated with your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Fdarkgrey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: TextStyle(color: Fdarkgrey),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Flightgrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.all(16),
                        hintText: 'Enter email',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Fdarkgrey,
                        ),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Fdarkgrey,
                        ),
                        suffixIcon: Icon(
                          _emailValid ? Icons.check_circle_outlined : null,
                          color: Fgreen,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    width: 374,
                    height: 52,
                    child: ElevatedButton.icon(
                      onPressed: _emailValid
                          ? () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LogincheckmainPage(),
                                ),
                              );
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _emailValid ? Fprimary : Fgrey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Verify",
                            style: TextStyle(
                              fontSize: 16,
                              color: _emailValid ? Colors.white : Fdarkgrey,
                            ),
                          ),
                          const SizedBox(width: 8),
                          AnimatedOpacity(
                            opacity: _emailValid ? 1 : 0,
                            duration: Durations.extralong1,
                            child: const Icon(
                              Icons.arrow_right_alt,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
