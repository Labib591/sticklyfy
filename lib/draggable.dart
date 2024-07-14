import 'package:flutter/material.dart';

class DraggableWidget extends StatefulWidget {
  final Widget child;
  final Offset initialPosition;
  final Function(Offset) onPositionChanged;

  DraggableWidget({
    Key? key,
    required this.child,
    required this.initialPosition,
    required this.onPositionChanged,
  }) : super(key: key);

  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  late Offset position;

  @override
  void initState() {
    super.initState();
    position = widget.initialPosition;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Draggable(
        feedback: Material(
          elevation: 4.0,
          child: widget.child,
        ),
        childWhenDragging: Opacity(
          opacity: 0.5,
          child: widget.child,
        ),
        onDragEnd: (details) {
          setState(() {
            position = details.offset;
            widget.onPositionChanged(position);
          });
        },
        child: widget.child,
      ),
    );
  }
}