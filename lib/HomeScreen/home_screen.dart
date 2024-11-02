import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            LottieBuilder.network(
              "https://lottie.host/271d759f-f018-4717-9884-cde5961844ea/Ulq5mzycYP.json",
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Congratulations",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
