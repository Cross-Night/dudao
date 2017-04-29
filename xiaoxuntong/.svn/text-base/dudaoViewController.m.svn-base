//
//  chaxunViewController.m
//  
//
//  Created by user on 15/11/16.
//
//

#import "dudaoViewController.h"

@interface dudaoViewController (){
    CGFloat viewW;
    CGFloat viewH;
    CGFloat buttonW;
    CGFloat buttonH;
    CGFloat paddingW;
    CGFloat paddingH;
    CGFloat StatusAndNavH;
    CGFloat realWindowH;
    CGFloat realWindowW;
}

@end

@implementation dudaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //获取屏幕width和height
    viewW = self.view.bounds.size.width;
    viewH = self.view.bounds.size.height;
    
    //获取状态栏和导航栏的高度和宽度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    CGRect rectNav = self.navigationController.navigationBar.frame;
    StatusAndNavH = rectNav.size.height + rectStatus.size.height;
    
    realWindowH = viewH - StatusAndNavH - 40;
    
    //设置返回按钮 代表下一个控制器返回按钮
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    
    //设置当前页面返回按钮
    UIBarButtonItem * backToLoginView = [[UIBarButtonItem alloc] initWithTitle:@"退出登录" style:UIBarButtonItemStylePlain  target:self action:@selector(backPrePage)];
    self.navigationItem.leftBarButtonItem = backToLoginView;
    
    //设置标题
    self.navigationItem.title = @"督 导 系 统";
    self.view.backgroundColor = [UIColor colorWithPatternImage:[[UIImage imageNamed:@"dudaoView3.jpg" ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    
    //设置4个按钮
    buttonH = realWindowH / 4;
    buttonW = viewW;
    
    UIButton *btn1 = [[UIButton alloc] init];
    btn1.frame = CGRectMake(viewW, StatusAndNavH, buttonW, buttonH);
    btn1.backgroundColor = [UIColor grayColor];
    [btn1 setTitle:@"预 约 查 询" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     btn1.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [self.view addSubview:btn1];
    
    //画横线
//    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(paddingW, paddingH+buttonH, buttonW, 1)];
//    view1.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view1];
    
    UIButton *btn2 = [[UIButton alloc] init];
    btn2.frame = CGRectMake(viewW, StatusAndNavH+buttonH, buttonW, buttonH);
    btn2.backgroundColor = [UIColor whiteColor];
    [btn2 setTitle:@"录 入 查 询" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [self.view addSubview:btn2];
    
    //画横线
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(paddingW, paddingH+(paddingH+buttonH)+buttonH, buttonW, 1)];
//    view2.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view2];
    
    UIButton *btn3 = [[UIButton alloc] init];
    btn3.frame = CGRectMake(viewW, StatusAndNavH+2*buttonH, buttonW, buttonH);
    btn3.backgroundColor = [UIColor grayColor];
    [btn3 setTitle:@"督 导 录 入" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [self.view addSubview:btn3];
    
    UIButton *btn4 = [[UIButton alloc] init];
    btn4.frame = CGRectMake(viewW, StatusAndNavH+3*buttonH, buttonW, buttonH);
    btn4.backgroundColor = [UIColor whiteColor];
    [btn4 setTitle:@"督 导 预 约" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [self.view addSubview:btn4];
    
    [btn1 addTarget:self action:@selector(enterbSTableView) forControlEvents:UIControlEventTouchUpInside];
    
    [btn2 addTarget:self action:@selector(entercXTableView) forControlEvents:UIControlEventTouchUpInside];
    
    [btn3 addTarget:self action:@selector(enterdLView) forControlEvents:UIControlEventTouchUpInside];
   
    [btn4 addTarget:self action:@selector(enterxYView) forControlEvents:UIControlEventTouchUpInside];
    
    CGFloat delay = 1.0f;
    CGFloat shutter = 0.1f;
    
    [self showButton:btn1 endWithFrame:CGRectMake(0, StatusAndNavH, viewW, buttonH) WithDelay:delay];
    [self showButton:btn2 endWithFrame:CGRectMake(0, StatusAndNavH+buttonH, viewW, buttonH) WithDelay:delay+shutter];
    [self showButton:btn3 endWithFrame:CGRectMake(0, StatusAndNavH+2*buttonH, viewW, buttonH) WithDelay:delay+2*shutter];
    [self showButton:btn4 endWithFrame:CGRectMake(0, StatusAndNavH+3*buttonH, viewW, buttonH) WithDelay:delay+3*shutter];

}

-(void)viewDidAppear:(BOOL)animated{


}

-(void)showButton:(UIButton *)button endWithFrame:(CGRect )frame WithDelay:(CGFloat )delay{
    
    [UIView animateWithDuration:2.1 delay:delay
         usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
             [button setFrame:frame];
         } completion:NULL];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) enterbSTableView{
    
    bookingSearchTableViewController *c = [[bookingSearchTableViewController alloc] init];
    
    bookingClassData *bClassData = [[bookingClassData alloc] init];
    
    [bClassData getBOokingClassDataWithSuccess:^() {
        c.sizeArray = bClassData.sizeArray;
        c.classArray = bClassData.classArray;
        [c.tableView reloadData];
    } failure:^() {
        
    }];
    
    
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:c animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (void) entercXTableView{
    SearchView *c = [[SearchView alloc] init];
    [self.navigationController pushViewController:c animated:YES];
}

-(void)enterdLView{
    EnterViewController * e = [[EnterViewController alloc] init];
    [self.navigationController pushViewController:e animated:YES];
}

-(void)enterxYView{
    YuyueViewController * e = [[YuyueViewController alloc] init];
    [self.navigationController pushViewController:e animated:YES];
}

- (void)backPrePage{
    [self.parentViewController.navigationController popToRootViewControllerAnimated: YES];
}



@end
