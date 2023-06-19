import 'package:flutter/material.dart';
import 'dart:ui';
import 'sign in.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Train Tracker PH',
      theme: ThemeData(),
      home: const WelcomePage(),
    );
  }
}


class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/train.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.black.withOpacity(0.5), // Adjust the opacity of the blur effect
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 125.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to Train Driver',
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32.0),
                  const Divider(
                    color: Colors.black,
                    height: 20.0,
                    thickness: 2.0,
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
                  const SizedBox(height: 32.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: const Text(
                      'Train Driver is a mobile app for tracking trains and send coordinates in real-time. '
                          'It provides users with a simple and intuitive interface that displays '
                          "the train's current location on a map, along with estimated arrival "
                          'and departure times for each station.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const SigninPage()),
                          );// Navigate to the register.dart page
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          minimumSize: const Size(130.0, 0),
                          backgroundColor: Colors.amber,
                        ),
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}