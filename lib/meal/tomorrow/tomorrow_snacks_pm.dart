import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/meal_model.dart';
class TomorrowSnacksPM extends StatefulWidget {
  List<MealModel> snacksPM = [];

  TomorrowSnacksPM({required this.snacksPM,Key? key}) : super(key: key);

  @override
  State<TomorrowSnacksPM> createState() => _TomorrowSnacksPMState();
}

class _TomorrowSnacksPMState extends State<TomorrowSnacksPM> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: ListView.separated(
              itemCount: widget.snacksPM.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.snacksPM[index]
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
                              widget.snacksPM[index]
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
                                  10.0),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                                children: [
                                Text( DateFormat('MMM-dd-yyyy').format( widget.snacksPM[index].date!),),

                                Text(
                                    widget.snacksPM[
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
