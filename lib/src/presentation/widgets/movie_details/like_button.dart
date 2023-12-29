import 'package:flutter/material.dart';

import '../../../core/utils/index.dart';

class LikeButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onTap;

  const LikeButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

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
              onTap();
            },
            child: FittedBox(
              child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            ),
          ),
        ),
      ),
    );
  }
}
