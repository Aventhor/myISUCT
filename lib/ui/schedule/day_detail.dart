import 'package:flutter/material.dart';
import 'package:myisuct/model/schedule/schedule.dart';

class DayDetail extends StatelessWidget {

  List<Lesson> lesson;
  DayDetail(this.lesson);

  @override 
  Widget build(BuildContext context) {
    Widget upperSection = new Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 150.0,
            child: new Center(
              child: Text(
              'Пятница',
              style: Theme.of(context).textTheme.title,
              ),
            ),
          )
        ],
      ),
    );

  // Widget item = new Padding(
  //   padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
  //   child: Row(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         SizedBox(
  //           width: 50,
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(vertical: 7.0),
  //             child: Center(
  //               child: Text(
  //                 lesson.time
  //               ),
  //             )
  //           )
  //         ),
  //         SizedBox(
  //           width: 200,
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(vertical: 7.0),
  //             child: Center(
  //               child: Text(
  //                 lesson.name
  //               ),
  //             )
  //           )
  //         ),
  //         SizedBox(
  //           width: 50,
  //           child: Padding(
  //             padding: EdgeInsets.symmetric(vertical: 7.0),
  //             child: Center(
  //               child: Text(
  //                 lesson.room
  //               ),
  //             )
  //           )
  //         ),
  //       ],
  //     )
  //   );

    Widget middleSection = Container(
      child: Card (
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: <Widget>[
            Container(    
              child: ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, index) => new ItemBuilder(lesson[index].time, lesson[index].name, lesson[index].room),
                itemCount: lesson.length,       
              ),
            ),
          ],
        )
      ),
    );

    return new Container(
      child: Column(
        children: <Widget>[
          upperSection,
          middleSection,
        ],
      )
    );
  }
}

class Line extends StatelessWidget {

  Widget build(BuildContext context) {
    return new Container(
      height: 1.0,
      margin: EdgeInsets.symmetric(horizontal: 22.0),
      color: Colors.black12
    );
  }
}

class ItemBuilder extends StatelessWidget {

  final String time;
  final String name;
  final String room;
  ItemBuilder(this.time, this.name, this.room);

  @override
  Widget build(BuildContext context) {
    return new Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0),
              child: Center(
                child: Text(
                  time
                ),
              )
            )
          ),
          SizedBox(
            width: 240,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0),
              child: Center(
                child: Text(
                  name
                ),
              )
            )
          ),
          SizedBox(
            width: 50,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 7.0),
              child: Center(
                child: Text(
                  room
                ),
              )
            )
          ),
        ],
      ),
    );
  }
}