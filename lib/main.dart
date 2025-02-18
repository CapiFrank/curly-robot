import 'package:firebase_core/firebase_core.dart';
import 'package:project_cipher/models/post.dart';
import 'package:project_cipher/utils/hash.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'models/model.dart';
import 'models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // var user = User(
            //     name: 'Pedro',
            //     email: '5411jos@gmail.com',
            //     password: Hash.make('Jose2001'));
            // user.create();
            var user = await Model.find<User>(
                collectionName: 'users',
                id: 'xkHRfEYNHDClR0HROWxd',
                fromJson: (id, data) => User(
                    id: id,
                    name: data['name'],
                    email: data['email'],
                    password: data['password']));
            // var post = Post(text: 'HelloWorld', userId: 'xkHRfEYNHDClR0HROWxd');
            // post.save();
            var posts = await user?.posts();
            var newUser = await posts?[0].user();

            print(newUser?.toJson());
            print(posts?[1].toJson());
          },
          child: const Text('Press Me'),
        ),
      ),
    );
  }
}
