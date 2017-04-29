//
//  loginViewController.h
//  
//
//  Created by user on 15/11/16.
//
//

#import "ViewController.h"
#import "MBProgressHUD.h"


@interface loginViewController : UIViewController<MBProgressHUDDelegate>{
    MBProgressHUD *HUD;
}
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) IBOutlet UISwitch *pswSwitch;
@property (weak, nonatomic) IBOutlet UIButton *forgetPswBtn;

@property (weak, nonatomic)  UIActivityIndicatorView *indicatorview;
@property (weak, nonatomic)  UIAlertView *alertview;




- (IBAction)loginBtnDidClicked:(UIButton *)sender;
- (IBAction)forgetPswClicked:(id)sender;

@end
