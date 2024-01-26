import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oyo/comman/dotted_line.dart';
import 'package:oyo/constant/constant.dart';
import 'package:oyo/constant/loader.dart';
import 'package:oyo/features/booking/provider/bookingProvider.dart';
import 'package:oyo/features/detailScreen/screen/detailScreen.dart';
import 'package:oyo/features/detailScreen/service/bookingService.dart';
import 'package:oyo/models/bookingModels.dart';
import 'package:provider/provider.dart';

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
  List<BookingModel>? bookedList;
  final BookingService bookingService = BookingService();



  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
    // searchService = SearchService();
    fetchBookList();
  }
    fetchBookList() async {
      await bookingService.getAllBooking(context: context);
      setState(() {
        bookedList = Provider.of<BookingProvider>(context, listen: false).bookingList;
      });
    
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
        body: Consumer<BookingProvider>(
          builder: (context, bookingProvider, child) {
            if (bookingProvider == null) {
              return Center(child: Loader());
            } else if (bookingProvider.bookingList.isEmpty) {
              return Center(child: Text("No Booking Found"));
            } else {
              return ListView.builder(
                itemCount: bookingProvider.bookingList.length,
                itemBuilder: (context, index) {
                  return BookListItem(bookingModel: bookingProvider.bookingList[index]);
                },
              );
            }
          },
        )
        );
  }
}

class BookListItem extends StatelessWidget {
   final BookingModel  bookingModel;

  const BookListItem({
    super.key,
   required this.bookingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      // width: 300,
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
                  "${bookingModel.hallId}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "${bookingModel.hallId}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // date
                SizedBox(height: 5),
                Text(
                  "Booking Date : ${DateFormat('MMM dd yyyy').format(bookingModel.bookingDate)}",
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
            "Status : ${bookingModel.status}",
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
                  onPressed: () {

                    BookingService().deleteBooking(context: context, bookingId: bookingModel.id);



                  },
                  child: Text("Cancel", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),))
            ],
          ),
        ],
      ),
    );
  }
}
