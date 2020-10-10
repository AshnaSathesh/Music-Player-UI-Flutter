import 'package:flutter/material.dart';
import 'package:pmplayer_app/constants.dart';
import 'package:pmplayer_app/custom_widget1.dart';
import 'package:pmplayer_app/progress_widget.dart';

class DetailPage extends StatefulWidget {

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with SingleTickerProviderStateMixin{
  var _value;
  AnimationController _controller;
  var isPlay;

  @override
  void initState() {
    _value = 0.0;
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    isPlay = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back, color: AppColors.buttonColor,),
                ),
                Text('Playing Now', style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2.0,
                    fontSize: 20.0 ),),
                CustomButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.more_horiz, color: AppColors.buttonColor,),
                )
              ],
            ),
          ),
          SizedBox(height: 50.0,),
          CustomButton(
            size: MediaQuery.of(context).size.width * .7,
            image: "images/bg4.jpg",
            borderWidth: 5.0,
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailPage(),
                  )
              );
            },
          ),
          Text('Flume', style: TextStyle(color: Colors.white70, fontSize: 32.0, height: 2.0,),),
          Text('Flume - Lose It', style: TextStyle(color: Colors.white54, fontSize: 12.0,),),
          Expanded(child: SizedBox(),),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: CustomProgress(
                value: _value,
                labelStart: "3:02",
                labelEnd: "5:12",
              )),
          Expanded(child: SizedBox(),),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomButton(
                  size: 80.0,
                  borderWidth: 5,
                  onTap: () {
                    setState(() {
                      if (_value > .1){
                        _value -= .1;
                      }
                    });
                  },
                  child: Icon(Icons.fast_rewind, color: AppColors.buttonColor,),
                ),
                CustomButton(
                  size: 80.0,
                  onTap: () {
                    if(_controller.value == 0.0){
                      _controller.forward();
                      setState(() {
                        isPlay = false;
                      });
                    }else{
                      _controller.reverse();
                      setState(() {
                        isPlay = true;
                      });
                    }
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.pause_play,
                    progress: _controller,
                    color: isPlay ? Colors.redAccent : AppColors.buttonColor,
                  ),
                  isActive: isPlay,
                ),
                CustomButton(
                  size: 80.0,
                  borderWidth: 5,
                  onTap: () {
                    setState(() {
                      if(_value < .9){
                        _value += .1;
                      }
                    });
                  },
                  child: Icon(Icons.fast_forward, color: AppColors.buttonColor,),
                )
              ],
            ),
          ),
          SizedBox(height: 25.0,),
        ],
      ),
    );
  }
}
