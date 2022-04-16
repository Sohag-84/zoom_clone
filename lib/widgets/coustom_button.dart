import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/colors.dart';

class CoustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const CoustomButton({Key? key, required this.buttonText,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 17),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 17),
        ),
        style: ElevatedButton.styleFrom(
            primary: buttonColor,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(color: buttonColor))),
      ),
    );
  }
}
