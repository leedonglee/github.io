import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainHeader extends StatefulWidget {
  const MainHeader({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<MainHeader> createState() => _MainHeader();
}

class _MainHeader extends State<MainHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget> [
          Container(
            height: 64,
            color: Colors.blue,
            child: Center(
              child: SizedBox(
                // margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                width: 1000,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Home Button
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
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
                              'assets/icons/home.svg',  
                            )
                          )
                        )
                      )
                    ),
                    MediaQuery.of(context).size.width <= 600 ? 
                    // Nav Button
                    GestureDetector(
                      onTap: () {
                        widget.onPressed();
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
                              'assets/icons/menu.svg',
                            )
                          )
                        )
                      )
                    ) :
                    Row(
                      children: [                        
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: const Text(
                            'About', style: TextStyle(color: Colors.white, fontSize: 16)
                          )
                        ),
                        const SizedBox(width: 64),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: const Text(
                            'Category 2', style: TextStyle(color: Colors.white, fontSize: 16)
                          )
                        ),
                        const SizedBox(width: 64),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: const Text(
                            'Category 3', style: TextStyle(color: Colors.white, fontSize: 16)
                          )
                        ),
                        const SizedBox(width: 24),
                      ]
                    )
                  ],
                ),
              ),
            )
          )
        ],
      )
    );
  }
}
