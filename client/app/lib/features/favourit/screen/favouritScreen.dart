import 'package:flutter/material.dart';
import 'package:oyo/constant/constant.dart';
import 'package:oyo/features/favourit/service/favService.dart';
import 'package:oyo/features/home/models/venueModel.dart';
import 'package:oyo/features/home/screen/home_screen.dart';
// import 'api_service.dart'; // Replace with the actual file name of your ApiService

class FavoriteHallsScreen extends StatefulWidget {
  // FavouritScreen.namedRoute
  static const String namedRoute = '/favouritScreen';
  final String userId;

  FavoriteHallsScreen({required this.userId});

  @override
  _FavoriteHallsScreenState createState() => _FavoriteHallsScreenState();
}

class _FavoriteHallsScreenState extends State<FavoriteHallsScreen> {
    FavService? favService  ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    favService = FavService();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
          ),
        
      body: FutureBuilder<List<Hall>>(
        future:  favService!.getUserFavoriteHalls( userId: widget.userId, context: context),
        builder: (context, snapshot) {
          print("********* snapshot  **********");
          print(snapshot.data);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No favorite halls found.'));
          } else {
              
                return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, 
                childAspectRatio:2/3, ),
                itemCount: snapshot.data!.length,
                 itemBuilder: (context, index) {
                final hall = snapshot.data![index];
                return FleatureItem(hall: hall);
                
                //  Card(
                //   color: Color.fromARGB(255, 255, 213, 227),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     // Image.network(hall.photos.first),
                //     Container(
                //       height: 100,
                //       width: 100,
                //       color: Colors.black,
                //       child: Image.asset(  "assets/places/p_1_banaras.jpeg", fit: BoxFit.cover,),
                //     ),
                //     Text(hall.name),
                //     Text(hall.pricePerPlate.toString()),
                //     Text(hall.capacity.toString()),
                //     Text(hall.location),
                //     Text(hall.about),
                //   ],
                //     ),
                // );
              
              
              });
          
          }
        },
      ),
    );
  }
}
 