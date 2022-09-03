import 'package:commentsreply/Provider/CommentProvider.dart';
import 'package:commentsreply/views/CommentScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => CommentProvider())],
        child: const MaterialApp(
          home: CommentScreen(),
        ));
  }
}
