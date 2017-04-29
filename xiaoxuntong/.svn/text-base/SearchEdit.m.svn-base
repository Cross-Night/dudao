//
//  SearchEdit.m
//  xiaoxuntong
//
//  Created by 月砂 on 15/11/27.
//  Copyright (c) 2015年 xietong-xkk. All rights reserved.
//

#import "SearchEdit.h"

@interface SearchEdit (){
    UITextField * text01;//lock
    UITextField * text02;//lock
    UITextField * text03;//lock
    UITextField * text04;//picker
    UITextField * text05;//lock
    UITextField * text06;//lock
    UITextField * text07;//lock
    UITextField * text08;//datepicker
    UITextField * text09;//numkey
    UITextField * text10;//numkey
    UITextField * text11;//numkey
    UITextField * text12;//numkey
    UITextField * text13;//numkey
    UITextField * text14;//numkey
    UITextField * text15;//numkey
    UITextField * text16;//numkey
    UITextField * text17;//numkey
    UITextField * text18;//free
    UITextField * now;
    UIDatePicker *pickerd;
    UIPickerView *picker;
    NSInteger whichpicker;
    CGFloat height;
    BOOL keyboardIsShown;
}

@end

@implementation SearchEdit
@synthesize data;
- (void)viewDidLoad {
    CGFloat a = self.view.bounds.size.width;
    [super viewDidLoad];
    self.title = @"录入信息";
    self.view.backgroundColor = [UIColor clearColor];
    UIScrollView * view = [[UIScrollView alloc] init];
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dudaoSearchView.jpg"]];
    //view.backgroundColor = [UIColor whiteColor];
    view.scrollsToTop = NO;//封印点击状态栏回到顶部
    view.contentSize = CGSizeMake(a, 1200);
    view.bounces = NO;
    //self.edgesForExtendedLayout = NO;
    self.view = view;
    
    [self addLabel];
    [self addButton];
    [self addText];
    [self loadingDate];
}

- (void)addLabel{
    //｛学院名称，教师名字，教学班组成＋老师是否按时｝
    //｛日期，节次，上课地点｝＋录入时间（就是下面的督导时间），
    //应到人数，实际人数，迟到早退人数，旷课人数，请假人数
    //玩手机情况(填人数)吃东西情况(填人数)睡觉、讲话情况(填人数)穿拖鞋、短裤情况(填人数)
    //上面的设置一下键盘类型限制数字输入就行了
    //督导时间，其他情况，老师是否按时情况(1-是、0-否) 这段完全没用？
    NSArray * array = [[NSArray alloc] initWithObjects:@"学院名称",@"教师名字",@"教学班组成",@"按时上课",@"日期",@"节次",@"上课地点",@"录入时间",@"应到人数",@"实际人数",@"迟到早退",@"旷课人数",@"请假人数",@"玩手机情况",@"吃东西情况",@"睡觉讲话",@"穿拖鞋短裤",@"其他情况", nil];
    
    for(int i=0;i<[array count];i++){
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10+i*60, 115, 30)];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont fontWithName:@"Helvetica-Bold" size:21.0];
        label.textAlignment = NSTextAlignmentRight;
        label.text = [array objectAtIndex:i];
        [self.view addSubview:label];
    }
}

- (void)addText{
    CGFloat a = [UIScreen mainScreen].bounds.size.width;
    NSLog(@"%f",a);
    text01 = [UITextField new];
    text02 = [UITextField new];
    text03 = [UITextField new];
    text04 = [UITextField new];
    text05 = [UITextField new];
    text06 = [UITextField new];
    text07 = [UITextField new];
    text08 = [UITextField new];
    text09 = [UITextField new];
    text10 = [UITextField new];
    text11 = [UITextField new];
    text12 = [UITextField new];
    text13 = [UITextField new];
    text14 = [UITextField new];
    text15 = [UITextField new];
    text16 = [UITextField new];
    text17 = [UITextField new];
    text18 = [UITextField new];
    //http://blog.csdn.net/wbw1985/article/details/7623699
    NSArray * array = [[NSArray alloc] initWithObjects:text01,text02,text03,text04,text05,text06,text07,text08,text09,text10,text11,text12,text13,text14,text15,text16,text17,text18, nil];
    for(int i=0;i<18;i++){
        UITextField * text = [array objectAtIndex:i];
        text.borderStyle = UITextBorderStyleRoundedRect;
        text.frame = CGRectMake(120, 10+i*60, a-120-40, 30);//375-125-200=250-200=50
        text.font = [UIFont fontWithName:@"Helvetica" size:20.0];
        text.delegate = self;
        
        if(i==3)text.placeholder = @"是否按时";
        if(i<9 && i!=3 && i!=7){
            text.enabled = NO;
            text.placeholder = @"数据出错";
        }
        if(i==7)text.placeholder = @"请输入日期";
        if(i>7 && i<17){
            text.placeholder = @"请输入人数";
            text.keyboardType = UIKeyboardTypeNumberPad;
        }
    }
    
    
    
    UIToolbar *tool = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, a, 45)];
    tool.tintColor = [UIColor greenColor];
    tool.barStyle = UIBarStyleDefault;
    //tool的确定与取消
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(a-70, 0, 70, 45);
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
    [tool addSubview:button];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(0, 0, 70, 45);
    button2.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitle:@"取消" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(cancel) forControlEvents:UIControlEventTouchUpInside];
    [tool addSubview:button2];
    
    pickerd = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    pickerd.backgroundColor = [UIColor whiteColor];
    pickerd.datePickerMode = UIDatePickerModeDate;
    text08.inputView = pickerd;
    
    picker = [[UIPickerView alloc] init];
    picker.backgroundColor = [UIColor whiteColor];
    picker.delegate = self;
    picker.dataSource = self;
    text04.inputView = picker;
    
    for(int i=0;i<[array count];i++){
        UITextField * text = [array objectAtIndex:i];
        text.inputAccessoryView = tool;
    }
    for(int i=0;i<[array count];i++){
        UITextField * text = [array objectAtIndex:i];
        [self.view addSubview:text];
    }
}

- (void)addButton{
    UIBarButtonItem * button = [[UIBarButtonItem alloc] initWithTitle:@"修改" style:UIBarButtonItemStyleDone target:self action:@selector(updateInformation)];
    self.navigationItem.rightBarButtonItem = button;
}


- (void)loadingDate{
    NSLog(@"");
}

- (void)updateInformation{
    //判断是否有网络连接
    Reachability * reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    if(status == NotReachable)[self ShowHint:999];
    else ;//在这里执行网络请求方法
    NSLog(@"%ld",(long)status);
    NSLog(@"更新数据");
}

#pragma mark - 编辑相关的一些方法

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    now = textField;
    if(textField==text04)whichpicker = 1;
    else if(textField==text08)whichpicker = 2;
    //这里调用键盘的变换方法。
}

- (void)clickButton{
    if(whichpicker==1)[self pickerchoose:text04];
    if(whichpicker==2)[self date:text08];
    whichpicker = 0;
    [now resignFirstResponder];
}

- (void)cancel{
    whichpicker = 0;
    [now resignFirstResponder];
}

#pragma mark - 键盘相关的一些方法
- (void)viewWillAppear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

- (void)keyboardShow:(NSNotification *)notify{
    if (keyboardIsShown) {
        return;
    }
    CGRect frame = [self.view frame];
    NSDictionary *info = [notify userInfo];
    NSValue *aValue = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyBoardSize = [aValue CGRectValue].size;
    
    height = frame.size.height;
    frame.size.height -= keyBoardSize.height;
    self.view.frame = frame;
    CGRect textFieldRect = [now frame];
    [(UIScrollView*)self.view scrollRectToVisible:textFieldRect animated:YES];
    
    keyboardIsShown = YES;
}

- (void)keyboardHide:(NSNotification *)notify{
    //NSDictionary *info = [notify userInfo];
    //NSValue *avalue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    //CGRect keyboardRect = [self.view convertRect:[avalue CGRectValue] fromView:nil];
    CGRect viewFrame = [self.view frame];
    viewFrame.size.height = height;
    self.view.frame = viewFrame;
    
    keyboardIsShown = NO;
}


#pragma mark - picker相关

- (void)pickerchoose:(UITextField*)text{
    if([picker selectedRowInComponent:0]==0)text.text = @"是";
    else text.text = @"否";
}

- (NSInteger)date:(UITextField *)text{
    NSInteger temp;
    NSDate * time = [pickerd date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    text.text = [formatter stringFromDate:time];
    [text resignFirstResponder];
    formatter.dateFormat = @"yyyyMMdd";
    temp = [[formatter stringFromDate:time] intValue];
    return temp;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return  2;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(row==0)return @"是";
    return @"否";
}

#pragma mark - 网络请求相关

- (void)sendNetwork{
    MBProgressHUD * H = [self displayHUD:@"正在修改"];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    //申明返回的结果是json类型
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];
    //如果报接受类型不一致请替换一致text/html或别的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    
    
    NSString * absentNum = [NSString stringWithFormat:@"%d",[text09.text intValue] - [text10.text intValue]];
    
    
    //@"学院名称",@"教师名字",@"教学班组成",@"按时4上课",@"日期",@"节次",@"上课地点",@"录入8时间",@"应到9人数",@"实际人数",@"迟到早退",@"旷课12人数",@"请假人数",@"玩手机情况",@"吃东西15情况",@"睡觉讲话",@"穿拖鞋短裤",@"其他情况", nil];
    //传入的参数
    //NSString * stringURL = [NSString stringWithFormat:@"http://eva.gdut.edu.cn:8080/Edu_Survey/IphoneUpdate"];
    NSString * stringURL = [NSString stringWithFormat:@"http://10.21.71.50:8080/Edu_Survey/IphoneUpdate"];
    NSDictionary *parameters = @{@"Survey_ID":@"XXXX",
                                 @"Absent_Num":absentNum,
                                 @"Teacher_Ontime":@"0或1",
                                 @"Survey_Time":text08.text,
                                 @"Actual_Num":text10.text,
                                 @"Late_LeaveEarly_Num":text11.text,
                                 @"Truant_Num":text12.text,
                                 @"Vacate_Num":text13.text,
                                 @"Play_Mobil_Num":text14.text,
                                 @"Food_Eat_Num":text15.text,
                                 @"Sleep_Speak_Num":text16.text,
                                 @"Slipper_Shorts_Num":text17.text,
                                 @"Other_Situation":text18.text};
    
    
    //    int absentNum = [ planPopulationTextField_.text intValue ] - [ actualNumTextField_.text intValue ];
    //    //    NSLog( @"%d", absentNum );
    //    NSString* absentNumString = [ NSString stringWithFormat: @"%d" , absentNum ];
    //
    //    [ classSituation setObject: submitClassSituation.survey_id forKey: @"Survey_ID" ];id
    //
    //    [ classSituation setObject: absentNumString  forKey: @"Absent_Num" ];缺席人数，根据上面进行计算
    //    [ classSituation setObject: teacherOntimeTextField_.text forKey: @"Teacher_Ontime" ];老师按时
    //    [ classSituation setObject: writeDownTimeTextField_.text forKey:@"Survey_Time" ];录入时间
    //    [ classSituation setObject: actualNumTextField_.text forKey: @"Actual_Num" ];实到人数
    //    [ classSituation setObject: lateLeaveEarlyNumTextField_.text forKey: @"Late_LeaveEarly_Num" ];迟到早退
    //    [ classSituation setObject: truantNumTextField_.text forKey: @"Truant_Num" ];旷课人数
    //    [ classSituation setObject: vacateNumTextField_.text forKey: @"Vacate_Num" ];请假人数
    //    [ classSituation setObject: playMobileNumTextField_.text forKey: @"Play_Mobil_Num" ];玩手机人数
    //    [ classSituation setObject: foodEatNumTextField_.text forKey: @"Food_Eat_Num" ];吃东西
    //    [ classSituation setObject: sleepSpeakNumTextField_.text forKey: @"Sleep_Speak_Num" ];睡觉讲话人数
    //    [ classSituation setObject: slipperShortsNumTextField_.text forKey: @"Slipper_Shorts_Num" ];穿拖鞋人数
    //    [ classSituation setObject: otherSituationTextView_.text forKey:@"Other_Situation"];备注
    //    init ];
    //    jsonString = [ classSituation JSONString ];
    
    
    [manager POST:stringURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        [H hide:YES];
        NSLog(@"JSON: %@", responseObject);
        [self ShowHint:[operation.response statusCode]];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [H hide:YES];
        NSLog(@"Error: %@", error);
        [self ShowHint:[operation.response statusCode]];
    }];
}

#pragma mark - 提示相关
- (void)ShowHint:(NSInteger)type{
    NSString * message;
    switch(type){
        case 0:message = @"连接超时，请检查网络";break;
        case 999:message = @"请检查网络连接是否正常";break;
        case 200:message = @"修改成功";break;
        case 400:message = @"请求数据出错";break;
        case 409:message = @"数据已经存在";break;
        case 500:message = @"连接错误，请检查网络";break;
        default:message = [NSString stringWithFormat:@"未知错误，错误代码:%ld",type];break;
    }
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alert show];
}

- (MBProgressHUD *)displayHUD:(NSString *)text{
    //MBProgressHUD 登陆转圈圈
    MBProgressHUD * HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.dimBackground = YES;
    HUD.labelText = text;
    [HUD show:YES];
    return HUD;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
