import 'package:dio/dio.dart';
import 'package:shop/models/product_model.dart';


class Api {
final dio = Dio();

  Future<List<Product>> fetchProducts() async {
    try {
      final response = await dio.get('https://dummyjson.com/products');

      var res = ProductModel.fromJson(response.data);
      return res.products ?? [];
    } catch (e) {
      throw (e);
    }
  }
}
