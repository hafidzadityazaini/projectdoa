import 'package:flutter/material.dart';

class AmalanTile extends StatelessWidget {
  final String title;
  final String category;

  const AmalanTile({
    super.key,
    required this.title,
    required this.category,
  });

  Color getCategoryColor() {
    switch (category) {
      case 'Doa':
        return Colors.blue;

      case 'Dzikir':
        return Colors.green;

      case 'Sunnah':
        return Colors.orange;

      default:
        return Colors.black;
    }
  }

  IconData getCategoryIcon() {
    switch (category) {
      case 'Doa':
        return Icons.menu_book;

      case 'Dzikir':
        return Icons.favorite;

      case 'Sunnah':
        return Icons.star;

      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),

      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),

        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black.withOpacity(0.15),
          )
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(
            backgroundColor: getCategoryColor(),

            child: Icon(
              getCategoryIcon(),
              color: Colors.white,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  category,
                  style: TextStyle(
                    color: getCategoryColor(),
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),

          const Icon(
            Icons.notifications,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}