import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shop/models/product_model.dart';

import '../../../utils/colors.dart';
import '../../second_screen/second_screen.dart';

class ProductTile extends StatefulWidget {
  final Product product;
  ProductTile({super.key, required this.product});

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          _header(),
          SizedBox(
            height: 15,
          ),
          _carousal(),
          SizedBox(
            height: 25,
          ),
          _bottomText(),
          SizedBox(
            height: 15,
          ),
          _button()
        ],
      ),
    );
  }

  _button() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondScreen(
                object: this.widget,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          color: primary,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            height: 40,
            width: 120,
            child: Center(
              child: Text(
                "BOOK NOW",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _bottomText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        widget.product.description.toString(),
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }

  _carousal() {
    return Stack(
      children: [
        CarouselSlider(
            options: CarouselOptions(
                height: 300,
                aspectRatio: 1,
                viewportFraction: 1,
                onPageChanged: (i, _) {
                  setState(() {
                    imageIndex = i;
                  });
                }),
            items: widget.product.images?.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      color: Colors.black,
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.network(
                        i,
                        fit: BoxFit.contain,
                      ));
                },
              );
            }).toList()),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CarouselIndicator(
                count: widget.product.images?.length,
                index: imageIndex,
                cornerRadius: 100,
                width: 10,
                height: 10,
                activeColor: Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              widget.product.title.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              softWrap: true,
            ),
          ),
          Row(
            children: [
              Text(
                (widget.product.rating ?? 0)
                    .toDouble()
                    .toStringAsFixed(1)
                    .toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 14,
              ),
              SizedBox(
                width: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}
