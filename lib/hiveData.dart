import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


@HiveType(typeId: 0)

class Stickdata extends HiveObject{

  @HiveField(0)
  late double x;

  @HiveField(1)
  late double y;

  @HiveField(2)
  late String text;

  Stickdata({required this.x, required this.y, required this.text});
  
}