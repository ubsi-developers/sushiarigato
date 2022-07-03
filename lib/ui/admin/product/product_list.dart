import 'package:flutter/material.dart';

import 'package:sushiarigato/bloc/product_bloc.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';
import 'package:sushiarigato/ui/admin/product/product_add.dart';
import 'package:sushiarigato/ui/admin/product/product_delete.dart';
import 'package:sushiarigato/ui/admin/product/product_edit.dart';
import 'package:sushiarigato/widget/header.dart';
import 'package:sushiarigato/widget/loading.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    Key? key,
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
        automaticallyImplyLeading: false,
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Daftar Produk : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ThemeColors.dark(),
                              fontSize: 16,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductAdd(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  FutureBuilder<List>(
                    future: ProductBloc.get(null),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }

                      return snapshot.hasData
                          ? _productList(
                              snapshot.data,
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

  _productList(List? list) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: MediaQuery.of(context).size.height * 0.9 - 15 - 100,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: _productListItem(context, list![i]),
          );
        },
      ),
    );
  }

  _productListItem(BuildContext context, dynamic product) {
    var discountPrice = product.discountPrice;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      semanticContainer: true,
      clipBehavior: Clip.antiAlias,
      color: ThemeColors.white(),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(product.image),
                onError: (error, stackTrace) {},
                fit: BoxFit.cover,
              ),
              color: ThemeColors.secondary(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Text(
                        "(${product.discount}%)",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: ThemeColors.danger(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  product.categoryName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "Rp. ${product.price}",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    color: ThemeColors.primary(),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  "Rp. $discountPrice",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.primary(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductEdit(
                              product: product,
                            ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDelete(
                              product: product,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
