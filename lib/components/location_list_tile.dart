import 'package:demo_map_search/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({required this.location, required this.press, super.key});

  final String location;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListTile(
            onTap: press,
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(
              'assets/icons/location_pin.svg',
              height: 16,
            ),
            title: Text(
              location,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              // style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const Divider(
          height: 2,
          thickness: 2,
          color: secondaryColor10LightTheme,
        ),
      ],
    );
  }
}
