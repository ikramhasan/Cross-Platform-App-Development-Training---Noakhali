import 'package:ecommerce/auth_wrapper.dart';
import 'package:ecommerce/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCpHxnZHlrYzZalv3w4NcLGUV_CELvn_o4',
      appId: '1:103525697016:web:d1d2edb07e0e3119f1020d',
      messagingSenderId: '103525697016',
      projectId: 'cross-platform-training',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthWrapper(),
    );
  }
}
