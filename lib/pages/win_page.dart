import 'package:provider/provider.dart';
import 'package:triqui/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:triqui/provider/count.dart';

class WinPage extends StatelessWidget {
  final bool win;
  const WinPage({Key? key, required this.win}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountProvider watch = context.watch<CountProvider>();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: win
              ? [
                  const Color.fromRGBO(245, 183, 177, 1),
                  const Color.fromRGBO(236, 112, 99, 1),
                  const Color.fromRGBO(231, 76, 60, 1),
                  const Color.fromRGBO(155, 89, 182, 1),
                  const Color.fromRGBO(175, 122, 197, 1),
                  const Color.fromRGBO(195, 155, 211, 1),
                ]
              : [
                  const Color.fromRGBO(174, 214, 241, 1),
                  const Color.fromRGBO(93, 173, 226, 1),
                  const Color.fromRGBO(52, 152, 219, 1),
                  const Color.fromRGBO(155, 89, 182, 1),
                  const Color.fromRGBO(175, 122, 197, 1),
                  const Color.fromRGBO(195, 155, 211, 1),
                ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Text(
                  win ? "X" : "O",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Es el ganador".toUpperCase(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Lottie.asset("assets/lottie/win.json"),
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const TriquiPage()),
                  );
                  win
                      ? context
                          .read<CountProvider>()
                          .setXWin(win: watch.xWin + 1)
                      : context
                          .read<CountProvider>()
                          .setOWin(win: watch.oWin + 1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
