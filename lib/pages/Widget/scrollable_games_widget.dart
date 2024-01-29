

import 'package:flutter/material.dart';
import 'package:gamefly/utils/data/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  const ScrollableGamesWidget({super.key , this.data , required this.width,required this.height , this.showTitle = true});
  final dynamic data;
  final double width;
  final double height;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context , index){
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * .30,
                height: height * .75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image:NetworkImage(data[index].image),
                    fit: BoxFit.cover
                  ),
                ),
              ),
            ),
            showTitle == true ? SizedBox(
              width: 140,
              child: Text(games[index].name,  maxLines: 3 , style: TextStyle(
                  fontSize: height *.065
              )),
            ) : const SizedBox(),
          ],
        );
      } , itemCount: data.length,),
    );
  }
}
