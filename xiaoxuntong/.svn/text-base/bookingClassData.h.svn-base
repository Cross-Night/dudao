//
//  bookingData.h
//  
//
//  Created by user on 15/11/16.
//
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "bookingSearchTableViewController.h"

typedef void(^successBlock)(void);
typedef void(^failureBlock)(void);

@class bookingSearchTableViewController;
@interface bookingClassData : NSObject<UIAlertViewDelegate>


@property (nonatomic ,retain) NSMutableArray *classArray;
@property (nonatomic ,strong) NSMutableArray *sizeArray;

+ (NSString * )getUserName;

-(void)getBOokingClassDataWithSuccess:(successBlock)success
                              failure:(failureBlock)failure;

@end
