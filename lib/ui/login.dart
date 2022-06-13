import 'package:flutter/material.dart';
import 'package:sushiarigato/ui/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg-sushiarigato.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Color.fromRGBO(0, 0, 0, 0.6), BlendMode.darken)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  child: const Text(
                    'SushiArigato',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromRGBO(255, 166, 116, 1)),
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
                      borderRadius: BorderRadius.circular(15)),
                  color: const Color.fromRGBO(0, 0, 0, 0.5),
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          _titleForm(),
                          Row(
                            children: [
                              _labelEmail(),
                            ],
                          ),
                          _inputEmail(),
                          Row(
                            children: [
                              _labelPassword(),
                            ],
                          ),
                          _inputPassword(),
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
    );
  }

  Widget _titleForm() {
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

  Widget _labelEmail() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const Text(
        "Email",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _inputEmail() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        style: const TextStyle(fontSize: 14, color: Colors.black),
        cursorColor: Colors.black,
        keyboardType: TextInputType.emailAddress,
        controller: _emailTextboxController,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Colors.white, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Email harus diisi';
          }
          Pattern pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zAZ]{2,}))$';
          RegExp regex = RegExp(pattern.toString());
          if (!regex.hasMatch(value)) {
            return "Email tidak valid";
          }
          return null;
        },
      ),
    );
  }

  Widget _labelPassword() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: const Text(
        "Password",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        style: const TextStyle(fontSize: 14, color: Colors.black),
        obscureText: true,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Colors.white, style: BorderStyle.none),
            borderRadius: BorderRadius.circular(10),
          ),
          fillColor: Colors.white,
          filled: true,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return "Password harus diisi";
          }

          if (value.length < 8) {
            return "Password harus minimal 8 karakter";
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
            primary: const Color(0xFFDA580F),
            minimumSize: const Size.fromHeight(45),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if(validate){
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Home()));
          }
        },
        child: const Text(
          "Login",
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
      ),
    );
  }
}
