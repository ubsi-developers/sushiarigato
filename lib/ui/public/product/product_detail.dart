import 'package:flutter/material.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';
import 'package:sushiarigato/widget/header.dart';

class ProductDetail extends StatefulWidget {
  final dynamic product;

  const ProductDetail({Key? key, this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primary(),
        title: const Header(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.product!.image),
                  onError: (error, stackTrace) {},
                  fit: BoxFit.cover,
                ),
                color: ThemeColors.secondary(),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 25,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: ThemeColors.white(),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _lableName(),
                        _lableCategory(),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _lableDiscount(),
                      _lablePrice(),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                bottom: 100,
                left: 10,
                right: 10,
              ),
              decoration: BoxDecoration(
                color: ThemeColors.white(),
              ),
              child: _lableDescription(),
            ),
          ],
        ),
      ),
    );
  }

  _lableName() {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 5, left: 15, right: 15),
      child: Text(
        widget.product!.name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _lableCategory() {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10, left: 15, right: 15),
      child: Text(
        widget.product.categoryName,
        style: const TextStyle(
            fontSize: 14,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w300),
      ),
    );
  }

  _lableDiscount() {
    return Container(
      margin: const EdgeInsets.only(top: 25, bottom: 5, left: 15, right: 15),
      child: Text(
        "Rp. ${widget.product.price}",
        style: TextStyle(
          fontSize: 14,
          decoration: TextDecoration.lineThrough,
          fontWeight: FontWeight.w200,
          color: ThemeColors.primary(),
        ),
      ),
    );
  }

  _lablePrice() {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10, left: 15, right: 15),
      child: Text(
        "Rp. ${widget.product.discountPrice}",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: ThemeColors.primary(),
        ),
      ),
    );
  }

  _lableDescription() {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Text(
        widget.product!.description,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: ThemeColors.darkOverlay80(),
        ),
      ),
    );
  }
}
