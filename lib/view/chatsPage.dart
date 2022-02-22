import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/service.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final service = Service();
  double height = 0;
  @override
  void initState() {
    service.searchOpen.addListener(listener);
    super.initState();
  }

  void listener() {
    if (service.searchOpen.value) {
      setState(() {
        height = service.topSearchBarHeight.value - service.topAppBarHeight.value;
      });
    } else {
      Future.delayed(Duration(milliseconds: 300)).then((value) {
          setState(() {
            height = 0;
          });
        });
    }
  }

  @override
  void dispose() {
    service.searchOpen.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ValueListenableBuilder<double>(
            valueListenable: service.topAppBarHeight,
            builder: (context, value, child) {
              return value.heightBox;
            },
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: height,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                    radius: 20,
                  ),
                  title: "Ranjan".text.size(16).black.make(),
                  subtitle: "Hello There Welcome to Whatsapp".text.size(14).make(),
                  trailing: "yesterday".text.size(14).make(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
