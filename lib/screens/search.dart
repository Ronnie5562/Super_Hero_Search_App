import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:super_hero_app/api/api.dart';
import 'package:super_hero_app/model/hero_model.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<HeroListModel> _heroes = [];
  bool _isLoading = false;

  void _searchHeroes(String query) async {
    if (query.isEmpty) {
      setState(() {
        _heroes = [];
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final List<HeroListModel> heroesList =
          await SuperHeroApi().getHeroesList(query);
      setState(() {
        _heroes = heroesList;
      });
    } catch (e) {
      print("Error fetching heroes: $e");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Search Heroes', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: const TextStyle(color: Colors.white),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: 'Enter hero name',
                hintStyle: TextStyle(color: Colors.grey[400]),
              ),
              onChanged: _searchHeroes,
            ),
            const SizedBox(height: 16),
            if (_isLoading) const CircularProgressIndicator(),
            Expanded(
              child: ListView.builder(
                itemCount: _heroes.length,
                itemBuilder: (context, index) {
                  final hero = _heroes[index];
                  return Container(
                    margin:
                        const EdgeInsets.only(bottom: 8.0),
                    child: ListTile(
                      title: Text(
                        hero.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: Image.network(hero.imageUrl, width: 50),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
