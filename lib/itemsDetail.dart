import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/models/ingredients.dart';
import 'package:food_recipe/models/recipeItems.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class itemDetail extends StatefulWidget{
  final RecipeItems recipeItems;
  const itemDetail({super.key, required this.recipeItems});

  @override
  State<StatefulWidget> createState() => _itemDetail();

}

class _itemDetail extends State<itemDetail> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Container(
              height: size.height *0.55,
              width: size.width,
              // child: Image.asset(widget.recipeItems.image),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.recipeItems.image),fit: BoxFit.cover)
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              child: CircleAvatar(
                backgroundColor: Colors.black45,
                child: InkWell(
                  onTap: ()=> Navigator.pop(context),
                    child: Icon(Icons.arrow_back,size: 18,color: Colors.white,)
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(26),
                height: size.height * 0.5,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(60))
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage(widget.recipeItems.woner),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${widget.recipeItems.wonerName}',
                                style: GoogleFonts.openSans(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 0
                                ),
                              ),
                              Text('12 Recipes Shared',
                                  style: GoogleFonts.openSans(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 11,
                                    height: 0,
                                  ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text('${widget.recipeItems.rate}',style:GoogleFonts.openSans(fontSize: 14,color: Colors.black,fontWeight: FontWeight.w700),),
                                RatingBar.builder(
                                    itemSize: 16,
                                    initialRating: widget.recipeItems.rate,
                                    unratedColor: Colors.grey,
                                    itemBuilder: (context , index) {
                                  return Icon(Icons.star_rate_rounded,color: Colors.amberAccent,);
                                }, onRatingUpdate: (value) {} )
                              ],
                            ),
                            Text('${widget.recipeItems.reviews} Reviews',
                             style: GoogleFonts.openSans(fontSize: 11,color: Colors.black.withOpacity(0.6)),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.recipeItems.name,style: GoogleFonts.openSans(
                              fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black
                             ),
                            ),
                            SizedBox(height: 0,),
                            Text('1 Bowl (${widget.recipeItems.weight})g',style: GoogleFonts.openSans(
                                fontSize: 13,color: Colors.grey
                            ),
                            )
                          ],
                        ),
                        Spacer(),
                        Text('See details'
                            ,style: GoogleFonts.openSans(fontSize: 13 ,color: Colors.green,fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyProgressIndicatorValue(name: 'Carbs', amount: '${widget.recipeItems.fat}g', percentage: '(56%)', color: Colors.green, data: 0.4),
                        MyProgressIndicatorValue(name: 'Fat', amount: '${widget.recipeItems.fat}g', percentage: '(72%)', color: Colors.red, data: 0.6),
                        MyProgressIndicatorValue(name: 'Protein', amount: '${widget.recipeItems.fat}g', percentage: '(8%)', color: Colors.orange, data: 0.2),
                        MyProgressIndicatorValue(name: 'Calories', amount: '${widget.recipeItems.fat}kkal', percentage: '', color: Colors.green, data: 0.7),
                      ],
                    ),
                    SizedBox(height: 25,),
                    Row(
                      children: [
                        Text('Ingredients',
                          style: GoogleFonts.openSans(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.black),
                        ),
                        Spacer(),
                        Text('See details'
                          ,style: GoogleFonts.openSans(fontSize: 13 ,color: Colors.green,fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SingleChildScrollView(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:List.generate(ingredients.length, (index) {
                          return Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                child: Image.asset(ingredients[index].image,height: 40,width: 40,),
                                backgroundColor: ingredients[index].color,
                              ),
                              SizedBox(height: 8,),
                              Text('${ingredients[index].name}',
                                style: GoogleFonts.openSans(fontSize:12,fontWeight: FontWeight.w400,color: Colors.black),
                              )
                            ],
                          );
                        })
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.48,
                right: 30,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.recipeItems.fav ? Colors.red : Colors.grey,
                    boxShadow: const [
                      BoxShadow(
                        spreadRadius: 5,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  child: Icon(Icons.favorite_border,color: Colors.white,),
                )
            ),
          ],
        ),
      ),
    );
  }
}



class MyProgressIndicatorValue extends StatelessWidget {
  final String? name, amount;
  final String percentage;
  final Color color;
  final double data;
  const MyProgressIndicatorValue({
    super.key,
    required this.name,
    required this.amount,
    required this.percentage,
    required this.color,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 20,
      circularStrokeCap: CircularStrokeCap.round,
      percent: data,
      lineWidth: 7,
      reverse: true,
      backgroundColor: color.withOpacity(0.2),
      animation: true,
      animationDuration: 500,
      restartAnimation: true,
      progressColor: color,
      header: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          name!,
          style: TextStyle(
            color: Colors.black.withOpacity(0.6),
            fontSize: 12,
          ),
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '$amount ',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              TextSpan(
                text: percentage,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

