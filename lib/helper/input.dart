
import 'package:flutter/material.dart';
// A widget for a text input field with an accompanying clear button.
class InputFieldWithClear extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback clearFunction;
// Constructor with required parameters.
  const InputFieldWithClear({
    super.key, 
    required this.label,
    required this.controller,
    required this.clearFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),

           // A button to clear the text field.
          ElevatedButton(
            onPressed: clearFunction,
            child: const Text('Clear'),
          ),
        ],
      ),
      
    );
    
  }
}
