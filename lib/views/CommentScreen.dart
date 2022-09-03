import 'package:commentsreply/Provider/CommentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  TextEditingController commentctrl = TextEditingController();

  TextEditingController cmtCtrl = TextEditingController();
  TextEditingController rplyCtrl = TextEditingController();
  int? rplyIndex;

  @override
  Widget build(BuildContext context) {
    final commentProvider = Provider.of<CommentProvider>(context);

    print(commentProvider.c);
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: commentProvider.getcmt.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index1) {
                    return Column(
                      children: [
                        Text("$index1${commentProvider.getcmt[index1][0]}"),
                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: commentProvider.c[index1][1].length,
                            itemBuilder: (context, ind) {
                              return Container(
                                child: Text(commentProvider.getcmt[index1][1]
                                        [ind]
                                    .toString()),
                              );
                            }),
                        // Text(
                        //   commentProvider.getcmt[index1][1]
                        //       .getRange(2, commentProvider.c.length)
                        //       .toString(),
                        // ),
                        TextButton(
                            onPressed: () {
                              print("Text Pressed");
                              rplyIndex = index1;
                              print(rplyIndex.toString());
                            },
                            child: const Text("Reply")),
                      ],
                    );
                  }),
            ),
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFormField(
                  onFieldSubmitted: ((value) {
                    commentProvider.addComment(value);
                    print(commentProvider.c);
                  }),
                  controller: cmtCtrl,
                  decoration: const InputDecoration(
                    hintText: "Add Comments",
                  ),
                ),
                TextFormField(
                  onFieldSubmitted: (
                    value,
                  ) {
                    commentProvider.addReplay(rplyCtrl.text, rplyIndex);
                    print(commentProvider.getreply);
                    print(rplyCtrl.text.toString());
                  },
                  controller: rplyCtrl,
                  decoration: const InputDecoration(hintText: "Add Replay"),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
