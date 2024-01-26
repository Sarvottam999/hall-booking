import 'package:flutter/material.dart';
import 'package:oyo/constant/constant.dart';
import 'package:oyo/features/detailScreen/screen/checkScreen.dart';
import 'package:oyo/features/favourit/service/favService.dart';
import 'package:oyo/features/home/models/venueModel.dart';
import 'package:oyo/features/home/screen/home_screen.dart';

import 'package:oyo/features/detailScreen/provider/user.dart';
import 'package:oyo/features/detailScreen/widget/custom_buttom.dart';
import 'package:oyo/providers/user_provider.dart';

import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreen extends StatefulWidget {
  static const String namedRoute = '/detailScreen';
  // final int hall_id;
  final Hall hall;
  DetailScreen({super.key, required this.hall});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

// icon for price
   
 
class _DetailScreenState extends State<DetailScreen> {
  bool isFavorite = false;
  bool readmore = false;
  int? maxLines = 2; 
  final FavService favService = FavService();
  // You can change this variable to control maxLines

  late List<List<dynamic>> tableData;

  @override
  void initState() {
    super.initState();

    tableData = [
      ['People', '${widget.hall.capacity}', Icons.people],
      ['Rate per plate', '\$${widget.hall.pricePerPlate}', Icons.attach_money],
    ];
  }

   Future<void> toggleFavoriteStatus( ) async {
    bool success = false;

    try {
      if (isFavorite) {
        final remStas = await favService.removeFromFavorites(
            context: context,
            hallId: widget.hall.id,
            userId: Provider.of<UserProvider>(context, listen: false).user.id);
        if (remStas) {
          setState(() {
            isFavorite = false; // Rollback the UI update
          });
        }
      } else {
        final addstas = await favService.addToFavorites(
            context: context,
            hallId: widget.hall.id,
            userId: Provider.of<UserProvider>(context, listen: false).user.id);
        if (addstas) {
          setState(() {
            isFavorite = true; // Rollback the UI update
          });
        }
      }
    } catch (error) {
      // Handle errors and rollback the UI update if necessary
      print('Error toggling favorite status: $error');
      setState(() {
        isFavorite = false; // Rollback the UI update
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),

            iconSize: 22.0, // Adjust the icon size as per your design
            color: const Color.fromARGB(
                255, 255, 255, 255), // Adjust the icon color as per your design
            onPressed: () {
              Navigator.pop(context);
              // Add your onPressed functionality here
              print('back button pressed');
            },
          ),
          actions: [
            GestureDetector(
              onTap: () {
                 print("---------------- > insode gesture detector");
                toggleFavoriteStatus();
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 238, 238, 238),
                ),
                child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
        body: Builder(builder: (context) {
          return SingleChildScrollView(
            child: Container(
          margin: EdgeInsets.only(bottom: 40),

                alignment: Alignment.center,
                // height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(),
                child: Column(
                  children: [
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 370,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset("assets/thumbnail/t2.jpg",
                                fit: BoxFit.fitHeight),
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.hall.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                          //  =============== ratings -----------
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                          widget.hall.location),

                          SizedBox(
                            height: 15,
                          ),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RatingBar.builder(
                                  initialRating:
                                      widget.hall.reviews.first.rating,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2.0),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemSize: 25,
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                                Text(
                                  "  4.0",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: yellow,
                                      fontWeight: FontWeight.w700,
                                      overflow: TextOverflow.clip),
                                ),
                              ]),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Description",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          Container(
                            color: const Color.fromARGB(31, 255, 255, 255),
                            // height: 50,
                            // width: double.infinity,
                            child: Text(
                              widget.hall.about,
                              maxLines: maxLines,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 148, 148, 148)),
                            ),
                          ),
                          readmore == false
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      maxLines = maxLines == 2 ? null : 2;

                                      readmore = !readmore;
                                    });
                                  },
                                  child: Text(
                                    "Read more...",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w700,
                                        overflow: TextOverflow.clip),
                                  ),
                                )
                              : Center(),
                          // ================  size ===============

                          SizedBox(height: 30),

                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Table(
                              border: TableBorder.symmetric(
                                inside:
                                    BorderSide(width: 2, color: Color.fromARGB(255, 238, 237, 237)),
                              ),
                              children: List.generate(
                                tableData.length,
                                (rowIndex) => TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Padding(

                                                  padding: const EdgeInsets.symmetric( horizontal: 10.0),
                                                  child: Icon(tableData[rowIndex][2] ),
                                                ),
                                                Text(tableData[rowIndex][0]),
 
                                              ],
                                            ),
                                      ),
                                    ),
                                    TableCell(
                                      
                                      child: Padding(
                                        
                                        padding: const EdgeInsets.all(10.0),
                                        child:
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Text(tableData[rowIndex][1], style: TextStyle(color: Colors.blue),),
 
                                              ],
                                            ),
                                      ),
                                    ),
                                  ]
                                ),
                              ),
                            ),
                          ),
                          // Divider(
                          //   height: 2,
                          //   color: const Color.fromARGB(255, 202, 202, 202),
                          //   thickness: 1,
                          //   indent: 10,
                          //   endIndent: 10,
                          // ),
                          SizedBox(height: 50),

                          // =================================
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomButton(
                                  type: ButtonType.Filled,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, SltDateScreen.namedRoute,
                                        arguments: widget.hall.id);
                                  },
                                  text: "Choose Date",
                                  icon: Icons.date_range_outlined),
                              CustomButton(
                                  type: ButtonType.Outline,
                                  onPressed: () {},
                                  text: "book",
                                  icon: Icons.book)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        }));
  }
}
