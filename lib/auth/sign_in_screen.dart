import 'package:advansio_test/common/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../common/components/custom_button.dart';
import '../common/components/custom_text_field.dart';
import '../common/utils/utils.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
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
                    Text(
                      "Welcome!",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          ?.apply(color: const Color(0xFF1C1939)),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    const Text(
                      "Sign in to continue",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1C1939)),
                    ),
                    const SizedBox(
                      height: 61,
                    ),
                    CustomTextField(
                      hint: "Email",
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
                      height: 21,
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1C1939)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 49,
                    ),
                    CustomButton(
                        width: context.width,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) {
                            //       return const AccountCreatedScreen();
                            //     }));
                          }
                        },
                        buttonText: "Sign in My Account"),
                    const SizedBox(
                      height: 19,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? - ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.apply(color: const Color(0xFF1C1939)),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SignUpScreen();
                            }));
                          },
                          child: Text(
                            "Sign Up",
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
