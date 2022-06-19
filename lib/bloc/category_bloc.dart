import 'package:sushiarigato/config/url.dart';
import 'package:sushiarigato/helpers/api.dart';
import 'package:sushiarigato/model/category.dart';

class CategoryBloc {
  static Future<List<dynamic>> getCategories() async {
    try {
      List<Category> categories = [];

      var url = Url.categories;
      var response = await Api().get(url);

      List<dynamic> body = (response as Map<String, dynamic>)['data'];

      for (int i = 0; i < body.length; i++) {
        categories.add(Category.fromJson(body[i]));
      }

      return categories;
    } catch (error) {
      return [];
    }
  }
}
