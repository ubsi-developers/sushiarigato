class Url {
  static String domain = "localhost:8000";

  static String baseUrl = "http://$domain/api/v1";
  static String register = "$baseUrl/register";
  static String login = "$baseUrl/login";
  static String logout = "$baseUrl/logout";
  static String categories = "$baseUrl/categories";
  static String products = "$baseUrl/products";
}
