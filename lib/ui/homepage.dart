import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/api/api_service.dart';
import '/api/data_state.dart';
import '/models/character.dart';
import '../utils/person_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 1;
  late Future<DataState<List<Character>>> _dataFuture;
  String searchQuery = '';
  String selectedStatus = '';
  String selectedSpecies = '';

  @override
  void initState() {
    super.initState();
    _dataFuture = fetchData(currentPage);
  }

  Future<DataState<List<Character>>> fetchData(int page) async {
    final apiService = Provider.of<ApiService>(context, listen: false);
    return apiService.getCharacters(page: page);
  }

  Future<void> changePage(int page) async {
    final newData = await fetchData(page);
    if (!newData.loading && newData.error == null) {
      setState(() {
        currentPage = page;
        _dataFuture = fetchData(currentPage);
      });
    }
  }

  Future<void> refreshData() async {
    final newData = await fetchData(currentPage);
    if (!newData.loading && newData.error == null) {
      setState(() {
        _dataFuture = fetchData(currentPage);
      });
    }
  }

  List<Character> filterCharacters(List<Character> characters) {
    if (searchQuery.isEmpty && selectedStatus.isEmpty && selectedSpecies.isEmpty) {
      return characters;
    } else {
      return characters.where((character) {
        final nameMatch = character.name.toLowerCase().contains(searchQuery.toLowerCase());
        final statusMatch = selectedStatus.isEmpty || character.status.toLowerCase() == selectedStatus.toLowerCase();
        final speciesMatch = selectedSpecies.isEmpty || character.species.toLowerCase() == selectedSpecies.toLowerCase();
        return nameMatch && statusMatch && speciesMatch;
      }).toList();
    }
  }

  void handlePageSelection(String selectedPage) {
    final page = int.tryParse(selectedPage);
    if (page != null) {
      changePage(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/Logo.svg',
          width: 100,
          height: 50,
        ),
        leading: SvgPicture.asset(
          'assets/rick.svg',
          width: 24,
          height: 24,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(
              'assets/morty.svg',
              width: 48,
              height: 48,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 16),
              DropdownButton<String>(
                value: selectedStatus,
                onChanged: (newValue) {
                  setState(() {
                    selectedStatus = newValue ?? '';
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: '',
                    child: Text('All Status'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'alive',
                    child: Text('Alive'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'dead',
                    child: Text('Dead'),
                  ),
                ],
              ),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: selectedSpecies,
                onChanged: (newValue) {
                  setState(() {
                    selectedSpecies = newValue ?? '';
                  });
                },
                items: const [
                  DropdownMenuItem<String>(
                    value: '',
                    child: Text('All Species'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'human',
                    child: Text('Human'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'alien',
                    child: Text('Alien'),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Expanded(
            child: FutureBuilder<DataState<List<Character>>>(
              future: _dataFuture,
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  final filteredCharacters = filterCharacters(snapshot.data!.data!);
                  return PersonList(characters: filteredCharacters);
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (currentPage != 1)
                IconButton(
                  onPressed: () {
                    changePage(currentPage - 1);
                  },
                  icon: const Icon(Icons.arrow_left),
                ),
              TextButton(
                onPressed: () {},
                child: PopupMenuButton<String>(
                  onSelected: handlePageSelection,
                  itemBuilder: (BuildContext context) {
                    return List.generate(42, (index) {
                      final pageNumber = index + 1;
                      return PopupMenuItem<String>(
                        value: pageNumber.toString(),
                        child: Text('Page $pageNumber'),
                      );
                    });
                  },
                ),
              ),
              Text('Page $currentPage'),
              if (currentPage != 42)
                IconButton(
                  onPressed: () {
                    changePage(currentPage + 1);
                  },
                  icon: const Icon(Icons.arrow_right),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshData,
        shape: const CircleBorder(),
        child: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
