import 'dart:core';

import 'package:flutter/material.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';
import 'package:sushiarigato/ui/admin/product/product_list.dart';
import 'package:sushiarigato/bloc/login_bloc.dart';
import 'package:sushiarigato/helpers/session.dart';
import 'package:sushiarigato/widget/loading_dialog.dart';
import 'package:sushiarigato/widget/success_dialog.dart';
import 'package:sushiarigato/widget/warning_dialog.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  late bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  late BuildContext loadingContext;

  @override
  Widget build(BuildContext context) {
    loadingContext = context;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("images/bg-sushiarigato.jpg"),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(ThemeColors.darkOverlay80(), BlendMode.darken),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Text(
                      'SushiArigato',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: ThemeColors.primary(),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 15, bottom: 15, left: 15, right: 15),
                child: SizedBox(
                  height: 400,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: ThemeColors.whiteOverlay80(),
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _titleForm(),
                            Row(
                              children: [
                                _labelForm("Email Address"),
                              ],
                            ),
                            _inputForm(
                              _emailTextboxController,
                              TextInputType.emailAddress,
                            ),
                            Row(
                              children: [
                                _labelForm("Password"),
                              ],
                            ),
                            _inputFormSecure(
                              _passwordTextboxController,
                              TextInputType.text,
                            ),
                            _buttonLogin(),
                          ],
                        ),
                      ),
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

  _titleForm() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const Text(
        "Login",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _labelForm(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _inputForm(dynamic controller, TextInputType type) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14,
          color: ThemeColors.dark(),
        ),
        cursorColor: ThemeColors.dark(),
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.white(),
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor: ThemeColors.white(),
          filled: true,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Tidak boleh kosong';
          }

          return null;
        },
      ),
    );
  }

  _inputFormSecure(dynamic controller, TextInputType type) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14,
          color: ThemeColors.dark(),
        ),
        cursorColor: ThemeColors.dark(),
        keyboardType: type,
        controller: controller,
        obscureText: true,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.white(),
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor: ThemeColors.white(),
          filled: true,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Tidak boleh kosong';
          }

          return null;
        },
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: ThemeColors.primary(),
          minimumSize: const Size.fromHeight(45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            var validate = _formKey.currentState!.validate();
            if (validate) {
              if (!_isLoading) _submitLogin();
            }
          }
        },
        child: Text(
          "Login",
          style: TextStyle(
            color: ThemeColors.white(),
          ),
        ),
      ),
    );
  }

  void _submitLogin() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
      Future.delayed(Duration.zero, () => _showDialog(loadingContext));
    });
    LoginBloc.login(
      email: _emailTextboxController.text,
      password: _passwordTextboxController.text,
    ).then((value) async {
      Navigator.pop(loadingContext);

      try {
        await Session().setToken(
          value.token.toString(),
        );

        await Session().setUserId(value.userID.toString());

        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductList(),
          ),
        );
      } catch (error) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => WarningDialog(
            description: value.toString(),
          ),
        );
      }
    }, onError: (error) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WarningDialog(
          description: error.toString(),
        ),
      );
    });
    setState(() {
      _isLoading = false;
    });
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const LoadingDialog(),
    );
  }
}
