import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:sticklyfy/draggable.dart';
import 'package:sticklyfy/stickyNote.dart';

import 'hiveData.dart';

class HomePage extends StatefulWidget{



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Box<Stickdata> _sticks;


  @override
  void initState() {
    super.initState();
    _sticks = Hive.box<Stickdata>('widgets');
  }


  void _addStickyNote() {
    final newWidget = Stickdata(
      x: 50.0 * _sticks.length,
      y: 50.0 * _sticks.length,
      text: '',
    );
    _sticks.add(newWidget);
  }

  void _deleteStickyNote(){
    setState(() {
      if (_sticks.isNotEmpty) {
        _sticks.clear();
      }
    });
  }

  void _updateWidgetPosition(int index, Offset newPosition) {
    final widget = _sticks.getAt(index);
    if (widget != null) {
      widget.x = newPosition.dx;
      widget.y = newPosition.dy;
      widget.save();
    }
  }

  void _updateWidgetText(int index, String newText) {
    final widget = _sticks.getAt(index);
    if (widget != null) {
      widget.text = newText;
      widget.save();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child :AppBar(
          elevation: 10,
          backgroundColor: Colors.black12,
          title: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Text("sticklyfy.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 36,
              ),
            ),
          ),
        ),
      ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                backgroundColor: Colors.black12,
              onPressed: _addStickyNote,
                child: Icon(
                  Icons.add_circle,
                  color: Colors.blue,
                  size: 40,
                ),
                  ),
            ),
            FloatingActionButton(onPressed: _deleteStickyNote,
              backgroundColor: Colors.black12,
              child: Icon(Icons.delete,
                color: Colors.redAccent,
                size: 40,
              ),
            ),
          ],
        ),
      body:  ValueListenableBuilder(
        valueListenable: _sticks.listenable(),
        builder: (context, Box<Stickdata> box, _) {
          return Stack(
            children: List.generate(box.length, (index) {
              final widget = box.getAt(index)!;
              return DraggableWidget(
                key: ValueKey(index),
                initialPosition: Offset(widget.x, widget.y),
                onPositionChanged: (newPosition) => _updateWidgetPosition(index, newPosition),
                child: Stickynote(
                  initialText: widget.text,
                  onTextChanged: (newText) => _updateWidgetText(index, newText),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}