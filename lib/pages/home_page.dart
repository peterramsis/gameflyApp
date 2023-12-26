

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gamefly/pages/Widget/scrollable_games_widget.dart';
import 'package:gamefly/utils/data/data.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(const Duration(seconds: 10), (timer) {
      if(selectedPage < games.length-1){
         selectedPage ++;
      }else{
        selectedPage=0;
      }

      _pageController.animateToPage(selectedPage, duration: const Duration(
         seconds: 10
      ), curve: Curves.bounceIn);
    });
  }

  int selectedPage = 0;

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
              controller: _pageController,
               onPageChanged: (index){
                 setState(() {
                   selectedPage = index;
                 });
               },
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
    final size = MediaQuery.of(context).size;
    return  Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.005
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topBarWidget(),
          gameInfoWidget(),
          ScrollableGamesWidget(width: size.width, height: size.height *.29 , data: games,)
        ],
      ),
    );
  }
  gameInfoWidget(){
    var size = MediaQuery.of(context).size;
    return  SizedBox(
      height: MediaQuery.of(context).size.height *.35,
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(games[selectedPage].name, maxLines: 2, style: TextStyle(
              fontSize: MediaQuery.of(context).size.height *.040,
            ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: games.map((e) {
              double doubleRadius =  size.height *.009;
              return  Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: doubleRadius *2,
                  width:doubleRadius *2 ,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: e.name == games[selectedPage].name ?Colors.green : Colors.grey
                  ),

                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
