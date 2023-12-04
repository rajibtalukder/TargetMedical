import 'package:target_medical/target_medical.dart';
import 'package:get/get.dart';
import 'package:target_medical/models/books_model.dart';
import 'package:target_medical/services/core_service.dart';

import '../models/notes_model.dart';

class ResourceScreenController extends GetxController {
  RxList<Book> books = RxList([]);
  RxList<Note> notes = RxList([]);

  @override
  void onReady() async {
    getData();
    super.onReady();
  }

  void getData() async {
    try {
      final booksResponse = await CoreService().getRequest(url: bookUrl);
      final booksModel = BooksModel.fromMap(booksResponse.body);
      books.addAll(booksModel.books!);
      final notesResponse = await CoreService().getRequest(url: noteUrl);
      final notesModel = NotesModel.fromMap(notesResponse.body);
      notes.addAll(notesModel.notes!);
      books.refresh();
      notes.refresh();
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }
}
