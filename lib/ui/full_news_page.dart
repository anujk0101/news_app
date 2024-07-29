import 'package:flutter/material.dart';

class FullNewsPage extends StatelessWidget {
  String? title,content,imgUrl;
  FullNewsPage({required this.title,required this.content,required this.imgUrl});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        child: Expanded(
          child: Column(children: [
            Text('${title}',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),),
            SizedBox(height: 11,),
            Container(
              height: 200,
                width: double.infinity,
                child: Image.network(imgUrl!,fit: BoxFit.fill,)),
            SizedBox(height: 11,),
            Text('${content}',textAlign: TextAlign.justify,)
          ],),
        ),
      ),
    );
  }
}
