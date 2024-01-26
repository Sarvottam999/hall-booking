import 'package:flutter/material.dart';
import 'package:oyo/comman/dotted_line.dart';
import 'package:oyo/constant/constant.dart';
import 'package:oyo/features/detailScreen/screen/detailScreen.dart';

class BookingScreen extends StatefulWidget {
  static const String namedRoute = '/BookingScreen';
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // TextEditingController _searchController = TextEditingController();
  // SearchService? searchService ;
  // List<Hall> hallList = [];

  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
    // searchService = SearchService();
  }

  // onSearchTextChanged( String text ){
  //   print("######################## $text");
  //   searchService!.fetchSearchedByParam(context: context, searchValue:  text).then((value) => {
  //     setState(() {
  //       hallList = value;
  //     })
  //   });
  // }

  @override
  void dispose() {
    // _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text("Your Booking", style: TextStyle(color: pink, fontSize: 25, fontWeight: FontWeight.bold),),
        ),
        body: ListView(children: [
          // bookin container that shows : hall name, address, status, price
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, DetailScreen.namedRoute);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hall Name : Green park hall",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Address : 123, abc, xyz",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // date
                        SizedBox(height: 5),
                        Text(
                          "Booking Date : 12/12/2021",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MySeparator(),
                  SizedBox(height: 5),
                  Text(
                    "Status : Booked",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price : 1000",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      // button for cancel
                      TextButton(
                          style: ButtonStyle(
                             
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(pink),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10.0), // Adjust the radius as needed
                                ),
                              )),
                          onPressed: () {},
                          child: Text("Cancel", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
