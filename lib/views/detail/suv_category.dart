import 'package:flutter/material.dart';
import 'package:hackathon_app/components/offer_card.dart';

class SUVCat extends StatelessWidget {
  SUVCat(
      {Key? key,
      required this.catList,
      required this.rent,
      required this.catName})
      : super(key: key);

  List catList;
  List catName;
  List rent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(width: 10),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: catList.length,
              itemBuilder: (context, index) {
                return OfferCard(
                    image: catList[index],
                    name: catName[index],
                    rent: rent[index]);
              }),
        ),
      ),
    );
  }
}
