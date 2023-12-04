import 'package:get/get.dart';
import 'package:target_medical/models/chapter_model.dart';
import 'package:target_medical/models/exam_model.dart';
import 'package:target_medical/models/exam_type_model.dart';
import 'package:target_medical/models/live_exam_model.dart';
import 'package:target_medical/models/subject_model.dart';
import 'package:target_medical/services/core_service.dart';
import '../target_medical.dart';

class ExamController extends GetxController {
  RxList<LiveExam> liveExams = RxList([]);
  RxList<ExamTypeModel> examTypes = RxList([]);
  RxList<SubjectModel> bjsSubject = RxList([]);
  RxList<SubjectModel> barCouncilSubject = RxList([]);
  List<ExamModel> exams = [];

  Future<List<ExamModel>> getExams() async {
    if (exams.isNotEmpty) return exams;
    try {
      final response = await CoreService().getRequest(url: allExamUrl);
      final data = response.body as List;

      for (int index = 0; index < data.length; index++) {
        final item = ExamModel.fromMap(data[index]);
        exams.add(item);
      }
      return exams;
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
      return [];
    }
  }

  Future getLiveExams() async {
    try {
      final response = await CoreService().getRequest(url: liveExamListUrl);
      final liveExamModel = LiveExamModel.fromMap(response.body);
      for (int index = 0; index < liveExamModel.liveExams!.length; index++) {
        final item = liveExamModel.liveExams![index];
        if (item.seen! == 1) {
          liveExams.add(item);
        }
      }
      liveExams.refresh();
      print(liveExams.subject);
      print('liveExams.subject');
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  Future getLiveTypes() async {
    if (examTypes.isNotEmpty) return;

    try {
      final response = await CoreService().getRequest(url: examTypeUrl);
      final data = response.body as List;

      for (int index = 0; index < data.length; index++) {
        final item = ExamTypeModel.fromMap(data[index]);
        examTypes.add(item);
      }
      examTypes.refresh();
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  Future getSubjects() async {
    if (bjsSubject.isNotEmpty) return;
    if (barCouncilSubject.isNotEmpty) return;

    try {
      final response = await CoreService().getRequest(url: subjectListUrl);
      final data = response.body as List;
      for (int index = 0; index < data.length; index++) {
        final item = SubjectModel.fromMap(data[index]);

        if (item.barC! == 1) {
          barCouncilSubject.add(item);
        }
        if (item.bjs! == 1) {
          bjsSubject.add(item);
        }
      }
      bjsSubject.refresh();
      barCouncilSubject.refresh();
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
    }
  }

  Future<List<ChapterModel>> getChapters(
      SubjectModel subject, bool isBJS) async {
    if (subject.chapters!.isNotEmpty) return subject.chapters!;
    try {
      final response = await CoreService()
          .getRequest(url: chapterListUrl(subId: subject.subId.toString()));
      final data = response.body as List;
      List<ChapterModel> chapters = [];
      for (int index = 0; index < data.length; index++) {
        final item = ChapterModel.fromMap(data[index]);
        chapters.add(item);
      }
      if (isBJS) {
        final index = bjsSubject.indexOf(subject);
        bjsSubject[index].chapters?.addAll(chapters);
      } else {
        final index = barCouncilSubject.indexOf(subject);
        barCouncilSubject[index].chapters?.addAll(chapters);
      }
      return chapters;
    } catch (error) {
      debugPrint("Error:- ${error.toString()}");
      return [];
    }
  }
}
