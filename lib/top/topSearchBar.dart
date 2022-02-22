import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/service.dart';

class TopSearchBar extends StatefulWidget {
  @override
  _TopSearchBarState createState() => _TopSearchBarState();
}

class _TopSearchBarState extends State<TopSearchBar> {
  GlobalKey key = GlobalKey();

  final service = Service();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      service.topSearchBarHeight.value = key.currentContext!.size!.height;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: context.screenWidth,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    service.searchOpen.value = false;
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: TextField(
                  decoration: InputDecoration(border:InputBorder.none),
                  ),
                ),
              ],
            ),
            Divider(),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  buildChip("Videos"),
                  buildChip("Photos"),
                  buildChip("Links"),
                ],
              ),
            ),
            Row(
              children: [
                buildChip("GIFs"),
                buildChip("Audio"),
                buildChip("Documents"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildChip(String name) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7),
      child: Chip(label: name.text.black.size(14).make()),
    );
  }
}
