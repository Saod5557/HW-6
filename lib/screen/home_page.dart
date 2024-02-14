import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../helper/input.dart'; 
import '../helper/list.dart'; 
import '../helper/button_bar_widget.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  // List to store items
  List<String> _items = [];

  @override
  void initState() {
    super.initState();
    _loadData(); // Load data when the widget is initialized
  }
// Load items from SharedPreferences
  _loadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _items = pref.getStringList('items') ?? [];
    });
  }
   
  _saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('items', _items);
  }

_addItem() async {
  if (_nameController.text.isNotEmpty && _emailController.text.isNotEmpty) {
    
    int index = _items.length + 1;
    
    final newItem = '$index - Name: ${_nameController.text}, Email: ${_emailController.text}';
   
    setState(() {
      _items.add(newItem);
    });
    
    await _saveData();
    
    _nameController.clear();
    _emailController.clear();
  }
}


  _clearList() {
    setState(() {
      _items.clear();
      _saveData();
    });
  }

  _clearField(TextEditingController controller) {
    setState(() {
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  backgroundColor: Color.fromARGB(255, 40, 6, 43),
  title: const Center(
    child: Text(
      'LIST',
      style: TextStyle(
        color: Colors.white,
      fontWeight: FontWeight.bold
      ),
       
    ),
  ),
),
      body: Column(
        children: <Widget>[
          //Upper 
          InputFieldWithClear(
            label: 'Name',
            controller: _nameController,
            clearFunction: () => _clearField(_nameController),
          ),
          InputFieldWithClear(
            label: 'Email',
            controller: _emailController,
            clearFunction: () => _clearField(_emailController),
          ),
         
         const SizedBox(height: 59),

          ButtonBarWidget( 
            onAdd: _addItem,
            onClearList: _clearList,
          ),
           //Lower
          ItemListWidget(items: _items), 
        ],
      ),
    );
  }
}
  
