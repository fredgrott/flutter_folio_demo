// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values, sized_box_shrink_expand

import 'package:flutter/material.dart';
import 'package:grott_folio/src/presentation/widgets/animated_text_slide_box_transition.dart';

class AnimatedLineThroughText extends StatefulWidget {
  final String text;
  final Duration duration;
  final Color hoverColor;
  final Color coverColor;
  final Color slideBoxColor;
  final Color slideBoxCoverColor;
  final double lineThickness;
  final double heightFactor;
  final double widthFactor;
  final TextStyle? textStyle;
  final TextStyle? onHoverTextStyle;
  final bool isUnderlinedOnHover;
  final bool isUnderlinedByDefault;
  final bool hasOffsetAnimation;
  final bool hasSlideBoxAnimation;
  final AnimationController? controller;
  final Offset beginOffset;
  final Offset endOffset;
  final GestureTapCallback? onTap;
  final int maxLines;
  final double width;

  const AnimatedLineThroughText({
    super.key,
    required this.text,
    this.duration = const Duration(milliseconds: 300),
    required this.hoverColor,
    required this.coverColor,
    required this.slideBoxColor,
    required this.slideBoxCoverColor,
    // ignore: no-magic-number
    this.lineThickness = 2,
    this.heightFactor = 1,
    this.widthFactor = 1,
    this.textStyle,
    this.onHoverTextStyle,
    this.isUnderlinedOnHover = true,
    this.isUnderlinedByDefault = false,
    this.hasOffsetAnimation = false,
    this.hasSlideBoxAnimation = false,
    this.controller,
    this.beginOffset = const Offset(0, 0,),
    this.endOffset = const Offset(0.15, 0,),
    this.onTap,
    this.maxLines = 1,
    this.width = double.infinity,
  });

  @override
  State<AnimatedLineThroughText> createState() =>
      _AnimatedLineThroughTextState();
}

class _AnimatedLineThroughTextState extends State<AnimatedLineThroughText>
    with TickerProviderStateMixin {
  late AnimationController _forwardController;
  late AnimationController _backwardsController;
  late AnimationController _slideTransitionController;
  late Animation<double> forwardAnimation;
  late Animation<double> backwardsAnimation;
  late Animation<Offset> _offsetAnimation;
  late double textWidth;
  late double textHeight;
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle? hoverTextStyle =
        widget.onHoverTextStyle ?? widget.textStyle;

    return InkWell(
      onTap: widget.onTap,
      hoverColor: Colors.transparent,
      child: MouseRegion(
        onEnter: (e) => _mouseEnter(true), 
        onExit: (e) => _mouseEnter(false), 
        cursor: SystemMouseCursors.click, 
        child: SlideTransition(
          position: _offsetAnimation, 
          child: Stack(
            children: [
              if (widget.hasSlideBoxAnimation) AnimatedTextSlideBoxTransition(
                controller: widget.controller!, 
                widthFactor: 
                widget.widthFactor, 
                heightFactor: widget.heightFactor, 
                boxColor: widget.slideBoxColor, 
                coverColor: widget.slideBoxCoverColor, 
                text: widget.text, 
                textStyle: _isHovering ? hoverTextStyle?.copyWith(
                  // ignore: avoid-nested-conditional-expressions
                  decoration: widget.isUnderlinedOnHover ? TextDecoration.underline : TextDecoration.none,
                  ) : widget.textStyle?.copyWith(
                    // ignore: avoid-nested-conditional-expressions
                    decoration: widget.isUnderlinedByDefault ? TextDecoration.underline : TextDecoration.none,
                    ), width: widget.width, maxLines: widget.maxLines,
                    ) else const SizedBox(width: 0, height: 0,), 
                    // ignore: no-magic-number
                    Positioned(top: (textHeight / 2) - widget.lineThickness, 
                    child: Container(
                      color: widget.hoverColor, 
                      width: forwardAnimation.value, 
                      height: widget.lineThickness,
                    ),
                  ), 
                  Positioned(
                    // ignore: no-magic-number
                    top: (textHeight / 2) - widget.lineThickness, 
                    child: Container(
                      color: widget.coverColor, 
                      width: backwardsAnimation.value, 
                      height: widget.lineThickness,
                    ),
                  ), 
                  if (widget.hasSlideBoxAnimation) const SizedBox(width: 0, height: 0,) else Text(
                    widget.text, 
                    style: _isHovering ? hoverTextStyle?.copyWith(
                      // ignore: avoid-nested-conditional-expressions
                      decoration: widget.isUnderlinedOnHover ? TextDecoration.underline : TextDecoration.none,) : widget.textStyle?.copyWith(
                        // ignore: avoid-nested-conditional-expressions
                        decoration: widget.isUnderlinedByDefault ? TextDecoration.underline : TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }

  @override
  void initState() {
    textWidth = _textSize(widget.text, widget.textStyle,).width;
    textHeight = _textSize(widget.text, widget.textStyle,).height;
    _forwardController = AnimationController(
      duration: widget.duration, vsync: this,)..addListener(() {
        // ignore: no-empty-block
        setState(() {});
      });
    _backwardsController = AnimationController(
      duration: widget.duration, vsync: this,)..addListener(() {
        // ignore: no-empty-block
        setState(() {});
      });

    _slideTransitionController = AnimationController(
      duration: widget.duration, vsync: this,)..addListener(() {
        // ignore: no-empty-block
        setState(() {});
      });
    forwardAnimation = Tween<double>(begin: 0, end: textWidth,).animate(
      CurvedAnimation(
        parent: _forwardController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    backwardsAnimation = Tween<double>(begin: 0, end: textWidth,).animate(
      CurvedAnimation(
        parent: _backwardsController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _offsetAnimation = Tween<Offset>(
      begin: widget.beginOffset,
      end: widget.hasOffsetAnimation ? widget.endOffset : widget.beginOffset,
    ).animate(
      CurvedAnimation(
        parent: _slideTransitionController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    _backwardsController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _backwardsController.reset();
        _forwardController.reset();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _forwardController.dispose();
    _backwardsController.dispose();
    _slideTransitionController.dispose();
    super.dispose();
  }

  Size _textSize(
    String text,
    TextStyle? style,
  ) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: style,
      ),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(
        minWidth: 0,
        maxWidth: double.infinity,
      );

    return textPainter.size;
  }

  void _mouseEnter(bool hovering) {
    if (hovering) {
      setState(() {
        _slideTransitionController.forward();
        _forwardController.forward();
        _isHovering = hovering;
      });
    } else {
      setState(() {
        _slideTransitionController.reverse();
        _backwardsController.forward();
        _isHovering = hovering;
      });
    }
  }
}
