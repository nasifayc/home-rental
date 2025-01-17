import 'package:flutter/material.dart';
import 'package:home_app/core/theme/app_theme.dart';
import 'package:home_app/model/house_model.dart';
import 'package:home_app/screen/main_screens/home_detail.dart';
import 'package:intl/intl.dart';

class HomeCard extends StatelessWidget {
  final HouseModel house;
  const HomeCard({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    AppTheme theme = AppTheme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HouseDetailScreen(house: house),
            ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.primaryBackground,
          boxShadow: [
            BoxShadow(
              color: theme.tertiary.withOpacity(0.2),
              offset: const Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(house.mainImage, scale: 1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    house.title,
                    style: theme.typography.bodyMedium
                        .copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                      '${NumberFormat("#,##0.00", "en_US").format(house.price)} ETB',
                      style: theme.typography.bodySmall),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: theme.tertiary,
                        size: 15,
                      ),
                      Text(
                        house.location,
                        style: theme.typography.titleSmall
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
