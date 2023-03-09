import 'package:escapingplan/Provider/homeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Modal/HomeModal.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  HomeProvider? apiproviderT;
  HomeProvider? apiproviderF;

  @override
  Widget build(BuildContext context) {
    apiproviderF = Provider.of<HomeProvider>(context, listen: false);
    apiproviderT = Provider.of<HomeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   iconTheme: IconThemeData(color: Colors.black),
        //   centerTitle: true,
        //   backgroundColor: Colors.transparent,
        //   elevation: 00,
        //   title: Text(
        //     "YourWeather",
        //     style: TextStyle(
        //       color: Color(0xff000000),
        //     ),
        //   ),
        //   actions: [
        //     PopupMenuButton(
        //       color: Color(0xffffc18f),
        //       icon: Icon(
        //         Icons.location_on_outlined,
        //         color: Color(0xff000000),
        //       ),
        //       itemBuilder: (context) {
        //         return [
        //           PopupMenuItem(
        //               onTap: () {
        //                 Provider.of<HomeProvider>(context, listen: false)
        //                     .changeWeather("21.1702", "72.8311");
        //               },
        //               child: Text('surat')),
        //           PopupMenuItem(
        //               onTap: () {
        //                 Provider.of<HomeProvider>(context, listen: false)
        //                     .changeWeather("26.809891", "80.273956");
        //               },
        //               child: Text('ahemdabad')),
        //           PopupMenuItem(
        //               onTap: () {
        //                 Provider.of<HomeProvider>(context, listen: false)
        //                     .changeWeather("22.303894", "70.802162");
        //               },
        //               child: Text('rajkot')),
        //           PopupMenuItem(
        //               onTap: () {
        //                 Provider.of<HomeProvider>(context, listen: false)
        //                     .changeWeather("21.5222", "70.4579");
        //               },
        //               child: Text('junagadh')),
        //         ];
        //       },
        //     ),
        //   ],
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Stack(
              children: [
                Image.asset(
                  "assets/splash2.jpg",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                FutureBuilder(
                    future: apiproviderF!
                        .fact(apiproviderF!.lon, apiproviderF!.lan),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        HomeModal apimodel = snapshot.data!;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '⛅',
                                  style: TextStyle(
                                    fontSize: 50,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '20 Mar',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Sunday',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              '${apimodel.main!.temp}°',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${apimodel.weather![0].main}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              height: 270,
                              width: 370,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(41, 181, 181, 181),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2.5,
                                  color: Color(0xff000000),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '🌡️',
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${apimodel.main!.tempMin}°',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Temprature',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 90,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '💨',
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${apimodel.wind!.speed} Km/h',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Wind Speed',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '☁',
                                                style: TextStyle(
                                                  fontSize: 30,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${apimodel.clouds!.all}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Clouds',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 90,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                '⬆',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '${apimodel.wind!.deg}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            'Wind degree',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '------------ More Details ------------',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 150,
                              width: 370,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(41, 255, 255, 255),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  width: 2.5,
                                  color: Color(0xff000000),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Humidity',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '💧',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${apimodel.main!.humidity} %',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Visibility',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '👁️',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${apimodel.visibility}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Sunrise',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '🌤',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '${apimodel.sys!.sunrise}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }
                      return CircularProgressIndicator();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
