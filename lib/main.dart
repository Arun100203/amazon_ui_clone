import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SingleChildScrollView(
          child: Container(
            height: 900,
            width: double.infinity,
            child: const Scaffold(
              body: PrefetchImageDemo(),
            ),
          ),
        )
    );
  }
}

class PrefetchImageDemo extends StatefulWidget {
  const PrefetchImageDemo({Key? key}) : super(key: key);

  @override
  State<PrefetchImageDemo> createState() => _PrefetchImageDemoState();
}

class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
  final List<String> images = [
    'https://m.media-amazon.com/images/I/61TD5JLGhIL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/61jovjd+f9L._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/61DUO0NqyyL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/71qid7QFWJL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/71aQ3u78A3L._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/71dbxIcDioL._SX3000_.jpg',
    'https://m.media-amazon.com/images/I/71tIrZqybrL._SX3000_.jpg'
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [

          Container(
            height: 400,
            child: Scaffold(
              body: ListView(
                  children: [
                    CarouselSlider.builder(
                      itemCount: images.length,
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 3.2,
                        enlargeCenterPage: false,
                      ),
                      itemBuilder: (context, index, realIdx) {
                        return Center(
                            child: Image.network(images[index],
                                fit: BoxFit.cover, width: double.infinity));
                      },
                    ),

                  ]
              ),
            ),
          ),

          Positioned(
            top: 250,
            left: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 500,
                    width: 300,
                    color: Colors.white,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      crossAxisSpacing: 2,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("       Gaming",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                decoration: TextDecoration.none,
                                color: Colors.black
                            ),),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("accessories",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                decoration: TextDecoration.none,
                                color: Colors.black
                            ),),
                        ),
                        Image.network(
                            "https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Headset_1x._SY116_CB667159060_.jpg"),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Keyboard_1x._SY116_CB667159063_.jpg'),
                        const Text("HeadSets", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black
                          ),),
                        const Text("KeyBoards", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black
                          ),),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Mouse_1x._SY116_CB667159063_.jpg'),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Chair_1x._SY116_CB667159060_.jpg'),
                        const Text("Computer mice", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black
                          ),),
                        const Text("Chairs", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black
                          ),),
                        TextButton(
                            onPressed: () {},
                            child: Text('see more')
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 500,
                    width: 300,
                    color: Colors.white,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("       Shop by",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                decoration: TextDecoration.none,
                                color: Colors.black
                            ),),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Category",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                decoration: TextDecoration.none,
                                color: Colors.black
                            ),),
                        ),
                        Image.network(
                            "https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2019/February/Dashboard/computer120x._SY85_CB468850970_.jpg"),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2019/August/DashboardCard/PS4_120X._SY85_CB438749318_.jpg'),
                        const Text("Computer &\n Accessories",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black
                          ),),
                        const Text("VideoGames", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black
                          ),),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2019/February/Dashboard/Baby120X._SY85_CB468850882_.jpg'),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2019/February/Dashboard/Toys120X._SY85_CB468851693_.jpg'),
                        const Text("Baby", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black
                          ),),
                        const Text(
                          "Toys &\n Games", textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black
                          ),),
                        TextButton(
                            onPressed: () {},
                            child: Text('see more')
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 500,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Find your ideal TV", textAlign: TextAlign
                              .start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                                decoration: TextDecoration.none,
                                color: Colors.black
                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.network(
                              'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2020/May/Dashboard/Fuji_Dash_TV_2X._SY304_CB432517900_.jpg'),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text('see more')
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 500,
                    width: 300,
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
          ),

        ],

      ),

    );
  }
}
