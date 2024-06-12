import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'common/header.dart';

// Home : Games
// About : Info, Contact
// Documents : PP, Terms
// Main Games

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
            // Home
            SingleChildScrollView(
              child: Column(
                children: [
                  MainHeader(
                    onPressed: setNav,
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          color: Colors.green
                        ),
                        Container(
                          height: 1000
                        )
                      ],
                    ),
                  )
                ]
              )
            ),
            MediaQuery.of(context).size.width <= 600 ? 
            // Mobile
            Stack(
              children: [
                // Nav
                if (isActive)
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
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  right: isActive ? 0 : -300,
                  top: 0,
                  bottom: 0,
                  width: 300,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setNav();
                              },
                              child: Container(
                                width: 64,
                                height: 64,
                                color: Colors.transparent,
                                child: Center(
                                  child: SizedBox(
                                    width: 32,
                                    height: 32,
                                    child: SvgPicture.asset(
                                      'assets/icons/arrow_forward.svg',
                                    )
                                  )
                                )
                              )
                            ),
                          ]
                        ),
                        // const Padding(padding: EdgeInsets.fromLTRB(0, 24, 0, 0)),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/');
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: SizedBox(
                                        width: 8,
                                        height: 8,
                                        child: SvgPicture.asset(
                                          'assets/icons/circle.svg',
                                        )
                                      )
                                    )
                                  ),
                                  const Text('Home', style: TextStyle(fontWeight: FontWeight.bold))
                                ],
                              )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: SizedBox(
                                        width: 8,
                                        height: 8,
                                        child: SvgPicture.asset(
                                          'assets/icons/circle.svg',
                                        )
                                      )
                                    )
                                  ),
                                  const Text('Item 2')
                                ],
                              )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: SizedBox(
                                        width: 8,
                                        height: 8,
                                        child: SvgPicture.asset(
                                          'assets/icons/circle.svg',
                                        )
                                      )
                                    )
                                  ),
                                  const Text('Item 3')
                                ],
                              )
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 64,
                                    height: 64,
                                    color: Colors.transparent,
                                    child: Center(
                                      child: SizedBox(
                                        width: 8,
                                        height: 8,
                                        child: SvgPicture.asset(
                                          'assets/icons/circle.svg',
                                        )
                                      )
                                    )
                                  ),
                                  const Text('Item 4')
                                ],
                              )
                            ),
                          ],
                        ),
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
