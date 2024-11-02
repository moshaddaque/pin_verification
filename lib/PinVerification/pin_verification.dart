import 'dart:math';

import 'package:flutter/material.dart';
import 'package:otp_varification/HomeScreen/home_screen.dart';
import 'package:pinput/pinput.dart';

class PinVerification extends StatefulWidget {
  const PinVerification({super.key});

  @override
  State<PinVerification> createState() => _PinVerificationState();
}

class _PinVerificationState extends State<PinVerification> {
  String randomNumber = "";
  @override
  void initState() {
    randomGenerate();
    super.initState();
  }

  randomGenerate() {
    setState(() {
      randomNumber = (100000 + Random().nextInt(900000)).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    String pinNumber = "";
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Input Your Validate Pin",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Your Pin Is: $randomNumber"),
              Pinput(
                length: 6,
                validator: (pin) {
                  return pin == randomNumber ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  pinNumber = pin;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (pinNumber.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Input Valid Pin"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(pinNumber),
                        ),
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Submit Now",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
