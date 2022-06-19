import 'package:flutter/material.dart';
import 'package:sushiarigato/bloc/category_bloc.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';
import 'package:sushiarigato/ui/public/product/product_list.dart';
import 'package:sushiarigato/widget/header.dart';
import 'package:sushiarigato/widget/loading.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primary(),
        automaticallyImplyLeading: false,
        title: const Header(),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List>(
          future: CategoryBloc.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
            }

            return snapshot.hasData
                ? _categoryList(
                    snapshot.data!,
                  )
                : const Loading();
          },
        ),
      ),
    );
  }

  _categoryList(List categories) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: MediaQuery.of(context).size.height * 0.9 - 15,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 5,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return _categoriesListItem(
            context,
            categories[i],
          );
        },
      ),
    );
  }

  _categoriesListItem(BuildContext context, dynamic category) {
    if (category.id is String) category.id = int.tryParse(category.id);
    int categoryId = category.id ?? 0;
    String categoryName = category.name ?? "";

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductList(
              categoryId: categoryId,
              categoryName: categoryName,
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
        child: Stack(
          children: [
            ClipRRect(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        ThemeColors.dark(),
                      ]).createShader(bounds);
                },
                blendMode: BlendMode.darken,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        category.image,
                      ),
                      onError: (error, stackTrace) {},
                      fit: BoxFit.cover,
                    ),
                    color: ThemeColors.secondary(),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    category.name!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: ThemeColors.white(),
                    ),
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
