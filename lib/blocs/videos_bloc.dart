import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fkuttertube/api.dart';
import 'package:fkuttertube/models/videos.dart';
import 'dart:async';

class VideosBloc implements BlocBase{

  Api api;

  List<Video> videos;

  final StreamController<List<Video>> _videosController = StreamController<List<Video>>();
  Stream get outVideos => _videosController.stream;

  final StreamController<String> _searchController = StreamController<String>();
  Sink get inSearch => _searchController.sink;


  VideosBloc(){
    api = Api();

    _searchController.stream.listen(_search);
  }

  void _search(String search) async {

    videos = await api.search(search);
    _videosController.sink.add(videos);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    _videosController.close();
    _searchController.close();
  }

}