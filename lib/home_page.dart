import 'dart:ui';

import 'package:dio_networking/dio_client.dart';
import 'package:dio_networking/model/response/data.dart';
import 'package:dio_networking/model/response/user.dart';
import 'package:flutter/material.dart';

class DetailPageArguments {
  final String userId;

  DetailPageArguments(this.userId);
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  static const routeName = '/detail';

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as DetailPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images.jpeg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            top: 250,
            left: 0,
            right: 0,
            child: Center(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
            ),
          ),
          Center(
            child: FutureBuilder<User?>(
              future: _client.getUser(id: args.userId),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  User? userInfo = snapshot.data;
                  if (userInfo != null) {
                    Data userData = userInfo.data;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(userData.avatar),
                        const SizedBox(height: 8.0),
                        Text(
                          '${userInfo.data.firstName} ${userInfo.data.lastName}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                        Text(
                          userData.email,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ],
                    );
                  }
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
