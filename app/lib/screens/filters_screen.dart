import 'package:app/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactosefree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactosefree,
                  'vegetarian': _vegetarian,
                  'vegan': _vegan,
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(24.0),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                FilterSwitch(
                  title: 'Gluten-free',
                  subtitle: 'Only include gluten-free meals',
                  currentFilterValue: _glutenFree,
                  onChange: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                FilterSwitch(
                  title: 'Lactose-free',
                  subtitle: 'Only include lactose-free meals',
                  currentFilterValue: _lactosefree,
                  onChange: (newValue) {
                    setState(() {
                      _lactosefree = newValue;
                    });
                  },
                ),
                FilterSwitch(
                  title: 'Vegetarian',
                  subtitle: 'Only include vegegarian meals',
                  currentFilterValue: _vegetarian,
                  onChange: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                FilterSwitch(
                  title: 'Vegan',
                  subtitle: 'Only include vegan meals',
                  currentFilterValue: _vegan,
                  onChange: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                )
              ],
            ))
          ],
        ));
  }
}

class FilterSwitch extends StatefulWidget {
  final String title;
  final String subtitle;
  final bool currentFilterValue;
  final Function onChange;

  FilterSwitch(
      {this.title, this.subtitle, this.currentFilterValue, this.onChange});

  @override
  _FilterSwitchState createState() => _FilterSwitchState();
}

class _FilterSwitchState extends State<FilterSwitch> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
        value: widget.currentFilterValue,
        onChanged: widget.onChange);
  }
}
