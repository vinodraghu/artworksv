
import 'package:article_finder/bloc/artwork_detail_bloc.dart';
import 'package:article_finder/bloc/bloc_provider.dart';
import 'package:article_finder/data/artwork_detils_model.dart';
import 'package:article_finder/ui/artworks_detail.dart';
import 'package:flutter/material.dart';

class ArtWorksDetailScreen extends StatelessWidget {
  final String? title;
  const ArtWorksDetailScreen({this.title}) : super();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ArtWorkDetailBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
      ),
      body: _buildContent(bloc),
    );
  }

  Widget _buildContent(ArtWorkDetailBloc bloc) {
    return StreamBuilder<ArtWorkDetilsModel?>(
      stream: bloc.artWorkStream,
      builder: (context, snapshot) {
        // 1
        final artwork = snapshot.data;
        if (artwork == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return ArtWorksDetail(artwork);
      },
    );
  }
}
