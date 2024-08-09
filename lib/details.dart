import 'package:flutter/material.dart';

class ItemsDetails extends StatefulWidget {
  final data;

  const ItemsDetails({super.key, this.data});

  @override
  State<ItemsDetails> createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails> {
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ecommerce',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              'App',
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(size: 30, color: Colors.black),
        // actions: const [
        //   Padding(
        //     padding: EdgeInsets.all(10),
        //     child: Icon(Icons.menu, size: 40,),
        //   )
        // ],
      ),
      endDrawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,
        onTap: (val) {
          setState(() {
            selectedItem = val;
          });
        },
        iconSize: 30,
        selectedItemColor: Colors.orange,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: ListView(
        children: [
          Image.network(widget.data['image']),
          Text(
            widget.data['title'],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.data['description'],
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            widget.data['price'],
            style: const TextStyle(
                fontSize: 20,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Color: '),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 25,
                height: 25,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orange)),
              ),
              const Text('Gray'),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 25,
                height: 25,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.orange)),
              ),
              const Text('Black'),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: MaterialButton(
              onPressed: () {},
              padding: const EdgeInsets.symmetric(vertical: 15),
              color: Colors.black,
              textColor: Colors.white,
              child: const Text('Add To Card'),
            ),
          )
        ],
      ),
    );
  }
}
