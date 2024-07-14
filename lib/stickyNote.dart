import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stickynote extends StatefulWidget{

  final String initialText;
  final Function(String) onTextChanged;

  Stickynote({super.key, required this.initialText, required this.onTextChanged});

  @override
  State<Stickynote> createState() => _StickynoteState();
}

class _StickynoteState extends State<Stickynote> {

  late TextEditingController _controller ;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
  }

  @override
  void didUpdateWidget(Stickynote oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialText != oldWidget.initialText) {
      _controller.text = widget.initialText;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          padding: EdgeInsets.all(10),
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            color: CupertinoColors.systemYellow,
            borderRadius: BorderRadius.circular(20.0),
          ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: _controller,
                  onChanged: widget.onTextChanged,
                  decoration: InputDecoration(
                    hintText: 'tap to add',
                    border: InputBorder.none
                  ),
                ),
              ],
            ),
      ),
    );
  }
}