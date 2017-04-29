//
//  loginViewController.m
//  
//
//  Created by user on 15/11/16.
//
//

#import "loginViewController.h"
#import "dudaoViewController.h"
#import "newsViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"登陆";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.loginBtn.layer setMasksToBounds:YES];
    [self.loginBtn.layer setCornerRadius:10.0];
    
    UIButton *freePswBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 375, 67)];
    [freePswBtn addTarget:self action:@selector(intoMainView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:freePswBtn];
    
    [self initWithThePassword];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//使用沙盒知识存储账号密码
//获取文件名和路径
-(NSString *) dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSLog(@"%@",paths);
    NSString *documentsDirectory=[paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"UN_PW"];
}

- (void) initWithThePassword
{
    //是否保存账号密码
    NSString * path = [self dataFilePath];
    if([[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        NSArray * array = [[NSArray alloc] initWithContentsOfFile:path];
        self.userName.text = [array objectAtIndex:0];
        NSString * rememberPassword = [array objectAtIndex:2];
        
        if([rememberPassword isEqualToString:@"YES"])
        {
            self.password.text = [array objectAtIndex:1];
            self.pswSwitch.on = YES;
        }
    }
}

- (void)hudWasHidden:(MBProgressHUD *)hud{
    [HUD removeFromSuperview];
    HUD = nil;
}

- (IBAction)loginBtnDidClicked:(UIButton *)sender {
    
    //判断输入是否争取
    if(self.userName.text.length == 0 || self.password.text.length == 0)//账号密码至少一个为空
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"警告" message:@"用户名与密码均不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else //输入账号密码，开始判断是否准确
    {
        //------- 保存数据到文件-------------------------------------------------//
        
        NSFileManager * fileManager = [NSFileManager defaultManager];
        //创建文件管理器
        
        NSString * filePath = [self dataFilePath];
        //调用函数将函数值documentsDirectory导入实例变量filePath中
        NSLog(@"%@",filePath);
        
        //若文件不存在，则创建新文件
        if(![fileManager fileExistsAtPath:filePath])
        {
            [fileManager createFileAtPath:filePath contents:nil attributes:nil];
            //createFileAtPath方法应该是创建一个叫filePath的文件，内容（content）为无，
            //属性为 无，大意是创建一个空文件用来存储账号密码与是否保存的yes/no值
        }
        
        //用数组来存账号密码及yes/no值
        NSMutableArray * array = [[NSMutableArray alloc] init];// 可变数组
        [array addObject:self.userName.text];
        [array addObject:self.password.text];
        if( self.pswSwitch.on == YES)
        {
            [array addObject:@"YES"];
        }
        else
        {
            [array addObject:@"NO"];
        }
        //将array放入filePath
        [array writeToFile:filePath atomically:YES];

    
    //--------------------------------------------------------------------//

    //MBProgressHUD 登陆转圈圈
        HUD = [[MBProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:HUD];
        HUD.delegate = self;
        
        //可设置HUD样式
        //HUD.mode = MBProgressHUDModeAnnularDeterminate;
        
        HUD.dimBackground = YES;
        HUD.labelText = @"正在登陆";
        
        [HUD show:YES];
        
        [self verifyPsw];

    }
}

- (IBAction)forgetPswClicked:(id)sender {
    
    UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示" message:@"如需找回密码，请联系协同软件工作室。" delegate:self cancelButtonTitle:@"好的" otherButtonTitles: nil];
    [alter show];
    return;
    
}

- (void)verifyPsw{
    NSString *loginURL = @"http://eva.gdut.edu.cn:8080/j_spring_security_check";
    
    //设置POST的userName和password
    NSDictionary *parameters = @{@"j_username":self.userName.text,@"j_password":self.password.text};
    
    AFHTTPRequestOperationManager *loginManager = [AFHTTPRequestOperationManager manager];
    
    [loginManager.requestSerializer setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    [loginManager POST:loginURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [HUD hide:YES];
        
        NSLog(@"1 --> %ld",(long)[operation.response statusCode]);
        
        //[ alertView dismissWithClickedButtonIndex: [ alertView cancelButtonIndex ] animated: YES ];
        
        [self intoMainView];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [HUD hide:YES];

        NSLog(@"2 --> %@",error);
        
        //[ alertView dismissWithClickedButtonIndex: [ alertView cancelButtonIndex ] animated: YES ];
        
        NSString* alertTitle = [ [ NSString alloc] initWithFormat: @"登录失败" ] ;
        NSString* alertMessage = [  [ NSString alloc ] init ] ;
        NSString* alertButtonName = [  [ NSString alloc ] initWithFormat: @"取消" ] ;
        
        if ( [operation.response statusCode] == 401 )
        {
            alertMessage = @"密码错误！";
            UIAlertView* resultAlert = [ [ UIAlertView alloc ] initWithTitle: alertTitle message: alertMessage delegate: self cancelButtonTitle: alertButtonName otherButtonTitles: nil , nil ];
            [ resultAlert show ];
            return;
        }
        else if ( [operation.response statusCode] == 404 )
        {
            alertMessage = @"用户名不存在";
            UIAlertView* resultAlert = [ [ UIAlertView alloc ] initWithTitle: alertTitle message: alertMessage delegate: self cancelButtonTitle: alertButtonName otherButtonTitles: nil , nil ];
            [ resultAlert show ];
            return;
        }
        else
        {
            alertMessage = @"服务器维护中";
            UIAlertView* resultAlert = [ [ UIAlertView alloc ] initWithTitle: alertTitle message: alertMessage delegate: self cancelButtonTitle: alertButtonName otherButtonTitles: nil , nil ];
            [ resultAlert show ];
            return;
        }
        
    }];
    

}


- (void) intoMainView{
    
    UITabBarController *mainController = [[UITabBarController alloc]init];
    
    
    dudaoViewController *dudaoVC = [[dudaoViewController alloc]init];
    UINavigationController *dudaoRootController = [[UINavigationController alloc]initWithRootViewController:dudaoVC];
    dudaoRootController.tabBarItem.title = @"督 导 系 统";
    dudaoRootController.tabBarItem.image = [[UIImage imageNamed:@"clipboard"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    newsViewController *newsVC = [[newsViewController alloc] init];
    UINavigationController *newsRootController = [[UINavigationController alloc]initWithRootViewController:newsVC];
    newsRootController.tabBarItem.title = @"新 闻 栏 目";
    newsRootController.tabBarItem.image = [[UIImage imageNamed:@"news"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIViewController *otherVC = [[UIViewController alloc] init];
    otherVC.tabBarItem.title = @"其 他";
    otherVC.tabBarItem.image = [[UIImage imageNamed:@"document"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    
    NSArray *tabs = [NSArray arrayWithObjects:dudaoRootController,newsRootController,otherVC,nil];
    [(UITabBarController *) mainController setViewControllers:tabs animated:NO];

    [self.navigationController pushViewController:mainController animated:YES];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end

