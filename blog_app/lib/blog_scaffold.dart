import 'package:flutter/material.dart';

class BlogScaffold extends StatelessWidget {
  final List<Widget> postKids;

  const BlogScaffold({ Key? key, required this.postKids})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 612,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: postKids,
          ),
        ),
      ),
    );
  }
}
