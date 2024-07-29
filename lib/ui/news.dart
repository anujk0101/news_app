import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news_bloc.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/ui/full_news_page.dart';

class News extends StatefulWidget {
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  var tfControllerSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "News Wire",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          onEditingComplete: (){
            if(tfControllerSearch.text==''){
              context.read<NewsBloc>().add(GetNewsEvent());
            }
            else {
              String url="https://newsapi.org/v2/everything?q="+tfControllerSearch.text+"&from=2024-06-29&sortBy=publishedAt&apiKey=3758da06ab024ba091c3e4d2307c21e8";
              context.read<NewsBloc>().add(GetSearchedNewsEvent(
                  search: url));
              print("url $url");
            }
            },

          controller: tfControllerSearch,
          decoration: InputDecoration(
              hintText: "Search News..",
              suffixIcon: Icon(Icons.search,color: Colors.grey.shade300 ,),
              hintStyle: TextStyle(color: Colors.grey.shade300),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300))),
        ),
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                child: InkWell(onTap: (){
                  context.read<NewsBloc>().add(GetNewsEvent());
                },
                  child: Text(
                    "All News",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: InkWell(
                    onTap: (){
                      String url="https://newsapi.org/v2/everything?q=Cricket&from=2024-06-29&sortBy=publishedAt&apiKey=3758da06ab024ba091c3e4d2307c21e8";
                      category(searchType: url);
                    },
                    child: Text("Cricket")),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: InkWell(
                    onTap: (){
                      String url="https://newsapi.org/v2/everything?q=Business&from=2024-06-29&sortBy=publishedAt&apiKey=3758da06ab024ba091c3e4d2307c21e8";
                      category(searchType: url);
                    },
                    child: Text("Business")),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: InkWell(
                    onTap: (){
                      String url="https://newsapi.org/v2/everything?q=Investment&from=2024-06-29&sortBy=publishedAt&apiKey=3758da06ab024ba091c3e4d2307c21e8";
                      category(searchType: url);
                    },
                    child: Text("Investment")),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: InkWell(
                    onTap: (){
                      String url="https://newsapi.org/v2/everything?q=Entertainment&from=2024-06-29&sortBy=publishedAt&apiKey=3758da06ab024ba091c3e4d2307c21e8";
                      category(searchType: url);
                    },
                    child: Text("Entertainment")),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: InkWell(
                    onTap: (){
                      String url="https://newsapi.org/v2/everything?q=Entertainment&from=2024-06-29&sortBy=publishedAt&apiKey=3758da06ab024ba091c3e4d2307c21e8";
                      category(searchType: url);
                    },
                    child: Text("Companies")),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: InkWell(
                    onTap: (){
                      String url="https://newsapi.org/v2/everything?q=Technology&from=2024-06-29&sortBy=publishedAt&apiKey=3758da06ab024ba091c3e4d2307c21e8";
                      category(searchType: url);
                    },
                    child: Text("Technology")),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                child: InkWell(
                    onTap: (){
                      String url="https://newsapi.org/v2/everything?q=Cricket&from=2024-06-29&sortBy=publishedAt&apiKey=3758da06ab024ba091c3e4d2307c21e8";
                      category(searchType: url);
                    },
                    child: Text("Cricket")),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder<NewsBloc, NewsState>(builder: (_, state) {
          if (state is NewsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is NewsErrorState) {
            return Center(
              child: Text("${state.errorMsg}"),
            );
          } else if (state is NewsLoadedState) {
            var mDataModel = state.apiData;

            return Expanded(
              child: ListView.builder(
                  itemCount: mDataModel.articles!.length,
                  itemBuilder: (_, index) {
                    var paths = mDataModel.articles![index];
                    return 
                      InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>FullNewsPage(title: paths.title, content: paths.content, imgUrl: paths.urlToImage)));
                      },
                        child: Container(
                        color: Colors.grey.shade100,
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Container(
                                width: 140,
                                height: 100,
                                child: Image.network(
                                  '${paths.urlToImage}',
                                  fit: BoxFit.fill,
                                )),
                            SizedBox(
                              width: 11,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                 // paths.title!.length > 30 ? Text('${paths.title}'.substring(0, 25) + '...', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),) : Container(),
                                  Text('${paths.title}',style: TextStyle(fontWeight: FontWeight.bold,),overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 5,),
                                  Text('${paths.description}',maxLines: 2,textAlign: TextAlign.justify,),
                                  SizedBox(height: 9,),
                                  Text('${paths.publishedAt} '.split('T')[0]),
                        
                                  //Text("hello")
                                ],
                              ),
                            )
                          ],
                        ),
                                            ),
                      );

                    /*Container(
                 height: 120,
                    child: Card(
                      elevation: 10,
                      child: ListTile(
                        leading: paths.urlToImage!=null ? Image.network('${paths.urlToImage}',height: 100,width: 150,fit: BoxFit.fill,) : Text("Ni Image"),
                          title: Text('${mDataModel.articles![index].source!.name}')),
                    ),
                  );*/
                  }),
            );
          } else {
            return Container();

          }

        }),
      ],
    );
  }
  void category({required String searchType}){
    context.read<NewsBloc>().add(GetSearchedNewsEvent(search: searchType));
  }


}
