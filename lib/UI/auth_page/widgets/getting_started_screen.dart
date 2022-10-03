import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 40.0),
                child: Center(
                  child: Container(
                    height: 300.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.amber[800],
                        borderRadius: BorderRadius.circular(10.0)),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: Colors.amber[800],
                        child: const CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: CircleAvatar(
                            radius: 10.0,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              const Text(
                "Hey! Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 25.0),
              ),
              const SizedBox(
                height: 17.0,
              ),
              Text(
                "Think fast, go farther with our simple \n solutions to finance.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500], fontSize: 14.0),
              ),
              const SizedBox(
                height: 35.0,
              ),
              SizedBox(
                height: 55.0,
                width: MediaQuery.of(context).size.width - 50,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/signUp");
                    },
                    style: TextButton.styleFrom(
                        onSurface: Colors.black,
                        backgroundColor: Colors.amber[800]),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                      ),
                    )),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 55.0,
                width: MediaQuery.of(context).size.width - 50,
                child: TextButton(
                    onPressed: () => Navigator.of(context).pushNamed("/signIn"),
                    style: TextButton.styleFrom(backgroundColor: Colors.white),
                    child: const Text(
                      "I already have an account",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
