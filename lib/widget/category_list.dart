import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sushiarigato/helpers/api_url.dart';
import 'package:sushiarigato/model/category.dart';

class CategoryList extends StatelessWidget {
  final List? list;

  const CategoryList({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // margin: const EdgeInsets.symmetric(vertical: 15.0),
      height: 300,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return Container(
            width: 200,
            margin: const EdgeInsets.only(left: 15, right: 0, top: 5, bottom: 0),
            child: CategoryListItem(
              category: list![i],
            ),
          );
        },
      ),
    );
  }
}

class CategoryListItem extends StatelessWidget {
  final dynamic category;

  const CategoryListItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    if (category.id is String) category.id = int.tryParse(category.id);
    int categoryId = category.id ?? 0;

    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => const Detail()));

        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => ProdukDetail(
        //                   produk: product,
        //                 )));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        semanticContainer: true,
        clipBehavior: Clip.antiAlias,
        color: const Color(0xFF171717),
        child:  Stack(
          children: [
            ClipRRect(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Color.fromRGBO(0, 0, 0, 0.7)
                      ]).createShader(bounds);
                },
                blendMode: BlendMode.darken,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        ApiUrl.category_images_url(categoryId),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children:  <Widget>[
                  Text(
                    category.name!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
