import 'package:advansio_test/common/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../common/components/amount_key_pad.dart';
import '../common/components/custom_button.dart';
import '../common/components/pin_box.dart';

class SetPinScreen extends StatefulWidget {
  const SetPinScreen({Key? key}) : super(key: key);

  @override
  State<SetPinScreen> createState() => _SetPinScreenState();
}

class _SetPinScreenState extends State<SetPinScreen> {
  String transactionPin = '';
  TextEditingController? contrller1;
  TextEditingController? contrller2;
  TextEditingController? contrller3;
  TextEditingController? contrller4;
  TextEditingController? contrller5;

  @override
  void initState() {
    super.initState();
    contrller1 = TextEditingController();
    contrller2 = TextEditingController();
    contrller3 = TextEditingController();
    contrller4 = TextEditingController();
    contrller5 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(37.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Set your PIN",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.apply(color: const Color(0xFF1C1939))),
                const SizedBox(
                  height: 21,
                ),
                const Text(
                  "You will use this to login next time",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1C1939)),
                ),
                const SizedBox(
                  height: 46,
                ),
                SizedBox(
                    height: 68,
                    width: context.width,
                    child: Row(children: [
                      Flexible(
                          child: PinBox(
                              first: true,
                              last: false,
                              controller: contrller1,
                              isKeyBoardAllowed: false)),
                      Flexible(
                          child: PinBox(
                              first: false,
                              last: false,
                              controller: contrller2,
                              isKeyBoardAllowed: false)),
                      Flexible(
                          child: PinBox(
                              first: false,
                              last: false,
                              controller: contrller3,
                              isKeyBoardAllowed: false)),
                      Flexible(
                          child: PinBox(
                              first: false,
                              last: false,
                              controller: contrller4,
                              isKeyBoardAllowed: false)),
                      Flexible(
                          child: PinBox(
                              first: false,
                              last: false,
                              controller: contrller5,
                              isKeyBoardAllowed: false))
                    ])),
                AmountKeyPad(
                  isStartWithZero: true,
                  kMax: 5,
                  onChange: (value) {
                    debugPrint("Value is $value");
                    transactionPin = value;
                    debugPrint("TransactionPin is $transactionPin");

                    if (transactionPin.length == 1) {
                      contrller1!.text = "*";
                    } else if (transactionPin.length == 2) {
                      contrller2!.text = "*";
                    } else if (transactionPin.length == 3) {
                      contrller3!.text = "*";
                    } else if (transactionPin.length == 4) {
                      contrller4!.text = "*";
                    } else if (transactionPin.length == 5) {
                      contrller5!.text = "*";
                    }

                    if (value.isEmpty) {
                      contrller1!.text = "";
                    } else if (transactionPin.length == 1) {
                      contrller2!.text = "";
                    } else if (transactionPin.length == 2) {
                      contrller3!.text = "";
                    } else if (transactionPin.length == 3) {
                      contrller4!.text = "";
                    } else if (transactionPin.length == 4) {
                      contrller5!.text = "";
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: CustomButton(
                      width: context.width,
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //   return const AccountCreatedScreen();
                        // }));
                      },
                      buttonText: "Save PIN"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
