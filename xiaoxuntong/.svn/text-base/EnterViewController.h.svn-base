//
//  EnterViewController.h
//  xiaoxuntong
//
//  Created by demo on 15/11/26.
//  Copyright © 2015年 xietong-xkk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONKit.h"
#import "ClassSituation.h"
#import "AFNetworking.h"
#import "dudaoAllTheURL.h"
#import "EditViewController.h"

#define CheckUrl @"http://eva.gdut.edu.cn:8080/dudao"

@class ClassSituation;



@interface EnterViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,NSXMLParserDelegate,UIActionSheetDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
UITextField * SchoolDistrictTextField_;
UITextField * SectionOfClassroomTextField_;
UITextField * ClassroomTextField_;
UITextField * NumberOfClassTextField_;
UITextField * DateTextField_;

//校区
NSArray * SchoolDistrictArray_;
//教室类型
NSMutableArray * SectionOfClassroomArray_;
//教室
NSMutableArray * ClassroomArray_;
//教室总和
NSMutableArray * AllClassroomArray_;
//节次
NSArray * NumberOfClassArray_;

//存xml里所有数据的字典
NSDictionary* allTheClassroomDictionary_;//待解答

//解析xml
NSData* xmlData_;
NSXMLParser* parserXML_;
NSMutableArray* workingArray_;
NSMutableString* workingPropertyString_;
NSArray* elementsToParse_;
BOOL storingCharacterData_;
//——————————————————————————————————————————————//


//创建操作框
//校区
UIActionSheet * schoolDistrictSheet_;
//教室类型
UIActionSheet * sectionOfClassroomSheet_;
//教室
UIActionSheet * classroomSheet_;
//节次
UIActionSheet * numberOfClassSheet_;

//*----------------选择框-----------------------*//
//日期
UIDatePicker * ToChooseDate_Picker;



//***************转跳到下一个画面，录入窗口前的所有方法***********************//

//警告框
UIAlertView * alert_;
//校区编号
NSString * SchoolNumber_;
//录入窗口
EditViewController * EditView;

}



@end
