//
//  DetailTableView.m
//  likTwoHelloWorld
//
//  Created by apple on 13-2-5.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "DetailTableView.h"


@implementation DetailTableView

//*******设置文本输入框***********// 

//教师基本信息
@synthesize  teacherNameTextField_;
@synthesize  studentFaucltyTextField_;
@synthesize  teachingClassGroupTextField_;
@synthesize  teacherOntimeTextField_;
//课堂基本信息
@synthesize  lessonClassroomTextField_;
@synthesize  lessonSectionTextField_;
@synthesize  lessonDateTextField_;
//新增的字段 录入时间
@synthesize  writeDownTimeTextField_;
//缺勤信息
@synthesize  planPopulationTextField_;
@synthesize  actualNumTextField_;
@synthesize  truantNumTextField_;
@synthesize  vacateNumTextField_;
@synthesize  lateLeaveEarlyNumTextField_;
//违纪情况
@synthesize  foodEatNumTextField_;
@synthesize  playMobileNumTextField_;
@synthesize  sleepSpeakNumTextField_;
@synthesize  slipperShortsNumTextField_;
//备注
@synthesize  otherSituationTextField_;
@synthesize  otherSituationTextView_;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle: UITableViewStyleGrouped ];
    if (self) {
        // Custom initialization
        self.title = @"督导信息录入";
    }
    return self;
}

//- (void)dealloc
//{
//    //*--------基本信息标签-------------*//
//    //字典
//    [ detailDictionary_ release ];
//    //数组
//    [ detailTitleArray_ release ];
//    //*-----------------------------*//
//    
//    //********设置文本输入框**************//
//    //教师基本信息  
//    [ teacherNameTextField_ release ];
//    [ studentFaucltyTextField_ release ];
//    [ teachingClassGroupTextField_ release ];
//    [ teacherOntimeTextField_ release ];
//    
//    //课堂基本信息   
//    [ lessonClassroomTextField_ release ];
//    [ lessonSectionTextField_ release ];
//    [ lessonDateTextField_ release ];
//    //新增的字段 录入时间
//    [ writeDownTimeTextField_ release ];
//    
//    //缺勤信息 
//    [ planPopulationTextField_ release ];
//    [ actualNumTextField_ release ];
//    [ truantNumTextField_ release ];
//    [ vacateNumTextField_ release ];
//    [ lateLeaveEarlyNumTextField_ release ];
//
//    //违纪情况  
//    [ foodEatNumTextField_ release ];
//    [ playMobileNumTextField_ release ];
//    [ sleepSpeakNumTextField_ release ];
//    [ slipperShortsNumTextField_ release ];
//    
//    //备注  
//    [ otherSituationTextField_ release ];
//    [ otherSituationTextView_ release ];
//    
//    //以字典的形式保存各个输入框
//    [ textDictionary_ release ];
//    //*********************************//
//    
//    [super dealloc];
//}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    //设置背景颜色（必须）
    //    //默认状态下为透明，无法完成触摸
    self.view.backgroundColor = [ UIColor groupTableViewBackgroundColor ];
    //self.view.backgroundColor = [ UIColor blackColor ];
    //    //设置背景图片
   // UIImage* backgroundImage = [ UIImage imageNamed: @"沙滩脚印.png" ];
    //BackGroundImage * backgroundView = [[BackGroundImage alloc]initWithImage:backgroundImage];
    //backgroundView.frame = /*self.view.bounds;*/CGRectMake( 0 , -20 , 320 , 640 );
    //backgroundView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;//| UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin;
    //[self.view setBackgroundView : backgroundView ];

    //*-----------------------------基本信息标签----------------------------------------------*//
    
    //每个group的标题
    detailTitleArray_ = [ [ NSArray alloc ] initWithObjects: @"教师基本信息", @"课堂基本信息" , @"缺勤信息" , @"违纪情况" , @"备注" , nil ];
    //每个group对应的信息点
    //教师基本信息
    NSArray* teacherBaseInformation = [ NSArray arrayWithObjects: @"任课老师" , @"学       院" , @"教学班组成" , @"老师是否按时" , nil ];
    //课堂基本信息
    NSArray* lessonBaseInformation = [ NSArray arrayWithObjects: @"教       室" , @"节       次" , @"上课日期" , @"录入时间" , nil ] ;
//    NSArray* lessonBaseInformation = [ NSArray arrayWithObjects: @"教       室" , @"节       次" , @"上课日期" , nil ] ;
    //缺勤人数
    NSArray* absentInformation = [ NSArray arrayWithObjects: @"应到人数" , @"实到人数" , @"旷课人数" , @"请假人数" , @"迟到早退的人数" , nil ] ;
    //违纪情况
    NSArray* disciplineInformation = [ NSArray arrayWithObjects: @"课堂进食人数" , @"玩手机人数" , @"睡觉讲话人数" , @"穿拖鞋短裤人数" , nil ]; 
    //备注
    NSArray* elseInformation = [ NSArray arrayWithObjects: @"其      他" , nil ];
    //所有信息
    NSArray* allTheInformation = [ NSArray arrayWithObjects: teacherBaseInformation , lessonBaseInformation , absentInformation , disciplineInformation , elseInformation , nil ] ;
    //字典的形式存放所有需要填写的信息
    detailDictionary_ = [ [ NSDictionary alloc ] initWithObjects: allTheInformation forKeys: detailTitleArray_ ];
//    NSLog( @"%@" , detailDictionary_ );
    
    //*----------------------------------------------------------------------------------------*//
    
    //*****************************设置文本输入框********************************************//
    
    //统一大小位置
    CGRect dudaoTextFieldRect = CGRectMake( 150 , 13 , 135 , 35 );
    CGRect dudaoNoteTextFieldRect = CGRectMake(150, 13, 135, 135);
    UIFont* dudaoFont = [ UIFont fontWithName: @"Helvetica" size: 16 ];
    NSString* dudaoTextFieldString = @"请输入人数";
    NSString* dudaoTextFieldNothing = @"";
    //教师基本信息  
    {//任课老师
        teacherNameTextField_ = [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        teacherNameTextField_.borderStyle = UITextBorderStyleRoundedRect;
        teacherNameTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        teacherNameTextField_.font = dudaoFont;
        teacherNameTextField_.text = dudaoTextFieldNothing;
        [ teacherNameTextField_ setEnabled: NO ];
        teacherNameTextField_.delegate = self;
        //学院
        studentFaucltyTextField_ = [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        studentFaucltyTextField_.borderStyle = UITextBorderStyleRoundedRect;
        studentFaucltyTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        studentFaucltyTextField_.font = dudaoFont;
        studentFaucltyTextField_.text = dudaoTextFieldNothing;
        [ studentFaucltyTextField_ setEnabled: NO ];
        studentFaucltyTextField_.delegate = self;
        //教学班组成   
        teachingClassGroupTextField_ = [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        teachingClassGroupTextField_.borderStyle = UITextBorderStyleRoundedRect;
        teachingClassGroupTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        teachingClassGroupTextField_.font = dudaoFont;
        teachingClassGroupTextField_.text = dudaoTextFieldNothing;
        [ teachingClassGroupTextField_ setEnabled: NO ];
        teachingClassGroupTextField_.delegate = self;
        //老师是否按时
        teacherOntimeTextField_ = [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        teacherOntimeTextField_.borderStyle = UITextBorderStyleRoundedRect;
        teacherOntimeTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        teacherOntimeTextField_.font = dudaoFont;
        teacherOntimeTextField_.placeholder = @"1-是 0-否";
        teacherOntimeTextField_.text = dudaoTextFieldNothing;
        teacherOntimeTextField_.delegate = self; 
        
        //数组存放输入框
        teacherBaseInformation = [ NSArray arrayWithObjects: teacherNameTextField_ , studentFaucltyTextField_ , teachingClassGroupTextField_ , teacherOntimeTextField_ , nil ];
    //课堂基本信息    
        //教室  
        lessonClassroomTextField_ = [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        lessonClassroomTextField_.borderStyle = UITextBorderStyleRoundedRect;
        lessonClassroomTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        lessonClassroomTextField_.font = dudaoFont;
        lessonClassroomTextField_.text = dudaoTextFieldNothing;
        [ lessonClassroomTextField_ setEnabled: NO ];
        lessonClassroomTextField_.delegate = self;
        //节次   
        lessonSectionTextField_ = [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        lessonSectionTextField_.borderStyle = UITextBorderStyleRoundedRect;
        lessonSectionTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        lessonSectionTextField_.font = dudaoFont;
        lessonSectionTextField_.text = dudaoTextFieldNothing;
        [ lessonSectionTextField_ setEnabled: NO ];
        lessonSectionTextField_.delegate = self;
        //上课日期    
        lessonDateTextField_ = [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        lessonDateTextField_.borderStyle = UITextBorderStyleRoundedRect;
        lessonDateTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        lessonDateTextField_.font = dudaoFont;
        lessonDateTextField_.text = dudaoTextFieldNothing;
        [ lessonDateTextField_ setEnabled: NO ];
        lessonDateTextField_.delegate = self;    
        //新增的字段 录入时间
        writeDownTimeTextField_ = [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        writeDownTimeTextField_.borderStyle = UITextBorderStyleRoundedRect;
        writeDownTimeTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        writeDownTimeTextField_.font = dudaoFont;
        writeDownTimeTextField_.text = dudaoTextFieldNothing;
        writeDownTimeTextField_.placeholder = @"HH:mm:ss";
        writeDownTimeTextField_.delegate = self; 
        
        //数组存放输入框
        lessonBaseInformation = [ NSArray arrayWithObjects: lessonClassroomTextField_ , lessonSectionTextField_ , lessonDateTextField_ , writeDownTimeTextField_  , nil ];
    
    //缺勤信息  
        //应到人数
        planPopulationTextField_ = [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        planPopulationTextField_.borderStyle = UITextBorderStyleRoundedRect;
        planPopulationTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        planPopulationTextField_.font = dudaoFont;
        planPopulationTextField_.text = dudaoTextFieldNothing;
        [ planPopulationTextField_ setEnabled: NO ];
        planPopulationTextField_.delegate = self;
        //实到人数
        actualNumTextField_= [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        actualNumTextField_.borderStyle = UITextBorderStyleRoundedRect;
        actualNumTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        actualNumTextField_.font = dudaoFont;
        actualNumTextField_.placeholder = dudaoTextFieldString;
        actualNumTextField_.text = dudaoTextFieldNothing;
        actualNumTextField_.delegate = self;
        //旷课人数  
        truantNumTextField_= [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        truantNumTextField_.borderStyle = UITextBorderStyleRoundedRect;
        truantNumTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        truantNumTextField_.font = dudaoFont;
        truantNumTextField_.placeholder = dudaoTextFieldString;
        truantNumTextField_.text = dudaoTextFieldNothing;
        truantNumTextField_.delegate = self;
        //请假人数  
        vacateNumTextField_= [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        vacateNumTextField_.borderStyle = UITextBorderStyleRoundedRect;
        vacateNumTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        vacateNumTextField_.font = dudaoFont;
        vacateNumTextField_.placeholder = dudaoTextFieldString;
        vacateNumTextField_.text = dudaoTextFieldNothing;
        vacateNumTextField_.delegate = self;        
        //迟到早退人数  
        lateLeaveEarlyNumTextField_= [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        lateLeaveEarlyNumTextField_.borderStyle = UITextBorderStyleRoundedRect;
        lateLeaveEarlyNumTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        lateLeaveEarlyNumTextField_.font = dudaoFont;
        lateLeaveEarlyNumTextField_.placeholder = dudaoTextFieldString;
        lateLeaveEarlyNumTextField_.text = dudaoTextFieldNothing;
        lateLeaveEarlyNumTextField_.delegate = self;        
    
        //数组存放输入框
        absentInformation = [ NSArray arrayWithObjects: planPopulationTextField_ , actualNumTextField_ , truantNumTextField_ , vacateNumTextField_ , lateLeaveEarlyNumTextField_ , nil ];
    
    //违纪情况 
        //课堂进食人数  
        foodEatNumTextField_= [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        foodEatNumTextField_.borderStyle = UITextBorderStyleRoundedRect;
        foodEatNumTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        foodEatNumTextField_.font = dudaoFont;
        foodEatNumTextField_.placeholder = dudaoTextFieldString;
        foodEatNumTextField_.text = dudaoTextFieldNothing;
        foodEatNumTextField_.delegate = self; 
        //玩手机人数   
        playMobileNumTextField_= [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        playMobileNumTextField_.borderStyle = UITextBorderStyleRoundedRect;
        playMobileNumTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        playMobileNumTextField_.font = dudaoFont;
        playMobileNumTextField_.placeholder = dudaoTextFieldString;
        playMobileNumTextField_.text = dudaoTextFieldNothing;
        playMobileNumTextField_.delegate = self; 
        //睡觉讲话人数  
        sleepSpeakNumTextField_= [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        sleepSpeakNumTextField_.borderStyle = UITextBorderStyleRoundedRect;
        sleepSpeakNumTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        sleepSpeakNumTextField_.font = dudaoFont;
        sleepSpeakNumTextField_.placeholder = dudaoTextFieldString;
        sleepSpeakNumTextField_.text = dudaoTextFieldNothing;
        sleepSpeakNumTextField_.delegate = self; 
        //穿拖鞋短裤人数
        slipperShortsNumTextField_= [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
        slipperShortsNumTextField_.borderStyle = UITextBorderStyleRoundedRect;
        slipperShortsNumTextField_.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        slipperShortsNumTextField_.font = dudaoFont;
        slipperShortsNumTextField_.placeholder = dudaoTextFieldString;
        slipperShortsNumTextField_.text = dudaoTextFieldNothing;
        slipperShortsNumTextField_.delegate = self; 
    
        //数组存放输入框
        disciplineInformation = [ NSArray arrayWithObjects: foodEatNumTextField_ , playMobileNumTextField_ , sleepSpeakNumTextField_ , slipperShortsNumTextField_ , nil ];
    
    //备注 
//        otherSituationTextField_= [ [ UITextField alloc ] initWithFrame: dudaoTextFieldRect ];
//        otherSituationTextField_.borderStyle = UITextBorderStyleRoundedRect;
//        otherSituationTextField_.font = dudaoFont;
//        otherSituationTextField_.text = dudaoTextFieldNothing;
//        otherSituationTextField_.delegate = self;
        
    
        otherSituationTextView_ = [ [ UITextView alloc ] initWithFrame: dudaoNoteTextFieldRect ];
        otherSituationTextView_.font = dudaoFont;
        otherSituationTextView_.text = dudaoTextFieldNothing;
        otherSituationTextView_.delegate = self;
        otherSituationTextView_.layer.borderColor = [ UIColor grayColor ].CGColor;
        otherSituationTextView_.layer.borderWidth = 1.0;
        otherSituationTextView_.layer.cornerRadius = 5.0;
        //数组存放输入框
        elseInformation = [ NSArray arrayWithObjects: otherSituationTextView_ , nil ];
    
    //以字典的形式保存各个输入框
        //所有信息
        allTheInformation = [ NSArray arrayWithObjects: teacherBaseInformation , lessonBaseInformation , absentInformation , disciplineInformation , elseInformation , nil ] ;
        textDictionary_ = [ [ NSDictionary alloc ] initWithObjects: allTheInformation forKeys: detailTitleArray_ ];
    }
//    NSLog( @"%@" , allTheInformation );
//    NSLog( @"%@" , textDictionary_ );
    //*************************************************************************************//
    
    //=================设置工具条增加三个快速上移、快速移动到中间、快速下移按钮=========================//
    static const NSInteger dudaoBarButtonWidth = 90;
    //工具条按钮
    UIBarButtonItem* topBarButton =  [ [ UIBarButtonItem alloc ]
                                       initWithTitle: @"顶部"
                                       style: UIBarButtonItemStyleBordered
                                       target: self
                                       action: @selector(topButtonDidPush) ] ;
    
    UIBarButtonItem* buttomBarButton = [ [ UIBarButtonItem alloc ]
                                          initWithTitle:@"底部" 
                                          style: UIBarButtonItemStyleBordered 
                                          target: self
                                          action: @selector(buttomBarButtonDidPush ) ];
    
    UIBarButtonItem* middleBarButton = [ [ UIBarButtonItem alloc ]
                                          initWithTitle:@"中间" 
                                          style: UIBarButtonItemStyleBordered 
                                          target: self
                                          action: @selector(middleBarButtonDidPush ) ] ;
    UIBarButtonItem* spaceBarButton1 = [ [ UIBarButtonItem alloc ]
                                          initWithBarButtonSystemItem: UIBarButtonSystemItemFixedSpace
                                          target: nil 
                                          action: nil ] ;
    
    UIBarButtonItem* spaceBarButton2 = [ [ UIBarButtonItem alloc ]
                                          initWithBarButtonSystemItem: UIBarButtonSystemItemFixedSpace
                                          target: nil
                                          action: nil ] ;
    spaceBarButton1.width = 10;
    spaceBarButton2.width = 10;
    topBarButton.width = dudaoBarButtonWidth;
    middleBarButton.width = dudaoBarButtonWidth;
    buttomBarButton.width = dudaoBarButtonWidth;
//    NSArray* buttons = [ NSArray arrayWithObjects: topBarButton , spaceBarButton1 , middleBarButton , spaceBarButton2 , buttomBarButton , nil ] ;
//    [ self setToolbarItems: buttons ];
    [ self setToolbarItems: [ NSArray arrayWithObjects: topBarButton , spaceBarButton1 , middleBarButton , spaceBarButton2 , buttomBarButton , nil ] ];
    
    
    //======================================================================================//
    
}

//=====================设置工具条增加两个快速上移、快速下移按钮==================================//

- (void)topButtonDidPush
{
    //滚动到第一个单元格
    NSIndexPath* indexPath = [ NSIndexPath indexPathForRow: 0  inSection: 0 ];
    [ self.tableView scrollToRowAtIndexPath: indexPath
                           atScrollPosition: UITableViewScrollPositionNone animated: YES ];
}

- (void)middleBarButtonDidPush
{
    //滚动到中间单元
    id key = [ detailTitleArray_ objectAtIndex: (NSInteger)  ( [ detailTitleArray_ count ] - 1  ) / 2 ];
//    NSLog( @"%@" , key );
    NSIndexPath* indexPath = [ NSIndexPath indexPathForRow:  [ [ detailDictionary_ objectForKey: key ] count] - 1 inSection: (NSInteger)  ( [ detailTitleArray_ count ] - 1  ) / 2 ];
    [ self.tableView scrollToRowAtIndexPath: indexPath atScrollPosition: UITableViewScrollPositionNone animated: YES ];
}

- (void)buttomBarButtonDidPush
{
    //滚动到最后一个单元格
//    NSIndexPath* indexPath = [ NSIndexPath indexPathForRow: 0 inSection: 4 ];
    id key = [ detailTitleArray_ objectAtIndex:  [ detailTitleArray_ count ] - 1  ];
    NSIndexPath* indexPath = [ NSIndexPath indexPathForRow: [ [ detailDictionary_ objectForKey: key ] count] - 1 inSection: [ detailTitleArray_ count ] - 1 ];
    [ self.tableView scrollToRowAtIndexPath: indexPath atScrollPosition: UITableViewScrollPositionNone animated: YES ];
}


//======================================================================================//

//点击return是收回键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [ textField resignFirstResponder ];
    return YES;
}

- (void)viewDidUnload
{
    [ self setActualNumTextField_: nil ];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [ self.navigationController setToolbarHidden: NO animated: YES ];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source
//返回段的数目,小标题数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{//取得段数 p289
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    NSLog(@"detailTitleArray_ count=%lu",(unsigned long)[detailTitleArray_ count]);
    return [ detailTitleArray_ count ];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{//取得行数 p289
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    id key = [ detailTitleArray_ objectAtIndex: section ];
    NSLog(@"[ detailDictionary_ objectForKey: key ] count =%lu", [[ detailDictionary_ objectForKey: key ] count] );
    return [ [ detailDictionary_ objectForKey: key ] count ];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{   //取得特定的单元 p289
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    // Configure the cell...
    
    //首先取得单元格的段名,即 取小标题的名字
    id key = [ detailTitleArray_ objectAtIndex: indexPath.section ];
    NSString* text = [ [ detailDictionary_ objectForKey: key ] objectAtIndex: indexPath.row ];
    cell.textLabel.textAlignment =  NSTextAlignmentLeft;
    cell.textLabel.font = [ UIFont fontWithName: @"Helvetica" size: 20 ];
    cell.textLabel.text = text;
    
    [ cell.contentView addSubview: [ [ textDictionary_ objectForKey: key ] objectAtIndex: indexPath.row ] ];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
     NSLog(@"cell =  %@",cell.textLabel.text);
    if([cell.textLabel.text isEqualToString:@"迟到早退的人数"])
    {
        [otherSituationTextView_ removeFromSuperview];
    }
    
    return cell;
   
}

//不同单元设置不同的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{   if(4==indexPath.section)
    {
        return 162.0;
    }
    else
    {
       return 60.0;
    }
}

//返回对应段的段名，即 小标题
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* customView =  [ [ UIView alloc ] initWithFrame: CGRectMake( 10 , 0 , 300 , 45 ) ] ;
    UILabel* headerLabel = [ [ UILabel alloc ] initWithFrame: CGRectZero ] ;
    headerLabel.backgroundColor = [ UIColor clearColor ];
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.textColor = [ UIColor blackColor ];
    headerLabel.font = [ UIFont fontWithName: @"Helvetica" size: 23 ];
    headerLabel.text = [ detailTitleArray_ objectAtIndex: section ];
    headerLabel.frame = CGRectMake( 10 , 0 , 300 , 45 );
    [ customView addSubview: headerLabel ];
    return customView;
}
//设置段的宽度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 45;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
    
    //============触摸cell单元，收起键盘===================================//
    //教师基本信息  
    [ teacherNameTextField_ resignFirstResponder ];
    [ studentFaucltyTextField_ resignFirstResponder ];
    [ teachingClassGroupTextField_ resignFirstResponder ];
    [ teacherOntimeTextField_ resignFirstResponder ];
    
    //课堂基本信息   
    [ lessonClassroomTextField_ resignFirstResponder ];
    [ lessonSectionTextField_ resignFirstResponder ];
    [ lessonDateTextField_ resignFirstResponder ];
    //新增的字段 录入时间
    [ writeDownTimeTextField_ resignFirstResponder ];
    
    //缺勤信息 
    [ planPopulationTextField_ resignFirstResponder ];
    [ actualNumTextField_ resignFirstResponder ];
    [ truantNumTextField_ resignFirstResponder ];
    [ vacateNumTextField_ resignFirstResponder ];
    [ lateLeaveEarlyNumTextField_ resignFirstResponder ];
    
    //违纪情况  
    [ foodEatNumTextField_ resignFirstResponder ];
    [ playMobileNumTextField_ resignFirstResponder ];
    [ sleepSpeakNumTextField_ resignFirstResponder ];
    [ slipperShortsNumTextField_ resignFirstResponder ];
    
    //备注  
//    [ otherSituationTextField_ resignFirstResponder ];
    [ otherSituationTextView_ resignFirstResponder ];
    //================================================================//
    
}

@end
