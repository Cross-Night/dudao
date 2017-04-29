//
//  SearchEdit.h
//  xiaoxuntong
//
//  Created by 月砂 on 15/11/27.
//  Copyright (c) 2015年 xietong-xkk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"
#import "MBProgressHUD.h"
#import "Reachability.h"

@interface SearchEdit : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property NSDictionary * data;
@end
