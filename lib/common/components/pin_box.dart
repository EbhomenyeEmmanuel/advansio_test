import 'package:flutter/material.dart';

class PinBox extends StatelessWidget {
  final bool first;
  final bool last;
  final bool isKeyBoardAllowed;
  final TextEditingController? controller;

  const PinBox(
      {Key? key,
      required this.first,
      required this.last,
      required this.controller,
      this.isKeyBoardAllowed = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: TextField(
          showCursor: false,
          keyboardType: isKeyBoardAllowed ? TextInputType.number : null,
          readOnly: !isKeyBoardAllowed,
          controller: controller,
          obscureText: true,
          obscuringCharacter: '*',
          textAlign: TextAlign.center,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            counter: const Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffBDBDBD)),
                borderRadius: BorderRadius.circular(16)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 2, color: Color(0xffBDBDBD)),
                borderRadius: BorderRadius.circular(16)),
          ),
        ),
      ),
    );
  }
}
