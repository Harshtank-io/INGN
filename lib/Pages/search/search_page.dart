import 'package:flutter/material.dart';
import 'package:ingn/theme/theme.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 32,
          child: TextFormField(
            controller: searchController,
            enabled: false,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              focusedBorder: _border(AppColors.orange),
              border: _border(AppColors.darkGrey),
              enabledBorder: _border(AppColors.darkGrey),
              hintText: 'Start search',
              contentPadding: const EdgeInsets.symmetric(vertical: 20),
              prefixIcon: const Icon(Icons.search, color: AppColors.darkGrey),
            ),
          ),
        ),
      ),

    );
  }
  OutlineInputBorder _border(Color color) => OutlineInputBorder(
    borderSide: BorderSide(width: 0.5, color: color),
    borderRadius: BorderRadius.circular(12),
  );
}
