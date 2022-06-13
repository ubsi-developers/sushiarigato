import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final dynamic product;

  const Detail({Key? key, this.product}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        // automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'SushiArigato',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(255, 166, 116, 1)),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
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
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 25,
              ),
              decoration: const BoxDecoration(
                color: Colors.black,
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
              )),
          Container(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 100,
            ),
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: _lableDescription(),
          ),
        ],
      )),
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
        margin: const EdgeInsets.only(top: 25, bottom: 10, left: 15, right: 15),
        child: Text(
          widget.product.categoryName,
          style: const TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300),
        ));
  }

  _lablePrice() {
    return Container(
        margin: const EdgeInsets.only(top: 5, bottom: 10, left: 15, right: 15),
        child: Text(
          "Rp. ${widget.product.discountPrice}",
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFFFFA370)),
        ));
  }

  _lableDiscount() {
    return Container(
        margin: const EdgeInsets.only(top: 25, bottom: 5, left: 15, right: 15),
        child: Text(
          "Rp. ${widget.product.price}",
          style: const TextStyle(
              fontSize: 12,
              decoration: TextDecoration.lineThrough,
              fontWeight: FontWeight.w200,
              color: Color(0xFFF1D0BE)),
        ));
  }

  _lableDescription() {
    return Container(
        margin: const EdgeInsets.all(15),
        child: Text(
          widget.product!.description,
          textAlign: TextAlign.justify,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ));
  }
}
