
import 'dart:async';

import 'package:article_finder/bloc/bloc.dart';
import 'package:article_finder/data/artwork_detils_model.dart';
import 'package:article_finder/data/rw_client.dart';
import 'package:rxdart/rxdart.dart';

class ArtWorkDetailBloc implements Bloc {
  final String id;
  final _refreshController = StreamController<void>();
  final _client = RWClient();

  late Stream<ArtWorkDetilsModel?> artWorkStream;

  ArtWorkDetailBloc({
    required this.id,
  }) {
    artWorkStream = _refreshController.stream
        .startWith({})
        .mapTo(id)
        .switchMap(
          (id) => _client.getDetailArtWorkData(id).asStream(),
        )
        .asBroadcastStream();
  }

  Future refresh() {
    final future = artWorkStream.first;
    _refreshController.sink.add({});
    return future;
  }

  @override
  void dispose() {
    _refreshController.close();
  }
}
