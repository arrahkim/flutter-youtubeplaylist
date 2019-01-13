import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './mydrawer.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Playlist extends StatefulWidget {
  Playlist({this.title, this.url});
  final String title;
  final String url;

  @override
  _PlaylistState createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {
  Future<List> getData() async {
    final response = await http.get(widget.url);
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return Center(
            child: snapshot.hasData
                ? ListVideo(
                    list: snapshot.data,
                  )
                : CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ListVideo extends StatelessWidget {
  final List list;
  ListVideo({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => VideoPlay(
                        url: "https:/youtube.com/embed/${list[i]['contentDetails']['videoId']}",
                      )),
                    ),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            list[i]['snippet']['thumbnails']['high']['url']),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
              ),
              Text(
                list[i]['snippet']['title'],
                style: TextStyle(fontSize: 18),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
              ),
              Divider()
            ],
          ),
        );
      },
    );
  }
}

class VideoPlay extends StatelessWidget {

  final String url;
  VideoPlay({this.url});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: WebviewScaffold(
        url: url,
      ),
    );
  }
}
