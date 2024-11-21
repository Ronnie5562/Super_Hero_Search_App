import 'package:flutter/material.dart';
import 'search.dart';
import 'package:super_hero_app/api/api.dart';
import 'package:super_hero_app/model/hero_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<HeroListModel>> heroesList;
  late Future<List<HeroListModel>> largeheroesList;

  @override
  void initState() {
    super.initState();
    heroesList = SuperHeroApi().getHeroesList("man");
    largeheroesList = SuperHeroApi().getHeroesList("a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Super Hero App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            FutureBuilder(
              future: largeheroesList,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final List<HeroListModel> heroes =
                    snapshot.data as List<HeroListModel>;
                return CarouselSlider.builder(
                  itemCount: heroes.length,
                  itemBuilder: (context, index, heroIndex) {
                    final HeroListModel hero = heroes[index];

                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              hero.imageUrl,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 350, // Adjust height as needed
                            ),
                          ),
                          const SizedBox(
                              height: 8
                          ),
                          Text(
                            hero.name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 450,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 1.4,
                    autoPlayInterval: const Duration(seconds: 3),
                  ),
                );
              },
            ),

            const Text(
              'Super Heroes',
              style: TextStyle(color: Colors.white),
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 240,
              child: FutureBuilder(
                future: heroesList,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final List<HeroListModel> heroes =
                      snapshot.data as List<HeroListModel>;
                  return ListView.builder(
                    itemCount: heroes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final HeroListModel hero = heroes[index];

                      return Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                hero.imageUrl,
                                fit: BoxFit.cover,
                                width: 120,
                                height: 180,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              hero.name,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                            Text(
                              hero.publisher,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.white),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      );
                    },
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
