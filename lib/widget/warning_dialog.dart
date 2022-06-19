import 'package:flutter/material.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';

class Consts {
  Consts._();

  static const double padding = 16.0;
  static const double avatarRadius = 66.0;
}

class WarningDialog extends StatelessWidget {
  final String? description;
  final VoidCallback? okClick;

  const WarningDialog({Key? key, this.description, this.okClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Consts.padding),
      ),
      elevation: 0.0,
      backgroundColor: ThemeColors.darkOverlay30(),
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: Consts.padding,
        bottom: Consts.padding,
        left: Consts.padding,
        right: Consts.padding,
      ),
      margin: const EdgeInsets.only(top: Consts.avatarRadius),
      decoration: BoxDecoration(
        color: ThemeColors.white(),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(Consts.padding),
        boxShadow: [
          BoxShadow(
            color: ThemeColors.dark(),
            blurRadius: 10.0,
            // offset: const Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Gagal",
            style: TextStyle(
                fontSize: 24.0, fontWeight: FontWeight.w700, color: Colors.red),
          ),
          const SizedBox(height: 16.0),
          Text(
            description!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: ThemeColors.dark(),
            ),
          ),
          const SizedBox(height: 24.0),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // To close the dialog
              },
              child: const Text("OK"),
            ),
          )
        ],
      ),
    );
  }
}
