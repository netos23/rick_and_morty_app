import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/api/data_state.dart';
import 'package:rick_and_morty/models/episode.dart';

import '../../api/api_service.dart';
import '../../models/character.dart';

@RoutePage()
class DetailsPage extends StatefulWidget {
  final Character character;

  const DetailsPage({Key? key, required this.character}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(widget.character.name),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              widget.character.image,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Episodes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _buildEpisodes()
        ],
      ),
    );
  }

  _buildEpisodes() {
    return FutureProvider<DataState<List<Episode>>>(
      create: (ctx)  {
        final apiService = Provider.of<ApiService>(ctx, listen: false);
        return apiService.getEpisodes(widget.character);
      },
      initialData: DataState(loading: true),
      child: Consumer<DataState<List<Episode>>>(
        builder: (ctx, data, _) {
          if (data.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (data.error != null) {
            return Center(child: Text('Error: ${data.error}'));
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: data.data!.length,
              itemBuilder: (ctx, index) {
                final episode = data.data![index];
                return Card(
                  child: ListTile(
                    title: Text(episode.name),
                    subtitle: Text(episode.episode),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}