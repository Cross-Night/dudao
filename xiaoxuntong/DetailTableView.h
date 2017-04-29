//
//  DetailTableView.h
//  likTwoHelloWorld
//
//  Created by apple on 13-2-5.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface DetailTableView : UITableViewController <UITextFieldDelegate,UITextViewDelegate>{
    @private
    
    //*--------基本信息标签---------------------*//
    
    //以字典的形式保存需要填写的信息
    NSDictionary* detailDictionary_;
    //以数组的形式存放各信息的标题
    NSArray* detailTitleArray_;

    //*---------------------------------------*//
    @public
    //************设置文本输入框*********************// 
    
    //教师基本信息
    UITextField* teacherNameTextField_;
    UITextField* studentFaucltyTextField_;
    UITextField* teachingClassGroupTextField_;
    UITextField* teacherOntimeTextField_;
    //课堂基本信息
    UITextField* lessonClassroomTextField_;
    UITextField* lessonSectionTextField_;
    UITextField* lessonDateTextField_;
    //新增的字段 录入时间
    UITextField* writeDownTimeTextField_;
    
    //缺勤信息
    UITextField* planPopulationTextField_;
    UITextField* actualNumTextField_;
    UITextField* truantNumTextField_;
    UITextField* vacateNumTextField_;
    UITextField* lateLeaveEarlyNumTextField_;
    //违纪情况
    UITextField* foodEatNumTextField_;
    UITextField* playMobileNumTextField_;
    UITextField* sleepSpeakNumTextField_;
    UITextField* slipperShortsNumTextField_;
    //备注
    UITextField* otherSituationTextField_;
    UITextView* otherSituationTextView_;
    //以字典的形式保存各个输入框
    NSDictionary* textDictionary_;
    
    //********************************************//
    

}

//教师基本信息
@property ( nonatomic , retain ) UITextField* teacherNameTextField_;
@property ( nonatomic , retain )UITextField* studentFaucltyTextField_;
@property ( nonatomic , retain )UITextField* teachingClassGroupTextField_;
@property ( nonatomic , retain )UITextField* teacherOntimeTextField_;
//课堂基本信息
@property ( nonatomic , retain )UITextField* lessonClassroomTextField_;
@property ( nonatomic , retain )UITextField* lessonSectionTextField_;
@property ( nonatomic , retain )UITextField* lessonDateTextField_;
//新增的字段 录入时间
@property ( nonatomic , retain )UITextField* writeDownTimeTextField_;

//缺勤信息
@property ( nonatomic , retain )UITextField* planPopulationTextField_;
@property ( nonatomic , retain )UITextField* actualNumTextField_;
@property ( nonatomic , retain )UITextField* truantNumTextField_;
@property ( nonatomic , retain )UITextField* vacateNumTextField_;
@property ( nonatomic , retain )UITextField* lateLeaveEarlyNumTextField_;
//违纪情况
@property ( nonatomic , retain )UITextField* foodEatNumTextField_;
@property ( nonatomic , retain )UITextField* playMobileNumTextField_;
@property ( nonatomic , retain )UITextField* sleepSpeakNumTextField_;
@property ( nonatomic , retain )UITextField* slipperShortsNumTextField_;
//备注
@property ( nonatomic , retain )UITextField* otherSituationTextField_;
@property ( nonatomic , retain )UITextView* otherSituationTextView_;

@end
