import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fkuttertube/models/videos.dart';
import 'dart:async';

import 'package:rxdart/rxdart.dart';

class FavoriteBloc implements BlocBase {

  Map<String, Video> _favorites = {};

  final _favController = BehaviorSubject<Map<String, Video>>(seedValue: {});
  Stream<Map<String, Video>> get outFav => _favController.stream;

  void toggleFavorite(Video video){
    if(_favorites.containsKey(video.id)) _favorites.remove(video.id);
    else{
      _favorites[video.id] = video;
    }

    _favController.sink.add(_favorites);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _favController.close();
  }

}