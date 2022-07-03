import 'package:flutter/material.dart';
import 'package:sushiarigato/bloc/category_bloc.dart';
import 'package:sushiarigato/bloc/product_bloc.dart';
import 'package:sushiarigato/helpers/theme_colors.dart';
import 'package:sushiarigato/model/product.dart';
import 'package:sushiarigato/ui/admin/product/product_list.dart';
import 'package:sushiarigato/widget/header.dart';
import 'package:sushiarigato/widget/loading_dialog.dart';
import 'package:sushiarigato/widget/warning_dialog.dart';

class ProductEdit extends StatefulWidget {
  final dynamic product;
  const ProductEdit({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final _formKey = GlobalKey<FormState>();
  late bool _isLoading = false;

  final _nameTextController = TextEditingController();
  final _descriptionTextController = TextEditingController();
  int categoryId = 0;
  final _priceTextController = TextEditingController();
  final _discountTextController = TextEditingController();
  final _imageTextController = TextEditingController();

  late BuildContext loadingContext;

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    setState(() {
      _nameTextController.text = widget.product.name;
      _descriptionTextController.text = widget.product.description;
      categoryId = widget.product.categoryId;
      _priceTextController.text = widget.product.price.toString();
      _discountTextController.text = widget.product.discount.toString();
      _imageTextController.text = widget.product.image;
    });
  }

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
                  "Ubah Produk : ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.black(),
                    fontSize: 20,
                  ),
                ),
              ),
              _labelForm("Nama Produk"),
              _inputForm(_nameTextController, TextInputType.name),
              _labelForm("Kategori"),
              _selectFormCategory(),
              _labelForm("Harga"),
              _inputForm(_priceTextController, TextInputType.number),
              _labelForm("Discount (%)"),
              _inputForm(_discountTextController, TextInputType.number),
              _labelForm("Image"),
              _inputForm(_imageTextController, TextInputType.text),
              _labelForm("Description"),
              _textareaForm(
                  _descriptionTextController, TextInputType.multiline),
              _buttonForm(
                "Simpan",
                ThemeColors.primary(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _labelForm(String labelText) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 0,
        bottom: 15,
      ),
      child: Text(
        labelText,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: ThemeColors.dark(),
        ),
      ),
    );
  }

  _inputForm(dynamic controller, TextInputType type) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 0,
        bottom: 25,
      ),
      child: TextFormField(
        style: TextStyle(
          fontSize: 14,
          color: ThemeColors.dark(),
        ),
        cursorColor: ThemeColors.dark(),
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 14.0,
            bottom: 8.0,
            top: 8.0,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.white(),
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor: ThemeColors.white(),
          filled: true,
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }

  _selectFormCategory() {
    return DropdownButtonHideUnderline(
      child: FutureBuilder<List>(
        future: CategoryBloc.getCategories(),
        builder: (context, snapshot) {
          List<DropdownMenuItem<dynamic>> list = [];
          if (snapshot.hasError) {
            return Container();
          } else if (snapshot.hasData) {
            var dropDownItemsMap = {};

            snapshot.data?.forEach((item) {
              int? index = snapshot.data?.indexOf(item);
              dropDownItemsMap[index] = item;

              list.add(
                DropdownMenuItem(
                  value: item.id,
                  child: Text(item.name),
                ),
              );
            });

            return Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 0,
                bottom: 25,
              ),
              child: DropdownButtonFormField(
                value: categoryId,
                style: TextStyle(
                  fontSize: 14,
                  color: ThemeColors.dark(),
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                    left: 14.0,
                    bottom: 14.0,
                    top: 14.0,
                    right: 14.0,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ThemeColors.white(),
                      style: BorderStyle.none,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fillColor: ThemeColors.white(),
                  filled: true,
                ),
                items: list,
                onChanged: (dynamic selected) async {
                  // var selectedItem = list[selected].value;
                  // print("-----------: " + selected.toString());
                  setState(() {
                    categoryId = selected;
                    // print("================: " + categoryId.toString());
                    // categoryId = dropDownItemsMap[selectedItem].id;
                  });
                },
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                top: 0,
                bottom: 25,
              ),
              child: const Text("Loading..."),
            );
          }
        },
      ),
    );
  }

  _textareaForm(dynamic controller, TextInputType type) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 0,
        bottom: 25,
      ),
      child: TextFormField(
        maxLines: 8,
        style: TextStyle(
          fontSize: 14,
          color: ThemeColors.dark(),
        ),
        cursorColor: ThemeColors.dark(),
        keyboardType: type,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 14.0,
            bottom: 8.0,
            top: 8.0,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.white(),
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          fillColor: ThemeColors.white(),
          filled: true,
        ),
        validator: (String? value) {
          // if (value!.isEmpty) {
          //   return 'Tidak boleh kosong';
          // }
          return null;
        },
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
    product.name = _nameTextController.text;
    product.description = _descriptionTextController.text;
    product.image = _imageTextController.text;
    product.price = int.parse(_priceTextController.text);
    product.discount = int.parse(_discountTextController.text);

    product.categoryId = categoryId;

    ProductBloc.edit(
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
