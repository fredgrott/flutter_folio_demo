// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:folio/src/presentation/widgets/custom_drawer_header.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CustomDrawerHeader(),
              ListView(
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
