import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'data_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qiou's App",
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Memory Card'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var data = DataProvider.getInstance();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:  new Swiper(
        itemBuilder: (BuildContext context,int index){
          var obj = data[index % data.length];
          return Card(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 ListTile(
                  leading: Text.rich(TextSpan(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    text: obj.ref
                  )),
                  title: Text(obj.title),
                  subtitle: Text(obj.content),
                ),
                ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('MARK'),
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        child: const Text('UNMARK'),
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: data.length > 10 ? 10 : data.length ,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}
