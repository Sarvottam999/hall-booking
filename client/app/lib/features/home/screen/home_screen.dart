import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oyo/constant/constant.dart';
import 'package:oyo/constant/loader.dart';
import 'package:oyo/constant/utils.dart';
import 'package:oyo/features/detailScreen/screen/detailScreen.dart';
import 'package:oyo/features/favourit/screen/favouritScreen.dart';
import 'package:oyo/features/favourit/service/favService.dart';
import 'package:oyo/features/home/service/homeService.dart';
import 'package:oyo/features/home/models/venueModel.dart';
import 'package:oyo/providers/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeService searchServices = HomeService();
  List<Hall>? halls;

  @override
  void initState() {
    super.initState();
    fetchSearchedProduct();
  }

  fetchSearchedProduct() async {
    var temp = await searchServices.fetchSearchedProduct(context: context);
    print(temp.length);
    setState(() {
      halls = temp;
    });
  }

  void navigateToSearchScreen(String query) {
    // Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Book Halls",
          style: TextStyle(
              fontFamily: "HankenGrotesk",
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: pink),
        ),
        actions: [
          //like vutton
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, FavoriteHallsScreen.namedRoute,
                  arguments: Provider.of<UserProvider>(context, listen: false)
                      .user
                      .id);
            },
            icon: Icon(
              Icons.favorite_border,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
        // title: SvgPicture.asset(
        //   "assets/ooy.svg",
        //   height: 30,
        // ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // search bar
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      place_imgs[index]["img"]
                                          .toString(), // "assets/places/p_1_banaras.jpeg"
                                    ),
                                    fit: BoxFit.cover),
                                color: Color.fromARGB(255, 255, 0, 0),
                                shape: BoxShape.circle

                                // borderRadius: BorderRadius.circular(38),
                                ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            place_imgs[index]["name"].toString(),
                            style: TextStyle(fontSize: 15),
                            // textAlign: TextAlign.center
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text(
                "Handpicked for you",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 15,
              ),

              halls == null
                  ? const Loader()
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: halls!.length,
                          itemBuilder: (context, index) {
                            return FleatureItem(hall: halls![index]);
                          })),

              Text(
                "Tap for the best experience",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 15,
              ),

              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      // color: Color.fromARGB(255, 245, 245, 245),
                      image: DecorationImage(
                          image: AssetImage("assets/thumbnail/t2.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.topRight,
                  height: 200,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Presenting",
                            style: TextStyle(
                                fontFamily: "HankenGrotesk",
                                fontWeight: FontWeight.w900,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            "Super Offer",
                            style: TextStyle(
                                fontFamily: "HankenGrotesk",
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.white, // foreground (text) color

                            foregroundColor:
                                Colors.black, // background (button) color
                          ),
                          onPressed: () {},
                          child: Text("Book Now"))
                    ],
                  )),

              SizedBox(
                height: 50,
              ),
              Text(
                "Wedding Photos, Latest Trends & Ideas",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),

                          // width: double.infinity,
                          width: 300,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/thumbnail/t${index + 1}.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10)),
                        );
                      })),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FleatureItem extends StatefulWidget {
  Hall hall;
  FleatureItem({super.key, required this.hall});

  @override
  State<FleatureItem> createState() => _FleatureItemState();
}

class _FleatureItemState extends State<FleatureItem> {
  final FavService favService = FavService();
  bool? isFavorite;

  // void addToFavorites(String hallId, BuildContext context) async {
  //   await favService.addToFavorites(
  //   userId: Provider.of<UserProvider>(context, listen: false). user.id,
  //       context: context,
  //       hallId: hallId);
  // }
  // initstate
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setFav(
      userId: Provider.of<UserProvider>(context, listen: false).user.id, 
      hall: widget.hall.id);
  }

  Future<void> setFav({required String userId, required hall}) async {
    final userFavoriteHalls =
        await favService.getUserFavoriteHalls(context: context, userId: userId);
if (userFavoriteHalls.isEmpty ) {
      isFavorite = false;


  
}
else{
  final targetHall = userFavoriteHalls.firstWhere((h) => h.id == hall);
    isFavorite =  userFavoriteHalls.contains(widget.hall.id);
    print("is fav ====================");

    setState(() {
       if (targetHall != null) {
      print('Found hall with ID : $targetHall');
      isFavorite = true;
    } else {
      print('Hall with ID   not found');
      isFavorite = false;

    }
    //
     });

}
    
  }

  Future<void> toggleFavoriteStatus() async {
    bool success = false;

    try {
      if (isFavorite!) {
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      // color: Color.fromARGB(255, 240, 240, 240),
      height: 300,
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                // color: Color.fromARGB(255, 245, 245, 245),
                image: DecorationImage(
                    image:
                        AssetImage("assets/places/p_1_banaras.jpeg"), // image
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.topRight,
            height: 150,
            width: 230,
            child: GestureDetector(
              onTap: () {
                print("---------------- > insode gesture detector");
                toggleFavoriteStatus();
              },
              child: Container(
                  height: 35,
                  width: 35,
                  // padding: EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      shape: BoxShape.circle),
                  child: Icon(
                    isFavorite == null || isFavorite == false
                        ? Icons.favorite_border
                        : Icons.favorite,
                    size: 20,
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 20,
                color: Color.fromARGB(255, 221, 70, 0),
              ),
              Text("  ${widget.hall.reviews.first.rating}  "), // rating
              Text(
                "(${widget.hall.reviews.length} )", // review length
                style: TextStyle(color: Color.fromARGB(255, 114, 114, 114)),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${widget.hall.name}", // name
            style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 15.0),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "${widget.hall.location}", // location
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 12.0,
                color: Colors.grey),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "₹ ${widget.hall.pricePerPlate} /-",
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  // color: Colors.grey
                ),
              ),

              // go to detail page
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, DetailScreen.namedRoute,
                      arguments: widget.hall);
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Text("View Details  "),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
