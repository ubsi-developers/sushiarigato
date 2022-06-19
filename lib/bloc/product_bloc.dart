import 'package:sushiarigato/config/url.dart';
import 'package:sushiarigato/helpers/api.dart';
import 'package:sushiarigato/model/product.dart';

class ProductBloc {
  static Future<List<dynamic>> get(int? categoryId) async {
    try {
      var url = Url.products;
      if (categoryId != null) {
        url += "?category=$categoryId";
      }
      var response = await Api().get(url);

      List<dynamic> body = (response as Map<String, dynamic>)['data'];
      List<Product> products = [];

      for (int i = 0; i < body.length; i++) {
        products.add(Product.fromJson(body[i]));
      }

      return products;
    } catch (error) {
      return [];
    }
  }

  static Future<dynamic> add({required Product product}) async {
    try {
      var url = Url.products;
      var body = {
        "name": product.name,
        "description": product.description,
        "image": product.image,
        "price": product.price.toString(),
        "discount": product.discount.toString(),
        "category_id": product.categoryId.toString(),
      };
      var response = await Api().post(url, body);

      return {
        "status": response["status"],
        "message": response["message"],
      };
    } catch (error) {
      return error;
    }
  }

  static Future<dynamic> edit({required Product product}) async {
    try {
      var url = "${Url.products}/${product.id}";
      var body = {
        "name": product.name,
        "description": product.description,
        "image": product.image,
        "price": product.price.toString(),
        "discount": product.discount.toString(),
        "category_id": product.categoryId.toString(),
      };
      var response = await Api().put(url, body);
      return {
        "status": response["status"],
        "message": response["message"],
      };
    } catch (error) {
      return error;
    }
  }

  static Future<dynamic> delete({required Product product}) async {
    try {
      var url = "${Url.products}/${product.id}";
      var response = await Api().delete(url);
      return {
        "status": response["status"],
        "message": response["message"],
      };
    } catch (error) {
      return error;
    }
  }
}
