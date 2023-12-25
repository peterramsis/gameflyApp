

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
          gradientBox(),
          topLayerWidget(),
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
        height: size.height *.80,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(35, 45, 70, 1.0),
                  Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.65,1.0]
            )
        ),
      ),
    );
  }
  topBarWidget(){
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height *.12,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
         Row(
           children: [
             IconButton(onPressed: (){

             }, icon:  const Icon(Icons.menu ,  color: Colors.white),),

           ],
         ),
          Row(
            children: [
              IconButton(onPressed: (){

              }, icon:  const Icon(Icons.search),),
              IconButton(onPressed: (){

              }, icon:  const Icon(Icons.notifications),)
            ],
          )

        ],
      ),
    );
  }
  topLayerWidget(){
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: MediaQuery.of(context).size.height * 0.005
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topBarWidget()
        ],
      ),
    );
  }
}
