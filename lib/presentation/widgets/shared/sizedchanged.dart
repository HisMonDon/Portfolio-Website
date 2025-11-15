import 'package:flutter/material.dart';

class SizedChanged extends StatefulWidget {
  final Widget child;
  const SizedChanged({Key? key, required this.child}) : super(key: key);

  @override
  _SizedChangedState createState() => _SizedChangedState();
}

class _SizedChangedState extends State<SizedChanged>
    with WidgetsBindingObserver {
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
  void didChangeMetrics() {
    super.didChangeMetrics();
    print("window size changed");

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
