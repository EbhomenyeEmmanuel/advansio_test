import 'package:advansio_test/common/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../common/components/custom_button.dart';
import 'set_pin_screen.dart';

class AccountCreatedScreen extends StatelessWidget {
  const AccountCreatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(37.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/thumbs_up.png')),
              const Spacer(),
              Text("Account Created!",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.apply(color: const Color(0xFF1C193))),
              const SizedBox(
                height: 21,
              ),
              const Text(
                "Dear user your account has been created successfully. Continue to start using app",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF1C1939)),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: CustomButton(
                    width: context.width,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SetPinScreen();
                      }));
                    },
                    buttonText: "Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
