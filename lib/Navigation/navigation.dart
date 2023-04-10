import 'package:flutter/material.dart';
import 'package:ingn/Pages/categories_page.dart';
import 'package:ingn/Pages/favorite_page.dart';
import 'package:ingn/Pages/games/GameDetail.dart';
import 'package:ingn/Pages/home_page.dart';
import 'package:ingn/Pages/page1.dart';
import 'package:ingn/Pages/search/search_page.dart';
import 'package:ingn/theme/theme.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex  = 0;

  static final List<Widget> widgetOptions =<Widget>[
    const HomePage(),
    CategoriesPage(),
    SearchPage(),
    FavouritesPage(),
  ];

  void iteamTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home , size: 30,color: selectedIndex == 0 ? AppColors.orange : AppColors.darkGrey,),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category , size: 30,color: selectedIndex == 0 ? AppColors.darkGrey : AppColors.orange ,),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search , size: 30,color: selectedIndex == 0 ? AppColors.darkGrey : AppColors.orange ,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add , size: 30,color: selectedIndex == 0 ? AppColors.darkGrey: AppColors.orange,),
            label: 'Whishlist',
          ),
        ],

        currentIndex: selectedIndex,
        selectedLabelStyle:const TextStyle(
          fontWeight: FontWeight.normal,color: AppColors.orange
        ) ,
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,color: AppColors.dark
        ),
       backgroundColor: AppColors.dark,
        selectedItemColor: AppColors.orange,
        unselectedItemColor: AppColors.darkGrey,
        onTap: iteamTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
