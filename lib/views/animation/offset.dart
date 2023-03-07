import 'package:flutter/material.dart';

class AnimateOffset extends StatefulWidget {
  final Duration duration;
  final Offset begin;
  final Offset end;
  final bool isForward;
  final bool isReverse;
  final bool isRepeat;
  final Widget widget;
  final dynamic curve;
  const AnimateOffset(
      {required this.begin,
      required this.end,
      required this.widget,
      required this.duration,
      this.curve = Curves.ease,
      this.isForward = false,
      this.isRepeat = false,
      this.isReverse = false,
      super.key});

  @override
  State<AnimateOffset> createState() => _AnimateOffsetState();
}

class _AnimateOffsetState extends State<AnimateOffset>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationOffest;
  getTikerFuture() {
    return widget.isForward
        ? _controller.forward()
        : widget.isRepeat
            ? _controller.repeat()
            : widget.isReverse
                ? _controller.reverse()
                : null;
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animationOffest = Tween<Offset>(begin: widget.begin, end: widget.end)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    getTikerFuture();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animationOffest, child: widget.widget);
  }
}
