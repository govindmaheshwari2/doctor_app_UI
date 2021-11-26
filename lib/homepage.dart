import 'package:doctor_tutorial/dataset.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Categories(),
            Banner(),
            PopularDoctor(
              doctorList: doctorList,
            )
          ],
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hi,",
              style: TextStyle(color: Colors.grey[700], fontSize: 25),
            ),
            const Icon(Icons.notifications_active, color: Color(0xFF6C5DD3))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          "Let's Find Your Doctor",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(25)),
            child: const TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  border: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF6C5DD3),
                  ),
                  hintText: 'search'),
            ))
      ],
    );
  }
}

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          CategoriesList(),
        ],
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      child: ListView.builder(
          itemCount: doctorTypes.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (itemBuilder, index) {
            return Container(
              margin: EdgeInsets.all(10),
              width: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white, blurRadius: 1, spreadRadius: 0.3)
                  ],
                  image: DecorationImage(
                      image: AssetImage(doctorTypes[index].image), scale: 7)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    doctorTypes[index].name,
                    style: TextStyle(
                        color: doctorTypes[index].color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          }),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage("assets/banner.png"), fit: BoxFit.fill)),
    );
  }
}

class PopularDoctor extends StatelessWidget {
  final List<Doctor> doctorList;
  const PopularDoctor({Key? key, required this.doctorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Popular Doctors",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                  itemCount: doctorList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (itemBuilder, index) {
                    return Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        margin: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(doctorList[index].image),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(doctorList[index].name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(doctorList[index].specialisation,
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 17),
                                    Text(doctorList[index].rating + " Rating",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12))
                                  ],
                                )
                              ],
                            )
                          ],
                        ));
                  }),
            )
          ],
        ));
  }
}
