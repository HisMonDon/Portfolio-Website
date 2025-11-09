import 'package:flutter/material.dart';
import "package:simple_icons/simple_icons.dart";

class ContactBar extends StatelessWidget {
  const ContactBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('images/icons/1.png'),

        Image.asset('images/icons/2.png'),
        // Icon(MyFlutterApp.linkedin_squared),
        Icon(Icons.email_outlined),
      ],
    );
  }
}
