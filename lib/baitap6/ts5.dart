import 'package:lesson6/baitap6/test1.dart';
import 'package:lesson6/baitap6/ts4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:lesson6/baitap6/test2.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('Your Products'),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => AddProduct()),);
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            body: Column(children: [
              Center(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: productList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTileCustom(productModel: productList[index],);
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    thickness: 1,
                    color: Colors.black12,
                  ),
                ),
              ),
            ])));
  }
}