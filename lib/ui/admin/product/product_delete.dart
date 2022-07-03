import 'package:flutter/material.dart';
import 'package:sushiarigato/bloc/category_bloc.dart';
import 'package:sushiarigato/bloc/product_bloc.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';
import 'package:sushiarigato/model/product.dart';
import 'package:sushiarigato/ui/admin/product/product_list.dart';
import 'package:sushiarigato/widget/header.dart';
import 'package:sushiarigato/widget/loading_dialog.dart';
import 'package:sushiarigato/widget/warning_dialog.dart';

class ProductDelete extends StatefulWidget {
  final dynamic product;
  const ProductDelete({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDelete> createState() => _ProductDeleteState();
}

class _ProductDeleteState extends State<ProductDelete> {
  final _formKey = GlobalKey<FormState>();
  late bool _isLoading = false;

  late BuildContext loadingContext;

  @override
  Widget build(BuildContext context) {
    loadingContext = context;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primary(),
        title: const Header(),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 35,
                  bottom: 35,
                ),
                child: Text(
                  "Hapus Produk : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.black(),
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
                  bottom: 15,
                ),
                child: Text(
                  "Apakah anda yakin untuk menghapus  ?",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: ThemeColors.dark(),
                    fontSize: 14,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 50),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(widget.product.image),
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
                        Text(
                          widget.product.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            widget.product.categoryName,
                            style: const TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: Text(
                            "Rp. ${widget.product.price}",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: ThemeColors.primary(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _buttonForm(
                "Ya, Hapus",
                ThemeColors.primary(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buttonForm(String text, Color color) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 25,
        bottom: 25,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          minimumSize: const Size.fromHeight(45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: () {
          var validate = _formKey.currentState!.validate();
          if (validate) {
            var validate = _formKey.currentState!.validate();
            if (validate) {
              if (!_isLoading) _submitLogin();
            }
          }
        },
        child: Text(
          text,
          style: TextStyle(
            color: ThemeColors.white(),
          ),
        ),
      ),
    );
  }

  void _submitLogin() {
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
      Future.delayed(Duration.zero, () => _showDialog(loadingContext));
    });

    Product product = Product();
    product.id = widget.product.id;
    ProductBloc.delete(
      product: product,
    ).then((value) async {
      Navigator.pop(loadingContext);
      try {
        if (value["status"]) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductList(),
            ),
          );
        } else {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) => WarningDialog(
              description: value["message"],
              okClick: () {
                Navigator.pop(context);
              },
            ),
          );
        }
      } catch (error) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => WarningDialog(
            description: error.toString(),
          ),
        );
      }
    }, onError: (error) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => WarningDialog(
          description: error.toString(),
        ),
      );
    });
    setState(() {
      _isLoading = false;
    });
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const LoadingDialog(),
    );
  }
}
