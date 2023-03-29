// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class TileNavItemData {
  final String title;
  bool isSelected;
  TileNavItemData({
    required this.title,
    this.isSelected = false,
  });
}

class TileNavItem extends StatefulWidget {
  final String tileTitle;
  final bool tileSelected;
  final IconData tileIcon;
  final VoidCallback? onTap;

  const TileNavItem({
    super.key,
    required this.tileTitle,
    this.tileSelected = false,
    required this.tileIcon,
    this.onTap,
  });

  @override
  State<TileNavItem> createState() => _TileNavItemState();
}

class _TileNavItemState extends State<TileNavItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: Key(widget.tileTitle),
      leading: Icon(widget.tileIcon),
      title: Text(widget.tileTitle),
      dense: true,
      visualDensity: VisualDensity.comfortable,
      style: ListTileStyle.drawer,
      contentPadding: null,
      onTap: widget.onTap,
      selected: widget.tileSelected,
      enableFeedback: true,
      titleAlignment: ListTileTitleAlignment.center,
    );
  }
}
