import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../utils/colors.dart';

class SecondScreen extends StatelessWidget {
  final Widget object;
  SecondScreen({super.key, required this.object});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: primary,
        title: Text("Products Detail"),
        centerTitle: true,
      ),
      body: Container(
        height: 500,
        padding: EdgeInsets.only(top: 10),
        child: object,
      ),
    );
  }
}
