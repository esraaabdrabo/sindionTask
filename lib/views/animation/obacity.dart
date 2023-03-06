import 'package:flutter/material.dart';

class AnimateObacity extends StatefulWidget {
  double begin;
  double end;
  Duration duration;
  bool isForward;
  bool isReverse;
  bool isRepeat;
  Color scaffoldBG;

  Widget widget;
  AnimateObacity(
      {required this.widget,
      required this.duration,
      this.scaffoldBG = Colors.transparent,
      this.isForward = false,
      this.begin = -1,
      this.end = 1,
      this.isRepeat = false,
      this.isReverse = false,
      super.key});

  @override
  State<AnimateObacity> createState() => _AnimateObacityState();
}

class _AnimateObacityState extends State<AnimateObacity>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationDouble;

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
    _animationDouble = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));

    getTikerFuture();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.scaffoldBG,
      body: FadeTransition(opacity: _animationDouble, child: widget.widget),
    );
  }
}
