import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pmplayer_app/custom_widget1.dart';
import 'package:pmplayer_app/constants.dart';
import 'package:pmplayer_app/music_model.dart';
import 'package:pmplayer_app/detailed_page.dart';
void main() {
  runApp(MaterialApp(
    home: ListPage(),
  ));
}

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<MusicModel> _list;
  int _playId;

  @override
  void initState() {
    // TODO: implement initState
    _list = MusicModel.list;
    _playId = 3;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar:AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: Text('Music List'),
        ),

      body: Stack(
        children: <Widget> [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomButton(
                      child: Icon(Icons.favorite, color: Colors.white38,),
                      onTap: () {},
                    ),
                    CustomButton(
                      size: 175.0,
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
                    CustomButton(
                      child: Icon(Icons.more_horiz, color: Colors.white38,),
                      onTap: () {},
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _list.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => DetailPage(),
                              )
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            color: _list[index].id == _playId ?
                                Colors.black12 : AppColors.mainColor,
                          ),
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _list[index].title,
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    _list[index].album,
                                    style: TextStyle(
                                      color: Colors.white54,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                              CustomButton(
                                child: Icon(
                                  _list[index].id == _playId ? Icons.pause : Icons.play_arrow,
                                  color: _list[index].id == _playId ? Colors.black54 : AppColors.buttonColor,
                                ),
                                isActive: _list[index].id == _playId,
                                onTap: () {
                                  setState(() {
                                    _playId = _list[index].id;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );              }
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 75.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mainColor.withAlpha(0),
                    AppColors.mainColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
