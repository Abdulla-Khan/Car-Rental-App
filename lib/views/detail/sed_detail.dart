import 'package:flutter/material.dart';

import '../../components/popular_card.dart';

class SedanCat extends StatelessWidget {
  SedanCat({
    Key? key,
    required this.catList,
    required this.catName,
  }) : super(key: key);
  List catList;
  List catName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: catList.length,
            itemBuilder: (context, index) {
              return Categories(name: catName[index], image: catList[index]);
            }),
      ),
    );
  }
}
