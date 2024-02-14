import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  // Loads the item list from SharedPreferences.

 Future<List<String>> loadItemList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getStringList('items') ?? [];
  }
  // Saves the given list of items to SharedPreferences.
  
  Future<bool> saveItemList(List<String> items) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setStringList('items', items);
  }
// Clears the item list from SharedPreferences.
  Future<bool> clearItemList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.remove('items');
  }
}
