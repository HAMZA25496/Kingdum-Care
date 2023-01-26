import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/meal_model.dart';
class TomorrowLunch extends StatefulWidget {
  List<MealModel> lunch = [];

   TomorrowLunch({required this.lunch,Key? key}) : super(key: key);

  @override
  State<TomorrowLunch> createState() => _TomorrowLunchState();
}

class _TomorrowLunchState extends State<TomorrowLunch> {
  @override
  Widget build(BuildContext context) {
    print("tomorrow Lunch Calles");
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: ListView.separated(
              itemCount: widget.lunch.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.lunch[index]
                                .mealType
                                .toString(),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight:
                                FontWeight
                                    .w600,
                                color: Color(
                                    0xFF00B925)),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets
                            .symmetric(
                            horizontal:
                            10),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .start,
                          children: [
                            Text(
                              widget.lunch[index]
                                  .title
                                  .toString(),
                              style: TextStyle(

                                  fontWeight:
                                  FontWeight
                                      .bold),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                              const EdgeInsets
                                  .only(
                                  top:
                                  7.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                  Text( DateFormat('MMM-dd-yyyy').format( widget.lunch[index].date!), style: TextStyle(
                                      fontSize:
                                      10.0),),
                                  Text(
                                    widget.lunch[
                                    index]
                                        .time
                                        .toString(),
                                    style: TextStyle(
                                        fontSize:
                                        10),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder:
                  (BuildContext context,
                  int index) {
                return SizedBox(
                  height: 20,
                );
              },
            ),
          ),
        ));
  }
}
