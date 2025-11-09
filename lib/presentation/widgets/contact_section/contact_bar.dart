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
        SizedBox(
          height: 35,
          width: 35,
          child: Image.asset('images/contact_icons/1.png'),
        ),
        SizedBox(width: 5),
        Container(width: 1, height: 30, color: Colors.grey),

        SizedBox(width: 5),
        SizedBox(
          height: 30,
          width: 30,
          child: Image.asset('images/contact_icons/2.png'),
        ),

        SizedBox(width: 5),
        Container(width: 1, height: 30, color: Colors.grey),
        SizedBox(width: 5),
        Icon(Icons.email_outlined, color: Colors.blue, size: 30.0),
      ],
    );
  }
}
