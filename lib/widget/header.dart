import 'package:flutter/material.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          'SushiArigato',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: ThemeColors.white(),
          ),
        ),
      ],
    );
  }
}
