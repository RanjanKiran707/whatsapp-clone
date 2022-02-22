import 'package:flutter/material.dart';
import 'package:whatsapp/service.dart';
import 'package:whatsapp/view/chatsPage.dart';

class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: ClampingScrollPhysics(),
      controller: Service().tabController,
      children: [
        Container(color: Colors.black),
        ChatsPage(),
        Container(color: Colors.blue),
        Container(color: Colors.orange),
      ],
    );
  }
}
