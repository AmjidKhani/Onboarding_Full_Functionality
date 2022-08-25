import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class buildwidget extends StatelessWidget {
  Color color;
  String title;
  String subTitle;
  String ImageUrl;
  buildwidget({required this.ImageUrl,required this.title, required this.subTitle,required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
child:
Column(
  children: [
    Image.asset(ImageUrl,
    fit: BoxFit.cover,width: double.infinity,),
    Text(title,style: TextStyle(
      color: Colors.teal.shade700,
      fontSize: 32,
      fontWeight: FontWeight.bold
    ),
    ),
    Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        subTitle,
        style: TextStyle(
          color: color,
        ),
      ),
    )
  ],
)
    );
  }
}
