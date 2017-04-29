//
//  EnterViewController.m
//  xiaoxuntong
//
//  Created by demo on 15/11/26.
//  Copyright © 2015年 xietong-xkk. All rights reserved.
//

#import "EnterViewController.h"

@interface EnterViewController (){
    NSInteger sectionOfClassroomButtonIndex;
}


@end

@implementation EnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    view.backgroundColor = [UIColor whiteColor];
//    UIImage *buttonImage = [UIImage imageNamed:@"keyboard_arrow_right64.png"];
    UIBarButtonItem * nextStep_rightItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStyleBordered  target:self action:@selector(nextStepButtonDidPush)];
    self.navigationItem.rightBarButtonItem = nextStep_rightItem;
    self.view = view;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dudaoView.jpg"]];
    self.title = @"督导录入";
    
    CGFloat a = (self.view.bounds.size.width-265)/2;
    CGFloat b = (self.view.bounds.size.height-108-150)/6;
    CGFloat c = b+64;
    
    UILabel * schoolDistrict = [[UILabel alloc] init];
    schoolDistrict.text = @"校       区";
    //    schoolDistrict.font = [UIFont fontWithName:@"Arial" size:24];
    schoolDistrict.textAlignment =  NSTextAlignmentCenter;
    schoolDistrict.frame = CGRectMake(a, c, 80, 30);
    //    schoolDistrict.backgroundColor = [UIColor orangeColor];
    schoolDistrict.font = [UIFont fontWithName:@"Helvetica" size:16];
    schoolDistrict.backgroundColor = [ UIColor clearColor ];
    schoolDistrict.textColor = [UIColor blackColor];
    [self.view addSubview:schoolDistrict];
    
    SchoolDistrictTextField_ = [[UITextField alloc] init];
    SchoolDistrictTextField_.frame = CGRectMake(a+85,c, 180, 30);
    SchoolDistrictTextField_.backgroundColor = [UIColor whiteColor];
//    [SchoolDistrictTextField_.layer setBorderColor:[UIColor blackColor].CGColor];
//    [SchoolDistrictTextField_.layer setBorderWidth:1];
    [SchoolDistrictTextField_ setFont:[UIFont fontWithName:@"Helvetica" size:16 ]];
    [SchoolDistrictTextField_.layer setMasksToBounds:YES];
    SchoolDistrictTextField_.borderStyle = UITextBorderStyleRoundedRect;
    SchoolDistrictTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    SchoolDistrictTextField_.layer.cornerRadius = 10;
    SchoolDistrictTextField_.placeholder = @"输入校区";
    [self.view addSubview:SchoolDistrictTextField_];
    
    c += 30;
    c += b;
    
    
    UILabel * date = [[UILabel alloc] init];
    date.text = @"日       期";
    //    date.font = [UIFont fontWithName:@"Arial" size:24];
    date.textAlignment =  NSTextAlignmentCenter;
    date.frame = CGRectMake(a, c, 80, 30);
    //    date.backgroundColor = [UIColor orangeColor];
    date.font = [UIFont fontWithName:@"Helvetica" size:16];
    date.backgroundColor = [ UIColor clearColor ];
    date.textColor = [UIColor blackColor];
    [self.view addSubview:date];

    DateTextField_ = [[UITextField alloc] init];
    DateTextField_.frame = CGRectMake(a+85, c, 180, 30);
    DateTextField_.backgroundColor = [UIColor whiteColor];
//    [DateTextField_.layer setBorderColor:[UIColor blackColor].CGColor];
//    [DateTextField_.layer setBorderWidth:1];
    [DateTextField_.layer setMasksToBounds:YES];
    DateTextField_.borderStyle = UITextBorderStyleRoundedRect;
    DateTextField_.delegate = self;
    DateTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    DateTextField_.layer.cornerRadius = 10;
    [DateTextField_ setFont:[UIFont fontWithName:@"Helvetica" size:16 ]];
    DateTextField_.placeholder = @"输入日期";
    [self.view addSubview:DateTextField_];
    
    c += 30;
    c += b;
    
    
    UILabel * sectionOfClassroom = [[UILabel alloc] init];
    sectionOfClassroom.text = @"课室类型";
    //    sectionOfClassroom.font = [UIFont fontWithName:@"Arial" size:24];
    sectionOfClassroom.textAlignment =  NSTextAlignmentCenter;
    sectionOfClassroom.frame = CGRectMake(a, c, 80, 30);
    //    sectionOfClassroom.backgroundColor = [UIColor orangeColor];
    sectionOfClassroom.font = [UIFont fontWithName:@"Helvetica" size:16];
    sectionOfClassroom.backgroundColor = [ UIColor clearColor ];
    sectionOfClassroom.textColor = [UIColor blackColor];
    [self.view addSubview:sectionOfClassroom];
    

    SectionOfClassroomTextField_ = [[UITextField alloc] init];
    SectionOfClassroomTextField_.frame = CGRectMake(a+85, c, 180, 30);
    SectionOfClassroomTextField_.backgroundColor = [UIColor whiteColor];
//    [SectionOfClassroomTextField_.layer setBorderColor:[UIColor blackColor].CGColor];
//    [SectionOfClassroomTextField_.layer setBorderWidth:1];
    [SectionOfClassroomTextField_.layer setMasksToBounds:YES];
    SectionOfClassroomTextField_.borderStyle = UITextBorderStyleRoundedRect;
    SectionOfClassroomTextField_.delegate =self;
//    SectionOfClassroomTextField_.layer.cornerRadius = 10;
    SectionOfClassroomTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [SectionOfClassroomTextField_ setFont:[UIFont fontWithName:@"Helvetica" size:16 ]];
    SectionOfClassroomTextField_.placeholder = @"课室类型";
    [self.view addSubview:SectionOfClassroomTextField_];
    
    
    c += 30;
    c += b;
    

    UILabel * classroom = [[UILabel alloc] init];
    classroom.text = @"课       室";
    //    classroom.font = [UIFont fontWithName:@"Arial" size:24];
    classroom.textAlignment =  NSTextAlignmentCenter;
    classroom.frame = CGRectMake(a, c, 80, 30);
    //    classroom.backgroundColor = [UIColor orangeColor];
    classroom.font = [UIFont fontWithName:@"Helvetica" size:16];
    classroom.backgroundColor = [ UIColor clearColor ];
    classroom.textColor = [UIColor blackColor];
    [self.view addSubview:classroom];
    

    ClassroomTextField_ = [[UITextField alloc] init];
    ClassroomTextField_.frame = CGRectMake(a+85, c, 180, 30);
    ClassroomTextField_.backgroundColor = [UIColor whiteColor];
//    [ClassroomTextField_.layer setBorderColor:[UIColor blackColor].CGColor];
//    [ClassroomTextField_.layer setBorderWidth:1];
    [ClassroomTextField_.layer setMasksToBounds:YES];
    ClassroomTextField_.borderStyle = UITextBorderStyleRoundedRect;
    [ClassroomTextField_ setFont:[UIFont fontWithName:@"Helvetica" size:16 ]];
    ClassroomTextField_.delegate = self;
    ClassroomTextField_.placeholder = @"课室";
    ClassroomTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//    ClassroomTextField_.layer.cornerRadius = 10;
    [self.view addSubview:ClassroomTextField_];
    
    c += 30;
    c += b;
    

    UILabel * numberOfClass = [[UILabel alloc] init];
    numberOfClass.text = @"节       次";
    //    numberOfClass.font = [UIFont fontWithName:@"Arial" size:24];
    numberOfClass.textAlignment =  NSTextAlignmentCenter;
    numberOfClass.frame = CGRectMake(a, c, 80, 30);
    //    numberOfClass.backgroundColor = [UIColor orangeColor];
    numberOfClass.font = [UIFont fontWithName:@"Helvetica" size:16];
    numberOfClass.backgroundColor = [ UIColor clearColor ];
    numberOfClass.textColor = [UIColor blackColor];
    [self.view addSubview:numberOfClass];

    
    NumberOfClassTextField_ = [[UITextField alloc] init];
    NumberOfClassTextField_.frame = CGRectMake(a+85, c, 180, 30);
    NumberOfClassTextField_.backgroundColor = [UIColor whiteColor];
//   [NumberOfClassTextField_.layer setBorderColor:[UIColor blackColor].CGColor];
//   [NumberOfClassTextField_.layer setBorderWidth:1];
    [NumberOfClassTextField_.layer setMasksToBounds:YES];
    NumberOfClassTextField_.borderStyle = UITextBorderStyleRoundedRect;
    [NumberOfClassTextField_ setFont:[UIFont fontWithName:@"Helvetica" size:16 ]];
    NumberOfClassTextField_.delegate = self;
//   NumberOfClassTextField_.layer.cornerRadius = 10;
    NumberOfClassTextField_.placeholder = @"节次";
    NumberOfClassTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:NumberOfClassTextField_];
    
    
    
//    UILabel * HeadLabel =[[UILabel alloc] init];
//    HeadLabel.text = @"录入督导信息";
//    HeadLabel.textColor = [UIColor blueColor];
//    HeadLabel.textAlignment = NSTextAlignmentCenter;
//    HeadLabel.font = [UIFont fontWithName:@"ArialMT" size:25];
//    HeadLabel.frame = CGRectMake(0, 80, self.view.frame.size.width, 50);
//    //HeadLabel.backgroundColor = [UIColor blueColor];
//    [self.view addSubview:HeadLabel];
    
    UIButton * schoolDistrictButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage * bgImage1 = [UIImage imageNamed:@"keyboard_arrow_right64.png"];
    [schoolDistrictButton setBackgroundImage:bgImage1 forState:UIControlStateNormal];
    schoolDistrictButton.frame = CGRectMake(0, 0, 22, 22);
    schoolDistrictButton.alpha = 1.0;
//    [schoolDistrictButton addTarget:self action:@selector(chooseSD) forControlEvents:UIControlEventTouchUpInside];
    [ schoolDistrictButton addTarget: self
                              action: @selector(schoolDistrictButtonDidPush)
                    forControlEvents: UIControlEventTouchUpInside ];
    SchoolDistrictTextField_.rightViewMode = UITextFieldViewModeAlways;
    SchoolDistrictTextField_.rightView = schoolDistrictButton;
  //  [self.view addSubview:schoolDistrictButton];
    
    UIButton * DateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // UIImage * bgImage2 = [UIImage imageNamed:@"蓝色向下箭头22X22.png"];
    [DateButton setBackgroundImage:bgImage1 forState:UIControlStateNormal];
    DateButton.frame = CGRectMake(0, 0, 22, 22);
    DateButton.alpha = 1.0;
    DateTextField_.rightViewMode = UITextFieldViewModeAlways;
    DateTextField_.rightView = DateButton;
    [ DateButton addTarget: self
                    action: @selector(DateButtonDidPush)
          forControlEvents: UIControlEventTouchUpInside ];
//    [self.view addSubview:DateButton];
    
    UIButton * SectionOfClassroomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [SectionOfClassroomButton setBackgroundImage:bgImage1 forState:UIControlStateNormal];
    SectionOfClassroomButton.frame = CGRectMake(0, 0, 22, 22);
    SectionOfClassroomButton.alpha = 1.0;
    SectionOfClassroomTextField_.rightViewMode = UITextFieldViewModeAlways;
    SectionOfClassroomTextField_.rightView = SectionOfClassroomButton;
    [SectionOfClassroomButton addTarget:self action:@selector(SectionOfClassroomButtonDidPush) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:SectionOfClassroomButton];
    
    UIButton * ClassroomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [ClassroomButton setBackgroundImage:bgImage1 forState:UIControlStateNormal];
    ClassroomButton.frame = CGRectMake(0, 0, 22, 22);
    ClassroomButton.alpha = 1.0;
    ClassroomTextField_.rightViewMode = UITextFieldViewModeAlways;
    ClassroomTextField_.rightView = ClassroomButton;
    [ClassroomButton addTarget:self action:@selector(ClassroomButtonDidPush) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:ClassroomButton];
    
    UIButton * NumberOfClassButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [NumberOfClassButton setBackgroundImage:bgImage1 forState:UIControlStateNormal];
    NumberOfClassButton.frame = CGRectMake(0, 0, 22, 22);
    NumberOfClassButton.alpha = 1.0;
    NumberOfClassTextField_.rightViewMode = UITextFieldViewModeAlways;
    NumberOfClassTextField_.rightView = NumberOfClassButton;
    [ NumberOfClassButton addTarget: self
                             action: @selector(NumberOfClassButtonDidPush)
                   forControlEvents: UIControlEventTouchUpInside ];
//    [self.view addSubview:NumberOfClassButton];
    
    NSString * nothing =@" ";

    //----------------------------------校区，教室类型，具体教室统一赋初值------------------------//
//
//    SchoolDistrictTextField_.text = nothing;
//    SectionOfClassroomTextField_.text = nothing;
//    ClassroomTextField_.text = nothing;

    //初始化教室类型、教室、字典
    SectionOfClassroomArray_ = [ [ NSMutableArray alloc ] init ];
    ClassroomArray_ = [ [ NSMutableArray alloc ] init ];
    
    //--------------------------------------------------------------------------------------//
    //选择框决定使用操作栏，省去TableView
    
    //初始化alert_
    alert_ = [ [ UIAlertView alloc ] init ];
    



    // Do any additional setup after loading the view.
}


-(void)nextStepButtonDidPush
{
    //[self.parentViewController.navigationController popToRootViewControllerAnimated: YES];
    // [self.navigationController popToRootViewControllerAnimated:YES];
    /*------------------------------------登录等候提示----------------------------------*/
    
    //提示窗口
    alert_ = [ [ UIAlertView alloc ] initWithTitle: @"正在查找，请稍候...." message: nil delegate: nil cancelButtonTitle: @"取消" otherButtonTitles: nil , nil ] ;
    //指示器
    UIActivityIndicatorView* indicator = [  [ UIActivityIndicatorView alloc ] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleWhiteLarge ];
    indicator.center = CGPointMake( 140.0f , alert_.bounds.size.height + 70.0f );
    //等待提示窗口运作
    [ indicator startAnimating ];
    [ alert_ show ];
    [ alert_ addSubview: indicator ];
    /*--------------------------------------------------------------------------------*/
    if ( [SchoolDistrictTextField_.text isEqualToString:@" "] ||
        [DateTextField_.text isEqualToString: @""] ||
        [SectionOfClassroomTextField_.text isEqualToString: @" "] ||
        [ClassroomTextField_.text isEqualToString: @" " ]||
        [NumberOfClassTextField_.text isEqualToString: @""] )
    {
        UIAlertView* nullAlert = [ [ UIAlertView alloc ] initWithTitle: nil message: @"请将信息填写完整" delegate: self cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
        [ alert_ dismissWithClickedButtonIndex: [ alert_ cancelButtonIndex ] animated: YES ];
        [ nullAlert show ];
    }
    else
    {
        NSString* path = [ self dataFilePath ];
        NSArray* array = [ [ NSArray alloc ] initWithContentsOfFile: path ];
        NSString* superviosr = [ array objectAtIndex: 0 ];
        //        dudaoAllTheURL* allTheUrl = [ [ [ dudaoAllTheURL alloc] init ] autorelease ];
        //        NSString* url = allTheUrl.checkUrl_;
        NSString* checkUrlString = [ NSString stringWithFormat: @"%@/%@/%@/%@/%@/%@", CheckUrl , SchoolNumber_ , DateTextField_.text , ClassroomTextField_.text ,NumberOfClassTextField_.text , superviosr ];
        
        //生成url，并发送请求
        //        NSString* path = [ self dataFilePath ];
        //        NSArray* array = [ [ NSArray alloc ] initWithContentsOfURL: (NSURL*) path ];
        //        NSString* superviosr = [ array objectAtIndex: 0 ];
        //        dudaoAllTheURL* allTheUrl = [ [ [ dudaoAllTheURL alloc] init ] autorelease ];
        //        NSString* url = allTheUrl.checkUrl_;
        //        NSString* checkUrlString = [ NSString stringWithFormat: @"%@/%@/%@/%@/%@/%@", url , schoolNumber_ , lessonDateTextField_.text , lessonClassroomTextField_.text ,lessonSectionTextField_.text , superviosr ];
       // NSLog( @"%@" , checkUrlString );
        NSLog(@"   hello ");
        //NSString* UTF8UrlStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)checkUrlString , NULL , NULL , kCFStringEncodingUTF8 ));
        // NSString* UTF8UrlStr = (NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)checkUrlString , NULL , NULL , kCFStringEncodingUTF8 );
        // NSString* UTF8UrlStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)checkUrlString, NULL, NULL, kCFStringEncodingUTF8));
        NSString * UTF8UrlStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)checkUrlString , NULL , NULL , kCFStringEncodingUTF8));
        NSURL* checkURL = [ NSURL URLWithString: UTF8UrlStr ];
        NSLog( @"%@" , checkURL );
        
        AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
        [manager GET:UTF8UrlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"SUCCEED,=%ld",(long)operation.response.statusCode);
            if ( operation.response.statusCode == 200 )
            {
                //        NSLog( @"%d" , [ request responseStatusCode ] );
                NSString* resultString = operation.responseString;
                //        NSLog( @"%@" , resultString );
                NSDictionary* resultDictionary = [ resultString objectFromJSONString ];
                ClassSituation* classSituation = [ [ ClassSituation alloc ] init ];
                classSituation.teaching_class_group = [ resultDictionary objectForKey: @"teaching_class_group" ];
                classSituation.student_faculty = [ resultDictionary objectForKey: @"student_faculty" ];
                classSituation.plan_population = [ resultDictionary objectForKey: @"plan_population" ];
                classSituation.course_class_no = [ resultDictionary objectForKey: @"course_class_no" ];
                classSituation.teacher_name = [ resultDictionary objectForKey: @"teacher_name" ];
                
                classSituation.lesson_section = NumberOfClassTextField_.text;
                classSituation.lesson_classroom =ClassroomTextField_.text;
                classSituation.lesson_date = DateTextField_.text;
                
                //录入窗口
                EditView = [ [ EditViewController alloc ] init ];//回头看这里
                //        NSLog( @"%@" , classSituation.lesson_date );
                //        NSLog( @"%@" , classSituation.course_class_no );
                [ alert_ dismissWithClickedButtonIndex: [ alert_ cancelButtonIndex ] animated: YES ];
                if ( classSituation.course_class_no != NULL )
                {
                    
                    EditView.submitClassSituation = classSituation;
                    //            submitView.writeDownTimeTextField_.text = writeDownTimeString;
                    [ self.navigationController pushViewController: EditView animated: YES ];
                    //            allTheClassroomDictionary_ = nil;
                    //            //节次数组
                    //            //NumberOfClassArray_ = nil;
                    //            xmlData_ = nil;
                    //            parserXML_ = nil;
                    //            //dataToParse_ = nil;
                    //            workingArray_ = nil;
                    //            workingPropertyString_ = nil;
                    //            elementsToParse_ = nil;
                    //            NSString * nothing = @" ";
                    //            SchoolDistrictTextField_.text= nothing;;
                    //            SectionOfClassroomTextField_.text = nothing;
                    //            ClassroomTextField_.text = nothing;
                    ////            NumberOfClassTextField_.text = nothing;
                    //            DateTextField_.text = nothing;
                    
                }
                else
                {
                    UIAlertView* errorAlert  = [ [ UIAlertView alloc ] initWithTitle: @"查找失败" message: @"没有找到相应督导信息,请确认所有信息已填入..." delegate: self cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                    [ errorAlert show ];
                    
                }
            }
//            else if ( operation.response.statusCode == 400 )
//            {
//                [ alert_ dismissWithClickedButtonIndex: [ alert_ cancelButtonIndex ] animated: YES ];
//                NSString* errorString = operation.responseString;
//                NSDictionary *ErrorDic = [errorString objectFromJSONString];
//                NSString* AlertString = [ ErrorDic objectForKey:@"reason" ];
//                UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"查找失败" message: AlertString  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
//                [ errorAlert show ];
//            }
//            
//            else if ( operation.response.statusCode == 404 )
//            {
//                [ alert_ dismissWithClickedButtonIndex: [ alert_ cancelButtonIndex ] animated: YES ];
//                NSString* errorString = operation.responseString;
//                NSDictionary *ErrorDic = [errorString objectFromJSONString];
//                NSString* AlertString = [ ErrorDic objectForKey:@"reason" ];
//                UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"查找失败" message: AlertString  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
//                [ errorAlert show ];
//            }

        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
              if ( operation.response.statusCode == 400 )
                        {
                            NSLog(@"FAIL1");

                            [ alert_ dismissWithClickedButtonIndex: [ alert_ cancelButtonIndex ] animated: YES ];
                            NSString* errorString = operation.responseString;
                            NSDictionary *ErrorDic = [errorString objectFromJSONString];
                            NSString* AlertString = [ ErrorDic objectForKey:@"reason" ];
                            UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"查找失败" message: AlertString  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                            [ errorAlert show ];
                        }
            
              else if ( operation.response.statusCode == 404 )
                        {
                            NSLog(@"FAIL2");

                            [ alert_ dismissWithClickedButtonIndex: [ alert_ cancelButtonIndex ] animated: YES ];
                            NSString* errorString = operation.responseString;
                            NSDictionary *ErrorDic = [errorString objectFromJSONString];
                            NSString* AlertString = [ ErrorDic objectForKey:@"reason" ];
                            UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"查找失败" message: AlertString  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                            [ errorAlert show ];
                        }else{

            NSLog(@"FAIL3");
            [ alert_ dismissWithClickedButtonIndex: [ alert_ cancelButtonIndex ] animated: YES ];
            UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"错误" message: @"网络错误，连接不到服务器" delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
            [ errorAlert show ];
                        }
        }];


    }
    
}


-(void)judge:(int) number
{
    
    if ( number == 1 )
    {
        //NSString *schoolDistrictName = [ SchoolDistrictArray_ objectAtIndex:  ];
        //SchoolDistrictTextField_.text = schoolDistrictName;
        NSString * schoolDistrictName = SchoolDistrictTextField_.text;
        SchoolNumber_ =  SchoolDistrictTextField_.text ;
        NSLog(@"%@", SchoolNumber_);
        SchoolNumber_ =  [ self  getDistrictNum ];
        NSLog( @"%@", SchoolNumber_ );
        //*********************************解析xml**************************************
        
        //尝试xml
        //初始化用来临时存储从xml中读取的字符串
        workingPropertyString_ = [ NSMutableString string ];
        
        //初始化用来存储解析后的xml文件
        workingArray_ = [ NSMutableArray array ];
        
        //从资源文件中获取xml文件
        // NSString *strPathXml = [[NSBundle mainBundle] pathForResource: schoolDistrictName ofType:@"xml"];
        NSString * strPathXml = [[NSBundle mainBundle] pathForResource: schoolDistrictName ofType:@"xml"];
        //将xml文件转换成data类型
        xmlData_ = [ [ NSData alloc ] initWithContentsOfFile: strPathXml ];
        
        //初始化待解析的xml
        parserXML_ = [ [ NSXMLParser alloc ] initWithData: xmlData_ ];
        
        //初始化需要从xml中解析的元素
        elementsToParse_ = [ NSArray arrayWithObjects:@"string-array",@"item", nil ];
        
        //设置xml解析代理为self
        [ parserXML_ setDelegate: self ];
        
        //开始解析之前清空数组
        [ SectionOfClassroomArray_ removeAllObjects ];
        
        //初始化存放所有课室二维数组
        AllClassroomArray_ = [ [ NSMutableArray alloc ] init ];
        //开始解析
        [ parserXML_ parse ];//调用解析的代理方法
        
        //以字典形式存放对应的所有课室
        allTheClassroomDictionary_ = [ [ NSDictionary alloc ] initWithObjects: AllClassroomArray_ forKeys: SectionOfClassroomArray_ ];
        
    }
    else if( number == 2 )
    {   NSInteger subscript = sectionOfClassroomButtonIndex;
        NSString *classTypeName = [ SectionOfClassroomArray_ objectAtIndex: subscript ];
        
        //[ classTypeTableView_ removeFromSuperview ];
        
        //SectionOfClassroomTextField_.text = classTypeName;
        NSLog( @"%@",[ allTheClassroomDictionary_ objectForKey: classTypeName ] );
        [ ClassroomArray_ removeAllObjects ];
        // 重要标记       [ ClassroomArray_ addObject: [ allTheClassroomDictionary_ objectForKey: classTypeName]];
        ClassroomArray_ = [allTheClassroomDictionary_ objectForKey:classTypeName];
        //        NSLog( @"%@",lessonClassroomMutableArray_ );
        //        NSLog( @"%@", [ [ lessonClassroomMutableArray_ objectAtIndex: 0 ] objectAtIndex: 0 ]);
        //[ lessonClassroomTableView_ reloadData ];
        
    }
    //    else if( tableView == lessonClassroomTableView_ )
    //    {
    //        NSString *lessonclassroomName = [ [ [ lessonClassroomMutableArray_ objectAtIndex: 0 ] objectAtIndex: 0 ] objectAtIndex: row ];
    //        [ lessonClassroomTableView_ removeFromSuperview ];
    //        lessonClassroomTextField_.text = lessonclassroomName;
    //    }
    else if (number == 3)
    {
        NSInteger subscript = sectionOfClassroomButtonIndex;
        NSString *classTypeName = [ SectionOfClassroomArray_ objectAtIndex: subscript ];
        ClassroomArray_ = [allTheClassroomDictionary_ objectForKey:classTypeName];
    }
}

//获取文件名和路径
-(NSString *) dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSLog(@"%@",paths);
    NSString *documentsDirectory=[paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"UN_PW"];
}

//显示导航条
-(void)viewWillAppear:(BOOL)animated
{   [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController setToolbarHidden:YES animated:NO];
}


#pragma mark *********************************解析xml*************************************

//遍历xml的节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    //判断elementName与string-array是否相等
    if ( [ elementName isEqualToString: @"string-array" ] )
    {
        [ SectionOfClassroomArray_ addObject: [ attributeDict objectForKey: @"name" ] ];
    }
    //查询指定对象是否存在
    storingCharacterData_ = [ elementsToParse_ containsObject: elementName ];
}

//节点有值则调用此方法
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ( storingCharacterData_ )
    {
        [ workingPropertyString_ appendString: string ];
    }
}

//当遇到结束标记时，进入此句
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ( storingCharacterData_ )
    {
        //NSString的方法，去掉字符串前后的空格
        NSString* trimmedString = [ workingPropertyString_ stringByTrimmingCharactersInSet: [ NSCharacterSet whitespaceAndNewlineCharacterSet ] ];
        //将字符串置空
        [ workingPropertyString_ setString:@"" ];;
        if ( [ elementName isEqualToString: @"item" ] )
        {
            [ ClassroomArray_ addObject: trimmedString ];
            //            NSLog( @"%@", trimmedString );
            //            NSLog(@"classArray=%@",ClassroomArray_);
        }
    }
    //遇到string-array时
    if ( [ elementName isEqualToString: @"string-array" ] )
    {
        if ( [ ClassroomArray_ count ])
        {
            //            [ AllClassroomArray_ addObject: [ NSArray arrayWithObject: ClassroomArray_ ] ];
            [AllClassroomArray_ addObject:ClassroomArray_];
            
            //先释放内存
            //            [ lessonClassroomMutableArray_ release ];
            ClassroomArray_ = [ [ NSMutableArray alloc ] init ];
            
        }
    }
}

- (NSString*)getDistrictNum
{
    if ( [SchoolNumber_ isEqualToString: @"大学城"])
        return    SchoolNumber_ = @"1";
    else if ( [SchoolNumber_ isEqualToString: @"龙洞" ])
        return    SchoolNumber_ = @"2";
    else if ( [SchoolNumber_ isEqualToString: @"东风路" ])
        return    SchoolNumber_ = @"3";
    else if ( [SchoolNumber_ isEqualToString: @"商学院" ])
        return    SchoolNumber_ = @"4";
    else
        return NULL ;
}

#pragma mark --button

-(void)schoolDistrictButtonDidPush{
    [self CancelButton_Date];
    //    [self CancelButton_SectionOfClassroom];
    //    [self CancelButton_Classroom];
    //    [self CancelButton_NumberOfClass];
    NSString * nothing = @" ";
    SchoolDistrictTextField_.text=nothing;
    SectionOfClassroomTextField_.text = nothing;
    ClassroomTextField_.text = nothing;
    schoolDistrictSheet_ = [[UIActionSheet alloc]init];
    schoolDistrictSheet_.tag = 1;
    schoolDistrictSheet_.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    schoolDistrictSheet_.delegate = self;//
    [schoolDistrictSheet_ addButtonWithTitle:@"大学城"];
    [schoolDistrictSheet_ addButtonWithTitle:@"龙洞"];
    [schoolDistrictSheet_ addButtonWithTitle:@"东风路"];
    [schoolDistrictSheet_ addButtonWithTitle:@"商学院"];
    [schoolDistrictSheet_ addButtonWithTitle:@"取消"];
    schoolDistrictSheet_.cancelButtonIndex = 4;
    [schoolDistrictSheet_ showInView:self.view];
}

-(void)DateButtonDidPush{
    //防止多次触控导致内存累积
    if(ToChooseDate_Picker)
    {
        [ToChooseDate_Picker removeFromSuperview];
        ToChooseDate_Picker = nil;
    }
    [self.navigationController setToolbarHidden:NO animated:NO];
    //移开所有控件
    //    [self CancelButton_SectionOfClassroom];
    //    [self CancelButton_Classroom];
    //    [self CancelButton_NumberOfClass];
    
    UIBarButtonItem* doneButton =[  [ UIBarButtonItem alloc ]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action: @selector(doneDidPush) ];
    UIBarButtonItem * Cancel = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(CancelButton_Date)];
    UIBarButtonItem * FlexibleSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    NSArray * buttons = [NSArray arrayWithObjects:Cancel,FlexibleSpace,doneButton, nil];
    
    [self setToolbarItems:buttons animated:YES];
    //[ UIView commitAnimations ];
    
    //[ UIView setAnimationDuration: 0.3 ];
    //时间选择器上移
    ToChooseDate_Picker = [[UIDatePicker alloc] init];
    ToChooseDate_Picker.datePickerMode = UIDatePickerModeDate;
    ToChooseDate_Picker.frame = CGRectMake( 0, 280, 320, 80 );
    ToChooseDate_Picker.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:ToChooseDate_Picker];
    //    //工具条上移
    CGRect toolbarFrame = self.navigationController.toolbar.frame;
    toolbarFrame.origin.y = self.view.frame.size.height  - toolbarFrame.size.height - 48 ;
    self.navigationController.toolbar.frame = toolbarFrame;
    [ UIView commitAnimations ];

}

- (void)CancelButton_Date
{
    //[UIView animateWithDuration:0.3 animations:^{
    //ToChooseDate_Picker.alpha = 0.0;
    //ToChooseDate_Picker.frame = CGRectMake(0, 480, 320, 160);}];
    //toolbar.frame = CGRectMake(0, NumberOfClass_Picker.frame.origin.y-44, 320, 44);
    //[UIControl animateWithDuration:0.3 animations:^{
    //ToChooseDate_Picker.alpha = 0.0;
    //ToChooseDate_Picker.frame = CGRectMake(0, 480, 320, 160);//}];
    [ToChooseDate_Picker removeFromSuperview];
    ToChooseDate_Picker = nil;
    CGRect toolbarFrame = self.navigationController.toolbar.frame;
    toolbarFrame.origin.y = self.view.frame.size.height  - toolbarFrame.size.height + 106 ;
    self.navigationController.toolbar.frame = toolbarFrame;
    //隐藏日期选择器
    //ToChooseDate_Picker.frame = toolbarFrame;
    [self setToolbarItems:nil animated: NO];
    
    
}

//日期选择完成按钮
-(void)doneDidPush
{
    NSDate* date = [ ToChooseDate_Picker date ];
    NSDateFormatter* dateFormatter = [ [ NSDateFormatter alloc ] init ];
    [ dateFormatter setDateFormat: @"yyyy-MM-dd" ];
    DateTextField_.text = [ dateFormatter stringFromDate: date ];
    [self CancelButton_Date];
    //    [ UIView beginAnimations: nil context: nil ];
    //    //隐藏工具条
    //    CGRect toolbarFrame = self.navigationController.toolbar.frame;
    //    toolbarFrame.origin.y =
    //    self.view.bounds.size.height + 65 ;
    //    self.navigationController.toolbar.frame = toolbarFrame;
    //    //隐藏完成按钮
    //    UIBarButtonItem* spaceButton = [  [ UIBarButtonItem alloc ]
    //                                    initWithBarButtonSystemItem: UIBarButtonSystemItemFixedSpace
    //                                    target: nil action: nil ];
    //    [ self setToolbarItems: [ NSArray arrayWithObject: spaceButton ] animated: YES ];
    //    //隐藏日期选择器
    //    //ToChooseDate_Picker.frame = toolbarFrame;
    //    [ToChooseDate_Picker removeFromSuperview];
    //    [ UIView commitAnimations  ];
}




-(void)SectionOfClassroomButtonDidPush{
    //防止多次触控导致内存累积
    //    if(SectionOfClassroom_Picker)
    //    {
    //     [SectionOfClassroom_Picker removeFromSuperview];
    //     SectionOfClassroom_Picker = nil;
    //    }
    //    [self.navigationController setToolbarHidden:NO animated:NO];
    //移开所有控件
    [self CancelButton_Date];
    //    [self CancelButton_Classroom];
    //    [self CancelButton_NumberOfClass];
    
    
    //if(SectionOfClassroomTextField_.text == @"")//当未选择校区点击选择课室会弹出提示，而且防止了程序运行错误
    NSString * nothing = @" ";
    if([SchoolDistrictTextField_.text isEqualToString: nothing])//当未选择校区点击选择课室会弹出提示，而且防止了程序运行错误
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请选择校区" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        //int a = 2;
        //工具条上移
        
        //        CGRect toolbarFrame = self.navigationController.toolbar.frame;
        //        toolbarFrame.origin.y = self.view.frame.size.height  - toolbarFrame.size.height - 49 ;
        //        self.navigationController.toolbar.frame = toolbarFrame;
        //        UIBarButtonItem * Done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(DoneButton_SectionOfClassroom)];
        //        //Done.title = @"确定";
        //        //Done.title = @"确定";
        //        UIBarButtonItem * Cancel = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(CancelButton_SectionOfClassroom)];
        //        UIBarButtonItem * FlexibleSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        //        NSArray * buttons = [NSArray arrayWithObjects:Cancel,FlexibleSpace,Done, nil];
        //
        //        [self setToolbarItems:buttons animated:YES];
        //        [ UIView commitAnimations ];
        //        // 选择框
        //        SectionOfClassroom_Picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 250, 320, 160)];
        //        SectionOfClassroom_Picker.delegate = self;
        //        SectionOfClassroom_Picker.dataSource = self;
        //        SectionOfClassroom_Picker.showsSelectionIndicator=YES;
        //        //[self judge:a];
        //
        //        [self.view addSubview:SectionOfClassroom_Picker];
        
        ClassroomTextField_.text = @" ";
        sectionOfClassroomSheet_ = [[UIActionSheet alloc]init];
        sectionOfClassroomSheet_.tag = 3;
        sectionOfClassroomSheet_.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        sectionOfClassroomSheet_.delegate = self;
        for(NSString* title in SectionOfClassroomArray_)
        {
            [sectionOfClassroomSheet_ addButtonWithTitle:title];
        }
        [sectionOfClassroomSheet_ addButtonWithTitle:@"取消"];
        sectionOfClassroomSheet_.cancelButtonIndex = [SectionOfClassroomArray_ count];
        [sectionOfClassroomSheet_ showInView:self.view];
    }

}

-(void)ClassroomButtonDidPush{
    //    if(Classroom_Picker)
    //    {
    //        [Classroom_Picker removeFromSuperview];
    //        Classroom_Picker = nil;
    //    }
    //    [self.navigationController setToolbarHidden:NO animated:NO];
    //移开所有控件
    [self CancelButton_Date];
    //    [self CancelButton_SectionOfClassroom];
    //    [self CancelButton_NumberOfClass];
    
    //int a = 2;
    NSString * nothing = @" ";
    if([SchoolDistrictTextField_.text isEqualToString:nothing]||[SectionOfClassroomTextField_.text isEqualToString:nothing])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示" message:@"请选择校区或教室类型" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        //int a = 3;
        //工具条上移
        //        CGRect toolbarFrame = self.navigationController.toolbar.frame;
        //        toolbarFrame.origin.y = self.view.frame.size.height  - toolbarFrame.size.height - 49 ;
        //        self.navigationController.toolbar.frame = toolbarFrame;
        //        UIBarButtonItem * Done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(DoneButton_Classroom)];
        //        //Done.title = @"确定";
        //        //Done.title = @"确定";
        //        UIBarButtonItem * Cancel = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(CancelButton_Classroom)];
        //        UIBarButtonItem * FlexibleSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        //        NSArray * buttons = [NSArray arrayWithObjects:Cancel,FlexibleSpace,Done, nil];
        //
        //        [self setToolbarItems:buttons animated:YES];
        //        [ UIView commitAnimations ];
        //        // 选择框
        //        Classroom_Picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 250, 320, 160)];
        //        Classroom_Picker.delegate = self;
        //        Classroom_Picker.dataSource = self;
        //        Classroom_Picker.showsSelectionIndicator=YES;
        //        //[self judge:a];
        //        [self.view addSubview:Classroom_Picker];
        
        //NSString* nothing = @" ";
        ClassroomTextField_.text = nothing;
        classroomSheet_ = [[UIActionSheet alloc]init];
        classroomSheet_.tag = 4;
        classroomSheet_.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
        classroomSheet_.delegate = self;
        for(NSString* title in ClassroomArray_)
        {
            [classroomSheet_ addButtonWithTitle:title];
        }
        [classroomSheet_ addButtonWithTitle:@"取消"];
        classroomSheet_.cancelButtonIndex = [ClassroomArray_ count];
        [classroomSheet_ showInView:self.view];
    }

}

-(void)NumberOfClassButtonDidPush
{
    //    if(NumberOfClass_Picker)
    //    {
    //        [NumberOfClass_Picker removeFromSuperview];
    //        NumberOfClass_Picker = nil;
    //    }
    //    [self.navigationController setToolbarHidden:NO animated:NO];
    //移开所有控件
    //    [self CancelButton_SectionOfClassroom];
    //    [self CancelButton_Classroom];
    [self CancelButton_Date];
    NSString* nothing = @" ";
    NumberOfClassTextField_.text = nothing;
    numberOfClassSheet_ = [[UIActionSheet alloc]init];
    numberOfClassSheet_.tag = 5;
    numberOfClassSheet_.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    numberOfClassSheet_.delegate = self;
    NumberOfClassArray_ = [ [ NSArray alloc ] initWithObjects: @"1,2",@"3,4",@"5",@"6,7",@"8,9",@"10,11,12", nil ];
    for(NSString* title in NumberOfClassArray_)
    {
        [numberOfClassSheet_ addButtonWithTitle:title];
    }
    [numberOfClassSheet_ addButtonWithTitle:@"取消"];
    numberOfClassSheet_.cancelButtonIndex = [NumberOfClassArray_ count];
    [numberOfClassSheet_ showInView:self.view];
    //节次默认第1，2节
    //NumberOfClassTextField_.text = [ NumberOfClassArray_ objectAtIndex: 0 ];
    //工具条上移
    //    CGRect toolbarFrame = self.navigationController.toolbar.frame;
    //    toolbarFrame.origin.y = self.view.frame.size.height  - toolbarFrame.size.height - 49 ;
    //    self.navigationController.toolbar.frame = toolbarFrame;
    //    UIBarButtonItem * Done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(DoneButton_NumberOfClass)];
    //    //Done.title = @"确定";
    //    //Done.title = @"确定";
    //    UIBarButtonItem * Cancel = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(CancelButton_NumberOfClass)];
    //    UIBarButtonItem * FlexibleSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    //    NSArray * buttons = [NSArray arrayWithObjects:Cancel,FlexibleSpace,Done, nil];
    //
    //    [self setToolbarItems:buttons animated:YES];
    //    [ UIView commitAnimations ];
    //    // 选择框
    //    NumberOfClass_Picker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 250, 320, 160)];
    //    NumberOfClass_Picker.delegate = self;
    //    NumberOfClass_Picker.dataSource = self;
    //    NumberOfClass_Picker.showsSelectionIndicator=YES;
    //    [self.view addSubview:NumberOfClass_Picker];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{//- (NSString *)buttonTitleAtIndex:(NSInteger)buttonIndex;
    //    NSLog(@"%d",buttonIndex);
    //    [   buttonTitleAtIndex];
    if( actionSheet.tag == 1 )
    {
        if(buttonIndex<4)
        {   int a = 1;
            SchoolDistrictTextField_.text = [schoolDistrictSheet_ buttonTitleAtIndex: buttonIndex];
            NSLog(@"schoolDistrict:%@",SchoolDistrictTextField_.text);
            [self judge:a];
        }
        else
        {
            SchoolDistrictTextField_.text = @" ";
        }
    }
    else if( actionSheet.tag == 3 )
    {
        if(buttonIndex<[SectionOfClassroomArray_ count])
        {
            SectionOfClassroomTextField_.text = [ sectionOfClassroomSheet_ buttonTitleAtIndex:buttonIndex ];
            NSLog(@"sectionOfClassroom:%@" , SectionOfClassroomTextField_.text);
            sectionOfClassroomButtonIndex = buttonIndex;
            [self judge:2];
        }
        else
        {
            SectionOfClassroomTextField_.text = @" ";
        }
    }
    else if ( actionSheet.tag == 4)
    {
        if(buttonIndex<[ClassroomArray_ count])
        {
            ClassroomTextField_.text = [classroomSheet_ buttonTitleAtIndex:buttonIndex];
            NSLog(@"classroom:%@" , ClassroomTextField_.text);
        }
        else
        {
            ClassroomTextField_.text = @" ";
        }
    }
    else if (actionSheet.tag == 5)
    {
        if(buttonIndex<[NumberOfClassArray_ count])
        {
            NumberOfClassTextField_.text = [numberOfClassSheet_ buttonTitleAtIndex:buttonIndex];
            NSLog(@"numberOfClass:%@" , NumberOfClassTextField_.text);
        }
        else
        {
            NumberOfClassTextField_.text  = @" ";
        }
    }
}


//触摸背景时收回所有窗口
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self CancelButton_Date];
    //    [self CancelButton_NumberOfClass];
    //    [self CancelButton_Classroom];
    //    [self CancelButton_SectionOfClassroom];
}

//尝试当开始编辑是发出收起键盘的信号
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField resignFirstResponder ];
}

-(void)viewWillDisappear:(BOOL)animated
{
    allTheClassroomDictionary_ = nil;
    //节次数组
    NumberOfClassArray_ = nil;
    xmlData_ = nil;
    parserXML_ = nil;
    workingArray_ = nil;
    workingPropertyString_ = nil;
    elementsToParse_ = nil;
    NSString * nothing = @" ";
    SchoolDistrictTextField_.text= nothing;;
    SectionOfClassroomTextField_.text = nothing;
    ClassroomTextField_.text = nothing;
    NumberOfClassTextField_.text = nothing;
    DateTextField_.text = nothing;
    //尝试把选择框给移除
    //    ToChooseDate_Picker = nil;
    //    schoolDistrictSheet_ = nil;
    //    SectionOfClassroom_Picker = nil;
    //    Classroom_Picker = nil;
    //    NumberOfClass_Picker = nil;
    
    [self CancelButton_Date];
    //    [self CancelButton_NumberOfClass];
    //    [self CancelButton_Classroom];
    //    [self CancelButton_SectionOfClassroom];
    //        //释放文本输入框
    //    SchoolDistrictTextField_ = nil;
    //    SectionOfClassroomTextField_ = nil;
    //    ClassroomTextField_ = nil;
    //    NumberOfClassTextField_ = nil;
    //    DateTextField_ = nil;
    //    //释放操作框、选择框
    //    schoolDistrictSheet_ = nil;
    //    ToChooseDate_Picker = nil;
    //    SectionOfClassroom_Picker = nil;
    //    Classroom_Picker = nil;
    //    NumberOfClass_Picker = nil;
    //    //
    //    alert_ = nil;
    //    //
    //    SchoolNumber_  =nil;
    //    //
    //    EditView = nil;
    //    //
    //    SchoolDistrictArray_ = nil;
    //    SectionOfClassroomArray_ =nil;
    //    ClassroomArray_ = nil;
    //    AllClassroomArray_ = nil;
    //    allTheClassroomDictionary_ = nil;
    //    NumberOfClassArray_ = nil;
    //    xmlData_ = nil;
    //    parserXML_ = nil;
    //    //dataToParse_ = nil;
    //    workingArray_ = nil;
    //    workingPropertyString_ = nil;
    //    elementsToParse_ = nil;
    //    
}

#pragma mark -
#pragma mark date Source

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 1;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
