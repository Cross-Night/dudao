//
//  bookingSearchTableViewController.h
//  
//
//  Created by user on 15/11/16.
//
//

#import <UIKit/UIKit.h>
#import "bookingSearchTableViewCell.h"
#import "dudaoViewController.h"
#import "deleteBookingData.h"
#import "MJRefresh.h"

@interface bookingSearchTableViewController : UITableViewController

@property (nonatomic ,retain) NSMutableArray *classArray;
@property (nonatomic ,strong) NSMutableArray *sizeArray;
@property (nonatomic ,strong) NSString *classDNumber;
@property (nonatomic ,strong) NSString *supervisor;
//@property (nonatomic ,strong) UISearchDisplayController *searchDisplayController;
@property (nonatomic ,strong) NSArray *filterData;

@end
