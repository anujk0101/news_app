
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/urls.dart';
import 'package:news_app/bloc/news_event.dart';
import 'package:news_app/bloc/news_state.dart';
import 'package:news_app/model/news_model.dart';

import '../api/api_helper.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState>{
  ApiHelper apiHelper;
  NewsBloc({required this.apiHelper}) : super(NewsInitialState()){

    on<GetNewsEvent>((event, emit) async{
      emit(NewsLoadingState());

      var resJson=await apiHelper.getAPI(url: Urls.getNewsUrl);

      if(resJson!=null){
        var mResData=NewsModel.fromJson(resJson);
        emit(NewsLoadedState(apiData: mResData));
      }
      else{
        emit(NewsErrorState(errorMsg: "Error detected!!"));
      }
    });

    on<GetSearchedNewsEvent>((event,emit) async{
      emit(NewsLoadingState());
      var resJson=await apiHelper.getAPI(url: event.search.toString());
      if(resJson!=null){
        var mResData=NewsModel.fromJson(resJson);
        emit(NewsLoadedState(apiData: mResData));
      }
      else{
        emit(NewsErrorState(errorMsg: "Error detected!!"));
      }
    });

  }
 }