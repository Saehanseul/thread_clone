import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';
import 'package:thread_clone/features/home/widgets/ThreadItem.dart';
import 'package:thread_clone/features/post/view_models/timeline_view_model.dart';
import 'package:thread_clone/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String routeURL = "/";
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.size24,
                ),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: Sizes.size64,
                  color: isDarkMode(context) ? Colors.white : Colors.black,
                ),
              ),
              ref.watch(timelineProvider).when(
                    data: (data) {
                      return Column(
                        children: data.map((post) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: Sizes.size16,
                            ),
                            child: ThreadItem(
                              contentText: post.text,
                              nickname: "Anony",
                              replayCount: 2,
                              likeCount: 3,
                              time: '2m',
                              commentProfileCount: 2,
                              imageUrlList:
                                  post.imageUrl != null ? [post.imageUrl!] : [],
                            ),
                          );
                        }).toList(),
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (error, stackTrace) => Text(error.toString()),
                  ),
              // const ThreadItem(
              //   contentText:
              //       "Vine after seeing the Threads logo unveiled. Vine after seeing the Threads logo unveiled Vine after seeing the Threads logo unveiled Vine after seeing the Threads logo unveiled Vine after seeing the Threads logo unveiled",
              //   imageUrlList: ["assets/images/image1.jpeg"],
              //   nickname: "pubity",
              //   replayCount: 10,
              //   likeCount: 21,
              //   time: "2m",
              //   commentProfileCount: 2,
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(
              //     vertical: Sizes.size16,
              //   ),
              //   child: Divider(),
              // ),
              // const ThreadItem(
              //   contentText: "Photoshoot with Molly pup. :)",
              //   imageUrlList: [
              //     "assets/images/image2.jpeg",
              //     "assets/images/image3.jpeg",
              //     "assets/images/image4.jpeg",
              //   ],
              //   nickname: "timferriss",
              //   replayCount: 3,
              //   likeCount: 15,
              //   time: "4m",
              //   commentProfileCount: 3,
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(
              //     vertical: Sizes.size16,
              //   ),
              //   child: Divider(),
              // ),
              // const ThreadItem(
              //   contentText: "Drop a comment here to test things out.",
              //   nickname: "tropicalseductions",
              //   replayCount: 33,
              //   likeCount: 152,
              //   time: "1h",
              // ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(
              //     vertical: Sizes.size16,
              //   ),
              //   child: Divider(),
              // ),
              // const ThreadItem(
              //   contentText:
              //       "my phone feels like a vibrator with all these notifications rn",
              //   nickname: "shityoushouldcareabout",
              //   replayCount: 2,
              //   likeCount: 8,
              //   time: "2h",
              // ),
              Gaps.v44,
            ],
          ),
        ),
      ),
    );
  }
}
