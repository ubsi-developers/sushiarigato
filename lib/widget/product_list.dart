import 'package:flutter/material.dart';
import 'package:sushiarigato/ui/detail.dart';

class ProductList extends StatelessWidget {
  final List? list;

  const ProductList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return Container(
              width: 200,
              margin:
                  const EdgeInsets.only(left: 15, right: 0, top: 5, bottom: 0),
              child: _productListItem(context, list![i]));
        },
      ),
    );
  }

  _productListItem(BuildContext context, dynamic product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(
              product: product,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        color: const Color(0xFF171717),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _cardImage(product.image!),
            _cardBody(
              product.name!,
              product.categoryName!,
              product.price!,
              product.discountPrice!,
              product.discount!,
            )
          ],
        ),
      ),
    );
  }

  _cardImage(dynamic image) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _cardBody(name, categoryName, price, discountPrice, discount) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 15, right: 15),
                  child: Text(
                    name,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 15, right: 15),
                  child: Text(
                    categoryName,
                    style: const TextStyle(
                      fontSize: 8,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 15, right: 15),
                child: Text(
                  "Rp. $price",
                  style: const TextStyle(
                      fontSize: 10,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.w200,
                      color: Color(0xFFF1D0BE)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 15, right: 15),
                child: Text(
                  "Rp. $discountPrice",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFA370)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
