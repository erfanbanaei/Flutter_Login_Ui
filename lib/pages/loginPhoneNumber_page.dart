import 'package:fhasier/constants/constants.dart';
import 'package:fhasier/pages/loginPhoneNumberVerify_page.dart';
import 'package:fhasier/widgets/buttomBack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Country {
  final String name;
  final String flag;
  final String code;

  Country(this.name, this.flag, this.code);
}

class LoginphonenumberPage extends StatefulWidget {
  const LoginphonenumberPage({super.key});

  @override
  State<LoginphonenumberPage> createState() => _LoginphonenumberPageState();
}

class _LoginphonenumberPageState extends State<LoginphonenumberPage> {
  Country _selectedCountry = countries[0];
  final TextEditingController _phoneNumberController = TextEditingController();
  final ValueNotifier<bool> _isPhoneNumberNotEmpty = ValueNotifier(false);

  static final List<Country> countries = [
    Country('Brazil', 'assets/images/flags/brazil.png', '+55'),
    Country('India', 'assets/images/flags/india.png', '+91'),
    Country('Italy', 'assets/images/flags/italy.png', '+39'),
    Country('Iran', 'assets/images/flags/iran.png', '+98'),
    Country('Japan', 'assets/images/flags/japan.png', '+81'),
    Country('Brunei', 'assets/images/flags/brunei.png', '+673'),
  ];

  @override
  void initState() {
    super.initState();
    _phoneNumberController.addListener(_checkPhoneNumber);
  }

  void _checkPhoneNumber() {
    _isPhoneNumberNotEmpty.value = _phoneNumberController.text.isNotEmpty;
  }

  void _navigateToNextPage() {
    final String phoneNumber = _phoneNumberController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginphonenumberverifyPage(
          selectedCountry: _selectedCountry,
          phoneNumber: phoneNumber,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _phoneNumberController.removeListener(_checkPhoneNumber);
    _phoneNumberController.dispose();
    _isPhoneNumberNotEmpty.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
                    "Phone Number",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w100),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Please enter your phone number to verify your \naccount",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Fdarkgrey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: Flightgrey,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButton<Country>(
                            value: _selectedCountry,
                            items: countries.map((Country country) {
                              return DropdownMenuItem<Country>(
                                value: country,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      country.flag,
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(country.name),
                                    const SizedBox(width: 8),
                                    Text(country.code),
                                  ],
                                ),
                              );
                            }).toList(),
                            onChanged: (Country? newValue) {
                              setState(() {
                                _selectedCountry = newValue!;
                              });
                            },
                            dropdownColor: Colors.white,
                            underline: Container(),
                            icon: const Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Flightgrey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextField(
                              controller: _phoneNumberController,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.all(16),
                                hintText: "484 4648 46846",
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Fdarkgrey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  ValueListenableBuilder<bool>(
                    valueListenable: _isPhoneNumberNotEmpty,
                    builder: (context, isPhoneNumberNotEmpty, child) {
                      return SizedBox(
                        width: 374,
                        height: 52,
                        child: ElevatedButton.icon(
                          onPressed: isPhoneNumberNotEmpty
                              ? _navigateToNextPage
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                isPhoneNumberNotEmpty ? Fprimary : Fdarkgrey,
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
                                  color: isPhoneNumberNotEmpty
                                      ? Colors.white
                                      : Fdarkgrey,
                                ),
                              ),
                              const SizedBox(width: 8),
                              AnimatedOpacity(
                                opacity: isPhoneNumberNotEmpty ? 1 : 0,
                                duration: Durations.extralong1,
                                child: const Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
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
  }
}
