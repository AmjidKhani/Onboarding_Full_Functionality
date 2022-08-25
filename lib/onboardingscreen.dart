import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'HomePage.dart';

class onboardingscreen extends StatefulWidget {
  const onboardingscreen({Key? key}) : super(key: key);

  @override
  State<onboardingscreen> createState() => _onboardingscreenState();
}

class _onboardingscreenState extends State<onboardingscreen> {
  final controller=PageController();
  bool isLastPage=false;
List Images=[
  "illustration.png",
  "illustration2.png",
  "illustration3.png",
];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    body:
      Container(
      padding: EdgeInsets.only(bottom: 60),
      child: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() =>
          isLastPage = index == 2

          );
        },
        children:List.generate(3, (index) => Container(
            child:
            Container(
              margin: EdgeInsets.only(top: 90),
              child: Column(
                children: [
                  Image.asset("assets/"+Images[index],
                    fit: BoxFit.cover,width: double.infinity,),
                  SizedBox(height: 20,),
                  Text("Stay Safe ",style: TextStyle(
                      color: Colors.teal.shade700,
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                  ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Stay-at-home directives are issued to protect you, your family, and the public at large. Do your part by staying home. Now is not the time for a play date for kids, not the time for a dinner for adults, and not the time for a personal visit to the elderly. Spring break plans should be cancelled, birthday parties should be postponed, extended family dinners should be suspended. If the NBA can cancel their basketball games, you can cancel your in-person social calendar. ",
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                    ),
                  )
                ],
              ),
            )
        )
        ),


      ),
      ),
      bottomSheet: isLastPage?
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                ),
                primary: Colors.white,
                backgroundColor: Colors.teal.shade700,
                maximumSize: Size.fromHeight(

                800),
              ),
              onPressed: ()async{
                final prefs=await SharedPreferences.getInstance();
                prefs.setBool("showHome", true);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=>HomePage()));
              }, child: Text("Get Strated")),
          ):
      Container(
        padding: EdgeInsets.symmetric(horizontal:10 ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: (){
controller.jumpToPage(2);
                },
                child: Text("Skip")),

            SmoothPageIndicator(
                controller: controller,
                count: 3,
              effect: WormEffect(
                spacing: 16,
                dotColor: Colors.black26,
                activeDotColor: Colors.teal.shade700
              ),
              onDotClicked: (index){
                  controller.animateToPage(
                      index,
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeIn);
              },

            ),


            TextButton(
                onPressed: (){
controller.nextPage(
    duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                },
                child: Text("Next")),
          ],
        ),
      ),
    );
  }



}
