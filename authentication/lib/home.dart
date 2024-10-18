import 'package:flutter/material.dart';
import 'car.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    final List<Car> cars = List.generate(
      100,
      (index) => Car(
        image:
            'https://auto.dev/images/forsale/2024/09/28/18/44/2014_toyota_corolla-pic-2424150520098383800-1024x768.jpeg',
        modele: 'clio',
        prix: '1.52',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return Card(
            child: Column(
              children: [
                Image.network(
                    "https://auto.dev/images/forsale/2024/09/28/18/44/2014_toyota_corolla-pic-2424150520098383800-1024x768.jpeg",
                    fit: BoxFit.cover,
                    height: 100,
                    width: double.infinity),
                Text(car.modele),
                Text('\€${car.prix}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
