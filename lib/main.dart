import 'package:flutter/material.dart';

void main() => runApp(WarzoneMetaApp());

class WarzoneMetaApp extends StatelessWidget { @override Widget build(BuildContext context) { return MaterialApp( title: 'Meta Loadouts', theme: ThemeData.dark(), home: LoadoutScreen(), ); } }

class LoadoutScreen extends StatefulWidget { @override _LoadoutScreenState createState() => _LoadoutScreenState(); }

class _LoadoutScreenState extends State<LoadoutScreen> { String selectedCategory = 'Long Range';

final List<String> categories = [ 'Long Range', 'Sniping', 'Close Range', 'Sniper Support' ];

final List<Map<String, dynamic>> loadouts = List.generate(5, (index) => { 'rank': index + 1, 'weapon': 'Weapon ${index + 1}', 'attachments': [ 'Muzzle: Example', 'Barrel: Example', 'Optic: Example', 'Underbarrel: Example', 'Magazine: Example', ] });

@override Widget build(BuildContext context) { return Scaffold( appBar: AppBar( title: Text('Top 5 Meta Loadouts'), ), body: Column( children: [ Padding( padding: const EdgeInsets.all(8.0), child: DropdownButton<String>( value: selectedCategory, isExpanded: true, onChanged: (value) { setState(() { selectedCategory = value!; }); }, items: categories.map((String category) { return DropdownMenuItem<String>( value: category, child: Text(category), ); }).toList(), ), ), Expanded( child: ListView.builder( itemCount: loadouts.length, itemBuilder: (context, index) { final loadout = loadouts[index]; return Card( margin: EdgeInsets.all(8), child: Padding( padding: const EdgeInsets.all(12.0), child: Column( crossAxisAlignment: CrossAxisAlignment.start, children: [ Text('#${loadout['rank']} - ${loadout['weapon']}', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)), SizedBox(height: 8), ...loadout['attachments'].map<Widget>((a) => Text('- $a')).toList(), ], ), ), ); }, ), ) ], ), ); } }

