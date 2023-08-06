import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodies/data/category_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
