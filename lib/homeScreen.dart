import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/itemsDetail.dart';
import 'package:food_recipe/models/recipeCategory.dart';
import 'package:food_recipe/models/recipeItems.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  var selectedItem = 0;
  var selectedPage = 0;
  List<IconData> icon = [
    Icons.home,
    Icons.bar_chart_rounded,
    Icons.favorite_border_rounded,
    Icons.person_2_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                    children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "Hello Talawish Sikandar!\n",
                            style: GoogleFonts.openSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text: 'what do you want to eat today?',
                            style: GoogleFonts.openSans(
                                fontSize: 13, color: Colors.black45))
                      ]))
                    ],
                  ),
                  Spacer(),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        backgroundImage:
                            AssetImage('assets/images/circleAvatar.jpg'),
                      ),
                      Positioned(
                        right: 1,
                        top: 1,
                        child: Container(
                          width: 9,
                          height: 9,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                            border: Border.all(color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.grey.shade200,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: GoogleFonts.openSans(
                        fontSize: 17,
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w500),
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular menus',
                      style: GoogleFonts.openSans(
                          fontSize: 19, fontWeight: FontWeight.bold)),
                  Text(
                    'See all',
                    style: GoogleFonts.openSans(
                        color: Colors.green,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      itemTypes.length,
                      (index) => Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {});
                                selectedItem = index;
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 7, vertical: 5),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                      colors: [
                                        selectedItem == index
                                            ? Colors.green.shade700
                                            : Colors.white,
                                        selectedItem == index
                                            ? Colors.greenAccent
                                            : Colors.white,
                                      ],
                                    )),
                                child: Center(
                                  child: Text(itemTypes[index],
                                      style: GoogleFonts.openSans(
                                          fontSize: 14,
                                          fontWeight: selectedItem == index
                                              ? FontWeight.bold
                                              : FontWeight.w500,
                                          color: selectedItem == index
                                              ? Colors.white
                                              : Colors.black)),
                                ),
                              ),
                            ),
                          ))),
            ),
            SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(recipeItems.length, (index) {
                  final recipe = recipeItems[index];
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(left: 20, right: 10)
                        : EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => itemDetail(recipeItems: recipe)));
                      },
                      child: Container(
                        height: 260,
                        width: MediaQuery.of(context).size.width / 2.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(recipe.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: recipe.fav ? Colors.red : Colors.black45,
                              ),
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.white70,
                                size: 16,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(11),
                                    topLeft: Radius.circular(11)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        recipe.name,
                                        maxLines: 1,
                                        style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                            height: 0),
                                      )),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star_rate_rounded,
                                            color: Colors.yellow,
                                            size: 18,
                                          ),
                                          Text(
                                            '${recipe.rate}',
                                            style: GoogleFonts.openSans(
                                                fontSize: 12,
                                                color: Colors.white,
                                                height: 0),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    '1 bowl (${recipe.weight}g)',
                                    style: GoogleFonts.openSans(
                                        fontSize: 11,
                                        color: Colors.white70,
                                        height: 0),
                                  ),
                                  Text(
                                    '${recipe.calorie} kCal | 25% APK',
                                    style: GoogleFonts.openSans(
                                        color: Colors.white70,
                                        height: 0,
                                        fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',
                      style: GoogleFonts.openSans(
                          fontSize: 19, fontWeight: FontWeight.bold)),
                  Text(
                    'See all',
                    style: GoogleFonts.openSans(
                        color: Colors.green,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(recipeCategory.length, (index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(left: 20, right: 20)
                        : EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: recipeCategory[index].color,
                            child: Image.asset(
                              recipeCategory[index].image,
                              height: 40,
                              width: 40,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${recipeCategory[index].name}',
                            style: GoogleFonts.openSans(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/profilee.webp')),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Min Ci Hao',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Expert Chef',
                          style: GoogleFonts.openSans(
                              color: Colors.grey, fontSize: 11, height: 0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
                    ],
                  ),
          )),
      bottomSheet: Container(
        height: 75,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.black45, spreadRadius: 1),
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icon.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {});
                selectedPage = index;
              },
              child: SizedBox(
                height: 40,
                width: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon[index],
                      color: selectedPage == index ? Colors.green : Colors.grey,
                      size: 28,
                    ),
                    selectedPage == index
                        ? Container(
                            height: 3,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(21),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
