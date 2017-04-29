//
//  BookingTableViewController.h
//  xiaoxuntong
//
//  Created by 姚润鑫 on 16/1/18.
//  Copyright © 2016年 xietong-xkk. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "JSONKit.h"
#import "AFNetworking.h"
#import "MBProgressHUD.h"

@class ClassSituation;
#define selectBookingUrl @"http://eva.gdut.edu.cn:8080/dudaoSaveBooking"

@interface BookingTableViewController : UITableViewController<UIAlertViewDelegate>
{
    NSArray* bookingArray;//预约信息数组
    NSMutableArray* arrangeMutableArray;//整理后的预约信息数组
    NSIndexPath * selectIndexPath;//选中的行
    NSString* course_Class_NoString;
    NSString* schedule_idString;
    NSString* semesterString;
    NSString* dayOfWeekString;
    NSString* weekString;
    UIAlertView* alertView;
}

@property (nonatomic , retain) NSArray* bookingArray;
@property (nonatomic , retain) NSMutableArray* arrangeMutableArray;
@property (nonatomic , retain) NSString* weekString;

@end
