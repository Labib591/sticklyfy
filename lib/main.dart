import 'package:flutter/material.dart';
import 'package:sticklyfy/homePage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sticklyfy/hiveData.dart';

part 'main.g.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(WidgetDataAdapter());
  await Hive.openBox<Stickdata>('widgets');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }

}