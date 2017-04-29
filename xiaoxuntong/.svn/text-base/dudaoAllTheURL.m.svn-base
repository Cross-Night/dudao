//
//  dudaoAllTheURL.m
//  NewSteeringSystem
//
//  Created by apple on 13-2-2.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "dudaoAllTheURL.h"
#import "ClassSituation.h"

@implementation dudaoAllTheURL
@synthesize hostUrl_;
@synthesize checkUrl_;
@synthesize submitUrl_;
@synthesize searchUrl_;
@synthesize sameUrl_;
@synthesize updateUrl_;
@synthesize modifyUrl_;
@synthesize searchBookedUrl_;

//- (void)dealloc
//{
//    [ hostUrl_ release ];
//    [ checkUrl_ release ];
//    [ submitUrl_ release ];
//    [ searchUrl_ release ];
//    [ sameUrl_ release ];
//    [ updateUrl_ release ];
//    [ modifyUrl_ release ];
//    [ searchBookedUrl_ release ];
//    [ super dealloc ];
//}

- (id)init
{
    if ( ( self = [ super init ] ) )
    {
        //共同的
        
        if ( [ ClassSituation shareClassSituation ].sameUrl  )
        {
            sameUrl_ = [ ClassSituation shareClassSituation ].sameUrl;
        }
        else
           // sameUrl_ = @"http://psy.gdut.edu.cn:8080/"; // 学校用
              sameUrl_ = @"http://eva.gdut.edu.cn:8080/";
        
        //登录时 
        hostUrl_ = [ [ NSString alloc ] initWithString: [ NSString stringWithFormat: @"%@j_spring_security_check" , sameUrl_ ] ];
//        hostUrl_ = [ NSString stringWithFormat: @"%@j_spring_security_check" , sameUrl_ ];
        //        hostUrl_ = @"http://psy.gdut.edu.cn:8080/j_spring_security_check";
        //        hostUrl_ = [ NSString stringWithFormat: sameUrl_ , @"j_spring_security_check" ];
        //#define HostUrl @"http://192.168.1.122:8080/j_spring_security_check"
        
        //没有预约录入前
        checkUrl_ = [ [ NSString alloc ] initWithString: [ NSString stringWithFormat: @"%@dudao" , sameUrl_ ] ];
//        checkUrl_ = [ NSString stringWithFormat: @"%@dudao" , sameUrl_ ];
        //        checkUrl_ = @"http://psy.gdut.edu.cn:8080/dudao";
        //#define CheckUrl @"http://192.168.1.122:8080/dudao"
        
        //录入时
        submitUrl_ = [ [ NSString alloc ] initWithString: [ NSString stringWithFormat: @"%@Edu_Survey/iphoneSave" , sameUrl_ ] ];
//        submitUrl_ = [ NSString stringWithFormat: @"%@Edu_Survey/iphoneSave" , sameUrl_ ];
        //         submitUrl_ = @"http://psy.gdut.edu.cn:8080/Edu_Survey/iphoneSave";
        //#define SubmitURL @"http://192.168.1.122:8080/Edu_Survey/iphoneSave"
        
        //查找时
        searchUrl_ = [ [ NSString alloc ] initWithString: [ NSString stringWithFormat: @"%@dudao/check" , sameUrl_ ] ];
//        searchUrl_ = [ NSString stringWithFormat: @"%@dudao/check" , sameUrl_ ];
        //         searchUrl_ = @"http://psy.gdut.edu.cn:8080/dudao/check";
        //#define SearchUrl @"http://192.168.1.122:8080/dudao/check"
        
        //修改前
        updateUrl_ = [ [ NSString alloc ] initWithString: [ NSString stringWithFormat: @"%@dudao/checkForUpdate/" , sameUrl_ ] ];
//        updateUrl_ = [ NSString stringWithFormat: @"%@dudao/checkForUpdate/" , sameUrl_ ];
        //#define UpdateUrl @"http://psy.gdut.edu.cn:8080/dudao/checkForUpdate/"
        //#define UpdateUrl @"http://192.168.1.122:8080/dudao/checkForUpdate/"
        
        //修改后
        modifyUrl_ = [ [ NSString alloc ] initWithString: [ NSString stringWithFormat: @"%@Edu_Survey/IphoneUpdate" , sameUrl_ ] ];
//#define ModifyURL @"http://psy.gdut.edu.cn:8080/Edu_Survey/IphoneUpdate"
        //@"http://192.168.1.122:8080/Edu_Survey/IphoneUpdate"
        
        //预约录入时
        searchBookedUrl_ = [ [ NSString alloc ] initWithString: [ NSString stringWithFormat: @"%@bookingQuery" , sameUrl_ ] ];
        //#define SearchBookedUrl @"http://192.168.1.122:8080/bookingQuery"
//#define SearchBookedUrl @"http://psy.gdut.edu.cn:8080/bookingQuery"
        
/************************************************************************************        
        //登录时
        //        hostUrl_ = @"http://psy.gdut.edu.cn:8080/j_spring_security_check";
        //#define HostUrl @"http://192.168.1.122:8080/j_spring_security_check"
        
        //没有预约录入前
        //        checkUrl_ = @"http://psy.gdut.edu.cn:8080/dudao";
        //#define CheckUrl @"http://192.168.1.122:8080/dudao"
        
        //录入时
        submitUrl_ = @"http://psy.gdut.edu.cn:8080/Edu_Survey/iphoneSave";
        //#define SubmitURL @"http://192.168.1.122:8080/Edu_Survey/iphoneSave"
        
        //查找时
        searchUrl_ = @"http://psy.gdut.edu.cn:8080/dudao/check";
        //#define SearchUrl @"http://192.168.1.122:8080/dudao/check"
        
************************************************************************************/
    }
    return self;
}


- (NSArray*) setUpAllTheSameUrl
{
    NSArray* allTheSameUrl = [ [ NSArray alloc ] initWithObjects: @"http://psy.gdut.edu.cn:8080/", @"http://10.21.32.123:8080/" , @"http://192.168.1.112:8080/" , nil ];
    return  allTheSameUrl;
}

@end
