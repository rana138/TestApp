import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _successState();
}

class _successState extends State<about> {
  List imgs = [
    "assets/images/jahnzaib.png",
    "assets/images/me.jpg",
  ];

  List imgs1 = [
    "assets/images/newali.jpeg",
    "assets/images/gir.png",
    "assets/images/adn.jpeg",
    "assets/images/hass.jpeg",
    "assets/images/gir.png",
    "assets/images/sha.jpeg",
    "assets/images/umer.jpeg",
  ];

  List TName = [
    'Rana Ali Hamza',
    'Summaira Munazza',
    'Rana Adnan',
    'Rana Hassan',
    'Amaria Ashiq',
    'Shafqat Liaqat',
    'Umer Ranjha',
    // 'Mehmood Khan',
  ];
  List work = [
    'C.T.O/ App Developer',
    'O.M (Web Developer)',
    'C.M.O (Graphic Designer)',
    'Front-End Web Developer',
    'HR Head',
    'Data Entry Expert',
    'Flutter Developer',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 4, 70, 125),
        title: const Text("About Companys"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Who We Are",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Text(
                "Is a dynamic and forward-thinking IT solutions company at the forefront of website and app development. Our commitment to innovation, cutting-edge technology, and unparalleled expertise sets us apart in the industry.Our team of highly skilled developers, designers, and strategists work collaboratively to bring your ideas to life. We understand that every project is unique, and we tailor our solutions to meet your specific needs, ensuring user-friendly experiences and seamless functionality. ",
                textAlign: TextAlign.justify,
                style: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 20, bottom: 10),
              child: Column(
                children: [
                  Text(
                    "Founders of SuffaTech",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 320,
              width: 240,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.purple),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      height: 270,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 235, 234, 234)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imgs[0],
                          fit: BoxFit.cover,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 0,
                    child: Container(
                      height: 80,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Color.fromARGB(122, 255, 255, 255)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Rana Jahanzaib",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Founder",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 320,
              width: 240,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.purple),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      height: 270,
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromARGB(255, 235, 234, 234)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imgs[1],
                          fit: BoxFit.cover,
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 0,
                    child: Container(
                      height: 80,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      width: 220,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          color: Color.fromARGB(122, 255, 255, 255)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Rana Shehroz",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Co-Founder",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              color: Color.fromARGB(255, 228, 242, 253),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Team Members",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Meet Our Professional Team Members",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 260,
                    padding: EdgeInsets.only(left: 30),
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: TName.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(right: 15),
                            height: 240,
                            width: 160,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.purple),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    height: 190,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color:
                                            Color.fromARGB(255, 235, 234, 234)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.asset(
                                        imgs1[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 60,
                                  right: 10,
                                  child: Container(
                                    height: 70,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    width: 140,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15),
                                        ),
                                        color:
                                            Color.fromARGB(180, 255, 255, 255)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 14,
                                        ),
                                        Text(
                                          TName[index],
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          work[index],
                                          style: TextStyle(
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
