// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_app/views/detail/sed_detail.dart';
import 'package:hackathon_app/views/detail/suv_category.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../components/offer_card.dart';
import '../../components/popular_card.dart';
import '../../model/usermodel.dart';
import '../../services/api_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var _currentIndex = 0;
  final PageController _pageController = PageController();

  int selected = 0;

  List catName = ['Sedan', 'SUV'];
  submitForm() async {
    ApiService _apiService = ApiService();
    List<Users> eachposts = await _apiService.fetchUsers();
    return eachposts;
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 2; i++) {
      list.add(i == selected ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        child: Column(children: [
          DrawerHeader(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Spacer(),
                  Text(
                    'Hyder Ali',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 63, 114), fontSize: 30),
                  ),
                  Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2020/02/03/10/02/sports-car-4815234_960_720.jpg'),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ],
          )),
          drawerBody('Privacy', Icons.lock),
          drawerBody('Payment', Icons.payment_rounded),
          drawerBody('Help Center', Icons.help_rounded),
          drawerBody('Invite Freinds', Icons.email_outlined),
          drawerBody('Notification', CupertinoIcons.bell),
          drawerBody('Setting', Icons.settings),
          drawerBody('Rate us', Icons.star),
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 1.6,
                width: double.infinity,
                child: FutureBuilder(
                    future: submitForm(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return PageView.builder(
                            controller: _pageController,
                            onPageChanged: (int page) {
                              setState(
                                () {
                                  selected = page;
                                },
                              );
                            },
                            itemCount: 2,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(40),
                                    bottomRight: Radius.circular(40),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${snapshot.data![index].image}'),
                                      fit: BoxFit.cover),
                                ),
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    })),
            Container(
              padding: const EdgeInsets.only(top: 50, left: 30, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Hi, Hyder!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(CupertinoIcons.bell_fill,
                                  color: Colors.white, size: 30),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://github.com/Abdulla-Khan/Social-App/blob/main/asset/user.jpg?raw=true'),
                                        fit: BoxFit.cover)),
                              ),
                            ],
                          ),
                        ]),
                    SizedBox(height: 30),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.green.shade200,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Find Your Ride',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 170),
                    const Text(
                      'Makes Renting\nEasy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 30,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                'View More',
                                style: TextStyle(color: Colors.black),
                              )),
                          Row(children: _buildPageIndicator())
                        ])
                  ]),
            )
          ]),
          SizedBox(height: 20),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      color: Colors.green.shade400,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: submitForm(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: [
                          InkWell(
                            onTap: () => Get.to(SedanCat(
                              catList: [
                                snapshot.data[0].image,
                                snapshot.data[1].image,
                              ],
                              catName: [
                                snapshot.data[0].title,
                                snapshot.data[1].title,
                              ],
                            )),
                            child: Categories(
                                name: catName[0],
                                image: '${snapshot.data[3].image}'),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () => Get.to(SUVCat(
                              catList: [
                                snapshot.data[2].image,
                                snapshot.data[3].image,
                              ],
                              catName: [
                                snapshot.data[2].title,
                                snapshot.data[3].title,
                              ],
                              rent: [
                                snapshot.data[2].rent,
                                snapshot.data[3].rent,
                              ],
                            )),
                            child: Categories(
                                name: '${snapshot.data![2].title}',
                                image: '${snapshot.data![2].image}'),
                          ),
                        ],
                      ));
                } else {
                  return CircularProgressIndicator();
                }
              }),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Popular Rides',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
              future: submitForm(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 10),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data.length - 1,
                        itemBuilder: (context, index) {
                          return OfferCard(
                              name: '${snapshot.data![index + 1].title}',
                              image: '${snapshot.data[index + 1].image}',
                              rent: snapshot.data[index + 1].rent);
                        }),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ]),
      ),
      bottomNavigationBar: SalomonBottomBar(
        selectedItemColor: Color.fromARGB(255, 0, 63, 114),
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home')),
          SalomonBottomBarItem(
              icon: Icon(Icons.location_pin), title: Text('Explore')),
          SalomonBottomBarItem(
              icon: Icon(Icons.person), title: Text('Account')),
          SalomonBottomBarItem(
              icon: Icon(Icons.messenger_outline_sharp), title: Text('Message'))
        ],
      ),
    );
  }

  Widget drawerBody(String title, IconData icon) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}

Widget _indicator(bool isActive) {
  return SizedBox(
    height: 10,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 10 : 8.0,
      width: isActive ? 12 : 8.0,
      decoration: BoxDecoration(
        boxShadow: [
          isActive
              ? BoxShadow(
                  color: Colors.amber.withOpacity(0.72),
                  blurRadius: 4.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    0.0,
                    0.0,
                  ),
                )
              : BoxShadow(
                  color: Colors.transparent,
                )
        ],
        shape: BoxShape.circle,
        color: isActive ? Colors.amber : Colors.white,
      ),
    ),
  );
}
