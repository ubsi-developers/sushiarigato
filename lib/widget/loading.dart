import 'package:flutter/material.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            margin: const EdgeInsets.only(bottom: 25),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/sushiemoji.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              "Tunggu sebentar, ya...",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ThemeColors.dark(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Text(
              "Loading",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: ThemeColors.dark(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
