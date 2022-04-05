import 'package:flutter/material.dart';
import 'package:lesson6/SCREEEN2.dart';

void main() {
  runApp(MyAppForLesson5());
}

class Routes {
  //static final String screen1 = "/screen1";
  static final String screen2 = "/screen2";
}

class MyAppForLesson5 extends StatelessWidget {
  const MyAppForLesson5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        routes: {
          Routes.screen2: (context) => Screen2(''),
        },
        home: Lesson5HomePage());
  }
}

class Lesson5HomePage extends StatefulWidget {
  @override
  State<Lesson5HomePage> createState() => _Lesson5HomePageState();
}

class _Lesson5HomePageState extends State<Lesson5HomePage> {
  //custom sliver appbar for scrollview
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'K',
      'L'
    ];
    final List<int> colorCodes = <int>[
      600,
      500,
      400,
      300,
      200,
      100,
      200,
      300,
      400,
      500,
      600
    ];

    // TODO: implement build
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Lesson 5 - Example'),
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Flexible(
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: <Widget>[
                    SliverAppBar(
                      pinned: _pinned,
                      snap: _snap,
                      floating: _floating,
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
                          child:
                          Text('Scroll to see the SliverAppBar in effect.'),
                        ),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(20.0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          <Widget>[
                            const Divider(),
                            _buildTile('CineArts at the Empire',
                                '85 W Portal Ave', Icons.theaters),
                            const Divider(),
                            _buildTile('The Castro Theater', '429 Castro St',
                                Icons.theaters),
                            const Divider(),
                            _buildTile('Alamo Drafthouse Cinema',
                                '2550 Mission St', Icons.theaters),
                            const Divider(),
                            _buildTile('Roxie Theater', '3117 16th St',
                                Icons.theaters),
                            const Divider(),
                            _buildTile('United Artists Stonestown Twin',
                                '501 Buckingham Way', Icons.theaters),
                            const Divider(),
                            _buildTile('AMC Metreon 16', '135 4th St #3000',
                                Icons.theaters),
                            const Divider(),
                            _buildTile('K\'s Kitchen', '757 Monterey Blvd',
                                Icons.restaurant),
                            const Divider(),
                            _buildTile('Emmy\'s Restaurant', '1923 Ocean Ave',
                                Icons.restaurant),
                            const Divider(),
                            _buildTile('Chaiya Thai Restaurant',
                                '272 Claremont Blvd', Icons.restaurant),
                            const Divider(),
                            _buildTile(
                                'La Ciccia', '291 30th St', Icons.restaurant),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () async {
                var data = 'CineArts at the Empire';
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) {
                //   // do something
                //   return Screen2(data);
                // }));
                var resultData = await Navigator.pushNamed(context, Routes.screen2, arguments: data);

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(resultData.toString())));
              }, child: Text('Go to Screen 2')),
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Container(
                        height: 50,
                        //color: Colors.amber[colorCodes[index]],
                        child: Center(child: Text('Entry ${entries[index]}')),
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Entry ${entries[index]}')));
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('pinned'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _pinned = val;
                      });
                    },
                    value: _pinned,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('snap'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _snap = val;
                        // Snapping only applies when the app bar is floating.
                        _floating = _floating || _snap;
                      });
                    },
                    value: _snap,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('floating'),
                  Switch(
                    onChanged: (bool val) {
                      setState(() {
                        _floating = val;
                        _snap = _snap && _floating;
                      });
                    },
                    value: _floating,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _buildTile(String title, String subtitle, IconData icon) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$title')));
      },
      onLongPress: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('$subtitle')));
      },
      // trailing: Icon(
      //   icon,
      //   color: Colors.blue[500],
      // ),
    );
  }
}