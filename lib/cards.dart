import 'package:flutter/material.dart';

class Card extends StatelessWidget {

List<Card> buildGridCards(int count) {
  List<Card> cards = List.generate(
    count,
        (int index) => Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 18.0 / 11.0,
            child: Image.asset('assets/diamond.png'),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Title'),
                SizedBox(height: 8.0),
                Text('Secondary Text'),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  return cards;
}

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: GridView.count(
        crossAxisCount: 1,
        padding: EdgeInsets.all(16.0),
    childAspectRatio: 8.0 / 9.0,
    children: buildGridCards(10),
    ),
        ),
    );
  }

}