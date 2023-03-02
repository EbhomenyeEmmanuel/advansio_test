import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/pallete.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? hint;
  final String? value;
  final bool autofocus;
  final bool isImportantField;
  final int lines;
  final TextEditingController? textEditingController;
  final TextInputType keyboardType;
  final String? errorText;
  final String? successText;
  final Function(String)? onChange;
  final Function(String)? onSubmitted;
  final List<TextInputFormatter> formatter;
  final Widget? prefix;
  final bool enabled;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextAlign inputTextAlign;

  CustomTextField(
      {Key? key,
      this.title,
      this.hint,
      this.value,
      this.textEditingController,
      this.autofocus = false,
      this.isImportantField = false,
      this.keyboardType = TextInputType.text,
      this.lines = 1,
      this.errorText,
      this.successText,
      this.onChange,
      this.onSubmitted,
      this.formatter = const [],
      this.prefix,
      this.enabled = true,
      this.suffixIcon,
      this.validator,
      this.inputTextAlign = TextAlign.start})
      : super(key: key);

  final outline = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xffBDBDBD), width: 1.0),
    borderRadius: BorderRadius.circular(16.0),
  );

  final errorOutline = OutlineInputBorder(
    borderSide: const BorderSide(color: Palette.errorColor, width: 1.0),
    borderRadius: BorderRadius.circular(16.0),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          TextFormField(
            // minLines: lines,
            // maxLines: 10,
            initialValue: value,
            textAlign: inputTextAlign,
            enabled: enabled,
            keyboardType: keyboardType,
            inputFormatters: formatter,
            autofocus: autofocus,
            controller: textEditingController,
            obscureText: isImportantField,
            obscuringCharacter: "*",
            onChanged: onChange,
            onFieldSubmitted: onSubmitted,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
                prefix: prefix,
                hintText: hint,
                labelStyle: const TextStyle(
                    color: Color(0xffcc101038), fontWeight: FontWeight.w500),
                hintStyle: const TextStyle(
                  color: Color(0xffcc101038),
                ),
                border: outline,
                focusedBorder: outline,
                enabledBorder: (errorText == null) ? outline : errorOutline,
                isDense: true,
                errorMaxLines: 3,
                suffixIcon: suffixIcon),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
