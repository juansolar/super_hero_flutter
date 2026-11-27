import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:superhero_app/data/model/super_hero_response.dart';
import 'package:superhero_app/data/model/superhero_details_response.dart';
import 'package:superhero_app/data/repository.dart';
import 'package:superhero_app/screens/superhero_detail_screen.dart';

class SuperheroSearchScreen extends StatefulWidget {
  const SuperheroSearchScreen({super.key});

  @override
  State<SuperheroSearchScreen> createState() => _SuperheroSearchScreenState();
}

class _SuperheroSearchScreenState extends State<SuperheroSearchScreen> {

  Future<SuperHeroResponse?>? _superheroInfo;
  Repository _repository = Repository();
  bool _isTextEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Super Hero")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Super Hero",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (text) {
                setState(() {
                  _isTextEmpty = text.isEmpty;
                  _superheroInfo = _repository.fetchSuperheroInfo(text);
                });
              },
            ),
          ),
          bodyList(_isTextEmpty),
        ],
      ),
    );
  }

  FutureBuilder<SuperHeroResponse?> bodyList(bool _isTextEmpty) {
    return FutureBuilder(
      future: _superheroInfo,
      builder: (context, snapshot) {
        if(_isTextEmpty) return Center(child: Text("Search Super Hero"));
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          var superheroList = snapshot.data?.result;
          return Expanded(
            child: ListView.builder(
              itemCount: superheroList?.length ?? 0,
              itemBuilder: (contaext, index) {
                if (superheroList != null) {
                  return itemSuperhero(superheroList[index]);
                } else {
                  return Text("");
                }
              },
            ),
          );
        } else {
          return Text("No results found");
        }
      },
    );
  }

  Padding itemSuperhero(SuperheroDetailsResponse item) => Padding(
    padding: const EdgeInsets.all(8.0),

    child: GestureDetector(
      onTap: () => Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => SuperheroDetailScreen(superhero: item))
      ),
      child: Column(
        children: [
          Image.network(
            item.url,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment(0, -0.6),
            //En caso de que no cargue las imagenes
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.image_not_supported, size: 100);
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const CircularProgressIndicator();
            },
          ),
          Text(item.name),
        ],
      ),
    ),
  );
}
