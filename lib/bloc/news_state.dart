import 'package:news_app/model/news_model.dart';

abstract class NewsState{}

class NewsInitialState extends NewsState{}
class NewsLoadingState extends NewsState{}
class NewsLoadedState extends NewsState{
  NewsModel apiData;
  NewsLoadedState({required this.apiData});
}
class NewsErrorState extends NewsState{
  String errorMsg;
  NewsErrorState({required this.errorMsg});
}