// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/views/detail/car_detail.dart';

class OfferCard extends StatelessWidget {
  OfferCard(
      {Key? key, required this.image, required this.name, required this.rent})
      : super(key: key);
  String image, name, rent;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 1,
          spreadRadius: 1,
        ),
      ], borderRadius: BorderRadius.circular(40), color: Colors.white),
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width / 2.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3.9,
                    width: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(
                            image,
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.green.shade400,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                rent,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 18),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, left: 40),
                child: TextButton(
                  onPressed: () {
                    Get.to(DetailView(
                      img: image,
                      rent: rent,
                      name: name,
                    ));
                  },
                  child: Text('Know more >>',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
