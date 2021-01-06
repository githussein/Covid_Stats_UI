import 'package:corona_stats/config/palette.dart';
import 'package:corona_stats/config/styles.dart';
import 'package:corona_stats/data/data.dart';
import 'package:corona_stats/widgets/dart/country_dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:corona_stats/widgets/dart/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _country = 'DE';

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight),
          _buildTips(screenHeight),
          _buildTest(screenHeight),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Palette.primaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'COVID-19',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CountryDropdown(
                  countries: [
                    'DE',
                    'EG',
                    'AU',
                    'IT',
                    'US',
                    'RU',
                  ],
                  country: _country,
                  onChanged: (val) => setState(() => _country = val),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Are you feeling sick?',
                  style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'If you are having any of COVID-19 symptoms please contact us.',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton.icon(
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        icon: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Call now',
                          style: Styles.buttonTextStyle,
                        )),
                    FlatButton.icon(
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        icon: const Icon(
                          Icons.message,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Send SMS',
                          style: Styles.buttonTextStyle,
                        )),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildTips(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Important Tips',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: prevention
                  .map(
                    (e) => Column(
                      children: <Widget>[
                        Image.asset(
                          e.keys.first,
                          height: screenHeight * 0.12,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          e.values.first,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildTest(double screenHeight) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        padding: EdgeInsets.all(10.0),
        height: screenHeight * 0.15,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.blue, Palette.primaryColor]),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/images/test.png'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Need a test?',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'Follow the instructions\nto do a test.',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14.0,
                  ),
                  maxLines: 2,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
