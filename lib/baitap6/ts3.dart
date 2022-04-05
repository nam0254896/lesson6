import 'package:lesson6/baitap6/ts4.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatefulWidget {
  ProductModel productModel;

  EditProduct({required this.productModel});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  FocusNode myFocusNode = new FocusNode();

  late TextEditingController titleController;
  late TextEditingController priceController;
  late TextEditingController descriptrionController;
  late TextEditingController imageURLController;

  String url = '';
  bool _loadingImage = false;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.productModel.title);
    priceController =
        TextEditingController(text: widget.productModel.price.toString());
    descriptrionController =
        TextEditingController(text: widget.productModel.description);
    imageURLController =
        TextEditingController(text: widget.productModel.imageURL);
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        url = widget.productModel.imageURL;
      });
      loadImage();
    });
  }

  void loadImage() {
    _loadingImage = true;
    precacheImage(NetworkImage(url), context, onError: (e, stackTrace) {
      //print('error $e');
      setState(() {
        _loadingImage = false;
        //print(_loadingimage);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Edit Product'),
            centerTitle: true,
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Expanded',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                          children: [
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            Positioned(left:1,child: Container(height: 20,color:Colors.brown.withOpacity(0.8),child: Text('1',style: TextStyle(fontSize: 15),)))
                          ]),
                    ),
                    Expanded(
                      flex: 2,
                      child: Stack(
                          children: [
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.blue,
                              ),
                            ),
                            Center(child: Container(height: 20,color:Colors.brown.withOpacity(0.8),child: Text('1',style: TextStyle(fontSize: 15),)))
                          ]),
                    ),
                    Expanded(
                      flex: 1,
                      child: Stack(
                          children: [
                            Container(
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.orange,
                              ),
                            ),
                            Positioned(right:1,child: Container(height: 20,color:Colors.brown.withOpacity(0.8),child: Text('2',style: TextStyle(fontSize: 15),)))
                          ]),
                    ),
                  ],
                ),
                TextFormField(
                  //initialValue: widget.productModel.title,
                  controller: titleController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                        color: myFocusNode.hasFocus ? Colors.blue : Colors.grey),
                    //I believe the size difference here is 6.0 to account padding
                    labelText: 'Title',
                  ),
                ),
                TextFormField(
                  //initialValue: widget.productModel.price.toString(),
                  controller: priceController,
                  decoration: InputDecoration(
                    //alignLabelWithHint: true,
                    labelStyle: TextStyle(
                        fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                        color: Colors.grey),
                    //I believe the size difference here is 6.0 to account padding
                    labelText: 'Price',
                  ),
                ),
                TextFormField(
                  //initialValue: widget.productModel.description,
                  controller: descriptrionController,
                  decoration: InputDecoration(
                    //alignLabelWithHint: true,
                    labelStyle: TextStyle(
                        fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                        color: Colors.grey),
                    //I believe the size difference here is 6.0 to account padding
                    labelText: 'Description',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Stack(children: [
                          Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                          ),
                          _loadingImage == false
                              ? Positioned(
                              top: 10,
                              left: 10,
                              child: Icon(Icons.image_outlined))
                              : Container(
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                                image: DecorationImage(
                                    image: NetworkImage(url),
                                    fit: BoxFit.cover)),
                          ),
                        ]),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: TextFormField(
                              //initialValue: widget.productModel.imageURL,
                              controller: imageURLController,
                              onChanged: (value) {
                                setState(() {
                                  url = value;
                                  loadImage();
                                });
                              },
                              decoration: InputDecoration(
                                //alignLabelWithHint: true,
                                labelStyle: TextStyle(
                                    fontSize: myFocusNode.hasFocus ? 18 : 16.0,
                                    color: Colors.grey),
                                //I believe the size difference here is 6.0 to account padding
                                labelText: 'Image URL',
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ));
  }
}