import 'package:advansio_test/auth/account_created_screen.dart';
import 'package:advansio_test/common/components/custom_text_field.dart';
import 'package:advansio_test/common/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../common/components/custom_button.dart';
import '../common/utils/pallete.dart';
import '../common/utils/utils.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  var isAgree = false;
  var isPasswordShown = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37.0, vertical: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1C1939)),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    const Text(
                      "Please provide following details",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1C1939)),
                    ),
                    const Text(
                      "for your new account",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1C1939)),
                    ),
                    const SizedBox(
                      height: 61,
                    ),
                    CustomTextField(
                      hint: "Full Name",
                      validator: Utils.validateTextField,
                    ),
                    CustomTextField(
                      hint: "Email Address",
                      validator: Utils.validateEmail,
                    ),
                    CustomTextField(
                      hint: "Password",
                      enabled: true,
                      isImportantField: isPasswordShown,
                      suffixIcon: InkWell(
                        child: isPasswordShown
                            ? const Icon(
                                Icons.visibility,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.visibility_off,
                                color: Colors.black,
                              ),
                        onTap: () {
                          setState(() {
                            isPasswordShown = !isPasswordShown;
                          });
                        },
                      ),
                      validator: Utils.validatePasswordTextField,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                            height: 26,
                            width: 26,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                border: Border.all(
                                    color: const Color(0xff979797), width: 1),
                                shape: BoxShape.rectangle),
                            child: isAgree
                                ? const Icon(
                                    Icons.check,
                                    size: 24,
                                  )
                                : null,
                          ),
                          onTap: () {
                            setState(() {
                              isAgree = !isAgree;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Text(
                            "By creating your account you have to agree with our Terms and Conditions.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.apply(color: const Color(0xFF16192C)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 49,
                    ),
                    CustomButton(
                        width: context.width,
                        onPressed: () {
                          if (_formKey.currentState!.validate() && isAgree) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const AccountCreatedScreen();
                            }));
                          } else if (!isAgree) {
                            Utils.displaySnackBar(context,
                                error:
                                    "You must agree to terms and conditions!");
                          }
                        },
                        buttonText: "Sign up my Account"),
                    const SizedBox(
                      height: 49,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have account? - ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.apply(color: const Color(0xFF1C1939)),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SignInScreen();
                            }));
                          },
                          child: Text(
                            "Sign In",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.apply(color: const Color(0xFF1C1939)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
