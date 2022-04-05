import 'package:lesson6/baitap6/ts3.dart';
import 'package:lesson6/baitap6/ts4.dart';
import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  ProductModel productModel;
  ListTileCustom({required this.productModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        alignment: Alignment.center,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            productModel.imageURL,
          ),
        ),
      ),
      title: Text(productModel.title),
      trailing: Wrap(spacing: 20,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => EditProduct(productModel: productModel)),);
              },
              child: Icon(
                Icons.edit,
                color: Colors.purple,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.calendar_today_rounded,
                color: Colors.green,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ]),
    );
  }

}