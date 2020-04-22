import 'package:flutter/material.dart';
import '../services/services.dart';
import '../shared/shared.dart';
import '../screens/screens.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TopicsScreen extends StatelessWidget {
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
            body: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: topics.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height:  50,
                  child: TopicItem(topic: topics[index]),
                );
              }
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

class TopicItem extends StatelessWidget {
  final Topic topic;
  const TopicItem({Key key, this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var container = Container(
      child: Hero(
        tag: topic.id ?? 'vazio',
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => PostsScreen(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          topic.title,
                          style: TextStyle(
                              height: 1.5, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                    ),
                    // Text(topic.description)
                  ],
                ),
                // )
                //TopicProgress(topic: topic),
              ],
            ),
          ),
        ),
      ),
    );
    return container;
  }
}

class TopicScreen extends StatelessWidget {
  Topic topic;

  TopicScreen({this.topic});

  @override
  Widget build(BuildContext context) {
    if (topic != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: ListView(children: [
        /*  Hero(
            tag: topic.id,*/
            /*child: Image.asset('assets/covers/${topic.img}',
                width: MediaQuery.of(context).size.width),*/
            InkWell (              
              radius: 50,
              child: Text(
                topic.title,
                style:
                    TextStyle(height: 2, fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PostsScreen(),
                  ),
                );
              }
            ),
        ]),
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: ListView(children: [
          Hero(
            tag: 'vazio',
            /*child: Image.asset('assets/covers/default.png',
                width: MediaQuery.of(context).size.width),*/
            child: InkWell (
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => PostsScreen(),
                  ),
                );
              }
            ),
          ),
          Text(
            'Nenhuma Postagem',
            style:
                TextStyle(height: 2, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          // QuizList(topic: topic)
        ]),
      );
    }
  }
}

/*
class QuizList extends StatelessWidget {
  final Topic topic;
  QuizList({Key key, this.topic});

  @override
  Widget build(BuildContext context) {
    
    return Column(
        children: topic.quizzes.map((quiz) {
      return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 4,
        margin: EdgeInsets.all(4),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => QuizScreen(quizId: quiz.id),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8),
            child: ListTile(
              title: Text(
                quiz.title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(
                quiz.description,
                overflow: TextOverflow.fade,
                style: Theme.of(context).textTheme.subhead,
              ),
              leading: QuizBadge(topic: topic, quizId: quiz.id),
            ),
          ),
        ),
      );
    }).toList());
  }
}
*/
class TopicDrawer extends StatelessWidget {
  final List<Topic> topics;
  TopicDrawer({Key key, this.topics});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: topics.length,
          itemBuilder: (BuildContext context, int idx) {
            Topic topic = topics[idx];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    topic.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
                // QuizList(topic: topic)
              ],
            );
          },
          separatorBuilder: (BuildContext context, int idx) => Divider()),
    );
  }
}
