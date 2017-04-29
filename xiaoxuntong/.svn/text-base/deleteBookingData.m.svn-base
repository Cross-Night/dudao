//
//  deleteBookingData.m
//  
//
//  Created by user on 15/11/22.
//
//

#import "deleteBookingData.h"

@implementation deleteBookingData

-(void)deleteBookingClassWithIndexPath:(NSIndexPath *)indexPath Success:(successBlock)success failure:(failureBlock)failure{
    //设置查找当前预约的详细资料的URL
    NSString *bookingSearchURL = [NSString stringWithFormat:@"http://eva.gdut.edu.cn:8080/bookingQuery"];
    
    AFHTTPRequestOperationManager *bookingSearchManager = [AFHTTPRequestOperationManager manager];
    
    //查找出删除课程的booking_id
    [bookingSearchManager GET:bookingSearchURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"1 --> %ld",(long)[operation.response statusCode]);
        
        NSArray *array = [NSArray arrayWithArray:[responseObject objectForKey:@"bookingCourseclass"]];
        
        NSString *classDNumber = [array[indexPath.row] objectForKey:@"booking_id"];
        
        NSLog(@"%@",classDNumber);
        
        //设置删除预约的URL
        NSString *deletingURL = [NSString stringWithFormat:@"http://eva.gdut.edu.cn:8080/deletebooking/%@",classDNumber];
        
        AFHTTPRequestOperationManager *bookingDeleteManager = [AFHTTPRequestOperationManager manager];
        
        
        [bookingDeleteManager GET:deletingURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            UIAlertView* messageAlert = [[ UIAlertView alloc ] initWithTitle:@"提示" message:@"你已经删除成功" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil, nil];
            [messageAlert show];
            
            success();
            
            NSLog(@"1 -->删除成功 %ld ",(long)[operation.response statusCode]);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            NSLog(@"2 --> %@",error);
            
        }];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"2 --> %@",error);
    }];
}

@end
