import 'package:flutter/material.dart';
import '../utils/pallete.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final Color buttonTextColor;
  final bool isLoading;
  final bool isEnabled;
  final double height;
  final double width;
  final Color color;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.buttonTextColor = Colors.white,
      this.isLoading = false,
      this.isEnabled = true,
      this.height = 50,
      this.color = Palette.primaryColor,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              isEnabled ? color : color.withOpacity(0.4)),
          minimumSize: MaterialStateProperty.all(Size(width, height)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () => !isEnabled
            ? null
            : isLoading
                ? null
                : onPressed(),
        child: Visibility(
            visible: isLoading,
            replacement: Text(buttonText,
                style: TextStyle(
                  color: buttonTextColor,
                  fontWeight: FontWeight.bold,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonText,
                  style: TextStyle(
                    color: buttonTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: buttonTextColor,
                  ),
                ),
              ],
            )));
  }
}
