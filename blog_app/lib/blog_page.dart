import 'package:blog_app/blog_post.dart';
import 'package:blog_app/blog_scaffold.dart';
import 'package:flutter/material.dart';

import 'constrained_center.dart';

class BlogPage extends StatelessWidget {
  final BlogPost blogPost;

  const BlogPage({Key? key, required this.blogPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlogScaffold(
      postKids: [
        ConstrainedCenter(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://media.licdn.com/dms/image/v2/D5603AQEl0i6TVmLqzg/profile-displayphoto-shrink_200_200/B56ZXO9fSyGUAY-/0/1742933980878?e=2147483647&v=beta&t=PIsNWor49ZBgJhEeOztl4PFNKjq6U1VcPomCxTmxz3A',
            ),
            radius: 54,
          ),
        ),
        SizedBox(height: 18),
        ConstrainedCenter(
          child: SelectableText(
            'Flutter Dev',
            style: Theme.of(context).textTheme.headlineSmall,
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
