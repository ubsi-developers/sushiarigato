import 'package:flutter/material.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class SuccessDialog extends StatelessWidget {
  final String? description;
  final VoidCallback? okClick;

  const SuccessDialog({Key? key, this.description, this.okClick})
      : super(key: key);

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
            margin: const EdgeInsets.only(bottom: 25),
            child: Text(
              "Gagal",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: ThemeColors.success(),
              ),
            ),
          ),
          Container(
            height: 120,
            width: 120,
            margin: const EdgeInsets.only(bottom: 25),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/sushiarigato-smile.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Text(
              description!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: ThemeColors.dark(),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ThemeColors.primary(),
                      minimumSize: const Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: const Text("OK"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
