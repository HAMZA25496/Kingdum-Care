import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kingdum_care/models/meal_model.dart';
class TomorrowSnacksAm extends StatefulWidget {
  List<MealModel> snacksAM = [];

   TomorrowSnacksAm({required this.snacksAM,Key? key}) : super(key: key);

  @override
  State<TomorrowSnacksAm> createState() => _TomorrowSnacksAmState();
}

class _TomorrowSnacksAmState extends State<TomorrowSnacksAm> {
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
              itemCount: widget.snacksAM.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            widget.snacksAM[index]
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
                              widget.snacksAM[index]
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
                                  Text( DateFormat('MMM-dd-yyyy').format( widget.snacksAM[index].date!),
                                    style: TextStyle(
                                        fontSize:
                                        10),
                                  ),
                                  Text(
                                    widget.snacksAM[
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
                  height: 10,
                );
              },
            ),
          ),
        ));
  }
}
