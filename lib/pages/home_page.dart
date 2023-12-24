

import 'package:flutter/material.dart';
import 'package:gamefly/utils/data/data.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height * .50,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: games.map((e) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(e.image),
                  ),
                ),
              )).toList(),
            ),
          ),
          gradientBox()
        ],
      ),
    );
  }


  gradientBox(){
    final size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: size.width,
        height: size.height *.90,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(35, 45, 70, 1.0),
                  Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.65,2.0]
            )
        ),
      ),
    );
  }
}
