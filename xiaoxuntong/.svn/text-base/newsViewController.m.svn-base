//
//  newsViewController.m
//  
//
//  Created by user on 15/11/28.
//
//

#import "newsViewController.h"

@interface newsViewController ()<UITableViewDelegate, UITableViewDataSource>{
    UIFont *defaultFont;
    UIFont *lagerFont;
    
    NSArray *news1;
    NSArray *news2;
    NSArray *news3;
    
    NSUInteger tag;
}

@end

@implementation newsViewController{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setDeafalutDetailArray];
    
    self.navigationItem.title = @"新 闻 栏 目";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //获取屏幕width和height
    viewW = self.view.bounds.size.width;
    viewH = self.view.bounds.size.height;
    
    //获取状态栏和导航栏的高度和宽度
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    CGRect rectNav = self.navigationController.navigationBar.frame;
    StatusAndNavH = rectNav.size.height + rectStatus.size.height;
    
    //设置字体大小
    defaultFont = [UIFont fontWithName:@"Helvetica" size:15.0];
    lagerFont = [UIFont fontWithName:@"Helvetica" size:18.0];
    
    //设置HeadScrollView
    self.headArray = @[@"校内通知",@"公示公告",@"校内简讯"];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, StatusAndNavH, viewW, 40)];
    self.headScrollView.backgroundColor = [UIColor whiteColor];
    self.headScrollView.contentSize = CGSizeMake([self.headArray count]*100, 0);
    self.headScrollView.bounces = NO;
    self.headScrollView.showsHorizontalScrollIndicator = NO;
    self.headScrollView.alwaysBounceHorizontal = NO;
    [self.view addSubview:self.headScrollView];

    //添加Button
    for (int i = 0; i < [self.headArray count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0 + i*100, 0, 80, 40);
        button.tag = i+100;
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [button setTitle:[self.headArray objectAtIndex:i] forState:UIControlStateNormal];
        button.titleLabel.font = defaultFont;
        [button addTarget:self action:@selector(didClickHeadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.headScrollView addSubview:button];
    }
    
    

    //添加主体
    CGRect defaultViewFrame = CGRectMake(0, StatusAndNavH+40, viewW, viewH-StatusAndNavH-50);
    
    self.mainScrollView = [[UIScrollView alloc] initWithFrame:defaultViewFrame];
    self.mainScrollView.backgroundColor = [UIColor grayColor];
    self.mainScrollView.contentSize = CGSizeMake([self.headArray count]*viewW, 0);
    self.mainScrollView.bounces = NO;
    self.mainScrollView.showsHorizontalScrollIndicator = NO;
    self.mainScrollView.alwaysBounceHorizontal = NO;
    self.mainScrollView.pagingEnabled = YES;
    self.mainScrollView.delegate = self;
    //设置起始偏移量
    self.mainScrollView.contentOffset = CGPointMake(0,40);
    
    [self.view addSubview:self.mainScrollView];
    
    self.mainScrollView.scrollEnabled = NO;
    
    defaultViewFrame.origin.y = 0;
    
    self.firstVC = [[UITableViewController alloc] init];
    [self.firstVC.view setFrame:defaultViewFrame];
    self.firstVC.tableView.tableHeaderView.backgroundColor = [UIColor grayColor];
    self.firstVC.tableView.delegate = self;
    self.firstVC.tableView.dataSource = self;
    self.firstVC.tableView.tag = 11111;
    
    [self.mainScrollView addSubview:self.firstVC.view];
    
    
    
    defaultViewFrame.origin.x += viewW;
    self.secondVC = [[UITableViewController alloc] init];
    [self.secondVC.view setFrame:defaultViewFrame];
    self.secondVC.tableView.delegate = self;
    self.secondVC.tableView.dataSource = self;
    self.firstVC.tableView.tag = 22222;

    [self.mainScrollView addSubview:self.secondVC.view];

    
    defaultViewFrame.origin.x += viewW;
    self.thirdVC = [[UITableViewController alloc] init];
    self.thirdVC.tableView.delegate = self;
    self.thirdVC.tableView.dataSource = self;
    [self.thirdVC.view setFrame:defaultViewFrame];
    self.firstVC.tableView.tag = 33333;
    
    [self.mainScrollView addSubview:self.thirdVC.view];
    
    
    //默认第一页大字体
    UIButton *tBtn = (UIButton *)[self.view viewWithTag:100];
    tBtn.titleLabel.font = lagerFont;
    [tBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    tag = 100;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)didClickHeadButtonAction:(UIButton *)button
{
    [self allButtonFontReturnDefault];
    
    
    CGPoint point = CGPointMake((button.tag-100)*viewW, 0);
    [self.mainScrollView setContentOffset:point animated:YES];

    button.titleLabel.font = lagerFont;
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    NSInteger viewNumber = button.tag - 100;
    //[self headScrollViewReturnNormal:viewNumber];
    
    tag = button.tag;
    [self.firstVC.tableView reloadData];
    [self.secondVC.tableView reloadData];
    [self.thirdVC.tableView reloadData];
}

// scrollView 开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    NSLog(@"scrollViewWillBeginDragging");
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"hello"];
    NSLog(@"%ld",tag);
    //if (tag == 100) {
        NSDictionary *new = news1[indexPath.row];
        NSString *labelText = [[new allKeys] objectAtIndex:0];
        cell.textLabel.text = labelText;
    //}
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //if (tag == 100) {
        NSDictionary *new = news1[indexPath.row];
        NSString *labelText = [[new allKeys] objectAtIndex:0];
        NSString *url = [new objectForKey:labelText];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        UIWebView *webView = [[UIWebView alloc] init];
        [self.view addSubview: webView];
    //}
    
}

// scrollView 结束拖动 - 手指离开
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    NSLog(@"scrollViewDidEndDragging");
}

//// scrollView 结束拖动 - 真正停下
//- ( void )scrollViewDidEndDecelerating:( UIScrollView  *)scrollView{
//    
//    [self allButtonFontReturnDefault];
//    
//    CGFloat offsetX =  self.mainScrollView.contentOffset.x;
//    NSInteger viewNumber = (offsetX/viewW);
//    UIButton *Btn = (UIButton *)[self.view viewWithTag:viewNumber + 100];
//    Btn.titleLabel.font = lagerFont;
//    [Btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//
//    [self headScrollViewReturnNormal:viewNumber];
//
//    
//}
//
-(void)allButtonFontReturnDefault{
    for (int i=0; i<[self.headArray count]; i++) {
        UIButton *tBtn = (UIButton *)[self.view viewWithTag:i+100];
        tBtn.titleLabel.font = defaultFont;
        [tBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }

}
//
//-(void)headScrollViewReturnNormal:(NSInteger )viewNumber{
//    
//    //viewNumber 从0开始
//    if (viewNumber > 1 && self.headScrollView.contentOffset.x<105) {
//        [self.headScrollView setContentOffset:CGPointMake((viewNumber-1)*65, 0) animated:YES];
//    }
//    
//    //viewNumber 从0开始
//    if (viewNumber <= 1 ) {
//        [self.headScrollView setContentOffset:CGPointMake(viewNumber*45, 0) animated:YES];
//    }
//
//
//}

- (void)setDeafalutDetailArray{
    
    news1 = [[NSArray alloc] initWithObjects:
             @{@"关于做好暑假留校住宿学生管理工作的通知":@"http://news.gdut.edu.cn/viewarticle.aspx?articleid=114244"},
             @{@"关于公布2016年大学生创新创业训练计划项目立项名单的通知":@"http://news.gdut.edu.cn/viewarticle.aspx?articleid=114232"},
             @{@"2017届毕业生免费创业培训班报名通知":@"http://news.gdut.edu.cn/viewarticle.aspx?articleid=114111"},
             @{@"2016-2017学年第一学期公选课选课通知":@"http://news.gdut.edu.cn/viewarticle.aspx?articleid=114339"},
             @{@"2015级本科生体育俱乐部选课通知":@"http://news.gdut.edu.cn/viewarticle.aspx?articleid=114104"},
             @{@"2016年研究生毕业典礼暨学位授予仪式安排通知":@"http://news.gdut.edu.cn/viewarticle.aspx?articleid=114160"},
             @{@"关于做好2015年大学生创新创业训练项目中期检查的通知":@"http://news.gdut.edu.cn/viewarticle.aspx?articleid=114244"},
             @{@"关于做好暑假留校住宿学生管理工作的通知":@"http://news.gdut.edu.cn/viewarticle.aspx?articleid=114231"},
             @{@"校行政领导班子任期期满考核大会通知":@"http://news.gdut.edu.cn/viewarticle.aspx?articleid=114187"},
             @{@"关于申请学生创业孵化基金暨创新创业实践项目征集的通知":@"http://news.gdut.edu.cn/viewarticle.aspx?articleid=114165"},nil];
}


@end
