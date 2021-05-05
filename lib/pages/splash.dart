import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

//"A bug reproduced is a bug half solved."
class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 100,
              width: 100,
              child: LiquidCircularProgressIndicator(
                borderWidth: 1.0,
                borderColor: Colors.blue,
                value: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            "Stay healthy,\nstay fit".toUpperCase(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
