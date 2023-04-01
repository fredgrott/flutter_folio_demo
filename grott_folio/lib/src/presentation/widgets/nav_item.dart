// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';
import 'package:grott_folio/src/presentation/widgets/animated_line_through_text.dart';

class NavItem extends StatefulWidget {
  final String title;
  final int index;
  final TextStyle? titleStyle;
  final Color titleColor;
  final Color selectedColor;
  final bool isSelected;
  final bool isMobile;
  final GestureTapCallback? onTap;
  final AnimationController controller;

  const NavItem({
    super.key,
    required this.isSelected,
    required this.isMobile,
    this.onTap,
    required this.controller, required this.title, required this.index, this.titleStyle, required this.titleColor, required this.selectedColor,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _hovering = false;
  bool _hoveringUnselectedNavItemMobile = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        child: _buildNavItem(),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _hovering = hovering;
    });
  }

  void _onMouseEnterUnselectedNavItemMobile(bool hovering) {
    setState(() {
      _hoveringUnselectedNavItemMobile = hovering;
    });
  }

  Widget _buildNavItem() {
    return widget.isMobile ? mobileText() : desktopText();
  }

  Widget mobileText() {
    final TextTheme textTheme = Theme.of(context).textTheme;
    const double indexTextSize = 80;
    const double selectedTextSize = 36;
    const double unselectedTextSize = 36;

    if (widget.isSelected) {
      return Stack(
      children: [
              _buildNavItemIndex(
                index: widget.index,
                indexTextSize: indexTextSize,
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: (indexTextSize - selectedTextSize) / 3,),
                child: Align(
                  alignment: Alignment.center,
                  child: AnimatedLineThroughText(
                    text: widget.title.toLowerCase(), 
                    hoverColor: Theme.of(context).colorScheme.inversePrimary, 
                    coverColor: Theme.of(context).colorScheme.onPrimaryContainer, 
                    slideBoxColor: Theme.of(context).colorScheme.secondaryContainer, 
                    slideBoxCoverColor: Theme.of(context).colorScheme.onSecondaryContainer, 
                    lineThickness: 4, 
                    textStyle: widget.titleStyle ?? widget.titleStyle ?? textTheme.headlineSmall?.copyWith(
                      fontSize: selectedTextSize, fontWeight: FontWeight.w400,
                    ), 
                    onHoverTextStyle: textTheme.headlineSmall?.copyWith(
                      fontSize: selectedTextSize, 
                      fontWeight: FontWeight.w400,
                    ), 
                    isUnderlinedOnHover: false,
                  ),
                ),
              ),
            ],

    );
    } else {
      return MouseRegion(
      onEnter: (e) => _onMouseEnterUnselectedNavItemMobile(true),
      onExit: (e) => _onMouseEnterUnselectedNavItemMobile(false),
      child: Stack(
        children: [
          AnimatedOpacity(
            // ignore: avoid-nested-conditional-expressions
            opacity: _hoveringUnselectedNavItemMobile ? 1 : 0, 
            curve: Curves.ease, 
            duration: const Duration(milliseconds: 200), 
            child: _buildNavItemIndex(index: widget.index, indexTextSize: indexTextSize),
          ),
          Container(
                  margin: const EdgeInsets.only(
                      top: (indexTextSize - selectedTextSize) / 3,),
                  child: Align(
                    alignment: Alignment.center,
                    child: AnimatedLineThroughText(
                      text: widget.title.toLowerCase(), 
                      hoverColor: Theme.of(context).colorScheme.onInverseSurface, 
                      coverColor: Theme.of(context).colorScheme.primaryContainer, 
                      slideBoxColor: Theme.of(context).colorScheme.onSecondaryContainer, 
                      slideBoxCoverColor: Theme.of(context).colorScheme.secondaryContainer, 
                      lineThickness: 4, 
                      textStyle: widget.titleStyle ?? textTheme.bodyLarge?.copyWith(
                        fontSize: unselectedTextSize, 
                        fontWeight: FontWeight.w400,
                      ), 
                      onHoverTextStyle: textTheme.bodyLarge?.copyWith(
                        fontSize: unselectedTextSize, 
                        fontWeight: FontWeight.w400,
                      ), 
                      isUnderlinedOnHover: false,
                    ),
                  ),
                ),

        ],
      ),

    );
    }
  }

  Widget desktopText() {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final TextStyle? defaultSelectedItemStyle = textTheme.bodyLarge?.copyWith(
      
      color: widget.selectedColor,
      fontWeight: FontWeight.w400,
    );
    final TextStyle? defaultUnselectedItemStyle = textTheme.bodyLarge?.copyWith(
      
      color: widget.titleColor,
    );

    return widget.isSelected
        ? AnimatedLineThroughText(
          text: widget.title, 
          hoverColor: Theme.of(context).colorScheme.inversePrimary, 
          coverColor: Theme.of(context).colorScheme.onPrimaryContainer, 
          slideBoxColor: Theme.of(context).colorScheme.secondaryContainer, 
          slideBoxCoverColor: Theme.of(context).colorScheme.onSecondaryContainer, 
          textStyle: widget.titleStyle ?? defaultSelectedItemStyle, 
          isUnderlinedOnHover: false, 
          hasOffsetAnimation: true, 
          hasSlideBoxAnimation: true, 
          controller: widget.controller,)
        : AnimatedLineThroughText(
          text: widget.title, 
          hoverColor: Theme.of(context).colorScheme.onInverseSurface,
          coverColor: Theme.of(context).colorScheme.primaryContainer,
          slideBoxColor: Theme.of(context).colorScheme.onSecondaryContainer,
          slideBoxCoverColor: Theme.of(context).colorScheme.secondaryContainer, 
          textStyle: widget.titleStyle ?? defaultUnselectedItemStyle, 
          onHoverTextStyle: defaultUnselectedItemStyle?.copyWith(
            color: widget.selectedColor, fontWeight: FontWeight.w400,
            ), 
          isUnderlinedOnHover: false, 
          hasOffsetAnimation: true,);



  }

  Widget _buildNavItemIndex({required int index, double? indexTextSize,}) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    
    return Align(
      alignment: Alignment.center,
      child: Text(
        '0$index',
        style: widget.titleStyle ??
            textTheme.headlineMedium?.copyWith(
              fontSize: indexTextSize,
              //color: AppColors.grey800,
              // fontWeight: FontWeight.w400,
            ),
      ),
    );
  }

}
