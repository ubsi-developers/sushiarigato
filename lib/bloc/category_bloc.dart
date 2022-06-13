import 'dart:convert';

import 'package:sushiarigato/helpers/api.dart';
import 'package:sushiarigato/helpers/api_url.dart';

import 'package:sushiarigato/model/category.dart';

class CategoryBloc {
  static Future<List<Category>> getCategories() async {
    var apiUrl = Uri.parse(ApiUrl.categories);
    var response = await Api().get(apiUrl);
    var jsonObj = json.decode(response.body);

    List<dynamic> body = (jsonObj as Map<String, dynamic>)['data'];
    List<Category> Categories = [];

    for (int i = 0; i < body.length; i++) {
      Categories.add(Category.fromJson(body[i]));
    }

    return Categories;
  }
}