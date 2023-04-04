import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/data/api_provider.dart';
import 'package:shop/models/product_model.dart';

// class HomeProvider extends ChangeNotifier 
// {
//   var isLoading = true;
//   List<Product> products = [];

//   fetchProducts() async {
//     isLoading = true;
//     try {
//       products = await Api().fetchProducts();
//     } catch (e) {
//       print(e);
//     }
//     isLoading = false;
//     notifyListeners();
//   }
// }

class HomeProvider extends GetxController
{
  var isLoading = true;
  List<Product> products = [];

  fetchProducts() async {
    isLoading = true;
    try {
      products = await Api().fetchProducts();
    } catch (e) {
      print(e);
    }
    isLoading = false;
    //notifyListeners();
    update();
  }
}
