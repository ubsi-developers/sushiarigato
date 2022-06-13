import 'package:sushiarigato/helpers/api_url.dart';

class Category {
  int? id;
  String? name;
  String? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> obj) {
    return Category(
      id: obj['id'],
      name: obj['name'],
      image: ApiUrl.product_images_url(obj["id"]),
    );
  }
}
