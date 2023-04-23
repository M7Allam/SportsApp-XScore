import 'dart:async';

import 'package:flutter/material.dart';

class FadeInWidget extends StatefulWidget {

  final Widget child;
  final bool isReverse;
  final Duration duration;

  const FadeInWidget({
    required this.child,
    this.isReverse = false,
    this.duration = const Duration(milliseconds: 1000),
    Key? key,
  }) : super(key: key);

  @override
  State<FadeInWidget> createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    if(widget.isReverse){
      _animation = Tween<double>(begin: 0.6, end: 1.0,).animate(_controller);
      _controller.repeat(reverse: true, period: widget.duration);
    }else{
      _animation = Tween<double>(begin: 0.0, end: 1.0,).animate(_controller);
      _controller.forward();
    }
    super.initState();
  }




  @override
  void didUpdateWidget(FadeInWidget oldWidget) {
    if(widget != oldWidget){
      _controller.addStatusListener((status) {
        if(status == AnimationStatus.reverse){
          if(!widget.isReverse){
            _controller.dispose();
          }
        }
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
