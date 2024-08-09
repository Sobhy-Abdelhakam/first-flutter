import 'package:first_flutter/details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    {'icon': Icons.laptop, 'title': 'LapTop'},
    {'icon': Icons.phone_android, 'title': 'Mobile'},
    {'icon': Icons.pedal_bike, 'title': 'Bike'},
    {'icon': Icons.headphones, 'title': 'HeadPhone'},
    {'icon': Icons.card_giftcard, 'title': 'Gift'},
  ];
  List products = [
    {
      'image': 'https://images.pexels.com/photos/205421/pexels-photo-205421.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'LapTop',
      'description': 'This is the description of laptop',
      'price': '300\$',
    },
    {
      'image': 'https://images.pexels.com/photos/109371/pexels-photo-109371.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'LapTop',
      'description': 'This is the description of laptop',
      'price': '300\$',
    },
    {
      'image': 'https://images.pexels.com/photos/414548/pexels-photo-414548.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'LapTop',
      'description': 'This is the description of laptop',
      'price': '300\$',
    },
    {
      'image': 'https://images.pexels.com/photos/205421/pexels-photo-205421.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'LapTop',
      'description': 'This is the description of laptop',
      'price': '300\$',
    },
    {
      'image': 'https://images.pexels.com/photos/205421/pexels-photo-205421.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      'title': 'LapTop',
      'description': 'This is the description of laptop',
      'price': '300\$',
    },
  ];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        actions: const [
          Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.menu, size: 40,),
          )
        ],
        title: TextFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.grey.shade300,
              filled: true,
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search)),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,
        onTap: (val){
          setState(() {
            selectedItem = val;
          });
        },
        iconSize: 30,
        selectedItemColor: Colors.orange,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Shop',),
          BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: 'Profile',),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                'Categories',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, i) {
                  return Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Icon(
                            categories[i]['icon'],
                            size: 40,
                          ),
                        ),
                        Text(
                          categories[i]['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade800),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: const Text(
                'Best Selling',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              itemCount: products.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 250),
              itemBuilder: (context, i){
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context){
                              return ItemsDetails(data: products[i],);
                            },
                        ),
                    );
                  },
                  child: Card(
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          products[i]['image'],
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          products[i]['title'],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(products[i]['description']),
                        Text(
                          products[i]['price'],
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
