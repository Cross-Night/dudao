//
//  EditViewController.m
//  xiaoxuntong
//
//  Created by demo on 16/3/3.
//  Copyright © 2016年 xietong-xkk. All rights reserved.
//

#import "EditViewController.h"

@implementation EditViewController
@synthesize submitClassSituation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        UIBarButtonItem* uploadButton = [ [ UIBarButtonItem alloc ] initWithTitle: @"录入" style: UIBarButtonItemStyleBordered target: self  action: @selector(confirmationDidPush) ];
        self.navigationItem.rightBarButtonItem = uploadButton;
        
    }
    return self;
}

//疑问
- (NSString *) dataFilePath
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDirectory, YES)objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:@"UN_PW"];
    return filePath;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //自动将基本信息填上
    teacherNameTextField_.text = submitClassSituation.teacher_name;
    studentFaucltyTextField_.text = submitClassSituation.student_faculty;
    teachingClassGroupTextField_.text = submitClassSituation.teaching_class_group;
    lessonDateTextField_.text = submitClassSituation.lesson_date;
    lessonClassroomTextField_.text = submitClassSituation.lesson_classroom;
    lessonSectionTextField_.text = submitClassSituation.lesson_section;
    planPopulationTextField_.text = [ NSString stringWithFormat: @"%@" , submitClassSituation.plan_population ];
    
    //新增字段 输出系统时间
    NSDate* date = [ NSDate date ];
    NSDateFormatter* formatter = [ [ NSDateFormatter alloc ] init ];
    [ formatter setDateFormat: @"HH:mm:ss" ];
    NSString* writeDownTimeString = [ formatter stringFromDate: date ];
    //            NSLog( @"writeDownTimeString %@" , writeDownTimeString );
    writeDownTimeTextField_.text = writeDownTimeString;
    
}


//*--------------------------------点击录入按钮后的事件----------------------------------------*//

//录入的方法
- (void)uploadMessage
{
    dudaoAllTheURL* allTheUrl = [  [ dudaoAllTheURL alloc ] init ] ;
    NSString* urlString = allTheUrl.submitUrl_;
//    NSURL* myUrl = [ NSURL URLWithString: urlString ];
   AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    [manager POST:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"succeed %ld",operation.response.statusCode);
        UIAlertView * alertResult = [ [ UIAlertView alloc ] initWithTitle: nil message: @"录入成功" delegate: self cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
        [ self.navigationController popViewControllerAnimated: YES ];
        [ alertWait dismissWithClickedButtonIndex: [ alertWait cancelButtonIndex ] animated: YES ];
        [ alertResult show ];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"FAIL %ld",operation.response.statusCode);
        if( [operation.response statusCode] == 400)
        {
            UIAlertView* alertResult = [ [ UIAlertView alloc ] initWithTitle: @"录入失败" message: @"请求数据有错" delegate: self cancelButtonTitle: @"取消" otherButtonTitles: nil , nil ];
            [ alertWait dismissWithClickedButtonIndex: [ alertWait cancelButtonIndex ] animated: YES ];
            [ alertResult show ];

        }
        else if([operation.response statusCode]==409)
        {
            UIAlertView* alertResult = [ [ UIAlertView alloc ] initWithTitle: @"录入失败" message: @"此数据已存在" delegate: self cancelButtonTitle: @"取消" otherButtonTitles: nil , nil ];
            [ alertWait dismissWithClickedButtonIndex: [ alertWait cancelButtonIndex ] animated: YES ];
            [ alertResult show ];
        }else if ([operation.response statusCode]==500)
        {
            UIAlertView* alertResult = [ [ UIAlertView alloc ] initWithTitle: @"录入失败" message: @"请确认网络设置正常再重试" delegate: self cancelButtonTitle: @"取消" otherButtonTitles: nil , nil ];
            [ alertWait dismissWithClickedButtonIndex: [ alertWait cancelButtonIndex ] animated: YES ];
            [ alertResult show ];
            
        }else{
            UIAlertView* alertResult = [ [ UIAlertView alloc ] initWithTitle: @"录入失败" message: @"未知错误" delegate:self cancelButtonTitle: @"取消" otherButtonTitles: nil , nil ];
            [ alertWait dismissWithClickedButtonIndex: [ alertWait cancelButtonIndex ] animated: YES ];
            [ alertResult show ];
        }
        
    }];

    /*=================================================================================
     NSMutableData *bodyData = [NSMutableData data];
     NSString *bodyDataStr = [NSString stringWithFormat:@"{\"student_institute\":\"%@\",\"classgroup\":\"%@\",\"study_place\":\"%@\",\"school_time\": \"%@\",\"selectdnum\":%@,\"actualnum\":%@, \"late_leaveEarly\":%@,\"late_leaveEarly_comment\":\"%@\", \"truant\":%@, \"truant_comment\":\"%@\", \"vacate\":%@,\"vacate_comment\": \"%@\", \"food_eat\":%@, \"food_eat_comment\":\"%@\", \"play_cellphone\":%@, \"play_cellphone_comment\":\"%@\",\"sleep_speak\": %@, \"sleep_speak_comment\":\"%@\", \"slipper_shorts\":%@, \"slipper_shorts_comment\":\"%@\",\"teacher_ontime\":%@,\"teacher_ontime_comment\": \"%@\",\"supervisor\":\"%@\", \"absentnum\":%@,\"other_sitution\":\"%@\",\"score\":%@,\"teacher\":\"%@\"}",teacherView.StudentInstitude.text,teacherView.ClassGroup.text,lessonInformationView.StudyPlace.text,lessonInformationView.SchoolTime.text,lessonInformationView.SelectdNumber.text,lessonInformationView.ActualNumber.text,absenceView.LateLeaveEarly.text,absenceView.LateLeaveEarlyComment.text,absenceView.Truant.text,absenceView.TruantComment.text,absenceView.Vacate.text,absenceView.VacateComment.text,disciplineSituationView.FoodEat.text,disciplineSituationView.FoodEatComment.text,disciplineSituationView.PlayCellPhone.text,disciplineSituationView.PlayCellPhoneComment.text,disciplineSituationView.SleepSpeak.text,disciplineSituationView.SleepSpeakComment.text,disciplineSituationView.SlipperShorts.text,disciplineSituationView.SlipperShortsComment.text,teacherView.TeacherOntime.text,teacherView.TeacherOntimeComment.text,uploadView.Supervisor.text,absenceView.AbsentNumber.text,uploadView.OtherSituation.text,uploadView.Score.text,teacherView.Teacher.text];
     ===================================================================================*/
    
    NSMutableDictionary* classSituation = [ [ NSMutableDictionary dictionary ] init ];
    NSMutableData* sendData = [ NSMutableData data ];
    NSString* path =[ self dataFilePath ];
    NSArray* array = [ [ NSArray alloc ] initWithContentsOfFile: path ];
    NSString* superviosr = [ array objectAtIndex: 0 ];
    
    [ classSituation setObject: submitClassSituation.course_class_no forKey: @"course_class_no" ];
    [ classSituation setObject: lessonDateTextField_.text forKey: @"lesson_date" ];
    [ classSituation setObject: lessonSectionTextField_.text forKey: @"lesson_section" ];
    [ classSituation setObject: lessonClassroomTextField_.text forKey: @"lesson_classroom" ];
    
    int absentNum = [ planPopulationTextField_.text intValue ] - [ actualNumTextField_.text intValue ];
    //    NSLog( @"%d", absentNum );
    NSString* absentNumString = [ NSString stringWithFormat: @"%d" , absentNum ];
    
    [ classSituation setObject: absentNumString  forKey: @"Absent_Num" ];
    [ classSituation setObject: actualNumTextField_.text forKey: @"Actual_Num" ];
    [ classSituation setObject: studentFaucltyTextField_.text forKey: @"Student_Faculty" ];
    [ classSituation setObject: foodEatNumTextField_.text forKey: @"Food_Eat_Num" ];
    [ classSituation setObject: lateLeaveEarlyNumTextField_.text forKey: @"Late_LeaveEarly_Num" ];
    [ classSituation setObject: playMobileNumTextField_.text forKey: @"Play_Mobil_Num" ];
    [ classSituation setObject: sleepSpeakNumTextField_.text forKey: @"Sleep_Speak_Num" ];
    [ classSituation setObject: slipperShortsNumTextField_.text forKey: @"Slipper_Shorts_Num" ];
    [ classSituation setObject: teacherOntimeTextField_.text forKey: @"Teacher_Ontime" ];
    [ classSituation setObject: truantNumTextField_.text forKey: @"Truant_Num" ];
    [ classSituation setObject: vacateNumTextField_.text forKey: @"Vacate_Num" ];
    //    [ classSituation setObject: otherSituationTextField_.text forKey:@"Other_Situation"];
    [ classSituation setObject: otherSituationTextView_.text forKey:@"Other_Situation"];
    [ classSituation setObject: superviosr forKey: @"Supervisor" ];
    [ classSituation setObject: @"IOS" forKey: @"Terminal_Type" ];
    [ classSituation setObject: [ [ UIDevice currentDevice ] systemVersion ] forKey: @"Terminal_Desc" ];
    
    //Survey_Time
    NSString *Survey_time = [[ NSString alloc] initWithFormat:@"%@ %@",lessonDateTextField_.text,writeDownTimeTextField_.text];
    [ classSituation setObject: Survey_time forKey:@"Survey_Time"];  //“录入时间”字段加入数据中
    
    
    //    NSLog( @"%@" , actualNumTextField_.text );
    NSString* jsonString = [ [ NSString alloc ] init ];
    jsonString = [ classSituation JSONString ];
    //    NSLog( @"%@" , jsonString );
    
    [ sendData appendData: [ jsonString dataUsingEncoding: NSUTF8StringEncoding ] ];
    //    NSLog( @"%@" , sendData );
    
    //*------------------------------原码----------------------
//    [ request setRequestMethod: @"POST" ];
//    [ request addRequestHeader: @"Content-Type" value: @"application/json;charset=UTF-8" ];
//    //    [ request setValue:SubmitClassSituation forKey:@"course_class_no"];
//    [ request appendPostData: sendData ];
//    [ request setDelegate: self ];
//    [ request setDidFinishSelector: @selector(getResult:) ];
//    [ request setDidFailSelector: @selector(getError:) ];
//    [ request startAsynchronous ];
//
 //--------------------------------------------------------*/
    /*--------------------------测试码---------------------------
     [self GetResult:nil];
     //--------------------------------------------------------*/

}

//---------------------------------------------------------------------------------------
//显示警告框，是否确认录入
- (void)confirmationDidPush
{
    alert = [ [ UIAlertView alloc ] initWithTitle: @"修改确认" message: @"真的要修改吗？" delegate: self cancelButtonTitle: @"否" otherButtonTitles: @"是" , nil ];
    [ alert show ];
}








//---------------------------------------------------------------------------------------

@end
