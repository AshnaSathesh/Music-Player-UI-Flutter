import 'package:flutter/material.dart';
import 'package:pmplayer_app/constants.dart';
import 'package:pmplayer_app/custom_widget1.dart';

class CustomProgress extends StatefulWidget {
  final double value;
  final String labelStart;
  final String labelEnd;

  CustomProgress({this.value,this.labelStart,this.labelEnd});
  @override
  _CustomProgressState createState() => _CustomProgressState();
}

class _CustomProgressState extends State<CustomProgress> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: 50.0,
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.labelStart,style: TextStyle(color: AppColors.buttonColor),),
                Text(widget.labelEnd,style: TextStyle(color: AppColors.buttonColor),),
              ],
            ),
          ),
          mainProgress(width),
          progressValue(width * widget.value),
          indicator(width * widget.value <30 ? 30 : width * widget.value),
        ],
      ),
    );
  }

  Widget indicator(double width) {
    return Container(
          height: 40.0,
          width: width,
          child: Row(
            children: <Widget>[
              Expanded(child: SizedBox(),),
              CustomButton(
                size: 30.0,
                onTap: null,
                child: Icon(Icons.fiber_manual_record,size: 20.0,color: Colors.redAccent,),
              ),
            ],
          ),
        );
  }

  Widget progressValue(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
            height: 5.0,
            width: width,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              border: Border.all(
                color: AppColors.buttonColor.withAlpha(90),
                width: 0.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
            ),
          ),
    );
  }

  Widget mainProgress(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
            height: 5.0,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              border: Border.all(
                color: AppColors.buttonColor.withAlpha(90),
                width: 0.5,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.buttonColor.withAlpha(90),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1,-1),
                )
              ]            ),
          ),
    );
  }
}
