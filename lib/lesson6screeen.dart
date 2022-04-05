import 'package:flutter/material.dart';

void main() {
  runApp(MyAppForLesson6());
}

class MyAppForLesson6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Lesson6HomePage());
  }
}

class Lesson6HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Lesson 6 - Example'),
      // ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                    child: CustomScrollView(
                      primary: false,
                      slivers: <Widget>[
                        SliverAppBar(
                          pinned: true,
                          snap: false,
                          floating: false,
                          expandedHeight: 150.0,
                          flexibleSpace: const FlexibleSpaceBar(
                            centerTitle: true,
                            title: Text('SliverAppBar'),
                            background: FlutterLogo(),
                          ),
                        ),
                        const SliverToBoxAdapter(
                          child: SizedBox(
                            height: 20,
                            child: Center(
                              child: Text('Scroll to see the SliverAppBar in effect.'),
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(20),
                          sliver: SliverGrid.count(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text("He'd have you all unravel at the"),
                                color: Colors.green[100],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('Heed not the rabble'),
                                color: Colors.green[200],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('Sound of screams but the'),
                                color: Colors.green[300],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('Who scream'),
                                color: Colors.green[400],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('Revolution is coming...'),
                                color: Colors.green[500],
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: const Text('Revolution, they...'),
                                color: Colors.green[600],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    child: GridView.builder(
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: 300,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            child: Card(
                              color: Colors.amber,
                              child: Center(child: Text('$index')),
                            ),
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('GridView 2 - Item $index')));
                            },
                          );
                        })
                )
              ],
            ),
          ),
        ));
  }
}
