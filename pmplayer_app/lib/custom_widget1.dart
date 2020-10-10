import 'package:flutter/material.dart';
import 'package:pmplayer_app/constants.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final double size;
  final double borderWidth;
  final String image;
  final bool isActive;
  final VoidCallback onTap;
  CustomButton({ this.child,this.size = 50.0, this.borderWidth = 2, this.image, this.isActive =false,@required this.onTap});
  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(200.0)),
        border: Border.all(
          width: borderWidth,
          color: isActive ? Colors.black54 : Colors.blueGrey[700],
        ),
        boxShadow: [

          BoxShadow(
            color: Colors.blueGrey[700],
            blurRadius: 18.0,
            offset: Offset(-5,-5),
            spreadRadius: 3.0,
          ),
          BoxShadow(
            color: Colors.black38,
            blurRadius: 18.0,
            offset: Offset(5,5),
            spreadRadius: 3.0,
          ),

        ],

    );
    if (image!= null){
      boxDecoration= boxDecoration.copyWith(
        image: DecorationImage(
          image: ExactAssetImage(image),
          fit: BoxFit.cover,
        )
      );
    }

    if(isActive){
      boxDecoration = boxDecoration.copyWith(
          gradient: RadialGradient(
              colors: [
                Colors.white24,
                Colors.white54,
              ]
          )
      );
    }else{
      boxDecoration = boxDecoration.copyWith(
          gradient: RadialGradient(
              colors: [
                AppColors.mainColor,
                AppColors.mainColor,
                AppColors.mainColor,
                Colors.blueGrey[800],
              ]
          )
      );
    }
    return Container(
      width: size,
      height: size,
      decoration: boxDecoration,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(200)),
        ),
        child: child ?? Container(),),
    );
  }
}

