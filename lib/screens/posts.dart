import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forumapp/services/services.dart';
import 'package:forumapp/shared/shared.dart';

import 'screens.dart';


class PostsScreen extends StatefulWidget {
  createState() => PostsScreenState();
}

class PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.topicsRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<Topic> topics = [];
          topics = snap.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text('Topics'),
              actions: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.userCircle,
                      color: Colors.pink[200]),
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                )
              ],
            ),
            drawer: TopicDrawer(topics: snap.data),
            body: Container(
              child: Center(
                child: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.android),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => TopicsScreen(),
                      ),
                    );
                  },
                ),
              ),
            ),
            bottomNavigationBar: AppBottomNav(),
          );
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}
