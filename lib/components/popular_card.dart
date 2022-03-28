import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  Categories({Key? key, required this.image, required this.name})
      : super(key: key);
  String image, name;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2.6,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.circular(40),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4.5,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.cover)),
              ),
              SizedBox(height: 10),
              Text(
                name,
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 63, 114),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
