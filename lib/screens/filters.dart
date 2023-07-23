import 'package:flutter/material.dart';

enum Filter { glutenfree, lactosefree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({
    super.key,
    required this.currenFilter,
  });
  final Map<Filter, bool> currenFilter;

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterset = false;
  var _lactoseFreeFilterset = false;
  var _vegeteriannFilterset = false;
  var _veganFilterset = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterset = widget.currenFilter[Filter.glutenfree]!;
    _lactoseFreeFilterset = widget.currenFilter[Filter.lactosefree]!;
    _vegeteriannFilterset = widget.currenFilter[Filter.vegetarian]!;
    _veganFilterset = widget.currenFilter[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters Meal'),
      ),
      // drawer: MainDrawer(onSelectScreen: (identifire) {
      //   Navigator.of(context).pop();
      //   if (identifire == 'meals') {
      //     Navigator.of(context).pushReplacement(
      //       MaterialPageRoute(builder: (ctx) => const TabScreen()),
      //     );
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenfree: _glutenFreeFilterset,
            Filter.lactosefree: _lactoseFreeFilterset,
            Filter.vegetarian: _vegeteriannFilterset,
            Filter.vegan: _veganFilterset,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterset,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterset = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Include glutten free meals',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterset,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterset = isChecked;
                });
              },
              title: Text(
                'Lactose Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Include gluten free meal',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _vegeteriannFilterset,
              onChanged: (isChecked) {
                setState(() {
                  _vegeteriannFilterset = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Include vegetarian meal',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              value: _veganFilterset,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilterset = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only Include vegan meal',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
