import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/service.dart';

class TopAppBar extends StatefulWidget {
  @override
  _TopAppBarState createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  final service = Service();
  GlobalKey key = GlobalKey();
  double height = 0;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      service.topAppBarHeight.value = key.currentContext!.size!.height;
    });
    service.searchOpen.addListener(() {
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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      width: context.screenWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              "WhatsApp".text.black.size(17).make(),
              Spacer(),
              IconButton(
                onPressed: () {
                  service.searchOpen.value = true;
                },
                icon: Icon(Icons.search),
              )
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: height,
          ),
          TabBar(
            indicatorWeight: 1,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            controller: service.tabController,
            tabs: [
              buildTab("CAMERA"),
              buildTab("CHATS"),
              buildTab("STATUS"),
              buildTab("CALLS"),
            ],
          ),
        ],
      ),
    );
  }

  Tab buildTab(String name) => Tab(
        child: name.text.black.make(),
      );
}
