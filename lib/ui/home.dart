import 'package:flutter/material.dart';
import 'package:sushiarigato/ui/detail.dart';

import 'package:sushiarigato/model/product.dart';
import 'package:sushiarigato/bloc/product_bloc.dart';
import 'package:sushiarigato/widget/product_list.dart';

import 'package:sushiarigato/model/category.dart';
import 'package:sushiarigato/bloc/category_bloc.dart';
import 'package:sushiarigato/widget/category_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF272727),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'SushiArigato',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 166, 116, 1)),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: const Text(
                      "kategori",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder<List>(
                    future: CategoryBloc.getCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }

                      return snapshot.hasData
                          ? CategoryList(
                              list: snapshot.data,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 25),
              decoration: const BoxDecoration(color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _labelAll(),
                  FutureBuilder<List>(
                    future: ProductBloc.getProducts(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }

                      return snapshot.hasData
                          ? ProductList(
                              list: snapshot.data,
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // _inputSearch() {
  //   return Container(
  //     child: TextFormField(
  //       autofocus: false,
  //       style: TextStyle(fontSize: 14, color: Colors.black),
  //       cursorColor: Colors.black,
  //       decoration: InputDecoration(
  //         suffixIcon: Icon(Icons.search),
  //         suffixIconColor: Color(0xFF98ACC2),
  //         hintText: "Search",
  //         hintStyle: TextStyle(fontSize: 14, color: Color(0xFF98ACC2)),
  //         contentPadding:
  //             const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
  //         border: OutlineInputBorder(
  //           borderSide:
  //               BorderSide(color: Colors.white, style: BorderStyle.none),
  //           borderRadius: BorderRadius.circular(10),
  //         ),
  //         fillColor: Colors.white,
  //         filled: true,
  //       ),
  //       onSaved: (String? value) {
  //         // This optional block of code can be used to run
  //         // code when the user saves the form.
  //       },
  //       validator: (String? value) {
  //         return (value != null && value.contains('@'))
  //             ? 'Do not use the @ char.'
  //             : null;
  //       },
  //     ),
  //   );
  // }

  _labelAll() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: const Text(
        "Menu",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

// _listProduct() {
//   return Container(
//     margin: const EdgeInsets.symmetric(vertical: 15.0),
//     height: 300,
//     child: ListView(
//       scrollDirection: Axis.horizontal,
//       children: <Widget>[
//         Container(
//           width: 200,
//           margin:
//               const EdgeInsets.only(left: 15, right: 0, top: 5, bottom: 0),
//           child: _listItemProduct(),
//         ),
//         Container(
//           width: 200,
//           margin:
//               const EdgeInsets.only(left: 15, right: 0, top: 5, bottom: 0),
//           child: _listItemProduct(),
//         ),
//         Container(
//           width: 200,
//           margin:
//               const EdgeInsets.only(left: 15, right: 0, top: 5, bottom: 0),
//           child: _listItemProduct(),
//         ),
//         Container(
//           width: 25,
//         ),
//       ],
//     ),
//   );
// }
//
// _listItemProduct() {
//   return GestureDetector(
//       onTap: () {
//         Navigator.of(context)
//             .push(MaterialPageRoute(builder: (context) => const Detail()));
//       },
//       child: Card(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           semanticContainer: true,
//           clipBehavior: Clip.antiAlias,
//           color: const Color(0xFF171717),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Expanded(
//                   child: Container(
//                       decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('images/bg-sushiarigato.jpg'),
//                     fit: BoxFit.cover),
//               ))),
//               Container(
//                   padding: const EdgeInsets.only(top: 15, bottom: 15),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _labelName(),
//                             _labelCategory(),
//                           ],
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           _labelDiscount(),
//                           _labelPrice(),
//                         ],
//                       ),
//                     ],
//                   )),
//             ],
//           )));
// }

// _labelName() {
//   return Container(
//       margin: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
//       child: const Text(
//         "Salmon Udon",
//         style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//       ));
// }
//
// _labelCategory() {
//   return Container(
//       margin: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
//       child: const Text(
//         "14 Pcs Roll sushi with extra salmon",
//         style: TextStyle(
//             fontSize: 8,
//             fontStyle: FontStyle.italic,
//             fontWeight: FontWeight.w300),
//       ));
// }
//
// _labelPrice() {
//   return Container(
//       margin: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
//       child: const Text(
//         "Rp. 45K",
//         style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFFFFA370)),
//       ));
// }
//
// _labelDiscount() {
//   return Container(
//       margin: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
//       child: const Text(
//         "Rp. 45K",
//         style: TextStyle(
//             fontSize: 8,
//             decoration: TextDecoration.lineThrough,
//             fontWeight: FontWeight.w200,
//             color: Color(0xFFF1D0BE)),
//       ));
// }
}
