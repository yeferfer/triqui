import 'package:triqui/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../provider/provider.dart';

class WinPage extends StatelessWidget {
  final bool win;
  const WinPage({Key? key, required this.win}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "El jugador ${win ? "1" : "2"} es el ganador".toUpperCase(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Lottie.asset("assets/lottie/win.json"),
            ),
            CupertinoButton(
              child: const Text("Jugar de Nuevo"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const TriquiPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
