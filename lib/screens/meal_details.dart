import 'package:flutter/material.dart';
import 'package:foodies/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Card(
          margin: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            children: [
              FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Ingredients',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              for (final ingradient in meal.ingredients)
                Text(
                  ingradient,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                  textAlign: TextAlign.left,
                ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Steps',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              for (final step in meal.steps)
                Text(
                  step,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:foodies/models/meal.dart';

// class MealDetailsScreen extends StatelessWidget {
//   const MealDetailsScreen({
//     super.key,
//     required this.meal,
//   });

//   final Meal meal;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(meal.title),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//             color: Colors.black54,
//             child: Column(
//               children: [
//                 Image.network(
//                   meal.imageUrl,
//                   height: 300,
//                   width: double.infinity,
//                   fit: BoxFit.cover,
//                 ),
//                 const SizedBox(height: 14),
//                 Text(
//                   'Ingredients',
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         color: Theme.of(context).colorScheme.primary,
//                         fontWeight: FontWeight.bold,
//                       ),
//                 ),
//                 const SizedBox(height: 14),
//                 for (final ingredient in meal.ingredients)
//                   Text(
//                     ingredient,
//                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                           color: Theme.of(context).colorScheme.onBackground,
//                         ),
//                   ),
//                 const SizedBox(height: 24),
//                 Text(
//                   'Steps',
//                   style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                         color: Theme.of(context).colorScheme.primary,
//                         fontWeight: FontWeight.bold,
//                       ),
//                 ),
//                 const SizedBox(height: 14),
//                 for (final step in meal.steps)
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 12,
//                       vertical: 8,
//                     ),
//                     child: Text(
//                       step,
//                       textAlign: TextAlign.left,
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                             color: Theme.of(context).colorScheme.onBackground,
//                           ),
//                     ),
//                   ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
