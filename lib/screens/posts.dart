import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:forumapp/services/services.dart';
import 'package:forumapp/shared/shared.dart';

import 'screens.dart';

class PostsScreen extends StatefulWidget {
  createState() => PostsScreenState();

  final Topic topic;

  PostsScreen(this.topic);
}

class PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Global.postsRef.getData(),
      builder: (BuildContext context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List<Post> posts = snap.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text(widget.topic.title),
              actions: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.userCircle,
                      color: Colors.pink[200]),
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                )
              ],
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Card(child: PostItem(post: posts[index])),
                        );
                      }),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Colors.purple,
                  child: Text(
                   'Responder',
                   style: TextStyle(
                     fontSize: 36,
                     color: Colors.white,
                   ),
                  ),
                  ),
              ],
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

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 5,
          )
        ],
      ),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Title(
                color: Colors.black,
                child: RichText(
                  text: TextSpan(
                    text: 'Postado por: ${post.authorName}',
                    style: TextStyle(color: Colors.black87, fontSize: 18),
                  ),
                ),
              ),
            ),
            //Container(
            //child:
            RichText(
              text: TextSpan(
                text: post.text,
                style: TextStyle(color: Colors.black87, fontSize: 24),
              ),
            ),
            //),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                icon: Icon( Icons.edit),
                onPressed: () {},
                color: Colors.black,
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {},
                  color: Colors.black,
                ),
              ],
            ),
          ]),
    );
  }
}

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: Text(widget.topic.title),
              actions: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.userCircle,
                      color: Colors.pink[200]),
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                )
              ],
            ),

            body: Container(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Escreva sua resposta aqui.'
                ),
              ),
            ),
            
            bottomNavigationBar: AppBottomNav(),
    );
  }
}
