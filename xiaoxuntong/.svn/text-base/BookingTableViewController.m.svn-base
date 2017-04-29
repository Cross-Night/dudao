//
//  BookingTableViewController.m
//  xiaoxuntong
//
//  Created by 姚润鑫 on 16/1/18.
//  Copyright © 2016年 xietong-xkk. All rights reserved.
//

#import "BookingTableViewController.h"
@interface BookingTableViewController ()
- (NSString*)changeDayOfWeekString:(NSString*)changeString;
@end

@implementation BookingTableViewController
@synthesize bookingArray;
@synthesize arrangeMutableArray;
@synthesize weekString;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dudaoView.jpg"]];
    self.title = @"督导预约";
    UIBarButtonItem *bookingButton = [[UIBarButtonItem alloc] initWithTitle:@"预约" style:UIBarButtonItemStyleBordered target:self action:@selector(bookingDidPush)];
    self.navigationItem.rightBarButtonItem = bookingButton;
    NSLog(@"tableview:%@" , bookingArray);
    [self soutOutArray:bookingArray];
    [ self.tableView reloadData ];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//将booking_class中需要用到的信息整理出来
- (void)soutOutArray:(NSArray*)booking_class_ {
    //重新分配内存
    arrangeMutableArray = [ [ NSMutableArray alloc ] init ];
    //整理预约信息
    for(NSArray * messageArray in bookingArray ){
        //整理数据
        NSString* messageString = [NSString stringWithFormat:@"%@ %@ %@" , [messageArray objectAtIndex:3] , [messageArray objectAtIndex:2] , [messageArray objectAtIndex:4]];
        NSLog(@"messageString:%@" , messageString);
        //将整理后的信息添加到arrangeMutableArray中
        [arrangeMutableArray addObject:messageString];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [arrangeMutableArray count];
}

- (UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(nil == cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [arrangeMutableArray objectAtIndex:indexPath.row];
    NSLog(@"%@" , cell.textLabel.text);
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectIndexPath = indexPath;
    UIAlertView *alert = [[UIAlertView alloc] init];
    alert.message  = [arrangeMutableArray objectAtIndex:indexPath.row];//防止课程名字过长无法看到教室号
    [alert addButtonWithTitle:@"OK"];
    [alert show];
}

-(void)bookingDidPush
{
    MBProgressHUD * H = [self displayHUD:@"正在查询，请稍候...."];
    /*String submitPath = "http://10.21.32.123:8080/dudaoSaveBooking/(2013-2014-1)-03101A02-00006210-2/27414/2013-2014-1/1/1";
     /dudaoSaveBooking/{course_Class_No}/{schedule_id}/{semester}/{dayOfWeek}
     String submitPath_this = BaseMessage.baseUrl + "/dudaoSaveBooking" + "/" + course_Class_No + "/"
     + schedule_id + "/" + semester + "/" + dayOfWeek + "/" + week;*/
    
    NSArray * selectmessageArray = [bookingArray objectAtIndex: selectIndexPath.row];
    course_Class_NoString = [ selectmessageArray objectAtIndex:0 ];
    schedule_idString = [ selectmessageArray objectAtIndex:1 ];
    semesterString = [ selectmessageArray objectAtIndex:5 ];
    dayOfWeekString = [ self changeDayOfWeekString: [ selectmessageArray objectAtIndex:6 ]];
    NSString * selectBookingUrlString = [NSString stringWithFormat:@"%@/%@/%@/%@/%@/%@" , selectBookingUrl , course_Class_NoString , schedule_idString , semesterString , dayOfWeekString , weekString];
    
    NSLog( @"%@" , selectBookingUrlString );
    NSString * UTF8UrlStr = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)selectBookingUrlString , NULL , NULL , kCFStringEncodingUTF8));
    NSURL* selectBookingURL = [ NSURL URLWithString: UTF8UrlStr ];
    NSLog( @"%@" , selectBookingURL );
    selectBookingUrlString = [NSString stringWithFormat:@"%@",selectBookingURL];
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:selectBookingUrlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        [H hide:YES];
        NSLog(@"succeed %ld",operation.response.statusCode);
        UIAlertView* finishAlert = [ [ UIAlertView alloc ] initWithTitle: @"预约成功" message: nil  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
        [ finishAlert show ];
        
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error){
             [H hide:YES];
             NSLog(@"FAIL %ld",operation.response.statusCode);
            if( [operation.response statusCode] == 400)
            {
                NSLog(@"%@",error);
                UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"预约失败" message: error.localizedDescription  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                [ errorAlert show ];
            }
            else if([operation.response statusCode]==404)
            {
                NSLog(@"%@",error);
                UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"预约失败" message: error.localizedDescription  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                [ errorAlert show ];
            }else if ([operation.response statusCode]==0)
            {
                NSLog(@"%@",error);
                UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"连接错误，无法连接到服务器" message: error.localizedDescription  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                [ errorAlert show ];
            }else if ([operation.response statusCode]==500)
            {
                NSLog(@"%@",error);
                UIAlertView* errorAlert = [ [ UIAlertView alloc ] initWithTitle: @"预约失败" message: error.localizedDescription  delegate: nil  cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                [ errorAlert show ];
            }
         }];
    
}


- (NSString*)changeDayOfWeekString:(NSString*)changeString
{
    if ([changeString isEqualToString:@"周一"])
    {
        changeString = @"1";
    }
    else if([changeString isEqualToString:@"周二"])
    {
        changeString = @"2";
    }
    else if([changeString isEqualToString:@"周三"])
    {
        changeString = @"3";
    }
    else if([changeString isEqualToString:@"周四"])
    {
        changeString = @"4";
    }
    else if([changeString isEqualToString:@"周五"])
    {
        changeString = @"5";
    }
    else if([changeString isEqualToString:@"周六"])
    {
        changeString = @"6";
    }
    else
    {
        changeString = @"7";
    }
    return changeString;
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ( alertView.tag == 200 && buttonIndex == 0 )
    {
        [ self.navigationController popToRootViewControllerAnimated: YES ];
    }
}

@end
