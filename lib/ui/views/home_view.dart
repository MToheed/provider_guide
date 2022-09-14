import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_guide/core/enums/viewstate.dart';
import 'package:provider_guide/core/models/user.dart';
import 'package:provider_guide/core/viewmodels/home_model.dart';
import 'package:provider_guide/ui/views/base_view.dart';
import 'package:provider_guide/ui/widgets/post_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) => model.fetchPosts(Provider.of<User>(context).id!),
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(title: const Text("Home View")),
            body: model.getState == ViewState.idle
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Welcome ${Provider.of<User>(context).name!}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("Here are all your posts"),
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.getPosts.length,
                            itemBuilder: (_, index) {
                              return PostItem(
                                post: model.getPosts[index],
                                press: () {
                                  Navigator.pushNamed(context, "post",
                                      arguments: model.getPosts[index]);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(child: CircularProgressIndicator()),
          );
        });
  }
}
