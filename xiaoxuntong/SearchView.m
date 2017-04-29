//
//  SearchView.m
//  督导碎片
//
//  Created by 月砂 on 15/11/13.
//  Copyright (c) 2015年 月砂. All rights reserved.
//

#import "SearchView.h"


@interface SearchView ()

@end

@implementation SearchView{
    UITextField * textname;
    UITextField * _time1;
    UITextField * _time2;
    UIDatePicker *picker;
    
    NSInteger temp1;
    NSInteger temp2;
    MBProgressHUD * H;
    UIAlertView *AlertTemp;
    NSInteger tag;
}

//使用沙盒知识存储账号密码
//获取文件名和路径
-(void)getusernumber
{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * path = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"UN_PW"];
    NSArray * array = [[NSArray alloc] initWithContentsOfFile:path];
    textname.text = [array objectAtIndex:0];
    //textname.text = @"00005955";//固定测试帐号
}

- (void)viewDidLoad {
    NSLog(@"_________________愉快的录入查询开始咯___________________");
    
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];//背景色
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dudaoView.jpg" ]];
    self.title = @"录入查询";
    [self addLabel];
    [self addText];
    [self addButton];
    [self getusernumber];
}

- (void)addLabel{
    UILabel * number = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 130, 30)];
    UILabel * startime = [[UILabel alloc] initWithFrame:CGRectMake(0, 160, 130, 30)];
    UILabel * stoptime = [[UILabel alloc] initWithFrame:CGRectMake(0, 220, 130, 30)];
    number.font = [UIFont fontWithName:@"Helvetica" size:16.0];
    startime.font = [UIFont fontWithName:@"Helvetica" size:16.0];
    stoptime.font = [UIFont fontWithName:@"Helvetica" size:16.0];
    number.textAlignment = NSTextAlignmentRight;
    startime.textAlignment = NSTextAlignmentRight;
    stoptime.textAlignment = NSTextAlignmentRight;
    
    
    number.text = @"督导员学号:";
    startime.text = @"开 始  日 期:";
    stoptime.text = @"截 至  日 期:";
    [self.view addSubview:number];
    [self.view addSubview:startime];
    [self.view addSubview:stoptime];
    
}

- (void)addText{
    CGFloat b = self.view.bounds.size.width;
    
    textname = [[UITextField alloc] initWithFrame:CGRectMake(130, 100, 150, 30)];
    _time1 = [[UITextField alloc] initWithFrame:CGRectMake(130, 160, 150, 30)];
    _time2 = [[UITextField alloc] initWithFrame:CGRectMake(130, 220, 150, 30)];
    textname.borderStyle = UITextBorderStyleRoundedRect;
    _time1.borderStyle = UITextBorderStyleRoundedRect;
    _time2.borderStyle = UITextBorderStyleRoundedRect;
    textname.font = [UIFont fontWithName:@"Helvetica" size:16.0];
    _time1.font = [UIFont fontWithName:@"Helvetica" size:16.0];
    _time2.font = [UIFont fontWithName:@"Helvetica" size:16.0];
    textname.placeholder = @"请重新登录";
    _time1.placeholder = @"请选择日期";
    _time2.placeholder = @"请选择日期";
    [_time1 addTarget:self action:@selector(edit1) forControlEvents:UIControlEventEditingDidBegin];
    [_time2 addTarget:self action:@selector(edit2) forControlEvents:UIControlEventEditingDidBegin];
    
    picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    picker.backgroundColor = [UIColor whiteColor];
    picker.datePickerMode = UIDatePickerModeDate;
    
    UIToolbar *tool = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, b, 45)];
    tool.tintColor = [UIColor greenColor];
    tool.barStyle = UIBarStyleDefault;
    
    //tool的确定与取消
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(b-70, 0, 70, 45);
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:22.0];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickTHEbutton) forControlEvents:UIControlEventTouchUpInside];
    [tool addSubview:button];
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = CGRectMake(0, 0, 70, 45);
    button2.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:22.0];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setTitle:@"取消" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(clickTHEcencal) forControlEvents:UIControlEventTouchUpInside];
    [tool addSubview:button2];
    
    //属性设置
    textname.userInteractionEnabled = NO;
    _time1.tag = 1;
    _time1.inputAccessoryView = tool;
    _time1.inputView = picker;
    _time2.tag = 2;
    _time2.inputAccessoryView = tool;
    _time2.inputView = picker;
    
    /*****************/
    //textname.backgroundColor = [UIColor redColor];
    //_time1.backgroundColor = [UIColor blueColor];
    //_time2.backgroundColor = [UIColor greenColor];
//    _time1.text = @"2015-9-22";
//    _time2.text = @"2015-11-27";
//    temp1=10;
//    temp2=100;
    //textname.text = @"3114006229";
    /*****************/
    [self.view addSubview:textname];
    [self.view addSubview:_time1];
    [self.view addSubview:_time2];
}

- (void)addButton{
    CGFloat b = self.view.bounds.size.width;
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(b/2 - 40, 280, 80, 50);
    button.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:20.0];
    [button setTitle:@"查询" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(checkdate) forControlEvents:UIControlEventTouchUpInside];
    //[button addTarget:self action:@selector(testButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)testButton{
    SearchEdit * testview = [SearchEdit new];
    [self.navigationController pushViewController:testview animated:YES];
}

#pragma － 直接调用方法

//确定按钮事件
- (void)clickTHEbutton{
    if(tag == 1){
        temp1 = [self date:_time1];
    }
    else if(tag == 2)temp2 = [self date:_time2];
}
//取消按钮事件
- (void)clickTHEcencal{
    if(tag == 1){
        [_time1 resignFirstResponder];
    }
    else if(tag == 2)[_time2 resignFirstResponder];
}
//查询按钮的日期的判断
- (void)checkdate{
    if(temp1 == 0 || temp2 == 0){
        [self displayHint:0];
        return;
    }
    if(temp1 >= temp2){
        [self displayHint:1];
        return;
    }
    H = [self displayHUD:@"正在查询"];
    
    //判断是否有网络连接
    Reachability * reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    if(status == NotReachable)[self displayHint:3];
    else [self sendNetwork];
}
//显示提示，返回预留指针
- (UIAlertView *)displayHint:(NSInteger)id{
    NSString *hint;
    NSString *button = @"确定";
    
    switch(id){
        case 0:hint = [NSString stringWithFormat:@"请选择日期"];break;
        case 1:hint = [NSString stringWithFormat:@"请选择正确的日期"];break;
        case 2:hint = [NSString stringWithFormat:@"查找不到录入信息"];break;
        case 3:hint = [NSString stringWithFormat:@"请检查是否连接网络"];break;
        case 4:hint = [NSString stringWithFormat:@"连接超时，请检查网络"];break;
        default:hint = [NSString stringWithFormat:@"未知错误，请联系管理员"];break;
    }
    
    
    UIAlertView * Alert = [[UIAlertView alloc] initWithTitle:@"提示" message:hint delegate:nil cancelButtonTitle:button otherButtonTitles: nil];
    Alert.tag = id;
    [Alert show];
    
    return Alert;
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

#pragma - 封装的一些小操作

//picker的响应
- (NSInteger)date:(UITextField *)text{
    NSInteger temp;
    NSDate * time = [picker date];
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"yyyy-MM-dd";
    text.text = [formatter stringFromDate:time];
    [text resignFirstResponder];
    formatter.dateFormat = @"yyyyMMdd";
    temp = [[formatter stringFromDate:time] intValue];
    return temp;
}
//text的判断
- (void)edit1{
    tag = _time1.tag;
}
- (void)edit2{
    tag = _time2.tag;
}

#pragma - 网络请求&数据new页面

- (void)sendNetwork{
    NSString * stringURL = [NSString stringWithFormat:@"http://eva.gdut.edu.cn:8080/dudao/check/%@/%@/%@",textname.text, _time1.text, _time2.text];
    //NSString * stringURL = [NSString stringWithFormat:@"http://10.21.71.50:8080/dudao/check/%@/%@/%@",textname.text, _time1.text, _time2.text];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:stringURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        //[AlertTemp dismissWithClickedButtonIndex:0 animated:YES];
        [H hide:YES];
        [self displayTableview:responseObject];
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error){
             NSLog(@"statusCode = %ld",(long)[operation.response statusCode]);//404 not found
             NSLog(@"Error: %@",error);
             [H hide:YES];
             if([operation.response statusCode]==404)[self displayHint:2];
             else [self displayHint:5];
         }];
}

- (void)displayTableview:(NSDictionary *)dic{
    SearchTable * table = [[SearchTable alloc] init];
    table.data = [dic objectForKey:@"dudao"];
    [self.navigationController pushViewController:table animated:YES];
    //[self presentViewController:table animated:YES completion:^(void){}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
