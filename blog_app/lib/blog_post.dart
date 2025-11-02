import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class BlogPost {
  final String title;
  final DateTime publishedDate;
  final String body;

  String get date => DateFormat('d MMMM y').format(publishedDate);

  BlogPost({
    required this.title,
    required this.publishedDate,
    required this.body,
  });

  factory BlogPost.fromDocument(DocumentSnapshot doc) {
    final blogMap = doc.data();
    if (blogMap == null) {
      return BlogPost.fromDocument(doc.exists as DocumentSnapshot<Object?>);
    }

    return BlogPost(
      title: blogMap['title'] ?? "",
      publishedDate: blogMap["published_date"].toDate() ?? "",
      body: blogMap["body"],
    );
  }
}



final timeStamp = Timestamp.fromDate(DateTime.now()).toDate();