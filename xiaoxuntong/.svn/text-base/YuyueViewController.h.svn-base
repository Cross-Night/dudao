//
//  ViewController.h
//  督导预约
//
//  Created by 姚润鑫 on 15/11/19.
//  Copyright © 2015年 姚润鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "AFNetworking.h"
#import "JSONKit.h"
#import "BookingTableViewController.h"
#import "ClassSituation.h"
#define bookingUrl @"http://eva.gdut.edu.cn:8080/dudaobooking"

@class ClassSituation;

@interface YuyueViewController : UIViewController<UITextFieldDelegate,UIActionSheetDelegate>
{
    UITextField* currentSemesterTextField;//当前学期
    UITextField* numberOfWeekTextField;//周次
    UITextField* collegeTextField;//学院
    UITextField* weekTextField;//星期
    UITextField* numberOfClassTextField;//节次
    
@public
    //校区
    NSArray * currentSemesterArray;
    //周次
    NSArray * numberOfWeekArray;
    //节次
    NSArray * numberOfClassArray;
    
    //创建判断类型
    //星期
    Boolean  weekbool;
    //节次
    Boolean  numberOfClassbool;
    //当前学期
    Boolean  currentSemesterbool;
    //学院
    Boolean  collegebool;
    //周次
    Boolean  numberOfWeekbool;
    
    //创建操作框
    
    //星期
    UIActionSheet * weekSheet;
    //节次
    UIActionSheet * numberOfClassSheet;
    //当前学期
    UIActionSheet * currentSemesterSheet;
    //学院
    UIActionSheet * collegeSheet;
    //周次
    UIActionSheet * numberOfWeekSheet;
    
    UIAlertView * alert_;
    
    BookingTableViewController *bookingTableView;
}
@property (nonatomic , retain) BookingTableViewController * bookingTableView;


@end

