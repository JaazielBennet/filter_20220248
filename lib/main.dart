import 'package:flutter/material.dart';
import 'package:flutter_filter_20220248/model/movie_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buscador',
      debugShowCheckedModeBanner: false,
      home: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPage();
}

class _SearchPage extends State<SearchPage> {
  static List<MovieModel> mainMovieList = [
    MovieModel("Kung Fu Panda 4", 2024, 9.5,
        "https://th.bing.com/th?id=OSK.0THj7cUeBQfZpcHmRB1NyH3FgbEcq1NC1VXghLApbIw&w=46&h=46&c=11&rs=1&qlt=80&o=6&dpr=2&pid=SANGAM"),
    MovieModel("Damsel", 2024, 9.6,
        "https://th.bing.com/th/id/OIF.SRFEKZ9fSqMZ3n4z90Up4w?w=272&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Ted 2", 2015, 8.6,
        "https://th.bing.com/th/id/OIP.RthAyR6Vs3P16nrPjKusoAHaLH?w=118&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Resident Evil", 2002, 9.3,
        "https://th.bing.com/th/id/OIP.fw6JDy-VIOY6dqgCm09HOwAAAA?pid=ImgDet&w=202&h=303&c=7"),
    MovieModel("Chappie", 2015, 9.2,
        "https://th.bing.com/th/id/OIP.WnpNnLKcB4FtRWLUbotamQHaLH?w=115&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Ghost Rider", 2007, 7.3,
        "https://th.bing.com/th/id/OIP.aLelYT7RPP02nz-CZcSTQQHaK-?w=204&h=303&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Bumblebee", 2018, 9.4,
        "https://th.bing.com/th/id/OIP.5t3gcJ006QH73qlVFQ9kZgHaLH?w=119&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Pandora", 2016, 9.7,
        "https://th.bing.com/th/id/OIP.myvXNFT7mmazfmWkBjsURwHaLH?w=204&h=306&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Lucy", 2014, 9.6,
        "https://th.bing.com/th/id/OIP.5lkUNKtAztHVLGFeWkCGgwHaLH?w=115&h=180&c=7&r=0&o=5&pid=1.7"),
    MovieModel("Bird Box", 2018, 9.8,
        "https://th.bing.com/th/id/OIP.TlDV3CQ5qhJgPVXnnCJGFwHaLL?w=121&h=183&c=7&r=0&o=5&pid=1.7"),
  ];

  List<MovieModel> displayList = List.from(mainMovieList);

  void updateList(String value) {
    setState(() {
      displayList = mainMovieList
          .where((element) =>
              element.movieTitle!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Buscador de películas',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              onChanged: (value) => updateList(value),
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF1f1545),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Buscar",
                prefixIcon: const Icon(Icons.search),
                prefixIconColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: displayList.length == 0
                  ? Center(
                      child: Text(
                        "No Hay Resultados",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayList.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          displayList[index].movieTitle!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${displayList[index].releaseYear!}',
                          style: TextStyle(color: Colors.white60),
                        ),
                        trailing: Text(
                          "${displayList[index].rating}",
                          style: TextStyle(color: Colors.amber),
                        ),
                        leading: Image.network(displayList[index].imageUrl!),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
