// ignore_for_file: non_constant_identifier_names

class ApiUrl {
  static const String baseUrl =
      "https://d356-103-154-141-229.ap.ngrok.io/api/v1";

  static const String register = "$baseUrl/register";
  static const String login = "$baseUrl/login";
  static const String logout = "$baseUrl/logout";
  static const String categories = "$baseUrl/categories";
  static const String products = "$baseUrl/products";

  static String product_images_url(int id) {
    return "$baseUrl/products/images/$id";
  }

  static String category_images_url(int id) {
    return "$baseUrl/categories/images/$id";
  }
}
