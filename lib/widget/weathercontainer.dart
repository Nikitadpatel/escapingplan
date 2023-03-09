import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Modal/HomeModal.dart';
import '../Provider/homeProvider.dart';

HomeProvider? apiproviderT;
HomeProvider? apiproviderF;
Widget weathercontainer(context) {
  apiproviderF = Provider.of<HomeProvider>(context, listen: false);
  apiproviderT = Provider.of<HomeProvider>(context, listen: true);
  return Center(
    child: FutureBuilder(
        future: apiproviderF!.fact(apiproviderF!.lon, apiproviderF!.lan),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else if (snapshot.hasData) {
            HomeModal apimodel = snapshot.data!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Surat - ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          '🌡️',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                        Text(
                          '${apimodel.main!.tempMax}°',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ],
                ),
                Divider(color: Colors.grey, thickness: 0.08.h),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Description - ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          '${apimodel.weather![0].main}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(color: Colors.grey, thickness: 0.08.h),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Clouds - ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          '${apimodel.clouds!.all}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' ☁',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          }
          return CircularProgressIndicator();
        }),
  );
}
