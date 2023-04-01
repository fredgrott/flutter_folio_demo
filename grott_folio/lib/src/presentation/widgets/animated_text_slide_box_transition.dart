// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:grott_folio/src/application/app_functions.dart';
import 'package:grott_folio/src/presentation/widgets/animated_slide_box.dart';

class AnimatedTextSlideBoxTransition extends StatefulWidget {
  final AnimationController controller;
  final double heightFactor;
  final double widthFactor;
  final Color boxColor;
  final Color coverColor;
  final Animation<double>? visibleBoxAnimation;
  final Animation<double>? invisibleBoxAnimation;
  final Animation<Offset>? position;
  final Curve visibleAnimationcurve;
  final Curve invisibleAnimationcurve;
  final Curve slideAnimationcurve;
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final double width;
  final int maxLines;

  const AnimatedTextSlideBoxTransition({
    super.key, 
    required this.controller, 
    this.widthFactor = 1,
    this.heightFactor = 1,
    required this.boxColor, 
    required this.coverColor, 
    this.visibleBoxAnimation, 
    this.invisibleBoxAnimation, 
    this.position, 
    this.visibleAnimationcurve = Curves.fastOutSlowIn,
    this.invisibleAnimationcurve = Curves.fastOutSlowIn,
    this.slideAnimationcurve = Curves.fastOutSlowIn,
    required this.text, 
    this.textStyle, 
    this.textAlign, 
    this.width = double.infinity,
    this.maxLines = 1,
    });


  @override
  State<AnimatedTextSlideBoxTransition> createState() =>
      _AnimatedTextSlideBoxTransitionState();
}

class _AnimatedTextSlideBoxTransitionState extends State<AnimatedTextSlideBoxTransition> with SingleTickerProviderStateMixin  {
  late AnimationController controller;
  late Animation<double> visibleAnimation;
  late Animation<double> invisibleAnimation;
  late Animation<RelativeRect> textPositionAnimation;
  late Size size;
  late double textWidth;
  late double textHeight;

  @override
  Widget build(BuildContext context) {
    setTextWidthAndHeight();

    return SizedBox(
      height: textHeight,
      child: Stack(
        children: [
          AnimatedSlideBox(
            controller: widget.controller, 
            height: textHeight, 
            width: textWidth, 
            visibleBoxAnimation: visibleAnimation, 
            invisibleBoxAnimation: invisibleAnimation, 
            boxColor: widget.boxColor, 
            coverColor: widget.coverColor,),
          PositionedTransition(
            rect: textPositionAnimation,
            child: Text(
              widget.text,
              style: widget.textStyle,
              textAlign: widget.textAlign,
            ),
          ),
        ],
      ),
    );

  }

  @override
  void initState() {
    setTextWidthAndHeight();
    controller = widget.controller;
    visibleAnimation = widget.visibleBoxAnimation ??
        Tween<double>(begin: 0, end: textWidth,).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0,
              0.35,
              curve: widget.visibleAnimationcurve,
            ),
          ),
        );

    invisibleAnimation = widget.invisibleBoxAnimation ??
        Tween<double>(begin: 0, end: textWidth,).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.35,
              0.7,
              curve: widget.invisibleAnimationcurve,
            ),
          ),
        );

    textPositionAnimation = RelativeRectTween(
      begin: RelativeRect.fromSize(
        Rect.fromLTWH(0, textHeight, textWidth, textHeight,),
        Size(textWidth, textHeight,),
      ),
      end: RelativeRect.fromSize(
        Rect.fromLTWH(0, 0, textWidth, textHeight,),
        Size(textWidth, textHeight,),
      ),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.6, 1.0, curve: widget.invisibleAnimationcurve,),
      ),
    );

    super.initState();
  }


  void setTextWidthAndHeight() {
    size = AppFunctions.textSize(
      text: widget.text,
      style: widget.textStyle,
      maxWidth: widget.width,
      maxLines: widget.maxLines,
    );
    textWidth = size.width * widget.widthFactor;
    textHeight = size.height * widget.heightFactor;
  }


  

}
