//
//  ViewController.m
//  督导预约
//
//  Created by 姚润鑫 on 15/11/19.
//  Copyright © 2015年 姚润鑫. All rights reserved.
//

#import "YuyueViewController.h"
#import "FacultyArray.h"

@interface YuyueViewController ()
{
    FacultyArray* facultyArray;
    NSInteger collegeNumber;
    NSString* valueString;
}

@end

@implementation YuyueViewController

-(void)viewDidLoad
{
        [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dudaoView.jpg"]];
    self.title = @"督导预约";
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"预约 " style:UIBarButtonItemStylePlain target:self action:@selector(checkButtonDidPush)];//导航条右边按钮
    self.navigationItem.rightBarButtonItem = button;
    UIImage *buttonImage = [UIImage imageNamed:@"keyboard_arrow_right64.png"];
    CGFloat a = (self.view.bounds.size.width-265)/2;
    CGFloat b = (self.view.bounds.size.height-108-150)/6;
    CGFloat c = b+64;
    //当前学期
    UILabel *currentlabel = [[UILabel alloc] initWithFrame:CGRectMake(a, c, 80, 30)];
    currentSemesterTextField = [[UITextField alloc] initWithFrame:CGRectMake(a+85,c, 180, 30)];
    c += 30;
    c += b;
    currentlabel.backgroundColor = [UIColor clearColor];
    currentlabel.textColor = [UIColor blackColor];
    currentlabel.textAlignment = NSTextAlignmentCenter;
    currentlabel.text = @"当前学期:";
    [self.view addSubview:currentlabel];
    
    currentSemesterTextField.backgroundColor= [UIColor whiteColor];
    currentSemesterTextField.borderStyle = UITextBorderStyleRoundedRect;
    [currentSemesterTextField setFont:[UIFont fontWithName:@"Helvetica" size:16 ]];
    currentSemesterTextField.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    
    UIButton*currentbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    currentbutton.alpha = 1.0;
    currentbutton.frame  = CGRectMake( 0, 0, 22, 22);
    [currentbutton setImage:buttonImage forState:UIControlStateNormal];
    [currentbutton addTarget: self
                              action: @selector(currentButtonDidPush)
                    forControlEvents: UIControlEventTouchUpInside ];
    currentSemesterTextField.rightViewMode = UITextFieldViewModeAlways;
    currentSemesterTextField.rightView = currentbutton;
    currentSemesterTextField.delegate = self;
    
    [self.view addSubview:currentSemesterTextField];
    
    //周       次
    UILabel *weeklabel = [[UILabel alloc] initWithFrame:CGRectMake(a, c, 80, 30)];
    numberOfWeekTextField = [[UITextField alloc] initWithFrame:CGRectMake(a+85, c, 180, 30)];
    c += 30;
    c += b;
    
    weeklabel.backgroundColor = [UIColor clearColor];
    weeklabel.textColor = [UIColor blackColor];
    weeklabel.textAlignment = NSTextAlignmentCenter;
    weeklabel.text = @"周       次:";
    [self.view addSubview:weeklabel];
    
    numberOfWeekTextField.backgroundColor = [UIColor whiteColor];
    numberOfWeekTextField.borderStyle = UITextBorderStyleRoundedRect;
    [numberOfWeekTextField setFont:[UIFont fontWithName:@"Helvetica" size:16 ]];
    numberOfWeekTextField.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    
    UIButton *weekbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    weekbutton.frame = CGRectMake(0, 0, 22, 22);
    [weekbutton setImage:buttonImage forState:UIControlStateNormal];
    [weekbutton addTarget:self action:@selector(weekbuttonDidPush) forControlEvents:UIControlEventTouchUpInside];
    numberOfWeekTextField.rightViewMode = UITextFieldViewModeAlways;
    numberOfWeekTextField.rightView = weekbutton;
    numberOfWeekTextField.delegate = self;
    [self.view addSubview:numberOfWeekTextField];
    
    //学       院
    UILabel *collegelabel = [[UILabel alloc] initWithFrame:CGRectMake(a, c, 80, 30)];
    collegeTextField = [[UITextField alloc] initWithFrame:CGRectMake(a+85, c, 180, 30)];
    c += 30;
    c += b;
    
    collegelabel.backgroundColor = [UIColor clearColor];
    collegelabel.textColor = [UIColor blackColor];
    collegelabel.textAlignment = NSTextAlignmentCenter;
    collegelabel.text = @"学       院:";
    [self.view addSubview:collegelabel];
    
    collegeTextField.backgroundColor = [UIColor whiteColor];
    collegeTextField.borderStyle = UITextBorderStyleRoundedRect;
    [collegeTextField setFont:[UIFont fontWithName:@"Helvetica" size:16 ]];
    collegeTextField.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    
    UIButton *collegebutton = [UIButton buttonWithType:UIButtonTypeCustom];
    collegebutton.frame = CGRectMake(0, 0, 22, 22);
    [collegebutton setImage:buttonImage forState:UIControlStateNormal];
    [collegebutton addTarget:self action:@selector(collageButtonDidPush) forControlEvents:UIControlEventTouchUpInside];
    collegeTextField.rightViewMode = UITextFieldViewModeAlways;
    collegeTextField.rightView = collegebutton;
    collegeTextField.delegate = self;
    [self.view addSubview:collegeTextField];
    
    //星       期
    UILabel *weekdaylabel = [[UILabel alloc] initWithFrame:CGRectMake(a, c, 80, 30)];
    weekTextField = [[UITextField alloc] initWithFrame:CGRectMake(a+85, c, 180, 30)];
    c += 30;
    c += b;
    
    weekdaylabel.backgroundColor = [UIColor clearColor];
    weekdaylabel.textColor = [UIColor blackColor];
    weekdaylabel.textAlignment = NSTextAlignmentCenter;
    weekdaylabel.text = @"星       期:";
    [self.view addSubview:weekdaylabel];
    
    weekTextField.backgroundColor = [UIColor whiteColor];
    weekTextField.borderStyle = UITextBorderStyleRoundedRect;
    [weekTextField setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    
    UIButton *weekdaybutton = [UIButton buttonWithType:UIButtonTypeCustom];
    weekdaybutton.frame = CGRectMake(0, 0, 22, 22);
    [weekdaybutton setImage:buttonImage forState:UIControlStateNormal];
    [weekdaybutton addTarget:self action:@selector(weekdayButtonDidPush) forControlEvents:UIControlEventTouchUpInside];
    weekTextField.rightViewMode = UITextFieldViewModeAlways;
    weekTextField.rightView = weekdaybutton;
    weekTextField.delegate =self;
    [self.view addSubview:weekTextField];
    
    //节       次
    UILabel *classlabel = [[UILabel alloc] initWithFrame:CGRectMake(a, c, 80, 30)];
    numberOfClassTextField = [[UITextField alloc] initWithFrame:CGRectMake(a+85, c, 180, 30)];
    
    classlabel.backgroundColor = [UIColor clearColor];
    classlabel.textColor = [UIColor blackColor];
    classlabel.textAlignment = NSTextAlignmentCenter;
    classlabel.text = @"节       次:";
    [self.view addSubview:classlabel];
    numberOfClassTextField.backgroundColor = [UIColor whiteColor];
    numberOfClassTextField.borderStyle = UITextBorderStyleRoundedRect;
    [numberOfClassTextField setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    
    UIButton *classbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    classbutton.frame = CGRectMake(0, 0, 22, 22);
    [classbutton setImage:buttonImage forState:UIControlStateNormal];
    [classbutton addTarget:self action:@selector(classButtonDidPush) forControlEvents:UIControlEventTouchUpInside];
    numberOfClassTextField.rightViewMode = UITextFieldViewModeAlways;
    numberOfClassTextField.rightView = classbutton;
    numberOfClassTextField.delegate = self;
    [self.view addSubview:numberOfClassTextField];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)currentButtonDidPush
{
    NSString* nothing = @" ";
    
    NSDate * senddate = [NSDate date];
    NSCalendar * cal = [NSCalendar currentCalendar];
    
    NSUInteger unitFlags = NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    NSDateComponents * component = [cal components:unitFlags fromDate:senddate];
    
    NSInteger year = [component year];
    NSInteger month = [component month];//获取当前年月
    if(month<9)
        year = year - 1;
    NSString *currentSemester1 = [NSString stringWithFormat:@"%4ld-%4ld-1",year-1,year];
    NSString *currentSemester2 = [NSString stringWithFormat:@"%4ld-%4ld-2",year-1,year];//上学年
    NSString *currentSemester3 = [NSString stringWithFormat:@"%4ld-%4ld-1",year,year+1];
    NSString *currentSemester4 = [NSString stringWithFormat:@"%4ld-%4ld-2",year,year+1];// 本学年

    
    currentSemesterTextField.text = nothing;
    currentSemesterSheet = [[UIActionSheet alloc] init];
    currentSemesterSheet.tag = 1;
    currentSemesterSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    currentSemesterSheet.delegate = self;
    [currentSemesterSheet addButtonWithTitle:currentSemester1];
    [currentSemesterSheet addButtonWithTitle:currentSemester2];
    [currentSemesterSheet addButtonWithTitle:currentSemester3];
    [currentSemesterSheet addButtonWithTitle:currentSemester4];
    [currentSemesterSheet addButtonWithTitle:@"取消"];
    currentSemesterSheet.cancelButtonIndex = 6;//新服务器数据
//    [currentSemesterSheet addButtonWithTitle:@"2012-2013-1"];
//    [currentSemesterSheet addButtonWithTitle:@"2012-2013-2"];
//    [currentSemesterSheet addButtonWithTitle:@"取消"];
//    currentSemesterSheet.cancelButtonIndex = 2;//老服务器数据
    [currentSemesterSheet showInView:self.view];
}

-(void)weekbuttonDidPush
{
    NSString* nothing = @" ";
    numberOfClassTextField.text = nothing;
    numberOfWeekSheet = [[UIActionSheet alloc]init];
    numberOfWeekSheet.tag = 2;
    numberOfWeekSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    numberOfWeekSheet.delegate = self;
    for(int i = 1;i <= 20;i++)
    {
        [numberOfWeekSheet addButtonWithTitle:[NSString stringWithFormat:@"%d",i]];
    }
    [numberOfWeekSheet addButtonWithTitle:@"取消"];
    numberOfWeekSheet.cancelButtonIndex = 20;
    [numberOfWeekSheet showInView:self.view];
}

-(void)collageButtonDidPush
{
    NSString* nothing = @" ";
    collegeTextField.text = nothing;
    collegeSheet = [[UIActionSheet alloc] init];
    collegeSheet.tag = 3;
    collegeSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    collegeSheet.delegate = self;
    facultyArray = [ [ FacultyArray alloc ] init ];
    for(NSString * title in facultyArray)
    {
        [collegeSheet addButtonWithTitle:title];
    }
    [collegeSheet addButtonWithTitle:@"取消"];
    collegeSheet.cancelButtonIndex = [facultyArray count];
    [collegeSheet showInView:self.view];
}

-(void)weekdayButtonDidPush
{
    NSString * nothing = @" ";
    weekTextField.text=nothing;
    weekSheet = [[UIActionSheet alloc]init];
    weekSheet.tag = 4;
    weekSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    weekSheet.delegate = self;
    
    [weekSheet addButtonWithTitle:@"周一"];
    [weekSheet addButtonWithTitle:@"周二"];
    [weekSheet addButtonWithTitle:@"周三"];
    [weekSheet addButtonWithTitle:@"周四"];
    [weekSheet addButtonWithTitle:@"周五"];
    [weekSheet addButtonWithTitle:@"周六"];
    [weekSheet addButtonWithTitle:@"周日"];
    [weekSheet addButtonWithTitle:@"取消"];
    weekSheet.cancelButtonIndex = 7;
    [weekSheet showInView:self.view];
}

- (void)classButtonDidPush
{
    NSString* nothing = @" ";
    numberOfClassTextField.text = nothing;
    numberOfClassSheet = [[UIActionSheet alloc] init];
    numberOfClassSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    numberOfClassSheet.delegate = self;
    numberOfClassSheet.tag = 5;
    [numberOfClassSheet addButtonWithTitle:@"1,2"];
    [numberOfClassSheet addButtonWithTitle:@"3,4"];
    [numberOfClassSheet addButtonWithTitle:@"5"];
    [numberOfClassSheet addButtonWithTitle:@"6,7"];
    [numberOfClassSheet addButtonWithTitle:@"8,9"];
    [numberOfClassSheet addButtonWithTitle:@"10,11,12"];
    [numberOfClassSheet addButtonWithTitle:@"取消"];
    numberOfClassSheet.cancelButtonIndex = 6;
    [numberOfClassSheet showInView:self.view];
}

- (void)integerToString:(NSInteger)integer {
    if(integer <= 9){
        valueString = [NSString stringWithFormat: @"0%ld" , integer  ];
    }
    else {
        valueString = [NSString stringWithFormat:@"%ld" , integer];
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ( actionSheet.tag == 1)
    {
        if(buttonIndex<4)
        {
            currentSemesterbool = YES;
            currentSemesterTextField.text = [currentSemesterSheet buttonTitleAtIndex:buttonIndex];
            NSLog(@"semester:%@" , currentSemesterTextField.text);
        }
//        if(buttonIndex<2)
//        {
//            currentSemesterbool = YES;
//            currentSemesterTextField.text = [currentSemesterSheet buttonTitleAtIndex:buttonIndex];
//            NSLog(@"semester:%@" , currentSemesterTextField.text);
//        }
        else
        {
            currentSemesterbool = NO;
        }
    }
    else if ( actionSheet.tag == 2 )
    {
        if(buttonIndex<20)
        {
            numberOfWeekbool = YES;
            numberOfWeekTextField.text = [numberOfWeekSheet buttonTitleAtIndex:buttonIndex];
            NSLog(@"numberOfWeek:%@" , numberOfWeekTextField.text);
        }
        else
        {
            numberOfWeekbool = NO;
        }
    }
    else if ( actionSheet.tag == 3 )
    {
        if(buttonIndex<[facultyArray count])
        {
            collegebool = YES;
            collegeTextField.text = [collegeSheet buttonTitleAtIndex:buttonIndex];
            NSLog(@"college:%@" , collegeTextField.text);
            collegeNumber = buttonIndex + 1;
            [self integerToString:collegeNumber];
        }
        else
        {
            collegebool = NO;
        }
    }
    else if ( actionSheet.tag == 4 )
    {
        if(buttonIndex<7)
        {
            weekbool = YES;
            weekTextField.text = [weekSheet buttonTitleAtIndex: buttonIndex];
            NSLog(@"week:%@",weekTextField.text);
        }
        else
        {
            weekbool = NO;
        }
    }
    else if(actionSheet.tag == 5)
    {
        if(buttonIndex < 6)
        {
            numberOfClassbool = YES;
            numberOfClassTextField.text = [ numberOfClassSheet buttonTitleAtIndex:buttonIndex ];
            NSLog(@"class:%@" , numberOfClassTextField.text);
        }
        else
        {
            numberOfClassbool = NO;
        }
    }
}

-(void)checkButtonDidPush
{
    /*------------------------------------登录等候提示----------------------------------*/
    
//    //提示窗口
//    alert_ = [ [ UIAlertView alloc ] initWithTitle: @"正在查询，请稍候...." message: nil delegate: nil cancelButtonTitle: @"取消" otherButtonTitles: nil , nil ] ;
//    //指示器
//    UIActivityIndicatorView* indicator = [  [ UIActivityIndicatorView alloc ] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge ];
//    indicator.center = CGPointMake( 140.0f , alert_.bounds.size.height + 70.0f );
//    //等待提示窗口运作
//    [ indicator startAnimating ];
//    [ alert_ show ];
//    [ alert_ addSubview: indicator ];
    /*--------------------------------------------------------------------------------*/
    
    if ( !currentSemesterbool || !weekbool || !numberOfWeekbool || !numberOfClassbool || !collegebool )
    {
        UIAlertView* nullAlert = [ [ UIAlertView alloc ] initWithTitle: nil message: @"请将信息填写完整" delegate: self cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
//        [ alert_ dismissWithClickedButtonIndex: [ alert_ cancelButtonIndex ] animated: YES ];
        [ nullAlert show ];
    }
    else
    {
        MBProgressHUD * H = [self displayHUD:@"正在查询，请稍候...."];
        //NSString* path = [ self dataFilePath ];
        //NSArray* array = [ [ NSArray alloc ] initWithContentsOfFile: path ];
        //NSString* superviosr = [ array objectAtIndex: 0 ];
        NSString* bookingUrlString = [ NSString stringWithFormat: @"http://eva.gdut.edu.cn:8080/dudaobooking/%@/%@/%@/%@/%@", valueString , currentSemesterTextField.text ,numberOfWeekTextField.text , weekTextField.text  , numberOfClassTextField.text ];
        NSLog( @"%@" , bookingUrlString );
        NSString * UTF8UrlStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)bookingUrlString , NULL , NULL , kCFStringEncodingUTF8));
        NSURL* bookingURL = [ NSURL URLWithString: UTF8UrlStr ];
        NSLog( @"%@" , bookingURL );
        bookingUrlString = [NSString stringWithFormat:@"%@",bookingURL];
        NSLog( @"%@" , bookingUrlString );
        
        AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
        [manager GET:bookingUrlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
                NSLog(@"SUCCEED %ld",operation.response.statusCode);
                [H hide:YES];
            NSString* resultString = [ operation responseString ];
            //        NSLog( @"%@" , resultString );
            NSDictionary* resultDictionary = [ resultString objectFromJSONString ];
            ClassSituation* classSituation = [ [ClassSituation alloc ] init ];
            classSituation.booking_class = [ resultDictionary objectForKey: @"booking_class"];
            NSLog(@"%@" , classSituation.booking_class);
            
            //预约界面
            _bookingTableView = [[BookingTableViewController alloc] init];
            if(classSituation.booking_class != NULL){
                _bookingTableView.bookingArray = classSituation.booking_class;
                _bookingTableView.weekString = numberOfWeekTextField.text;
                [self.navigationController pushViewController:_bookingTableView animated:YES];
            }
            else
            {
                UIAlertView* errorAlert  = [ [ UIAlertView alloc ] initWithTitle: @"查询失败" message: @"没有找到相应预约信息,请确认所有信息已填入..." delegate: self cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                [ errorAlert show ];
                
            }
           
        }
             failure:^(AFHTTPRequestOperation *operation, NSError *error){
                  NSLog(@"FAIL %ld",operation.response.statusCode);
                 [H hide:YES];
                 if( [operation.response statusCode] == 400)
                 {
                     
                     NSLog(@"%@",error);
                     UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"查询失败" message: error.localizedDescription  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                     [ errorAlert show ];
                    
                 }
                 else if([operation.response statusCode]==404)
                 {
                     NSLog(@"%@",error);
                     UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"查询失败" message: error.localizedDescription  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                     [ errorAlert show ];
                 }else if ([operation.response statusCode]==0)
                 {
                     NSLog(@"%@",error);
                     UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"连接错误，无法连接到服务器" message: error.localizedDescription  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                     [ errorAlert show ];
                 }
             }];

    }
}
- (MBProgressHUD *)displayHUD:(NSString *)text{
    //MBProgressHUD 登陆转圈圈
    MBProgressHUD * HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    //HUD.delegate = self;//代理什么的没必要写啦
    
    //可设置HUD样式
    //HUD.mode = MBProgressHUDModeAnnularDeterminate;
    
    HUD.dimBackground = YES;
    HUD.labelText = text;
    [HUD show:YES];
    
    return HUD;
}
-(void)NewcheckButtonDidPush//没有服务器情况下的测试界面方法
{
    _bookingTableView = [[BookingTableViewController alloc] init];
    _bookingTableView.bookingArray = facultyArray;
    _bookingTableView.weekString = numberOfWeekTextField.text;
        [self.navigationController pushViewController:_bookingTableView animated:YES];
//        UIAlertView* errorAlert  = [ [ UIAlertView alloc ] initWithTitle: @"查询失败" message: @"没有找到相应预约信息,请确认所有信息已填入..." delegate: self cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
//        [ errorAlert show ];
}
//
//
//-(NSString *) dataFilePath
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    //NSLog(@"%@",paths);
//    NSString *documentsDirectory=[paths objectAtIndex:0];
//    return [documentsDirectory stringByAppendingPathComponent:@"UN_PW"];
//}
@end
