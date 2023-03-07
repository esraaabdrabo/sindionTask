import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimateSize extends StatefulWidget {
  final Color scaffoldBG;
  final double begin;
  final double end;
  final Duration duration;
  final bool isForward;
  final bool isReverse;
  final bool isRepeat;
  final Widget widget;
  final dynamic curve;
  const AnimateSize(
      {required this.begin,
      required this.end,
      required this.widget,
      required this.duration,
      this.curve = Curves.ease,
      this.isForward = false,
      this.isRepeat = false,
      this.isReverse = false,
      this.scaffoldBG = Colors.transparent,
      super.key});

  @override
  _AnimateSizeState createState() => _AnimateSizeState();
}

class _AnimateSizeState extends State<AnimateSize>
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
    _animation = Tween(begin: widget.begin, end: widget.end)
        .animate(CurvedAnimation(parent: _controller, curve: widget.curve));
    getTikerFuture();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
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
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
