import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fkuttertube/models/videos.dart';
import 'dart:async';

class FavoriteBloc implements BlocBase {

  Map<String, Video> _favorites = {};

  final StreamController<Map<String, Video>> _favController = StreamController<Map<String, Video>>.broadcast();
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