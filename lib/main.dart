import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool valuefirst = false;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final List<IconData> iconslist = [
    FontAwesomeIcons.gift,
    FontAwesomeIcons.shirt,
    FontAwesomeIcons.bagShopping,
    FontAwesomeIcons.glasses,
    FontAwesomeIcons.bagShopping,
    FontAwesomeIcons.wallet,
    FontAwesomeIcons.hatCowboy,
  ];

  final List<String> imagelist = [
    'assets/images/watchone.png',
    'assets/images/watchtwo.png',
    'assets/images/watchthree.png',
    'assets/images/watchfour.png',
    'assets/images/watchone.png',
    'assets/images/watchtwo.png',
    'assets/images/watchthree.png',
    'assets/images/watchfour.png',
  ];

  final List<String> namelist = [
    'Redmi Note 9',
    'Apple Watch 6',
    'Digital Dial Watch',
    'Fitness Band',
    'Redmi Note 9',
    'Apple Watch 6',
    'Digital Dial Watch',
    'Fitness Band',
  ];

  final List<Color> colors = [
    Color(0xffF17547),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    children: [
                      Container(
                          width: 41,
                          height: 41,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              color: Color(0xffD9D9D9)),
                          child: Icon(Icons.menu, size: 22)),
                      Spacer(),
                      Container(
                          width: 41,
                          height: 41,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              color: Color(0xffD9D9D9)),
                          child: Icon(
                            Icons.search,
                            size: 22,
                          )),
                    ],
                  ),
                  Container(height: 27),
                  Row(
                    children: [
                      Text('Hello Sumair',
                          style: (TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold))),
                      Container(width: 10),
                      Icon(Icons.waving_hand_rounded, color: Color(0xffF17547)),
                    ],
                  ),
                  Container(height: 7),
                  Text('Let\'s Start Shopping',
                      style:
                          TextStyle(color: Color.fromARGB(255, 107, 107, 107))),
                  Container(height: 20),
                  salerow(),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Top Categories',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      InkWell(
                        child: Text('See All',
                            style: TextStyle(
                              color: Color(0xffF17547),
                              fontSize: 22,
                            )),
                        onTap: () {},
                      ),
                    ],
                  ),
                  Container(height: 20),
                  Container(
                    height: 75,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: iconslist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 17.0),
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                color: Color(0xffF2F2F2),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Color.fromARGB(255, 230, 230, 230),
                                    width: 2)),
                            child: Center(
                              child: FaIcon(
                                iconslist[index],
                                size: 30.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.78,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Stack(alignment: Alignment.center, children: [
                      Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF2F2F2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 35,
                                      child: Center(
                                        child: Text('50% OFF',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12)),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                    ),
                                    Spacer(),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      child: Center(
                                        child: FaIcon(FontAwesomeIcons.heart,
                                            size: 20),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(35)),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Text(namelist[index],
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.75),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                Row(
                                  children: [
                                    Text('\$129',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    Spacer(),
                                    Text('\$260',
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            decoration:
                                                TextDecoration.lineThrough)),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Container(
                          width: double.infinity,
                          height: 90,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(imagelist[index]),
                            fit: BoxFit.fitHeight,
                          ))),
                    ]);
                  },
                  childCount: imagelist.length,
                ),
              ),
            ),
          ],
        ));
  }
}

class salerow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
              width: 285,
              height: 143,
              decoration: BoxDecoration(
                  color: Color(0xffF17547),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 42,
                          child: Text('20% OFF DURING THIS SUMMER',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          height: 13,
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size(120, 34),
                              side: BorderSide.none,
                            ),
                            child: Text('Get Now',
                                style: TextStyle(
                                    color: Color(0xffF17547), fontSize: 16))),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: 200.0,
                        height: 230.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/handbag.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            width: 20,
          ),
          Container(
              width: 285,
              height: 143,
              decoration: BoxDecoration(
                  color: Color(0xff1383F1),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 42,
                          child: Text('50% OFF ON ALL ITEMS',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          height: 13,
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size(120, 34),
                              side: BorderSide.none,
                            ),
                            child: Text('Get Now',
                                style: TextStyle(
                                    color: Color(0xff1383F1), fontSize: 16))),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: 200.0,
                        height: 230.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/handbag.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            width: 20,
          ),
          Container(
              width: 285,
              height: 143,
              decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 42,
                          child: Text('ENJOY THE SALE ON CLOTHING',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          height: 13,
                        ),
                        OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: Size(120, 34),
                              side: BorderSide.none,
                            ),
                            child: Text('Get Now',
                                style: TextStyle(
                                    color: Colors.pinkAccent, fontSize: 16))),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        width: 200.0,
                        height: 230.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/handbag.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
    throw UnimplementedError();
  }
}
