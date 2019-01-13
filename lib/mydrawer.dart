import 'package:flutter/material.dart';
import './playlist.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              "Home",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Divider(),
          ListMenu(
            title: "Dart", url: "https://youtube-playlist-flutter.herokuapp.com/",
          ),
        ],
      ),
    ));
  }
}

class ListMenu extends StatelessWidget {

  final String title, url;
  ListMenu({this.title, this.url});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.video_call),
      title: Text(
       title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => Playlist(
                    url: url,
                    title: title,
                  ),
            ),
          ),
    );
  }
}
