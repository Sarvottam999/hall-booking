import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:oyo/features/detailScreen/screen/detailScreen.dart';
import 'package:oyo/features/home/models/venueModel.dart';
import 'package:oyo/features/search/service/searchService.dart';


class SearchScreen extends StatefulWidget {

  static const String namedRoute = '/searchScreen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  SearchService? searchService ;
  List<Hall> hallList = [];


  @override
  void initState() {
    // TODO: implement initStat
    super.initState();
    searchService = SearchService();

  }

  onSearchTextChanged( String text ){
    print("######################## $text");
    searchService!.fetchSearchedByParam(context: context, searchValue:  text).then((value) => {
      setState(() {
        hallList = value;
      })
    });
  }

  @override
void dispose() {
  _searchController.dispose();
  super.dispose();
}


  @override
  Widget build(BuildContext context) {
    return  Column(
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
              child: TextField(
                
              
                
                controller: _searchController,
                decoration: InputDecoration(
               prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
              ),
                  
 
                  hintText: "Search",
                  border: InputBorder.none,
                  
                ),
                onChanged: (value) => onSearchTextChanged(value),
               ),
            ),
           (hallList.length == 0)?
            Expanded(child: Container(
              color: Colors.white,
              child: Center(),
            )):

            /// search result
            Expanded(
              child: ListView.builder(
                itemCount: hallList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DetailScreen.namedRoute,
                          arguments: hallList[index],
                        );
                      },
                      child: Row(
                        children: [
                        
                          SizedBox(width: 20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hallList[index].location,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  hallList[index].name,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
 



      ],
    );
  }
}