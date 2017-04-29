//
//  bookingSearchTableViewController.m
//  
//
//  Created by user on 15/11/16.
//
//

#import "bookingSearchTableViewController.h"

@interface bookingSearchTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation bookingSearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查询预约";
    self.title = @"查询预约";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadNewData];
    }];
    
    //增加搜索
    /*
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 375, 40)];
    searchBar.placeholder = @"搜索";
    self.tableView.tableHeaderView = searchBar;
    self.searchDisplayController = [[UISearchDisplayController alloc] initWithSearchBar:searchBar contentsController:self];
    self.searchDisplayController.searchResultsDataSource = self;
    self.searchDisplayController.searchResultsDelegate = self;
     */
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self.sizeArray objectAtIndex:0] integerValue];
    
    //增加搜索
    /*
    if(tableView == self.tableView){
        return [[self.sizeArray objectAtIndex:0] integerValue];
    }else{
        // 谓词搜索
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains [cd] %@",self.searchDisplayController.searchBar.text];
        self.filterData =  [[NSArray alloc] initWithArray:[self.classArray filteredArrayUsingPredicate:predicate]];
        return self.filterData.count;
    }
    */
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseID = @"reuseID";
    
    bookingSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if(!cell){
        cell = [[[NSBundle mainBundle] loadNibNamed:@"bookingSearchTableViewCell" owner:nil options:nil] lastObject];
    }
    
    cell.classRoom.text         = [self.classArray objectAtIndex:indexPath.row][6];
    cell.className.text         = [NSString stringWithFormat:@"第%@节课",[self.classArray objectAtIndex:indexPath.row][5]];
    cell.classInstitue.text     = [self.classArray objectAtIndex:indexPath.row][7];
    cell.classWeekAndDay.text   = [self.classArray objectAtIndex:indexPath.row][1];
    cell.classNumber.text       = [NSString stringWithFormat:@"应到人数:%@",[self.classArray objectAtIndex:indexPath.row][8]];

    //增加搜索
    /*
    if (tableView == self.tableView) {
    cell.classRoom.text         = [self.classArray objectAtIndex:indexPath.row][6];
    cell.className.text         = [NSString stringWithFormat:@"第%@节课",[self.classArray objectAtIndex:indexPath.row][5]];
    cell.classInstitue.text     = [self.classArray objectAtIndex:indexPath.row][7];
    cell.classWeekAndDay.text   = [self.classArray objectAtIndex:indexPath.row][1];
    cell.classNumber.text       = [NSString stringWithFormat:@"应到人数:%@",[self.classArray objectAtIndex:indexPath.row][8]];
    }else{
    cell.textLabel.text = self.filterData[indexPath.row];
    }
    */
     
    return cell;
     
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 160;
}


#pragma mark - 向左滑动删除按钮
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        deleteBookingData *dBookingData = [[deleteBookingData alloc] init];
        
        [dBookingData deleteBookingClassWithIndexPath:indexPath Success:^() {
            
            [self loadNewData];
            
        } failure:^() {
            
        }];
    }
        
        
}

//刷新数据
-(void)loadNewData{
    
    bookingClassData *bClassData = [[bookingClassData alloc] init];
    [bClassData getBOokingClassDataWithSuccess:^() {
        
        self.sizeArray = bClassData.sizeArray;
        self.classArray = bClassData.classArray;
        
        NSLog(@"%@\n%@",self.sizeArray,self.classArray);
        
        [self.tableView reloadData];
        
    } failure:^() {
        
        self.sizeArray = nil;
        self.classArray = nil;
        
        [self.tableView reloadData];
        
    }];
    
    [self.tableView.mj_header endRefreshing];
}


@end
