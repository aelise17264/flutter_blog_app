import 'package:blog_app/blog_post.dart';
import 'package:blog_app/user.dart';
import 'package:provider/provider.dart';
import 'package:blog_app/home_page.dart';
import 'package:flutter/material.dart';

var myTheme = ThemeData(
  primarySwatch: Colors.blue,
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    headlineMedium: TextStyle(
      fontSize: 27,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(fontSize: 22, height: 1.4),
    // bodySmall has replaced caption since Flutter 3.19
    bodySmall: TextStyle(fontSize: 18, height: 1.4),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<List<BlogPost>>(create: (context) => _blogPosts),
        Provider<User>(
          create: (context) => User(
            name: 'User Name',
            profilePicture:
                'https://media.licdn.com/dms/image/v2/D5603AQEl0i6TVmLqzg/profile-displayphoto-shrink_200_200/B56ZXO9fSyGUAY-/0/1742933980878?e=2147483647&v=beta&t=PIsNWor49ZBgJhEeOztl4PFNKjq6U1VcPomCxTmxz3A',
          ),
        ),
      ],

      child: MaterialApp(
        title: 'Flutter Blog App',
        theme: myTheme,
        home: HomePage(),
      ),
    );
  }
}

final _blogPosts = [
  BlogPost(
    title: 'Blog App',
    publishedDate: DateTime(2020, 1, 2),
    body:
        "This app was created using Dart and Flutter. It includes Flutter elements such as Inkwells, Navigators and Providers.",
  ),
  BlogPost(
    title: 'MultiProvider',
    publishedDate: DateTime(2020, 2, 2),
    body:
        "Mergin multiple providers into a single linear widget tree, MultiProviders are used to improve readability. Additionally they also reduce boilerplate code by eliminating multiple layers of nested providers",
  ),
];
