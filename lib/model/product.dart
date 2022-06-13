import 'package:sushiarigato/helpers/api_url.dart';

class Product {
  int? id;
  String? name;
  String? description;
  String? image;
  int? price;
  int? discountPrice;
  int? discount;
  int? categoryId;
  String? categoryName;

  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.discountPrice,
    this.discount,
    this.categoryId,
    this.categoryName,
  });

  factory Product.fromJson(Map<String, dynamic> obj) {
    return Product(
      id: obj['id'],
      name: obj["name"],
      description: obj["description"],
      image: ApiUrl.product_images_url(obj["id"]),
      price: obj["price"],
      discountPrice: obj["discount_price"],
      discount: obj["discount"],
      categoryId: obj["category_id"],
      categoryName: obj["category_name"],
    );
  }
}
