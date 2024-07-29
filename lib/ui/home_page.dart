
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news.dart';


class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color bottomSelectItemClr=Colors.blueAccent.withOpacity(0.8);

  int currentIndex=0;
  List<Widget> bottomNavigatorPage=[
    SafeArea(child: News()),
    News(),
    News(),
    News(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeIndexvalue(index: 0);
  }
  changeIndexvalue({required int index})
  {
    currentIndex=index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 15),
        child: bottomNavigatorPage[currentIndex],
      )),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            border: Border(top: BorderSide(color: Colors.grey.shade300))
        ),
        padding: EdgeInsets.only(top: 10.0,bottom: 10,left: 20,right: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(child: currentIndex ==0 ? Icon(Icons.home, color: bottomSelectItemClr,size: 35,) : Icon(Icons.home, color: Colors.grey,),
              onTap: ()
              {
                changeIndexvalue(index: 0);
              },),
            InkWell(child: currentIndex ==1 ? Icon(Icons.trending_up, color: bottomSelectItemClr,size: 35,) : Icon(Icons.trending_up, color: Colors.grey,),
                onTap: (){
                  changeIndexvalue(index: 1);
                }),
            InkWell(child: currentIndex ==2 ? Icon(Icons.workspace_premium, color: bottomSelectItemClr,size: 35,) : Icon(Icons.workspace_premium, color: Colors.grey,),
                onTap: (){
                  changeIndexvalue(index: 2);
                }),
            InkWell(child: currentIndex ==3 ? Icon(Icons.account_circle, color: bottomSelectItemClr,size: 35,) : Icon(Icons.account_circle, color: Colors.grey,),
                onTap: (){
                  changeIndexvalue(index: 3);

                }),

            //REPLACE WITH ICON
          ],
        ),
      ),


      /* NavigationBar(
        destinations: [
        NavigationDestination(icon: Image.asset("asset/icon/home_bottom_navigator.png",width: 30,), label: ''),
        NavigationDestination(icon: Icon(Icons.bar_chart,), label: '', ),
        Container(
            //margin: EdgeInsets.only(top: 15,right: 10,left: 10,bottom: 30),
            color: Color.fromARGB(255, 231, 138, 188),
            child: NavigationDestination(icon: Icon(Icons.add,size: 40,color: Colors.white,), label: '' )),
        NavigationDestination(icon: Icon(Icons.notifications), label: '', ),
        NavigationDestination(icon: Icon(Icons.account_circle), label: ''),
      ],

      ),*/
    );
  }
}
