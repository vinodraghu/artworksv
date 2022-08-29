
import 'dart:async';

import 'package:article_finder/bloc/bloc.dart';
import 'package:article_finder/data/artworks_model.dart';
import 'package:article_finder/data/rw_client.dart';
import 'package:rxdart/rxdart.dart';

class ArtWorkListBloc implements Bloc {
  final _client = RWClient();
  final _searchQueryController = StreamController<String?>();
  Sink<String?> get searchQuery => _searchQueryController.sink;
  late Stream<ArtWorksModel?> artWorkStream;


  ArtWorkListBloc() {
    artWorkStream = _searchQueryController.stream
        .startWith(null) // 1
        .debounceTime(const Duration(milliseconds: 100)) // 2
        .switchMap(
          // 3
          (query) => _client
              .fetchArtWorksData(query)
              .asStream() // 4
              .startWith(null), // 5
        );

  }

  @override
  void dispose() {
    _searchQueryController.close();
  }
}
