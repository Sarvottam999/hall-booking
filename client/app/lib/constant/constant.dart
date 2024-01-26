


// const url  = "http://localhost:4000";
import 'package:flutter/material.dart';

const url = "http://10.0.2.2:4000";


// array of 8 images assets/places/p_1_banaras.jpeg assets/places/p_2_jhansi-fort-main-gate.jpg assets/places/p_3_agra_Tomb_Akbar.jpg assets/places/p_4_agra_tajmahal.jpg assets/places/p_5_Kushinagar_chinese_temple.jpeg assets/places/p_6_Vrindavan_Prem_Mandir.jpg assets/places/p_7_ayodhya_ram_mandir.jpg assets/places/p_8_pragraj.jpg

 

// create a json with image and name of the place

const List<Map<String,String>> place_imgs = [
  {
    "img":"assets/places/p_1_banaras.jpeg",
    "name":"Banaras"
  },
  {
    "img":"assets/places/p_2_jhansi-fort-main-gate.jpg",
    "name":"Jhansi"
  },
  {
    "img":"assets/places/p_3_agra_Tomb_Akbar.jpg",
    "name":"Agra"
  },
  {
    "img":"assets/places/p_4_agra_tajmahal.jpg",
    "name":"Taj Mahal"
  },
  {
    "img":"assets/places/p_5_Kushinagar_chinese_temple.jpeg",
    "name":"Kushinagar"
  },
  {
    "img":"assets/places/p_6_Vrindavan_Prem_Mandir.jpg",
    "name":"Vrindavan"
  },
  {
    "img":"assets/places/p_7_ayodhya_ram_mandir.jpg",
    "name":"Ayodhya"
  },
  {
    "img":"assets/places/p_8_pragraj.jpg",
    "name":"Prayagraj"
  }
];


//color
const Color pink =  Color(0xffD35E92);
const Color yellow =  Color.fromARGB(255, 255, 196, 0);
   const secondaryColor = Color(0xffD35E92);
   const backgroundColor = Colors.white;
   const Color greyBackgroundCOlor = Color(0xffebecee);
   var selectedNavBarColor = Colors.black87;
   const unselectedNavBarColor = Colors.black87;
   // light pink
    const Color lightPink = Color(0xffF8E8F4);



 

 // json for hall api
 