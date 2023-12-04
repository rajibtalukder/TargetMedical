//const String baseUrl = 'https://lexam.soykothosen.com/';
const String baseUrl = 'https://medical-exam.soykothosen.com/api/';

const String examTypeUrl = 'exam_type';
const String allExamUrl = 'all_exam';
const String subjectListUrl = 'subject_list';
const String addUserUrl = 'add_user';
const String allUserUrl = 'all_user';
const String membershipPlanUrl = 'membership_plan';
const String userLoginUrl = 'user_login';
const String newDeviceLoginUrl = 'new_device_login';
const String paymentMethodUrl = 'payment_method';
const String packageUrl = 'package';
const String bannerUrl = 'banner';
const String bookUrl = 'book';
const String socialMediaUrl = 'social_media';
const String courseListUrl = 'course_list';
const String noteUrl = 'note';
const String liveExamListUrl = 'live_exam_list';
const String examHistoryPostUrl = 'exam_history_post';
const String favouritePostUrl = 'favourite_mcq_add';
const String favouriteGetUrl = 'favourite_mcq_list';
const String checkResultGetUrl = 'end_live_exam_result_api';
const String forgetPassUrl = 'api_forget_password';
const String setNewPassUrl = 'new_password_set';
const String breakingNewsUrl = 'breaking_news';
const String freeTrialDurationUrl = 'free_trial_duration';
const String freeTrialPostUrl = 'free_trial/insert';
const String expireDateUrl = 'check_expire_date';
const String aboutUsUrl = 'about_us';


String examUrl(
        {required String examTypeId,
        required String bjs,
        required String barC}) =>
    'exam?exam_type_id=$examTypeId&bjs=$bjs&bar_c=$barC';

String quesUrl({required String examId}) => 'ques?exam_id=$examId';

String chapterListUrl({required String subId}) => 'chapter_list?sub_id=$subId';

String subQuesUrl(
        {required String chapterId,
        required String bjs,
        required String barC}) =>
    'sub_ques?chapter_id=$chapterId&bjs=$bjs&bar_c=$barC';
String exerciseQesUrl(
        {required String chapterId,
        required String bjs,
        required String barC}) =>
    'exercise_ques?chapter_id=$chapterId&bjs=$bjs&bar_c=$barC';

String profileUrl({required String userId}) => 'profile?user_id=$userId';

String profileUpdateUrl({required String userId}) =>
    'profile_update?user_id=$userId';

String paymentPostUrl({required String userId}) =>
    'payment_post?user_id=$userId';

String liveExamQuesUrl({required String examId}) =>
    'live_exam_ques?exam_id=$examId';

String examHistoryUrl({required String userId}) =>
    'exam_history?user_id=$userId';

String currentDeviceUrl({required String userId}) =>
    'current_device?user_id=$userId';

String userCoursesUrl({required String userId}) =>
    'user_buy_course_list?user_id=$userId';

String coursePaymentUrl({required String userId}) =>
    'course_payment_post?user_id=$userId';


String courseDetailUrl({required String courseId}) =>
    'course?course_id=$courseId';
