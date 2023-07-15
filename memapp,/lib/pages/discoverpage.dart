import 'package:flutter/material.dart';
import 'package:memapp/widgets/bottomnavigationbar.dart';
import 'package:memapp/widgets/searchcart.dart';

class DiscoverPage extends StatelessWidget{
  const DiscoverPage({
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white ,
        centerTitle: true,
        title: const SearchBar(),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context,index){
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height/2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                SearchCart(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(profilepressed: false,searchpressed: true,uploadpressed: false),
    );
  }
}

class SearchBox extends SearchDelegate{

  List<String> data = [
    "Numan", "Eren", "Sinem", "Ahmet", "Veli", "Ayşe", "Fatma",
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        icon: const Icon(Icons.clear) ,
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back) ,
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in data) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in data) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index){
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showSearch(context: context,
          delegate: SearchBox(),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/20,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
          color: Colors.grey[400]
    ),
        child: Row(
          children: const <Widget>[
            SizedBox(width: 5,),
            Icon(Icons.search),
            SizedBox(width: 10,),
            Text("Ara"),
          ]
        ),
    ),
    );
  }
}
