import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'common/header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isActive = false;

  void setNav() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('state : $isActive');

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  MainHeader(
                    onPressed: setNav,
                  ),
                ]
              )
            ),
            MediaQuery.of(context).size.width <= 600 && isActive ? 
            // Mobile
            Stack(
              children: [
                Positioned.fill(
                  child: GestureDetector(
                    onTap: () {
                      setNav();
                    },
                    child: Container(
                      color: Colors.black.withOpacity(0.8),
                    )
                  )
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  width: 300,
                  child: Container(
                    color: Colors.white,
                    child: const Column(
                      children: [
                        Text('Navigation Item 1'),
                        Text('Navigation Item 2'),
                        Text('Navigation Item 3'),
                        // 다른 네비게이션 항목 추가 가능
                      ],
                    ),
                  ),
                ),                
              ],
            ) : 
            // Web
            const SizedBox(),
          ],
        )
      )
    );
  }
}
