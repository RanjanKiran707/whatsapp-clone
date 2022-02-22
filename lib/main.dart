import 'package:flutter/material.dart';
import 'package:whatsapp/service.dart';
import 'package:whatsapp/top/top.dart';
import 'package:whatsapp/view/View.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  final service = Service();
  @override
  void initState() {
    service.tabController = TabController(length: 4, vsync: this,initialIndex: 1);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          View(),
          Top(),

        ],
      ),
    );
  }
}
