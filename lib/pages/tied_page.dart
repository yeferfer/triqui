import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../game_controller/transition_page.dart';
import '../main.dart';

class TiePage extends StatefulWidget {
  const TiePage({Key? key}) : super(key: key);

  @override
  State<TiePage> createState() => _TiePageState();
}

class _TiePageState extends State<TiePage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        CustomPageRoute(child: const TriquiPage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white10, Colors.black87, Colors.white12]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Empate".toUpperCase(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset("assets/lottie/tied.json"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
