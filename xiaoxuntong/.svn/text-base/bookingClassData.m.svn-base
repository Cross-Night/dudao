//
//  bookingData.m
//  
//
//  Created by user on 15/11/16.
//
//

#import "bookingClassData.h"
#import "Reachability.h"


@implementation bookingClassData{
    int netTag;
    __block UIAlertView *alertView;
}

//获取文件名和路径
+(NSString * )getUserName
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:@"UN_PW"];

    NSArray *array = [[NSArray alloc] initWithContentsOfFile:filePath];
    NSString *supervisor = [ array objectAtIndex: 0 ];
    return supervisor;
}

-(void)getBOokingClassDataWithSuccess:(successBlock)success failure:(failureBlock)failure{
    //判断是否有网络
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus status = [reach currentReachabilityStatus];
    
    //网络请求处理
    if (NotReachable == status) {//网络连接失败
        //提示窗口
        alertView = [ [ UIAlertView alloc ] initWithTitle: @"当前网络不可用,请检查你的网络设置" message: nil delegate: self cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
        [ alertView show ];
    }else{
    //设置查询的URL
        NSString *userName = [bookingClassData getUserName];
        
        NSString *bookingSearchURL = [NSString stringWithFormat:@"http://eva.gdut.edu.cn:8080/bookingQuery/%@",userName];
        
        netTag = 1;//取消窗口判断
        //提示窗口
        alertView = [ [ UIAlertView alloc ] initWithTitle: @"正在查询，请稍候...." message: nil delegate: self cancelButtonTitle: @"取消查询" otherButtonTitles: nil , nil ];
        [ alertView show ];
        
        //获取数据
        AFHTTPRequestOperationManager *bookingSearchManager = [AFHTTPRequestOperationManager manager];
        
        [bookingSearchManager GET:bookingSearchURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"1 --> %ld",(long)[operation.response statusCode]);
            
            NSArray *array = [responseObject objectForKey:@"size"];
            NSLog(@"%@",array[0]);
            self.sizeArray = array[0];
            self.classArray = [responseObject objectForKey:@"booking_class"];
            
            //登录完成后删除提示信息
            [alertView dismissWithClickedButtonIndex: [alertView cancelButtonIndex] animated: YES ];
            
            success();
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"2 --> %@",error);
            
            
            [alertView dismissWithClickedButtonIndex: [alertView cancelButtonIndex] animated: YES ];
            
            if (netTag == 1) {
                alertView = [[UIAlertView alloc] initWithTitle: @"无预约课程" message: @"你好,你还没有预约课程!" delegate: self cancelButtonTitle: @"确定" otherButtonTitles: nil , nil ];
                [alertView show ];
                
            }
            
            self.sizeArray = nil;
            self.classArray = nil;
            
            //没有实现失败处理
            failure();
            
        }];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        netTag = 0;//取消查询
    }
}

@end
