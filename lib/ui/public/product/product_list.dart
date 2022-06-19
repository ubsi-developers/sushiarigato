import 'package:flutter/material.dart';

import 'package:sushiarigato/bloc/product_bloc.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';
import 'package:sushiarigato/ui/public/product/product_detail.dart';
import 'package:sushiarigato/widget/header.dart';
import 'package:sushiarigato/widget/loading.dart';

class ProductList extends StatefulWidget {
  final int? categoryId;
  final String? categoryName;
  final String? searchKey;
  final String? page;

  const ProductList({
    Key? key,
    this.categoryId,
    this.categoryName,
    this.searchKey,
    this.page,
  }) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "${widget.categoryName!} : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.black(),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  FutureBuilder<List>(
                    future: ProductBloc.get(widget.categoryId!),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }

                      return snapshot.hasData
                          ? _productList(
                              snapshot.data!,
                            )
                          : const Loading();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _productList(List list) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: MediaQuery.of(context).size.height * 0.9 - 15 - 100,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, i) {
          return Container(
            height: 300,
            width: 200,
            margin: const EdgeInsets.only(bottom: 15),
            child: _productListItem(context, list[i]),
          );
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
            builder: (context) => ProductDetail(
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
        color: ThemeColors.white(),
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
            onError: (error, stackTrace) {},
            fit: BoxFit.cover,
          ),
          color: ThemeColors.secondary(),
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
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 5, left: 15, right: 15),
                  child: Text(
                    categoryName,
                    style: const TextStyle(
                      fontSize: 12,
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
                  style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w200,
                    color: ThemeColors.primary(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 15, right: 15),
                child: Text(
                  "Rp. $discountPrice",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primary(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
