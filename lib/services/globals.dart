import 'services.dart';
import 'package:firebase_analytics/firebase_analytics.dart';


/// Static global state. Immutable services that do not care about build context. 
class Global {
  // App Data
  static final String title = 'Fireship';

  // Services
  static final FirebaseAnalytics analytics = FirebaseAnalytics();

    // Data Models
  static final Map models = {
    Topic: (data) => Topic.fromMap(data),
    //Quiz: (data) => Quiz.fromMap(data),
    Report: (data) => Report.fromMap(data),
    Post: (data) => Post.fromMap(data),
  };


  // Firestore References for Writes
  static final Collection<Topic> topicsRef = Collection<Topic>(path: 'topics');

  static final UserData<Report> reportRef = UserData<Report>(collection: 'reports'); 

  static final Collection<Post> postsRef = Collection<Post>(path: 'posts');

  
}
