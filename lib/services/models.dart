//// Embedded Maps
/*
class Option {
  String value;
  String detail;
  bool correct;

  Option({ this.correct, this.value, this.detail });
  Option.fromMap(Map data) {
    value = data['value'];
    detail = data['detail'] ?? '';
    correct = data['correct'];
  }
}


class Question {
  String text;
  List<Option> options;
  Question({ this.options, this.text });

  Question.fromMap(Map data) {
    text = data['text'] ?? '';
    options = (data['options'] as List ?? []).map((v) => Option.fromMap(v)).toList();
  }
}

///// Database Collections

 class Quiz { 
  String id;
  String title;
  String description;
  String video;
  String topic;
  List<Question> questions;

  Quiz({ this.title, this.questions, this.video, this.description, this.id, this.topic });

  factory Quiz.fromMap(Map data) {
    return Quiz(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
      topic: data['topic'] ?? '',
      description: data['description'] ?? '',
      video: data['video'] ?? '',
      questions: (data['questions'] as List ?? []).map((v) => Question.fromMap(v)).toList()
    );
  }
  
}
*/

class Post {
  int id;
  String text;
  int authorId;
  String topicId;
  String authorName;

  Post({this.id, this.text, this.authorId, this.topicId, this.authorName});

  factory Post.fromMap(Map data) {
    return Post(
      id: data['id'] ?? '',
      authorId: data['authorId'] ?? '',
      text: data['text'] ?? '',
      topicId: data['topicid'] ?? '',
      authorName: data['authorName'] ?? '',
       );
  }
}

class Topic {
   int id;
   String title;
   User author;
  //final List<Quiz> quizzes;

  Topic({ this.id, this.title, this.author });

  factory Topic.fromMap(Map data) {
    return Topic(
      id: data['id'] ?? '',
      title: data['title'] ?? '',
     // author: data['authorId'].map((v) => User.fromMap(v)),
      //quizzes:  (data['quizzes'] as List ?? []).map((v) => Quiz.fromMap(v)).toList(), //data['quizzes'],
    );
  }

}

class User {
  String uid;
  String nome;

  User({this.uid, this.nome});

  factory User.fromMap(Map data) {
    return User(
      nome: data['nome'],
      uid: data['uid']
      );
  }
}
class Report {
  String uid;
  int total;
  dynamic topics;

  Report({ this.uid, this.topics, this.total });

  factory Report.fromMap(Map data) {
    return Report(
      uid: data['uid'],
    );
  }

} 

