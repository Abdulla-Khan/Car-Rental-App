// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/components/google_map.dart';

class DetailView extends StatefulWidget {
  DetailView(
      {Key? key, required this.img, required this.name, required this.rent})
      : super(key: key);

  String img, name, rent;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                image: DecorationImage(
                    image: NetworkImage(widget.img), fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height / 4,
              width: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Name:  ${widget.name}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w800),
                  ),
                  Text(
                    'Rent: ${widget.rent}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Center(
                    child: InkWell(
                      onTap: () {
                        Get.to(LocationTracking());
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height * 0.05,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(88, 0, 25, 54),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(88, 0, 25, 54)
                                      .withOpacity(0.2),
                                  blurStyle: BlurStyle.inner,
                                  blurRadius: 1,
                                  spreadRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: Text(
                          'Book Now',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
