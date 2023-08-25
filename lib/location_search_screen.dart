import 'package:demo_map_search/components/location_list_tile.dart';
import 'package:demo_map_search/components/network_untility.dart';
import 'package:demo_map_search/constants.dart';
import 'package:demo_map_search/models/autocomplate_prediction.dart';
import 'package:demo_map_search/models/place_auto_complate_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  List<AutocompletePrediction> placePredictions = [];

  void placeAutocomplate(String query) async {
    Uri uri = Uri.https(
      "maps.googleapis.com",
      "maps/api/place/autocomplete/json",
      {
        'input': query,
        'key': 'AIzaSyAuZlVvE7ZYKOCCVV7LBGZbYdX_SBeLOt0',
      },
    );

    String? response = await NetworkUtility.fetchUrl(uri);
    if (response != null) {
      print('response : $response');

      PlaceAutocompleteResponse result = PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    } else {
      print('response is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: defaultPadding),
          child: CircleAvatar(
            backgroundColor: secondaryColor10LightTheme,
            child: SvgPicture.asset(
              'assets/icons/location.svg',
              height: 16,
              width: 16,
              color: secondaryColor40LightTheme,
            ),
          ),
        ),
        title: const Text(
          'Set Delivery Location',
          style: TextStyle(color: textColorLightTheme),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: secondaryColor10LightTheme,
            child: SvgPicture.asset(
              'assets/icons/cancel.svg',
              height: 16,
              width: 16,
              color: secondaryColor40LightTheme,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Form(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: TextFormField(
                onChanged: (value) {},
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: 'Search your location',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: SvgPicture.asset(
                      'assets/icons/location_pin.svg',
                      color: secondaryColor40LightTheme,
                      height: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 2,
            thickness: 2,
            color: secondaryColor5LightTheme,
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ElevatedButton.icon(
              onPressed: () {
                placeAutocomplate('Dubai');
              },
              icon: SvgPicture.asset(
                'assets/icons/location.svg',
                height: 16,
              ),
              label: const Text('Use my Current Location'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: secondaryColor10LightTheme,
                  foregroundColor: textColorLightTheme,
                  elevation: 0,
                  fixedSize: const Size(double.infinity, 40),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),
          const Divider(
            height: 2,
            thickness: 2,
            color: secondaryColor5LightTheme,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: placePredictions.length,
              itemBuilder: (_, index) {
                return LocationListTile(press: () {}, location: placePredictions[index].description!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
