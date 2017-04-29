//
//  ClassSituation.m
//  NewSteeringSystem
//
//  Created by apple on 13-2-5.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "ClassSituation.h"


@implementation ClassSituation

@synthesize  survey_id;                    //
@synthesize course_class_no;
@synthesize absent_num;
@synthesize actual_num;
@synthesize student_faculty;
@synthesize food_eat_num;
@synthesize late_leaveearly_num;
@synthesize play_mobil_num;
@synthesize sleep_speak_num;
@synthesize slipper_shorts_num;
@synthesize teacher_ontime;
@synthesize truant_num;
@synthesize vacate_num;
@synthesize other_situation;
@synthesize supervisor;
@synthesize pic_path ; 
@synthesize survey_score;
@synthesize survey_level;
@synthesize notice_flag;
@synthesize survey_receiver;
@synthesize add_user;
@synthesize add_time;
@synthesize modify_user;
@synthesize modify_time;  
@synthesize lesson_date;
@synthesize teacher_name;
@synthesize teaching_class_group;
@synthesize plan_population;
@synthesize lesson_classroom;
@synthesize lesson_section;
@synthesize Terminal_Desc;
@synthesize Terminal_Type;
@synthesize Terminal_Visit_Ip;
@synthesize Auditor;
@synthesize Audit_Status;
@synthesize Survey_Time;
@synthesize booking_class;

@synthesize sameUrl;

+ (ClassSituation*) shareClassSituation
{
    static ClassSituation * obj = nil;
    if ( obj == nil )
    {
        obj = [ [ ClassSituation alloc ] init ];
    }
    return obj;
}

- (id) init
{
    if ( self = [ super init ] )
    {
        
    }
    return self;
}

@end
