import 'package:flutter/material.dart';

class FullWidthButton extends StatelessWidget {
  Widget child;
  Function() onPressed = () => print("FullWidthButton");

  FullWidthButton(
      {super.key, required this.child, required Function()? onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: onPressed,
                child: child)
          ],
        ));
  }
}
