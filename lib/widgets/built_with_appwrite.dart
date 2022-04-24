import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuiltWithAppwriteWrapper extends StatelessWidget {
  const BuiltWithAppwriteWrapper({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: child,
          ),
          const SizedBox(height: 10.0),
          SvgPicture.asset('assets/built-with-appwrite-hr.svg'),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
