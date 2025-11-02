import 'package:blog_app/blog_page.dart';
import 'package:blog_app/blog_post.dart';
import 'package:blog_app/blog_scaffold.dart';
import 'package:blog_app/constrained_center.dart';
import 'package:blog_app/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final posts = Provider.of<List<BlogPost>>(context);
    final user = Provider.of<User>(context);
    return BlogScaffold(
      // crossAxisAlignment: CrossAxisAlignment.start,
      // key: super.key,
      postKids: [
        ConstrainedCenter(
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.profilePicture),
            radius: 72,
          ),
        ),
        SizedBox(height: 18),
        ConstrainedCenter(
          child: SelectableText(
            user.name,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        SizedBox(height: 40),
        SelectableText(
          'Description of Blog Post',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 40),
        SelectableText(
          'Subcategory of Blog Posts',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        for (var post in posts) BlogListTile(post: post),
      ],
    );
  }
}

class BlogListTile extends StatelessWidget {
  final BlogPost post;
  const BlogListTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        InkWell(
          child: Text(
            post.title,
            style: TextStyle(color: Colors.blueAccent.shade700),
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return BlogPage(blogPost: post);
                },
              ),
            );
          },
        ),
        SizedBox(height: 10),
        SelectableText(post.date, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
