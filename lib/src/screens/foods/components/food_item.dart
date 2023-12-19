import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nomnom/src/models/food_model.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({
    super.key,
    required this.food,
    required this.color,
    required this.centerness,
  });

  final FoodModel food;
  final double centerness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width / 2.1,
          height: double.maxFinite,
          margin: EdgeInsets.only(top: (MediaQuery.sizeOf(context).width / 2) / 2),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          width: MediaQuery.sizeOf(context).width / 2.1,
          height: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: centerness * pi / 3,
                  child: Transform.scale(
                    scale: 0.7 + (centerness * 0.3),
                    child: Image.asset(
                      food.plateImageUrl,
                      width: MediaQuery.sizeOf(context).width / 2 - 50,
                      height: MediaQuery.sizeOf(context).width / 2 - 50,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              RatingBar.builder(
                initialRating: food.rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.only(right: 2.0),
                itemSize: 10,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                onRatingUpdate: (rating) {},
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                food.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: centerness * 60,
                child: Text(
                  food.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                '\$${food.price}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_shopping_cart,
                        color: Color(0xFF4A7E83),
                        size: 16,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Add to bug',
                        style: TextStyle(
                          color: Color(0xFF4A7E83),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
