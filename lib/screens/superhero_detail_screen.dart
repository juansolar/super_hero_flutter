import 'package:flutter/material.dart';
import 'package:superhero_app/components/superhero_stats.dart';
import 'package:superhero_app/data/model/superhero_details_response.dart';

class SuperheroDetailScreen extends StatelessWidget {
  final SuperheroDetailsResponse superhero;

  const SuperheroDetailScreen({super.key, required this.superhero});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Superhero ${superhero.name}")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Image.network(
              superhero.url,
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
            Text(
              superhero.name,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
              superhero.realName,
              style: TextStyle(fontSize: 28, fontStyle: FontStyle.italic),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SuperheroStats(powerStat: superhero.superheroStatsResponse.intelligence, statColor: Colors.blue, statTitle: "Intelligence"),
                  SuperheroStats(powerStat: superhero.superheroStatsResponse.strength, statColor: Colors.green, statTitle: "Strength"),
                  SuperheroStats(powerStat: superhero.superheroStatsResponse.speed, statColor: Colors.yellow, statTitle: "Speed"),
                  SuperheroStats(powerStat: superhero.superheroStatsResponse.durability, statColor: Colors.grey, statTitle: "Durability"),
                  SuperheroStats(powerStat: superhero.superheroStatsResponse.power, statColor: Colors.red, statTitle: "Power"),
                  SuperheroStats(powerStat: superhero.superheroStatsResponse.combat, statColor: Colors.orange, statTitle: "Combat"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
