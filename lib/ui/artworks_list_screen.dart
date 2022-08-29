
import 'package:article_finder/bloc/artwork_detail_bloc.dart';
import 'package:article_finder/bloc/artwork_list_bloc.dart';
import 'package:article_finder/bloc/bloc_provider.dart';
import 'package:article_finder/data/artworks_model.dart';
import 'package:article_finder/ui/artworks_detail_screen.dart';
import 'package:article_finder/ui/artworks_list_item.dart';
import 'package:flutter/material.dart';

class ArtWorksListScreen extends StatelessWidget {
  const ArtWorksListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ArtWorkListBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('ArtWorks')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration:  const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search Artworks',
                fillColor: Colors.black26,
                filled: true,
                prefixIcon: Icon(Icons.search,color: Colors.black12,),
              ),
              onChanged: bloc.searchQuery.add,
            ),
          ),
          Expanded(
            child: _buildResults(bloc),
          )
        ],
      ),
    );
  }

  Widget _buildResults(ArtWorkListBloc bloc) {
    // 1
    return StreamBuilder<ArtWorksModel?>(
      stream: bloc.artWorkStream,
      builder: (context, snapshot) {
        // 2
        final results = snapshot.data?.data;
        if (results == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (results.isEmpty) {
          return const Center(child: Text('No Results'));
        }
        // 3
        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Data>?  results) {
    return ListView.builder(
      itemCount: results?.length,
      itemBuilder: (context, index) {
        final artwork = results?[index];
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ArtWorksListItem(artwork: artwork),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  bloc: ArtWorkDetailBloc(id: artwork?.id.toString() ?? ""),
                  child:  ArtWorksDetailScreen(title: artwork?.title,),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
