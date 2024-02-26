import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'main.dart';
import 'pp_screen.dart';
import 'tou_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset(
                      'assets/7.webp',
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Enjoy our car stickers sharing app',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w700, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: CupertinoButton(
                      color: Colors.redAccent,
                      child: Text('Get started',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white)),
                      onPressed: () async {
                        isFirstTime = false;
                        sharedPreferences.setBool('isFirstTime', isFirstTime!);
                        Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                                builder: (_) => const HomeScreen()));
                      }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => const TermsOfUseScreen()));
                        },
                        child: const Text('Terms of use',
                            style: TextStyle(color: Colors.white))),
                    const Text('/', style: TextStyle(color: Colors.white)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (_) => const PrivacyPolicyScreen()));
                        },
                        child: const Text('Privacy Policy',
                            style: TextStyle(color: Colors.white))),
                  ],
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
