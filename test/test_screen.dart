import 'package:flutter/material.dart';
import '../lib/widgets/bla_button.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BlaButton Test")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Primary Button:"),
            const SizedBox(height: 10),
            BlaButton(
              label: "Request to book", 
              onPressed: () => print("Primary tapped"),
              icon: Icons.calendar_month,
              type: BlaButtonType.primary,
            ),
            
            const SizedBox(height: 20),
            
            const Text("Secondary Button:"),
            const SizedBox(height: 10),
            BlaButton(
              label: "Contact Volodia", 
              onPressed: () => print("Secondary tapped"),
              icon: Icons.chat_bubble_outline,
              type: BlaButtonType.secondary,
            ),
             
             const SizedBox(height: 20),
             
             const Text("No Icon:"),
             const SizedBox(height: 10),
             BlaButton(
              label: "Confirm", 
              onPressed: () => print("No icon tapped"),
              type: BlaButtonType.primary,
            ),
          ],
        ),
      ),
    );
  }
}