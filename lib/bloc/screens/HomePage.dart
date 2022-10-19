import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/InternetBloc.dart';
import 'package:news_app/bloc/state.dart';

import 'newspage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(onPressed: () {}, child: Text("Logout"))
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade500,
        title: const Text('NEWS'),
      ),
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is InternetGainedState) {
              return NewsPage();
            } else if (state is InternetLostState) {
              return const Text('Internet Lost');
            } else {
              return const Text('Initial State');
            }
          },
        ),
      ),
    );
  }
}
