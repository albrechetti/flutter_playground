import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TinderLogin extends StatefulWidget {
  const TinderLogin({Key? key}) : super(key: key);

  @override
  State<TinderLogin> createState() => _TinderLoginState();
}

class _TinderLoginState extends State<TinderLogin> {
  Color firstColor = const Color(0xFFfd2c74);
  Color secondColor = const Color(0xFFFF5E63);
  Color thirdColor = const Color(0xFFff5a5f);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            transform: const GradientRotation(math.pi / 4),
            colors: [firstColor, thirdColor, secondColor],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          //crossAxisAlignment: CrossAxisAlignment.
          children: [
            SizedBox(
              width: 200,
              child: Image.asset('../assets/tinder.png'),
            ),
            const SizedBox(height: 120),
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text:
                        'By tapping Create Account or Sign In, you agree to our ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: 'Terms. ',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text: 'Terms. Learn how we process your data in our ',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: 'Cookies Policy.',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const CustomButton(
                text: 'Sign in with Apple', icon: Icon(FontAwesomeIcons.apple)),
            const SizedBox(height: 10),
            const CustomButton(
                text: 'Sign in with Facebook',
                icon: Icon(FontAwesomeIcons.facebook)),
            const SizedBox(height: 10),
            const CustomButton(
                text: 'Sign in with Phone Number',
                icon: Icon(Icons.chat_bubble)),
            const SizedBox(height: 30),
            const Text(
              'Trouble Signing In?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2, bottom: 4, top: 2),
              child: Align(
                child: icon,
                alignment: Alignment.centerLeft,
              ),
            ),
            Align(
              child: Text(text.toUpperCase()),
              alignment: Alignment.center,
            ),
          ],
        ),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.all(14.0),
          primary: Colors.white,
          side: const BorderSide(color: Colors.white, width: 1.5),
          textStyle: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
