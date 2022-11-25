import 'package:dio_networking/dio_client.dart';
import 'package:dio_networking/home_page.dart';
import 'package:dio_networking/model/response/data.dart';
// import 'package:dio_networking/model/request/user_info.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final DioClient _client = DioClient();
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('POST'),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            //   child: TextFormField(
            //     controller: _nameController,
            //     decoration: const InputDecoration(
            //       border: UnderlineInputBorder(),
            //       labelText: 'Enter name',
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            //   child: TextFormField(
            //     controller: _jobController,
            //     decoration: const InputDecoration(
            //       border: UnderlineInputBorder(),
            //       labelText: 'Enter job',
            //     ),
            //   ),
            // ),
            // ElevatedButton(
            //   child: const Text('Create User'),
            //   onPressed: () {
            //     UserInfo userInfo = UserInfo(
            //         name: _nameController.text, job: _jobController.text);
            //     _client.createUser(userInfo: userInfo);
            //   },
            // ),
            FutureBuilder<List<Data>?>(
              future: _client.getListUser(page: '1'),
              builder: (context, AsyncSnapshot<List<Data>?> snapshot) {
                if (snapshot.hasData) {
                  List<Data>? dataList = snapshot.data;
                  if (dataList != null) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: dataList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var user = dataList.elementAt(index);
                        return InkWell(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: const Color(0xff764abc),
                              child: Image.network(user.avatar),
                            ),
                            title: Text(user.firstName),
                            subtitle: Text(user.email),
                            trailing: const Icon(Icons.more_vert),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, DetailPage.routeName,
                                arguments: DetailPageArguments('${user.id}'));
                          },
                        );
                      },
                    );
                  }
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
