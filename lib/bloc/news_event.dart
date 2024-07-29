import 'package:flutter/foundation.dart';

abstract class NewsEvent{}

class GetNewsEvent extends NewsEvent{}

class GetSearchedNewsEvent extends NewsEvent{
  String? search;
  GetSearchedNewsEvent({required this.search});
}