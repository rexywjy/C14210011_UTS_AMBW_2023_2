import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/widgets.dart';
import 'package:image_card/image_card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Another Page!',
              style: TextStyle(fontSize: 24.0),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MainAppState extends State<MainApp> {
  final List<String> images = [
    'assets/images/pizza.jpg',
    'assets/images/burger.jpg',
    'assets/images/sushi.jpg',
    'assets/images/rendang.jpg',
  ];
  int currentPageIndex = 0;
  int currentCarousel = 0;
  void handleTap(String action, BuildContext context) {
    switch (action) {
      case 'viewAll':
        print('View All tapped!');
        // Navigate to the new page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnotherPage()),
        );
        break;
      case 'otherAction':
        print('Other Action tapped!');
        // Add your logic for 'otherAction' action
        break;
      // Add more cases for other actions if needed
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: 
            // Icon(Icons.arrow_back)
            Container(
              margin: EdgeInsets.all(5),
              // color: Colors.amber,
              child: 
              CircleAvatar(
                backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlGkCblBh48-MUPOWJCGBLIKi9Ps_UMAYFf8womWA8Gg&s'),
              ),
            )
          ,
          title: Text('NOMNOM'),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Container(
              child: 
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      autocorrect: false,
                      autofocus: false,
                      decoration: InputDecoration(
                        hintText: 'Search for restaurants...',
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            ),
                        ),
                      ),
                    ),
                    )
            ),
          )
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.amber,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Badge(child: Icon(Icons.notifications_sharp)),
              label: 'Notifications',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('2'),
                child: Icon(Icons.messenger_sharp),
              ),
              label: 'Messages',
            ),
          ],
        ),

        body: <Widget>[
          /// Home page
          Center(
          child: ListView(
            children: [
              Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      aspectRatio: 16/9,
                      viewportFraction: 0.9,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentCarousel = index;
                        });
                      },
                    ),
                    items: [
                      Container(
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage('https://www.southernliving.com/thmb/3x3cJaiOvQ8-3YxtMQX0vvh1hQw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2652401_QFSSL_SupremePizza_00072-d910a935ba7d448e8c7545a963ed7101.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3), // Adjust opacity for darkness
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 24.0, // Adjust the value to move the title upwards
                              left: 16.0, // Adjust the value to move the title horizontally
                              child: Text(
                                'Pizza',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8.0, // Adjust the value to move the description upwards
                              left: 16.0, // Adjust the value to move the description horizontally
                              child: Text(
                                '12 Places',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage('https://images.deliveryhero.io/image/foodpanda/recipes/burger-patty-recipe-1.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3), // Adjust opacity for darkness
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 24.0, // Adjust the value to move the title upwards
                              left: 16.0, // Adjust the value to move the title horizontally
                              child: Text(
                                'Burger',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8.0, // Adjust the value to move the description upwards
                              left: 16.0, // Adjust the value to move the description horizontally
                              child: Text(
                                '4 Places',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage('https://www.thespruceeats.com/thmb/KKVYHEcAN6Jt7yvULfCB4r3ad30=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-is-sushi-5079606-hero-01-e5a0a26f194a49478f84e04193baaefa.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3), // Adjust opacity for darkness
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 24.0, // Adjust the value to move the title upwards
                              left: 16.0, // Adjust the value to move the title horizontally
                              child: Text(
                                'Sushi',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8.0, // Adjust the value to move the description upwards
                              left: 16.0, // Adjust the value to move the description horizontally
                              child: Text(
                                '2 Places',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(0.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage('https://cdn0-production-images-kly.akamaized.net/h4VakkIL8Sncx9aJoDROfMXc-Tc=/1200x675/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/4416362/original/027044400_1683267847-shutterstock_1939111798.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.3), // Adjust opacity for darkness
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 24.0, // Adjust the value to move the title upwards
                              left: 16.0, // Adjust the value to move the title horizontally
                              child: Text(
                                'Rendang',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8.0, // Adjust the value to move the description upwards
                              left: 16.0, // Adjust the value to move the description horizontally
                              child: Text(
                                '6 Places',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.map((url) {
                      int index = images.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentCarousel == index ? Colors.blueAccent : Colors.grey,
                        ),
                      );
                    }).toList(),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 5, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Most Popular', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        // Text('View All', style: TextStyle(fontSize: 15, color: Colors.blue)),
                        GestureDetector(
                          onTap: () {
                            // handleTap('viewAll', context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AnotherPage()),
                            );
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsetsDirectional.only(start: 10),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Material(
                              elevation: 5,
                              child: Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  // color: Colors.amber[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: FillImageCard(
                                    width: 200,
                                    heightImage: 140,
                                    imageProvider: NetworkImage('https://www.allrecipes.com/thmb/e8uotDI18ieXNBY0KpmtGKbxMRM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/238691-Simple-Macaroni-And-Cheese-mfs_008-4x3-6ed91ba87a1344558aacc0f9ef0f4b41.jpg'),
                                    tags: [Icon(Icons.star, color: Colors.amber,), Text("4.8/5"),],
                                    title: Text("Mac and Cheese", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    description: Text('IDR 30.000,00'),
                                  )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Material(
                              elevation: 5,
                              child: Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  // color: Colors.amber[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: FillImageCard(
                                    width: 200,
                                    heightImage: 140,
                                    imageProvider: NetworkImage('https://images.deliveryhero.io/image/foodpanda/recipes/burger-patty-recipe-1.jpg'),
                                    tags: [Icon(Icons.star, color: Colors.amber,), Text("4.9/5"),],
                                    title: Text("Burger", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    description: Text('IDR 50.000,00'),
                                  )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Material(
                              elevation: 5,
                              child: Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  // color: Colors.amber[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: FillImageCard(
                                    width: 200,
                                    heightImage: 140,
                                    // imageProvider: AssetImage('assets/images/pizza.jpg'),
                                    imageProvider: NetworkImage('https://www.southernliving.com/thmb/3x3cJaiOvQ8-3YxtMQX0vvh1hQw=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/2652401_QFSSL_SupremePizza_00072-d910a935ba7d448e8c7545a963ed7101.jpg'),
                                    tags: [Icon(Icons.star, color: Colors.amber,), Text("4.8/5"),],
                                    title: Text("Pizza", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    description: Text('IDR 80.000,00'),
                                  )
                              ),
                            ),
                          ),
                        ],
                        
                      ),
                    ),
                    
                    Container(
                      padding: EdgeInsetsDirectional.only(start: 20, end: 20, top: 35, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Meal Deals', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          // Text('View All', style: TextStyle(fontSize: 15, color: Colors.blue)),
                        GestureDetector(
                          onTap: () {
                            // handleTap('viewAll', context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AnotherPage()),
                            );
                          },
                          child: Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        ],
                      ),
                    ),
                    
                  
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsetsDirectional.only(start: 10),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Material(
                              elevation: 5,
                              child: Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  // color: Colors.amber[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: FillImageCard(
                                    width: 200,
                                    heightImage: 140,
                                    imageProvider: NetworkImage('https://www.thespruceeats.com/thmb/KKVYHEcAN6Jt7yvULfCB4r3ad30=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/what-is-sushi-5079606-hero-01-e5a0a26f194a49478f84e04193baaefa.jpg'),
                                    tags: [Icon(Icons.star, color: Colors.amber,), Text("4.8/5"),],
                                    title: Text("Sushi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    description: Text('IDR 40.000,00'),
                                  )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Material(
                              elevation: 5,
                              child: Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  // color: Colors.amber[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: FillImageCard(
                                    width: 200,
                                    heightImage: 140,
                                    imageProvider: NetworkImage('https://cdn0-production-images-kly.akamaized.net/3RZxxR43-zW-NhwMBetL4z2W7dk=/0x138:2048x1292/1200x675/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3166919/original/012001300_1593576450-shutterstock_1542386222.jpg'),
                                    tags: [Icon(Icons.star, color: Colors.amber,), Text("4.6/5"),],
                                    title: Text("Corn Dog", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    description: Text('IDR 20.000,00'),
                                  )
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Material(
                              elevation: 5,
                              child: Container(
                                margin: EdgeInsets.all(0),
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  // color: Colors.amber[300],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: FillImageCard(
                                    width: 200,
                                    heightImage: 140,
                                    imageProvider: NetworkImage('https://assets-pergikuliner.com/3IVIkXCLccl-2kTVM3-1IRlyAMk=/fit-in/1366x768/smart/filters:no_upscale()/https://assets-pergikuliner.com/uploads/image/picture/1665405/picture-1572691901.JPG'),
                                    tags: [Icon(Icons.star, color: Colors.amber,), Text("4.7/5"),],
                                    title: Text("Toast", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                    description: Text('IDR 12.000,00'),
                                  )
                              ),
                            ),
                          ),
                        ],
                        
                      ),
                    ),
                    Container(
                      padding: EdgeInsetsDirectional.only(top: 35),
                    )
                    
                  ],
                )
              ],
            )
          ),

          /// Notifications page
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Notification 1'),
                    subtitle: Text('This is a notification'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.notifications_sharp),
                    title: Text('Notification 2'),
                    subtitle: Text('This is a notification'),
                  ),
                ),
              ],
            ),
          ),

          /// Messages page
          ListView.builder(
            reverse: true,
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.all(8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Hello',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.colorScheme.onPrimary),
                    ),
                  ),
                );
              }
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hi!',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            },
          ),
        ][currentPageIndex],

      ),
    );
  }
}
