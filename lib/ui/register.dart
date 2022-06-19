// import 'package:flutter/material.dart';
// import 'package:sushiarigato/ui/home.dart';

// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);

//   @override
//   State<Register> createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(

//           padding: const EdgeInsets.only(top: 100, bottom: 100),
//           decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("images/bg-sushiarigato.jpg"),
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(
//                     Color.fromRGBO(0, 0, 0, 0.6), BlendMode.darken),),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Column(
//                 children: [
//                   Container(
//                     margin: const EdgeInsets.only(top: 15, bottom: 15),
//                     child: Text(
//                       'SushiArigato',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 25,
//                           color: ThemeColors.primary(),),
//                     ),
//                   ),
//                 ],
//               ),
//               Container(
//                 margin: const EdgeInsets.only(
//                     top: 15, bottom: 15, left: 15, right: 15),
//                 child: SizedBox(
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15),),
//                     color: Color.fromRGBO(0, 0, 0, 0.5),
//                     child: Container(
//                       margin: const EdgeInsets.only(
//                           top: 20, bottom: 20, left: 20, right: 20),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             _titleAuth(),
//                             Row(
//                               children: [
//                                 _labelName(),
//                               ],
//                             ),
//                             _inputName(),
//                             Row(
//                               children: [
//                                 _labelEmail(),
//                               ],
//                             ),
//                             _inputEmail(),
//                             Row(
//                               children: [
//                                 _labelPassword(),
//                               ],
//                             ),
//                             _inputPassword(),
//                             Row(
//                               children: [
//                                 _labelAddress(),
//                               ],
//                             ),
//                             _inputAddress(),
//                             _buttonRegister(),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   _titleAuth() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: const Text(
//         "Register",
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   _buttonRegister() {
//     return Container(
//       margin: const EdgeInsets.only(top: 10),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//             primary: Color(0xFFDA580F),
//             minimumSize: const Size.fromHeight(45),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(50),),),
//         onPressed: () {
//           Navigator.of(context)
//               .push(MaterialPageRoute(builder: (context) => Home(),),);
//         },
//         child: Text(
//           "Register",
//           style: TextStyle(
//             color: Color.fromRGBO(255, 255, 255, 1),
//           ),
//         ),
//       ),
//     );
//   }

//   _labelName() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: const Text(
//         "Name",
//         style: TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   _inputName() {
//     return Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         child: TextFormField(
//           style: TextStyle(fontSize: 14, color: ThemeColors.dark()),
//           cursorColor: ThemeColors.dark(),
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
//             border: OutlineInputBorder(
//               borderSide:
//                   BorderSide(color: ThemeColors.white(), style: BorderStyle.none),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             fillColor: ThemeColors.white(),
//             filled: true,
//           ),
//           onSaved: (String? value) {
//             // This optional block of code can be used to run
//             // code when the user saves the form.
//           },
//           validator: (String? value) {
//             return (value != null && value.contains('@'),)
//                 ? 'Do not use the @ char.'
//                 : null;
//           },
//         ),);
//   }

//   _labelEmail() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: const Text(
//         "Email",
//         style: TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   _inputEmail() {
//     return Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         child: TextFormField(
//           style: TextStyle(fontSize: 14, color: ThemeColors.dark()),
//           cursorColor: ThemeColors.dark(),
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
//             border: OutlineInputBorder(
//               borderSide:
//                   BorderSide(color: ThemeColors.white(), style: BorderStyle.none),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             fillColor: ThemeColors.white(),
//             filled: true,
//           ),
//           onSaved: (String? value) {
//             // This optional block of code can be used to run
//             // code when the user saves the form.
//           },
//           validator: (String? value) {
//             return (value != null && value.contains('@'),)
//                 ? 'Do not use the @ char.'
//                 : null;
//           },
//         ),);
//   }

//   _labelPassword() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: const Text(
//         "Password",
//         style: TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   _inputPassword() {
//     return Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         child: TextFormField(
//           style: TextStyle(fontSize: 14, color: ThemeColors.dark()),
//           obscureText: true,
//           cursorColor: ThemeColors.dark(),
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
//             border: OutlineInputBorder(
//               borderSide:
//                   BorderSide(color: ThemeColors.white(), style: BorderStyle.none),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             fillColor: ThemeColors.white(),
//             filled: true,
//           ),
//           onSaved: (String? value) {
//             // This optional block of code can be used to run
//             // code when the user saves the form.
//           },
//           validator: (String? value) {
//             return (value != null && value.contains('@'),)
//                 ? 'Do not use the @ char.'
//                 : null;
//           },
//         ),);
//   }

//   _labelAddress() {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: const Text(
//         "Address",
//         style: TextStyle(
//           fontSize: 12,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     );
//   }

//   _inputAddress() {
//     return Container(
//         margin: const EdgeInsets.only(bottom: 20),
//         child: TextFormField(
//           style: TextStyle(fontSize: 14, color: ThemeColors.dark()),
//           cursorColor: ThemeColors.dark(),
//           maxLines: 4,
//           //or null
//           decoration: InputDecoration(
//             contentPadding:
//                 const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
//             border: OutlineInputBorder(
//               borderSide:
//                   BorderSide(color: ThemeColors.white(), style: BorderStyle.none),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             fillColor: ThemeColors.white(),
//             filled: true,
//           ),
//           onSaved: (String? value) {
//             // This optional block of code can be used to run
//             // code when the user saves the form.
//           },
//           validator: (String? value) {
//             return (value != null && value.contains('@'),)
//                 ? 'Do not use the @ char.'
//                 : null;
//           },
//         ),);
//   }
// }
