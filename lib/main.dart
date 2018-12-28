import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'data_provider.dart';

import 'package:flutter/services.dart' show rootBundle;

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

  @override
  Widget build(BuildContext context) {
    var builder = new FutureBuilder(
        future: rootBundle.loadString("assets/law.txt"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          switch(snapshot.connectionState) {
            case ConnectionState.done: {
              if(snapshot.hasError)
                return new Text("Error");

              var data = DataProvider.getInstance(s: snapshot.data);

              return new Swiper(
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
                itemCount: data.length, //> 100 ? 100 : data.length ,
                viewportFraction: 0.85,
                scale: 0.9,
              );
            }

            case ConnectionState.waiting: {
              return new Text("Loading");
            }

            case ConnectionState.none: {
              return new Text("Loading");
            }

            case ConnectionState.active: {
              return new Text("Loading");
            }
          }
        }
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:  builder
    );
  }
}
