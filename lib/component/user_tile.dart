import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
 final String text;
  final void Function()? onTap;
  const UserTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10,left: 20, right: 20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
         
          color: Theme.of(context).colorScheme.onSurface,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
           Icon(Icons.person, color: Theme.of(context).colorScheme.secondary),
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}