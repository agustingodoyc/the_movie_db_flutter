import 'package:flutter/material.dart';

import '../../../core/utils/constants/index.dart';


class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  IconData icon = Icons.favorite_border;
  static const circleBorder = 20.0;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(AppPaddings.image),
        child: SizedBox(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                Theme.of(context).unselectedWidgetColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(circleBorder),
                ),
              ),
            ),
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
            child: FittedBox(
              child: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}
