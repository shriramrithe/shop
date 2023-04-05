import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/ui/home_screen/home_provider.dart';
import 'package:shop/ui/home_screen/widgets/product_tile.dart';

import '../../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final x = Get.find<HomeProvider>();
  @override
  void initState() {
    super.initState();
    //context.read<HomeProvider>().fetchProducts();
    x.fetchProducts();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      appBar: AppBar(
        
        backgroundColor: primary,
        title: Text("Products"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return 
    GetBuilder<HomeProvider>(builder: (x) 
    {
      if (x.isLoading) {
        return Center(child: CircularProgressIndicator());
      }
      return _listView(x.products);
    });
  }

  _listView(List<Product> products) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 10),
      itemCount: products.length,
      itemBuilder: (_, index) {
        return ProductTile(product: products[index]);
      },
      separatorBuilder: (_, index) {
        return SizedBox(
          height: 10,
        );
      },
    );
  }
}
