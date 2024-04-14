import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'ciara_ferguson.dart';
import 'josh_murphy.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key});

  final User? user = FirebaseAuth.instance.currentUser;

  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'lib/images/logo.png',
              width: 120,
              height: 120,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              signUserOut(context);
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 16),
                buildButtonWithCircleImage(
                  context: context,
                  imageAsset: 'lib/images/Sarah.jpg',
                  buttonText: "Ciara Ferguson",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CiaraFergusonPage()));
                  },
                ),
                SizedBox(height: 8),
                buildButtonWithCircleImage(
                  context: context,
                  imageAsset: 'lib/images/Michael.jpg',
                  buttonText: "Josh Murphy",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => JoshMurphyPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonWithCircleImage({
    required BuildContext context,
    required String imageAsset,
    required String buttonText,
    VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(imageAsset),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
