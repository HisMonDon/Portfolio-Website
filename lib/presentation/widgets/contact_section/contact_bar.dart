import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactBar extends StatelessWidget {
  const ContactBar({super.key});

  @override
  //can reuse this function for other widgets
  void openLink(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'error, cant launch url $url';
    }
  }

  void sendEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: 'eric.luchenyu@gmail.com');

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch email';
    }
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              openLink('https://github.com/HisMonDon');
            },
            child: SizedBox(
              height: 35,
              width: 35,
              child: Image.asset('images/contact_icons/1.png'),
            ),
          ),
        ),
        SizedBox(width: 5),
        Container(width: 1, height: 30, color: Colors.grey),

        SizedBox(width: 5),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              openLink('https://www.linkedin.com/in/chenyu-lu-53b09938a/');
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset('images/contact_icons/2.png'),
            ),
          ),
        ),

        SizedBox(width: 5),
        Container(width: 1, height: 30, color: Colors.grey),
        SizedBox(width: 5),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              sendEmail();
            },
            child: Icon(Icons.email_outlined, color: Colors.blue, size: 30.0),
          ),
        ),
      ],
    );
  }
}
