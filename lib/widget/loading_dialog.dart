import 'package:flutter/material.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class LoadingDialog extends StatelessWidget {
  final VoidCallback? okClick;

  const LoadingDialog({Key? key, this.okClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: ThemeColors.lightOverlay80(),
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: ThemeColors.white(),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 150,
            width: 150,
            margin: const EdgeInsets.only(bottom: 25),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/sushiarigato-smile.png'),
                fit: BoxFit.cover,
              ),
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
