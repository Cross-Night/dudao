//
//  SearchTable.m
//  督导碎片
//
//  Created by 月砂 on 15/11/20.
//  Copyright (c) 2015年 月砂. All rights reserved.
//

#import "SearchTable.h"

@interface SearchTable ()

@end

@implementation SearchTable{
    UITableView * _tableView;
    UISearchController * searchControl;
    NSMutableArray * searchList;
    NSMutableArray * day;
    NSMutableArray * group;
    MBProgressHUD * Hud;
}
@synthesize data;

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate   = self;
    _tableView.bounces = NO;
    //_tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"dudaoSearchView.jpg"]];
    _tableView.backgroundColor = [UIColor whiteColor];
    self.view = _tableView;
    self.title = @"督导纪录";
    
//    NSLog(@"数据的数量 ＝ %lu",(unsigned long)[data count]);
//    for(int i = 0; i<8 ;i++)NSLog(@"%d-%@",i,[[data objectAtIndex:0] objectAtIndex:i]);
    
    [self groupOfDataArray:data];
    [self addSearchBar];
}

- (void)addSearchBar{
    searchControl = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchControl.searchResultsUpdater = self;//设置代理
    searchControl.dimsBackgroundDuringPresentation = NO;//背景暗化
    //searchControl.hidesNavigationBarDuringPresentation = NO;//是否升高盖过navigationBar
    searchControl.searchBar.frame = CGRectMake(searchControl.searchBar.frame.origin.x, searchControl.searchBar.frame.origin.y, searchControl.searchBar.frame.size.width, 44.0);
    _tableView.tableHeaderView = searchControl.searchBar;
}

#pragma mark - TableViewDataSoures

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellID = @"cell";
    UITableViewCell * cell = [_tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    if(searchControl.active)cell.textLabel.text = [NSString stringWithFormat:@"%@  %@节  %@",[[searchList objectAtIndex: indexPath.row] objectAtIndex:6],[[searchList objectAtIndex: indexPath.row] objectAtIndex:5],[[searchList objectAtIndex: indexPath.row] objectAtIndex:4]];
    else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@  %@节  %@",[[[group objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectAtIndex:6],[[[group objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectAtIndex:5],[[[group objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectAtIndex:4]];
    }
    
    return cell;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(searchControl.active)return @"查询结果";
    return [day objectAtIndex:section];
}

#pragma mark - TableView代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(searchControl.active)return 1;
    else return [day count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(searchControl.active)return [searchList count];
    else return [[group objectAtIndex:section] count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self displayHUD:@"正在加载"];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString * SurveyID;
    if(searchControl.active)SurveyID = [[searchList objectAtIndex:indexPath.row] objectAtIndex:0];
    else SurveyID = [[[group objectAtIndex:indexPath.section] objectAtIndex:indexPath.row] objectAtIndex:0];
    [self sendNetwork:SurveyID];
}

#pragma mark - SearchController代理,搜索功能的具体实现

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString * searchString = searchControl.searchBar.text;//获取当前输入的文本
    if(searchList != nil)[searchList removeAllObjects];
    searchList = [[NSMutableArray alloc] init];
    
    for(int i=0;i<[data count];i++){
        if([[[data objectAtIndex:i] objectAtIndex:4] rangeOfString:searchString].location == NSNotFound)
            if([[[data objectAtIndex:i] objectAtIndex:5] rangeOfString:searchString].location == NSNotFound)
                if([[[data objectAtIndex:i] objectAtIndex:6] rangeOfString:searchString].location == NSNotFound)continue;
        [searchList addObject:[data objectAtIndex:i]];
    }
    
    [_tableView reloadData];
}

#pragma mark - 数据处理

- (void)groupOfDataArray:(NSArray *)dataArray{
    int daycount = 1;
    NSMutableArray * dayArray = [[NSMutableArray alloc] init];
    group = [[NSMutableArray alloc] init];
    NSMutableArray * newdata = [[NSMutableArray alloc] init];
    NSString * day1 = [[dataArray objectAtIndex:0] objectAtIndex:1];
    [dayArray addObject:[[[dataArray objectAtIndex:0] objectAtIndex:1] substringToIndex:10]];
    [newdata addObject:[dataArray objectAtIndex:0]];

    for(int i = 1 ;i<[dataArray count];i++){
        if([day1 compare:[[dataArray objectAtIndex:i] objectAtIndex:1]]==NSOrderedAscending){
            daycount+=1;
            day1 = [[dataArray objectAtIndex:i] objectAtIndex:1];
            [dayArray addObject:[[[dataArray objectAtIndex:i] objectAtIndex:1] substringToIndex:10]];
            [group addObject:newdata];
            newdata = [[NSMutableArray alloc] init];
        }
        [newdata addObject:[dataArray objectAtIndex:i]];
    }
    [group addObject:newdata];
    day = dayArray;
}

#pragma mark - 网络请求

- (void)sendNetwork:(NSString*)SID{
    NSString * stringURL = [NSString stringWithFormat:@"http://eva.gdut.edu.cn:8080/dudao/checkForUpdate/%@",SID];
    //NSString * stringURL = [NSString stringWithFormat:@"http://10.21.71.50:8080/dudao/checkForUpdate/%@",SID];
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:stringURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject){
        [Hud hide:YES];
        //NSLog(@"%@",operation.responseString);
        
        [self displayOtherView:responseObject];
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error){
             [Hud hide:YES];
             NSLog(@"statusCode = %ld",(long)[operation.response statusCode]);//404 not found
             NSLog(@"Error: %@",error);
             [self displayHint:[NSString stringWithFormat:@"StatusCode:%ld",(long)[operation.response statusCode]]];
         }];
}

#pragma mark - 其他一些小提示

- (void)displayHUD:(NSString *)text{
    MBProgressHUD * HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.dimBackground = YES;
    HUD.labelText = text;
    [HUD show:YES];
    Hud = HUD;
}

- (UIAlertView *)displayHint:(NSString*)hintText{
    UIAlertView * Alert = [[UIAlertView alloc] initWithTitle:hintText message:@"请检查网络" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [Alert show];
    return Alert;
}

#pragma mark - 页面跳转

- (void)displayOtherView:(NSDictionary*)dic{
    SearchEdit * SearchEditView = [[SearchEdit alloc] init];
    SearchEditView.data = dic;
    [self.navigationController pushViewController:SearchEditView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
