import 'package:advansio_test/common/utils/extensions.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'auth/sign_up_screen.dart';
import 'common/components/custom_button.dart';
import 'common/utils/pallete.dart';
import 'navigation/advansio_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light(),
        home: const SplashScreen(),
        routes: {
          AdvansioPages.splashPath: (context) => const SplashScreen(),
        });
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(
        width: 350,
        height: 450,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        image: const DecorationImage(
          image: AssetImage("assets/images/splash_image.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 60),
        child: Column(
          children: [
            CustomButton(
                width: context.width,
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //   return WelcomePageScreen(
                  //     authOption: AuthOption.signUp,
                  //   );
                  // }));
                },
                buttonText: "Lend'n"),
            const Spacer(),
            CustomButton(
                width: context.width,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                },
                color: Colors.white,
                buttonTextColor: const Color(0xFF121032),
                buttonText: "Get Started"),
          ],
        ),
      ),
    );
  }
}
