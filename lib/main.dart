import 'package:doctor_tutorial/bottomBar.dart';
import 'package:doctor_tutorial/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: NavigationController(),
    );
  }
}

class NavigationController extends StatefulWidget {
  const NavigationController({Key? key}) : super(key: key);

  @override
  _NavigationControllerState createState() => _NavigationControllerState();
}

class _NavigationControllerState extends State<NavigationController> {
  int _currentPage = 0;
  final _pageController = PageController();

  notifyParent(index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            HomePage(),
            Container(
              color: Colors.blue,
            ),
            Container(
              color: Colors.green,
            ),
            Container(color: Colors.yellow),
            Container(
              color: Colors.orange,
            ),
          ],
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomBarC(
            currentPage: _currentPage,
            pageController: _pageController,
            notifyParent: notifyParent),
      ),
    );
  }
}
