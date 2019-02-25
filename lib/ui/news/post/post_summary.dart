import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'package:myisuct/model/news/post.dart';

class PostSummary extends StatelessWidget {

  final Post post;

  PostSummary(this.post);

  @override
  Widget build(BuildContext context) {

    Widget imageSection = new Container(
      child: Image.network('${post.imageLink}', 
        scale: 0.1
      ),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      margin: EdgeInsets.all(0),      
    );    
    

    Widget titleSection = Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      alignment: Alignment.centerLeft,
      child: Column(
        children: <Widget>[
          Text(
          '${post.title}', 
          style: Theme.of(context).textTheme.subtitle,  
          ),
        ]
      ),
    );
    
    Widget bottomSection = Container(
      padding: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: new Row(
        children: <Widget>[
          Icon(Icons.arrow_forward),
          new Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.0, vertical: 10.0),
            child: new Text('Подробнее',
              style: TextStyle(fontSize: 17.0),
            )
          )
        ]
      )
    );

    return new Card(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),
      child: new InkWell(
        onTap: () {  
          Navigator.push(
            context,MaterialPageRoute(builder: (context) => DetailPage(post)),
          );
        },
        child: new Column(
          children: <Widget>[
            imageSection,
            titleSection,
            bottomSection,
          ],
        )
      )
    );
  }
}