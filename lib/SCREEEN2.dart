import 'package:flutter/material.dart';
import 'package:lesson6/screen3.dart';

class Screen2 extends StatelessWidget {

  var _initialData;

  Screen2(this._initialData);


  @override
  Widget build(BuildContext context) {

    var data;
    if (_initialData != '') {
      data = _initialData;
    } else {
      data = ModalRoute.of(context)?.settings.arguments;
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(data),
              ElevatedButton(onPressed: () async {
                var data = 'data from screen 2';

                var resultData = await Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                  // do something
                  return Screen3(data);
                }));

                Navigator.pop(context, resultData);

              }, child: Text('Go to Screen 3'))
            ],
          ),
        ),
      ),
    );
  }
}