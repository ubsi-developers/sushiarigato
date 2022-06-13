// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:sushiarigato/helpers/api.dart';
import 'package:sushiarigato/helpers/api_url.dart';

import 'package:sushiarigato/model/Product.dart';

class ProductBloc {
  static Future<List<Product>> getProducts() async {
    var apiUrl = Uri.parse(ApiUrl.products);
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);

    List<dynamic> body = (jsonObj as Map<String, dynamic>)['data'];
    List<Product> Products = [];

    for (int i = 0; i < body.length; i++) {
      Products.add(Product.fromJson(body[i]));
    }

    return Products;
  }
//
// static Future addProduct({Product? Product}) async {
//   String apiUrl = ApiUrl.products;
//   var body = {
//     "kode_Product": Product!.kodeProduk,
//     "nama_Product": Product.namaProduk,
//     "harga": Product.hargaProduk.toString()
//   };
//   var response = await Api().post(apiUrl, body);
//   var jsonObj = json.decode(response.body);
//   return jsonObj['status'];
// }
//
// static Future<bool> updateProduct({required Product Product}) async {
//   String apiUrl = "${ApiUrl.products}/${Product.id}";
//   var body = {
//     "kode_Product": Product.namaProduk,
//     "nama_Product": Product.namaProduk,
//     "harga": Product.hargaProduk.toString()
//   };
//   print("Body : $body");
//   var response = await Api().post(apiUrl, body);
//   var jsonObj = json.decode(response.body);
//   return jsonObj['data'];
// }
//
// static Future<bool> deleteProduct({int? id}) async {
//   String apiUrl = "${ApiUrl.products}/$id";
//   var response = await Api().delete(apiUrl);
//   var jsonObj = json.decode(response.body);
//   return (jsonObj as Map<String, dynamic>)['data'];
// }
}
