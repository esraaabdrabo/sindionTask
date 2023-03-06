import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedHeight extends StatefulWidget {
  Color scaffoldBG;
  double begin;
  double end;
  Duration duration;
  bool isForward;
  bool isReverse;
  bool isRepeat;

  Widget widget;
  AnimatedHeight(
      {required this.begin,
      required this.end,
      required this.widget,
      required this.duration,
      this.isForward = false,
      this.isRepeat = false,
      this.isReverse = false,
      this.scaffoldBG = Colors.transparent,
      super.key});

  @override
  _AnimatedHeightState createState() => _AnimatedHeightState();
}

class _AnimatedHeightState extends State<AnimatedHeight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

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
    _animation =
        Tween(begin: widget.begin, end: widget.end).animate(_controller);
    getTikerFuture();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.scaffoldBG,
      body: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Center(
            child: SizedBox(
              width: _animation.value,
              height: _animation.value,
              child: widget.widget,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
