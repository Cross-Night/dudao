//
//  dudaoAllTheURL.h
//  NewSteeringSystem
//
//  Created by apple on 13-2-2.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface dudaoAllTheURL : NSObject {
    @public
    NSString* hostUrl_;
    NSString* checkUrl_;
    NSString* submitUrl_;
    NSString* searchUrl_;
    NSString* updateUrl_;
    NSString* sameUrl_;
    NSString* modifyUrl_;
    NSString* searchBookedUrl_;
}
@property ( nonatomic , retain ) NSString* hostUrl_;
@property ( nonatomic , retain ) NSString* checkUrl_;
@property ( nonatomic , retain ) NSString* submitUrl_;
@property ( nonatomic , retain ) NSString* searchUrl_;
@property ( nonatomic , retain ) NSString* updateUrl_;
@property ( nonatomic , retain ) NSString* sameUrl_;
@property ( nonatomic , retain ) NSString* modifyUrl_;
@property ( nonatomic , retain ) NSString* searchBookedUrl_;

- (NSArray*) setUpAllTheSameUrl;

@end
