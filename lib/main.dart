import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/splash.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
      final app = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  splashScreen(),
    );
      return kIsWeb ? Center(child: SizedBox(width: 390,child: app,),):app;
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white,
          child: Column(
             children: [
               Container(
                 width: double.infinity,
                  height: size.height * 0.68,
                 decoration: BoxDecoration(
                   gradient: LinearGradient(
                     begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                       colors: [
                         Colors.grey.shade400,
                         Colors.grey.shade200,
                         Colors.white,
                       ]
                   )
                 ),
                 child: Image.asset('assets/images/background.png',fit: BoxFit.cover,),
               ),
               const SizedBox(height: 20,),
               SizedBox(
                 width: size.width,
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 18),
                   child: Column(
                     children: [
                       Text("Let's cook your own food and adjust your diet",
                         textAlign: TextAlign.center,
                         style: GoogleFonts.montserrat(
                           fontSize: kIsWeb?20:25,
                           color: Colors.black,
                           fontWeight: FontWeight.w700,
                           height: 1.3,
                         ),
                       ),
                       SizedBox(height: 13,),
                       Text("Don't be confused. Complete your nutritional needs by choosing food here",
                       textAlign: TextAlign.center,
                         style: GoogleFonts.openSans(
                           fontSize: kIsWeb?13:16,
                           color: Colors.grey.shade600,
                           height: 1.3
                         ),
                       ),
                       SizedBox(height: 25,),
                       GestureDetector(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                         },
                         child: Container(
                           height: 49,
                           width: double.infinity,
                           child: Center(child: Text('Get Started',style: GoogleFonts.openSans(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)
                         ),
                           decoration: BoxDecoration(
                             gradient: LinearGradient(colors: [Colors.green,Colors.greenAccent]),
                             borderRadius: BorderRadius.circular(12),
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
               )
             ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
