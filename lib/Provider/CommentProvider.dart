import 'package:flutter/widgets.dart';

class CommentProvider with ChangeNotifier {
  List c = [];

  List get getcmt => c;
  addComment(cmtval) {
    c.add([cmtval, []]);
    notifyListeners();
  }

  List get getreply => c;
  addReplay(repval, rplyIndex) {
    c[rplyIndex][1].add(repval);
    notifyListeners();
  }
}
