import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  IconData icon = Icons.favorite_border;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(UIConstants.imagePadding),
        child: SizedBox(
          child: ElevatedButton(
            onPressed: () {
              setState(
                () {
                  if (icon == Icons.favorite) {
                    icon = Icons.favorite_border;
                  } else {
                    icon = Icons.favorite;
                  }
                },
              );
            },
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
