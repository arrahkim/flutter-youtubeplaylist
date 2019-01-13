import 'package:flutter/material.dart';
import './mydrawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Youtube Playlist",
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://cdn-asset.hipwee.com/wp-content/uploads/2016/07/hipwee-w-poolga-com-750x1333.jpg"),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 150,
                height: 150,
                child: Image.network("http://www.stickpng.com/assets/images/580b57fcd9996e24bc43c545.png"),
              ),
              Text("Youtube Playlist", style: TextStyle(fontSize: 20, color: Colors.orange),),
            ],
          ),
        ),
      ),
    );
  }
}