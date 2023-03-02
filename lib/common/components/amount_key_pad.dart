import 'package:advansio_test/common/utils/extensions.dart';
import 'package:flutter/material.dart';

class AmountKeyPad extends StatefulWidget {
  final Function(String) onChange;
  final int kMax;
  final bool isStartWithZero;

  const AmountKeyPad(
      {Key? key,
      this.kMax = 11,
      required this.onChange,
      this.isStartWithZero = false})
      : super(key: key);

  @override
  State<AmountKeyPad> createState() => _AmountKeyPadState();
}

class _AmountKeyPadState extends State<AmountKeyPad> {
  final double kPadHeight = 65;
  String keyValue = "";

  void _onChange(KeyPadItem key) {
    String value = key.value;
    if (value == 'delete') {
      if (keyValue.isNotEmpty && keyValue != "0.0" && keyValue != "0") {
        keyValue = keyValue.substring(0, keyValue.length - 1);
        setState(() {
          if (widget.isStartWithZero) {
            widget.onChange(keyValue);
          } else {
            widget.onChange(keyValue.toDouble().toString());
          }
        });
      }
      return;
    }
    if (value == "") return;

    if (_canEditText(keyValue, value)) {
      keyValue += value;
      setState(() {
        if (widget.isStartWithZero) {
          widget.onChange(keyValue);
        } else {
          widget.onChange(keyValue.toDouble().toString());
        }
      });
    }
  }

  bool _canEditText(String text, String value) {
    final dotChar = value == '.';
    // text cannot start with a leading dot
    if (text.isEmpty && dotChar) return false;
    if (keyValue.length == widget.kMax) return false;
    // cannot add zeros to empty text
    if (value.toInt() == 0 && widget.isStartWithZero) return true;
    // cannot add another dot if a dot already exist
    if (text.contains(".")) {
      if (dotChar) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kPadHeight * 4 + 40,
      child: Column(
        children: [
          ...numberKeys
              .map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: e
                        .map(
                          (key) => Expanded(
                            child: SizedBox(
                              height: kPadHeight,
                              child: _KeyPadButtonItem(
                                key,
                                onTap: () => _onChange(key),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ))
              .toList(),
        ],
      ),
    );
  }
}

class _KeyPadButtonItem extends StatelessWidget {
  final KeyPadItem keyPadItem;
  final Color? color;
  final Widget? child;
  final Function? onTap;

  const _KeyPadButtonItem(this.keyPadItem,
      {this.color, this.child, this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Colors.white,
        ),
        child: Center(
          child: (keyPadItem.isNum)
              ? child ??
                  Text(
                    keyPadItem.value,
                    style: const TextStyle(
                      fontSize: 32,
                      color: Color(0xFF2C2835),
                      fontWeight: FontWeight.w400,
                    ),
                  )
              : const ImageIcon(AssetImage("assets/icons/delete.png")),
        ),
      ),
    );
  }
}

class KeyPadItem {
  String value;

  bool get isNum => value != "delete";

  KeyPadItem(this.value);
}

final List<List<KeyPadItem>> numberKeys = [
  [
    KeyPadItem("1"),
    KeyPadItem("2"),
    KeyPadItem("3"),
  ],
  [
    KeyPadItem("4"),
    KeyPadItem("5"),
    KeyPadItem("6"),
  ],
  [
    KeyPadItem("7"),
    KeyPadItem("8"),
    KeyPadItem("9"),
  ],
  [
    KeyPadItem("."),
    KeyPadItem("0"),
    KeyPadItem("delete"),
  ]
];
