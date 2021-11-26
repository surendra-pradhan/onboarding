import 'package:flutter/material.dart';
import 'package:onboarding/screens/store_screen.dart';
import 'package:onboarding/themes/theme.dart';
import 'package:flutter_svg/svg.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String count;
  final String icons;
  final String routename;
  ServiceCard(
      {Key? key,
      required this.title,
      required this.count,
      required this.icons,
      required this.routename})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(routename),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      count,
                      style: AppTheme.h3Style,
                    ),
                    Text(
                      title,
                      style: AppTheme.h1Style,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  icons,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
