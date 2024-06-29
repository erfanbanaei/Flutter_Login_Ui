import 'package:fhasier/constants/constants.dart';
import 'package:fhasier/pages/loginWelcome_page.dart';
import 'package:fhasier/widgets/buttomBack.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginregisterPage extends StatefulWidget {
  const LoginregisterPage({super.key});

  @override
  State<LoginregisterPage> createState() => _LoginregisterPageState();
}

class _LoginregisterPageState extends State<LoginregisterPage> {
  bool? _onCheckBox = false;
  bool _isButtonActive = false;
  bool _emailValid = false;
  bool _showPassword = true;
  bool _showPasswordConfirm = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _checkFields() {
    setState(() {
      final email = _emailController.text;
      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;
      final emailValid =
          RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
      _emailValid = emailValid;
      final passwordValid = password.length > 8;
      final passwordconfirmValid = password.length > 8;
      _isButtonActive = emailValid &&
          passwordValid == passwordconfirmValid &&
          password == confirmPassword;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_checkFields);
    _passwordController.addListener(_checkFields);
    _confirmPasswordController.addListener(_checkFields);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            child: Column(
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w100),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(color: Fdarkgrey, fontSize: 12),
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
                            hintText: "Enter email",
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
                      const SizedBox(height: 30),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                          style: TextStyle(color: Fdarkgrey, fontSize: 12),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Flightgrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _showPassword,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.all(16),
                            hintText: "Enter password",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Fdarkgrey,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                                color: Fdarkgrey,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Confirm Password",
                          style: TextStyle(color: Fdarkgrey, fontSize: 12),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Flightgrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _confirmPasswordController,
                          obscureText: _showPasswordConfirm,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: const EdgeInsets.all(16),
                            hintText: "Enter password",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              color: Fdarkgrey,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _showPasswordConfirm = !_showPasswordConfirm;
                                });
                              },
                              child: Icon(
                                _showPasswordConfirm
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                                color: Fdarkgrey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: _onCheckBox,
                            activeColor: Fprimary,
                            onChanged: (value) {
                              setState(() {
                                _onCheckBox = value;
                              });
                            },
                          ),
                          RichText(
                            text: const TextSpan(
                              text: "I agree to ",
                              style: TextStyle(color: Fblack, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Term of Service ",
                                  style:
                                      TextStyle(color: Fprimary, fontSize: 14),
                                ),
                                TextSpan(
                                  text: "and ",
                                  style: TextStyle(color: Fblack, fontSize: 14),
                                ),
                                TextSpan(
                                  text: "Privacy Policy",
                                  style:
                                      TextStyle(color: Fprimary, fontSize: 14),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: 374,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: _isButtonActive
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const LoginwelcomePage(),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isButtonActive ? Fprimary : Fgrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Register",
                          style: TextStyle(
                            fontSize: 16,
                            color: _isButtonActive ? Colors.white : Fdarkgrey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        AnimatedOpacity(
                          opacity: _isButtonActive ? 1 : 0,
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
                const SizedBox(height: 50),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(color: Fdarkgrey, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(color: Fprimary, fontSize: 14),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).pop();
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
