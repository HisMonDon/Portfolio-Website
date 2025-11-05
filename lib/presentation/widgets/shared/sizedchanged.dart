import 'package:flutter/material.dart';
import 'package:portfolio_website/core/constants/globals.dart' as globals;

class SizedChanged extends StatefulWidget {
  const SizedChanged({Key? key}) : super(key: key);

  @override
  _SizedChangedState createState() => _SizedChangedState();
}

class _SizedChangedState extends State<SizedChanged>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (SizeChangedLayoutNotification notification) {
        Future.delayed(Duration(milliseconds: 300), () {
          setState(() {
            print('window size changed');
          });
        });
        return true;
      },
      child: SizeChangedLayoutNotifier(),
    );
  }
}
