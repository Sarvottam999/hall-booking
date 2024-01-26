import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:oyo/constant/constant.dart';
import 'package:oyo/features/detailScreen/service/detailService.dart';
import 'package:oyo/models/venueModel.dart';
import 'package:oyo/features/detailScreen/provider/user.dart';
import 'package:oyo/features/detailScreen/widget/custom_buttom.dart';
import 'package:oyo/providers/user_provider.dart';
import 'package:provider/provider.dart';
 // class HomeService  {

class SltDateScreen extends StatelessWidget {
  final String hallid;
  SltDateScreen({required this.hallid});


  DetailService detailService = DetailService();

    static  const String  namedRoute = '/checkScreen';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
         leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () => Navigator.of(context).pop(),
         )
       ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              // padding: EdgeInsets.fromLTRB(20, 0, 30, 0),
              alignment: Alignment.center,
              height: 200,
              width: 340,
              decoration: BoxDecoration(
                // color: pink,
                border: Border.all( color: pink, width: 2.0
                   ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  SizedBox(height: 20),
             
                   Consumer<UserProvider>(
                  builder: (context, dateProvider, child) {
                    return Text(
                      dateProvider.isDateSelectedAval ? 'Available' : 'Not Available',

                      // DateFormat('yyyy-MM-dd').format(dateProvider.selectedDate),
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    );
                  },
                  ),
                  

                  Container(
                    height: 2,
                    // width: 100,
                    color: pink,
                  ),
                  Text(
                    'Selected Date',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Consumer<UserProvider>(
                  builder: (context, dateProvider, child) {
                    return Text(
                      dateProvider.selectedDateFormated,

                      // DateFormat('yyyy-MM-dd').format(dateProvider.selectedDate),
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    );
                  },
                  ),
                 
                ],
              )
              
            ),
            


           
            
            SizedBox(height: 20),
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomButton(
                onPressed: ()  async  { 
                  // sendRequest(context);
                       await _selectDate(context);
                      await detailService.checkAvailability(context: context,hallId: hallid, date: Provider.of<UserProvider>(context, listen: false).selectedDate);

                 
                   },
                text: 'Select Date',
                icon: Icons.calendar_today,
                type: ButtonType.Filled,
               ),
            ),
          ],
        ),
      ),
    );
  }

  sendRequest( context) async{
                   
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: pink, // header background color
              onPrimary: Color.fromARGB(255, 255, 255, 255), // header text color
              onSurface: pink, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: pink, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
  
  
      

    );

    if (picked != null && picked != Provider.of<UserProvider>(context, listen: false).selectedDate) {
      Provider.of<UserProvider>(context, listen: false).setSelectedDate(picked);
    }
  }
}