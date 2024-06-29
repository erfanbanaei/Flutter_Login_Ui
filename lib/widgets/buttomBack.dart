import "package:fhasier/constants/constants.dart";
import "package:flutter/material.dart";

class Buttomback extends StatelessWidget {
  const Buttomback({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          TextButton.icon(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: const ButtonStyle(
              iconColor: WidgetStatePropertyAll(Fblack),
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
            ),
            label: const Text(
              "Back",
              style: TextStyle(color: Fblack),
            ),
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 18,
            ),
          )
        ],
      ),
    );
  }
}
