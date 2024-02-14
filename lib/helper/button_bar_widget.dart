import 'package:flutter/material.dart';
// A widget that displays a row of buttons for adding and clearing items.
class ButtonBarWidget extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onClearList;

  const ButtonBarWidget({
    super.key,
    required this.onAdd,
    required this.onClearList,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Column(
          children: [
            ElevatedButton(
              onPressed: onAdd,
              child: const Text('Add'),
            ),
          
        ElevatedButton(
          onPressed: onClearList,
          child: const Text('Clear List'),
        ),
      ],
      ),
      ],
        
    );
  }
}
