import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

List<String> imageUrls = [

  'https://m.media-amazon.com/images/I/61XvxaSCHdL._AC_SY200_.jpg',
  'https://m.media-amazon.com/images/I/61SyZZAIqRL._AC_SY200_.jpg',
  'https://m.media-amazon.com/images/I/61XbwII8h7L._AC_SY200_.jpg',
  'https://m.media-amazon.com/images/I/71M2jqoK7XL._AC_SY200_.jpg',
  'https://m.media-amazon.com/images/I/51EEa+prjXL._AC_SY200_.jpg',
  'https://m.media-amazon.com/images/I/71VC-83rr7L._AC_SY200_.jpg'
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        child: SizedBox(
          height: 5620,
          child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  "amazon",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                  ),
                ),
                backgroundColor: Colors.black,
                actions: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.location_on_outlined),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Text(
                      "Deliver to \n India",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 60,
                        width: 800,
                        child: Theme(
                          data: ThemeData(
                            primaryColor: Colors.orangeAccent,
                            primaryColorDark: Colors.orange,
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.orange,
                                    width: 3.0,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: const Icon(
                                Icons.search,
                              ),
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all((8.0)),
                    child: TextButton(
                      onPressed: () {},
                      child: Column(
                        children: const [
                          Text(
                            "Hello Sing in",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Account & Lists",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          " Returns\n & Orders",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        )),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_cart_outlined),
                  ),
                ],
              ),
              body: PrefetchImageDemo()),
        ),
      ),
    );
  }
}

class PrefetchImageDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
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
          Scaffold(
            body: ListView(children: [
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
            ]),
          ),
          Positioned(
            top: 250,
            left: 31,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "       Gaming",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "accessories",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Image.network(
                            "https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Headset_1x._SY116_CB667159060_.jpg"),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Keyboard_1x._SY116_CB667159063_.jpg'),
                        const Text(
                          "HeadSets",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                        const Text(
                          "KeyBoards",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Mouse_1x._SY116_CB667159063_.jpg'),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Chair_1x._SY116_CB667159060_.jpg'),
                        const Text(
                          "Computer mice",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                        const Text(
                          "Chairs",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'see more',
                                textAlign: TextAlign.start,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 2,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "       Shop by",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Category",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 23,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Image.network(
                            "https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2019/February/Dashboard/computer120x._SY85_CB468850970_.jpg"),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2019/August/DashboardCard/PS4_120X._SY85_CB438749318_.jpg'),
                        const Text(
                          "Computer &\n Accessories",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                        const Text(
                          "VideoGames",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2019/February/Dashboard/Baby120X._SY85_CB468850882_.jpg'),
                        Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2019/February/Dashboard/Toys120X._SY85_CB468851693_.jpg'),
                        const Text(
                          "Baby",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                        const Text(
                          "Toys &\n Games",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.none,
                              color: Colors.black),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'see more',
                                textAlign: TextAlign.start,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Find your ideal TV",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 26,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(9, 10, 9, 10),
                          child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2020/May/Dashboard/Fuji_Dash_TV_2X._SY304_CB432517900_.jpg',
                            height: 330,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'see more',
                                textAlign: TextAlign.right,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Sign in for the best experience",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.yellow,
                                elevation: 2,
                                shadowColor: Colors.amber,
                              ),
                              child: const Text(
                                'sign in securely',
                                textAlign: TextAlign.start,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2020/October/Fuji_D2_45M_en_US_1x._CB418309979_.jpg',
                            height: 300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 725,
              left: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 450,
                      width: 300,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Health & Personal Care",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2022/February/DashboardCards/GW_CONS_AUS_HPC_HPCEssentials_CatCard_Desktop1x._SY304_CB627424361_.jpg',
                              height: 300,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'see more',
                                  textAlign: TextAlign.left,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 450,
                      width: 300,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Get fit at home",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://images-na.ssl-images-amazon.com/images/G/01/events/GFAH/GWDesktop_SingleImageCard_fitathome_1x._SY304_CB434924743_.jpg',
                              height: 300,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'Explore more',
                                  textAlign: TextAlign.left,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 450,
                      width: 300,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Electronics",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2020/May/Dashboard/Fuji_Dash_Electronics_1x._SY304_CB432774322_.jpg',
                              height: 300,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'shop more',
                                  textAlign: TextAlign.left,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      height: 450,
                      width: 300,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Toys Under \$ 30",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://images-na.ssl-images-amazon.com/images/G/01/US-hq/2022/img/Amazon_Exports/XCM_CUTTLE_1469244_2584128_379x304_1X_en_US._SY304_CB609318944_.jpg',
                              height: 300,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  'shop more',
                                  textAlign: TextAlign.left,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: 1212,
            left: 45,
            child: Container(
              height: 320,
              width: 1275,
              color: Colors.white,
              child: SizedBox(
                height: 289,
                width: 1275,
                child: Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    title: const Text(
                      'Frequently repurchased in Supplies',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                      ),
                    ),
                    backgroundColor: Colors.white,
                  ),
                  backgroundColor: Colors.white,
                  body: Container(
                      child:GridView.count(
                        scrollDirection: Axis.horizontal,
                        mainAxisSpacing: 10,
                        crossAxisCount: 1,
                        children: [
                          Image.network(
                            'https://m.media-amazon.com/images/I/61a3u+FcviL._AC_SY200_.jpg',
                          ),
                          Image.network(
                            'https://m.media-amazon.com/images/I/71V-yPMUeML._AC_SY200_.jpg',
                          ),
                          Image.network(
                            'https://m.media-amazon.com/images/I/81A-7mHInrS._AC_SY200_.jpg',
                          ),
                          Image.network(
                            'https://m.media-amazon.com/images/I/715nuBVKo0L._AC_SY200_.jpg',
                          ),
                          Image.network(
                            'https://m.media-amazon.com/images/I/61MzTQDBTXL._AC_SY200_.jpg',
                          ),
                        ],
                      )
                  )
                ),
              ),
            ),
          ),
          Positioned(
              top: 1560,
              left: 45,
              child: Row(
                  children: [
                Container(
                  height: 320,
                  width: 1275,
                  color: Colors.green,
                  child: SizedBox(
                    height: 289,
                    width: 1275,
                    child: Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          title: const Text(
                            'Top Sellers in Books for you',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        backgroundColor: Colors.white,
                        body: Container(
                            child:GridView.count(
                              scrollDirection: Axis.horizontal,
                              mainAxisSpacing: 0,
                              crossAxisCount: 1,
                              children: [
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61brVKkPT8L._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61Rlhrgk5iL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/81OwcfWEX4L._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/51OcUs5LjpL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61V3gx7ljfL._AC_SY200_.jpg'
                                ),
                              ],
                            )
                        )
                    ),
                  ),
                ),
              ])),
          Positioned(
              top: 1900,
              left: 35,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Shop Laptops & Tablets",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2020/May/Dashboard/Fuji_Dash_Laptops_379x304_1X_en_US._SY304_CB418608471_.jpg',
                            height: 300,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'see more',
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "New arrivals in Toys",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/September/DashboardCards/Fuji_Dash_Toys_1X._SY304_CB639759658_.jpg',
                            height: 300,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'shop more',
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Shop activity trackers and smartwatches",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/September/DashboardCards/Fuji_Dash_SmartWatch_1X._SY304_CB639922137_.jpg',
                            height: 270,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'shop now',
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Home & Kitchen Under \$30",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/US-hq/2022/img/Amazon_Exports/XCM_CUTTLE_1469391_2584745_379x304_1X_en_US._SY304_CB609304299_.jpg',
                            height: 270,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'shop now',
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
          Positioned(
              top: 2388,
              left: 45,
              child: Row(children: [
                Container(
                  height: 320,
                  width: 1275,
                  color: Colors.white,
                  child: SizedBox(
                    height: 289,
                    width: 1275,
                    child: Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          title: const Text(
                            'Stuffed Animals & Toys under \$ 10  Shop now',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        backgroundColor: Colors.white,
                        body: Container(
                            child:GridView.count(
                              scrollDirection: Axis.horizontal,
                              mainAxisSpacing: 0,
                              crossAxisCount: 1,
                              children: [
                                Image.network(
                                  'https://m.media-amazon.com/images/I/81-RlWFdRrL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/71KUNPdl7dL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/71msxzqxUbL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/71qeNzidkkL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/91c6YQrtQLL._AC_SY200_.jpg'
                                ),
                              ],
                            )
                        )
                    ),
                  ),
                ),
              ])),
          Positioned(
              top: 2734,
              left: 45,
              child: Row(children: [
                Container(
                  height: 320,
                  width: 1275,
                  color: Colors.white,
                  child: SizedBox(
                    height: 289,
                    width: 1275,
                    child: Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          title: const Text(
                            'International top sellers',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        backgroundColor: Colors.white,
                        body: Container(
                            child:GridView.count(
                              scrollDirection: Axis.horizontal,
                              mainAxisSpacing: 0,
                              crossAxisCount: 1,
                              children: [
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61smwbhzBML._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61zAZtbID5L._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/71DCZOdq92S._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/71vQzuqmiSL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/41uaUNLw3tL._AC_SY200_.jpg'
                                ),
                              ],
                            )
                        )
                    ),
                  ),
                ),
              ])),
          Positioned(
              top: 3072,
              left: 35,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "For your Fitness Needs",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/September/DashboardCards/Fuji_Dash_Fitness_1X._SY304_CB639748186_.jpg'
                            ,height: 270,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'shop now',
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Top Deal",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://m.media-amazon.com/images/I/61lp8JgqV-L._AC_SY230_.jpg',
                            height: 270,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'see all details',
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Shop Pet supplies",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/September/DashboardCards/Fuji_Dash_Pets_1X._SY304_CB639746743_.jpg',
                            height: 270,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'shop now',
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Create with strip lights",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                          'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2020/May/Dashboard/Fuji_Dash_StripLighting_379x304_1X_en_US._SY304_CB418597476_.jpg',
                            height: 270,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'shop now',
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ])),
          Positioned(
              top: 3562,
              left: 45,
              child: Row(children: [
                Container(
                  height: 320,
                  width: 1275,
                  color: Colors.lightBlueAccent,
                  child: SizedBox(
                    height: 289,
                    width: 1275,
                    child: Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          title: const Text(
                            'Popular products in Beauty internationally',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        backgroundColor: Colors.white,
                        body: Container(
                            child:GridView.count(
                              scrollDirection: Axis.horizontal,
                              mainAxisSpacing: 0,
                              crossAxisCount: 1,
                              children: [
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61VIt2hm6hL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61fji+hyAVL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/71uWJsAIjxL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61scf7kONPL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61fXW3g5niL._AC_SY200_.jpg'
                                ),
                              ],
                            )
                        )
                    ),
                  ),
                ),
              ])),
          Positioned(
              top: 3914,
              left: 45,
              child: Row(children: [
                Container(
                  height: 320,
                  width: 1275,
                  color: Colors.white,
                  child: SizedBox(
                    height: 289,
                    width: 1275,
                    child: Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          title: const Text(
                            'Home Décor Under \$20',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        backgroundColor: Colors.white,
                        body: Container(
                            child:GridView.count(
                              scrollDirection: Axis.horizontal,
                              mainAxisSpacing: 0,
                              crossAxisCount: 1,
                              children: [
                                Image.network(
                                  'https://m.media-amazon.com/images/I/613+CG1dP1L._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/71iArV-kskL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/41d1tq6oesL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61VxFel4T9L._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61XwmZLvaNL._AC_SY200_.jpg'
                                ),
                              ],
                            )
                        )
                    ),
                  ),
                ),
              ])),
          Positioned(
              top: 4248,
              left: 35,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child:  Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 450,
                        width: 300,
                        color: Colors.white,
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "      Gaming",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                    color: Colors.black),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "merchandise",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                    color: Colors.black),
                              ),
                            ),
                            Image.network(
                              'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Apparel_1x._SY116_CB667159060_.jpg'
                            ),
                            Image.network(
                              'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Hat_1x._SY116_CB667159060_.jpg'
                            ),
                            const Text(
                              "Apparel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                            const Text(
                              "Hats",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                            Image.network(
                                'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Figure_1x._SY116_CB667159060_.jpg'),
                            Image.network(
                                'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/June/Fuji_Quad_Mug_1x._SY116_CB667159063_.jpg'),
                            const Text(
                              "Action figures",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                            const Text(
                              "Mugs",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'see more',
                                    textAlign: TextAlign.start,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Deals in Tools and Home Improvement",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                          'https://images-na.ssl-images-amazon.com/images/G/01/home/THILGMA/Holiday2022/Graphics/XCM_CUTTLE_1475305_2610205_379x304_1X_en_US._SY304_CB608600856_.jpg'
                          ,height: 300,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'shop now',
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Kindle E readers",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                                decoration: TextDecoration.none,
                                color: Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Fuji/2021/September/DashboardCards/Fuji_Desktop_Dash_Kindle_1x._SY304_CB639752818_.jpg',
                            height: 330,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                'shop now',
                                textAlign: TextAlign.left,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 450,
                    width: 300,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        height: 450,
                        width: 300,
                        color: Colors.white,
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 2,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "  Early Black",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                    color: Colors.black),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Friday deals",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    decoration: TextDecoration.none,
                                    color: Colors.black),
                              ),
                            ),
                            Image.network(
                              'https://images-na.ssl-images-amazon.com/images/G/01/DiscoTec/2022/HOL22/ShoulderPeriod/GW/QuadCard/DT/SP22_W2_Kitchen_GW_QuadCard_DT_1x._SY116_CB606308915_.jpg'
                            ),
                            Image.network(
                              'https://images-na.ssl-images-amazon.com/images/G/01/DiscoTec/2022/HOL22/ShoulderPeriod/GW/QuadCard/DT/SP22_W2_ComputersAndAccessories_GW_QuadCard_DT_1x._SY116_CB606308915_.jpg'
                            ),
                            const Text(
                              "Kitchen",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                            const Text(
                              "Computers & more",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                            Image.network(
                                'https://images-na.ssl-images-amazon.com/images/G/01/DiscoTec/2022/HOL22/ShoulderPeriod/GW/QuadCard/DT/SP22_W2_HealthAndPersonalCare_GW_QuadCard_DT_1x._SY116_CB606308915_.jpg'),
                            Image.network(
                                'https://images-na.ssl-images-amazon.com/images/G/01/DiscoTec/2022/HOL22/ShoulderPeriod/GW/QuadCard/DT/SP22_W2_HomeImprovement_GW_QuadCard_DT_1x._SY116_CB606308915_.jpg'),
                            const Text(
                              "Personal Care",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                            const Text(
                              "Home Improvement",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                  color: Colors.black),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'see more',
                                    textAlign: TextAlign.start,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ])),
          Positioned(
              top: 4734,
              left: 45,
              child: Row(children: [
                Container(
                  height: 300,
                  width: 1275,
                  color: Colors.green,
                  child: SizedBox(
                    height: 289,
                    width: 1275,
                    child: Scaffold(
                        appBar: AppBar(
                          elevation: 0,
                          title: const Text(
                            'Popular Gifts in Baby',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                            ),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        backgroundColor: Colors.white,
                        body: Container(
                            child:GridView.count(
                              scrollDirection: Axis.horizontal,
                              mainAxisSpacing: 0,
                              crossAxisCount: 1,
                              children: [
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61t66wWbwSL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61vCn24QwwL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/817Rqx4FHSL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/61q1Cq1IYCL._AC_SY200_.jpg'
                                ),
                                Image.network(
                                  'https://m.media-amazon.com/images/I/6129I-o5iLL._AC_SY200_.jpg'
                                ),
                              ],
                            )
                        )
                    ),
                  ),
                ),
              ])),
          Positioned(
              top: 5124,
              left: 0,
              child: Row(children: [
                Container(
                  height: 400,
                  width: 1365,
                  color: Color.fromARGB(255, 25, 30, 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Padding(
                            padding: EdgeInsets.all(40.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Get to Know Us',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text('Careers',
                                    textAlign: TextAlign.left,
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Text('Blog',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('About Amazon',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('Investor Relations',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('Amazon Devices',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                                Text('Amazon Science',
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Make Money with Us',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Sell products on Amazon',
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text('Sell on Amazon Business',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Sell apps on Amazon',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Become an Affiliate',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Advertise Your Products',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Self-Publish with Us',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Host an Amazon Hub',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('›See More Make Money with Us',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Amazon Payment Products',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Amazon Business Card',
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text('Shop with Points',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Reload Your Balance',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Amazon Currency Converter',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(

                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Let Us Help You',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text('Amazon and COVID-\n19',
                                textAlign: TextAlign.left,
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text('Your Account',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Your Orders',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Shipping Rates &\n Policies',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Returns &\n Replacements',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Manage Your\n Content and Devices',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Amazon Assistant',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            Text('Help',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]
              )
          ),
          const Positioned(
            top: 5520,
            left: 570,
            child: Align(
              alignment: Alignment.center,
              child: Text('With ❤️Arun',
              style: TextStyle(
                fontSize: 30,
                decoration: TextDecoration.none,
                fontWeight: FontWeight.w400
              ),)
            ),
          )

        ],
      ),
    );
  }
}
