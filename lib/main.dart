import 'package:flutter/material.dart';
import 'package:interview_list_assignment5/provider/fetch_data.dart';
import 'screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Data>(
          create: (BuildContext context) => Data(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFE9EBF2),
        ),
        home:  const HomePage(),
      ),
    );
  }
}