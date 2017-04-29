//
//  deleteBookingData.h
//  
//
//  Created by user on 15/11/22.
//
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "bookingSearchTableViewController.h"

typedef void(^successBlock)(void);
typedef void(^failureBlock)(void);

@class bookingSearchTableViewController;

@interface deleteBookingData : NSObject{
    bookingSearchTableViewController *bSTableViewController;
}

- (void)deleteBookingClassWithIndexPath:(NSIndexPath *)indexPath
                                Success:(successBlock)success
                                failure:(failureBlock)failure;

@end
