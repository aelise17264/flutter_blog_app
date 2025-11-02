import 'package:blog_app/blog_post.dart';
import 'package:blog_app/blog_scaffold.dart';
import 'package:blog_app/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constrained_center.dart';

class BlogPage extends StatelessWidget {
  final BlogPost blogPost;

  const BlogPage({Key? key, required this.blogPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return BlogScaffold(
      postKids: [
        ConstrainedCenter(
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.profilePicture),
            radius: 54,
          ),
        ),
        SizedBox(height: 18),
        ConstrainedCenter(
          child: SelectableText(
            user.name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: 40),
        SelectableText(
          blogPost.title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: 20),
        SelectableText(
          blogPost.date,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 20),

        SelectableText(
          blogPost.body,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
