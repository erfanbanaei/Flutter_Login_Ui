import 'dart:async';

import 'package:fhasier/constants/constants.dart';
import 'package:fhasier/pages/loginPhoneNumber_page.dart';
import 'package:fhasier/pages/login_page.dart';
import 'package:fhasier/widgets/buttomBack.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginphonenumberverifyPage extends StatefulWidget {
  final Country selectedCountry;
  final String phoneNumber;

  const LoginphonenumberverifyPage({
    super.key,
    required this.selectedCountry,
    required this.phoneNumber,
  });

  @override
  State<LoginphonenumberverifyPage> createState() =>
      _LoginphonenumberverifyPageState();
}

class _LoginphonenumberverifyPageState
    extends State<LoginphonenumberverifyPage> {
  late Timer _timer;
  int _timerStart = 10;
  final List<TextEditingController> _codeControllers =
      List.generate(4, (_) => TextEditingController());
  bool _allFieldsFilled = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
    for (var controller in _codeControllers) {
      controller.addListener(_checkFieldsFilled);
    }
  }

  void _startTimer() {
    setState(() {
      _timerStart = 10;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timerStart == 0) {
        timer.cancel();
      } else {
        setState(() {
          _timerStart--;
        });
      }
    });
  }

  void _resendCode() {
    _timer.cancel();
    _startTimer();
  }

  void _checkFieldsFilled() {
    bool allFilled =
        _codeControllers.every((controller) => controller.text.isNotEmpty);
    setState(() {
      _allFieldsFilled = allFilled;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in _codeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildCodeTextField(BuildContext context, int index) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Flightgrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _codeControllers[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none),
          counterText: "",
        ),
        onChanged: (value) {
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
          _checkFieldsFilled();
        },
      ),
    );
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
                SizedBox(
                  height: 250,
                  width: 250,
                  child:
                      Image.asset("assets/images/illustration-smartphone.png"),
                ),
                const Text(
                  "Verify Your Phone",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w100),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Please enter the 4 digit code sent to",
                  style: TextStyle(
                    color: Fdarkgrey,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${widget.selectedCountry.code} ${widget.phoneNumber}",
                  style: const TextStyle(
                    color: Fprimary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => _buildCodeTextField(context, index),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 374,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: _allFieldsFilled
                        ? () {
                            Navigator.of(context)
                              .push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _allFieldsFilled ? Fprimary : Fgrey,
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
                            color: _allFieldsFilled ? Colors.white : Fdarkgrey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        AnimatedOpacity(
                          opacity: _allFieldsFilled ? 1 : 0,
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
                const SizedBox(height: 20),
                Text(
                  "00:$_timerStart",
                  style: const TextStyle(color: Fdarkgrey, fontSize: 14),
                ),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: "Didn’t receive the code? ",
                    style: const TextStyle(color: Fdarkgrey, fontSize: 14),
                    children: <TextSpan>[
                      TextSpan(
                        text: "Resend",
                        style: const TextStyle(color: Fprimary, fontSize: 14),
                        recognizer: TapGestureRecognizer()..onTap = _resendCode,
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