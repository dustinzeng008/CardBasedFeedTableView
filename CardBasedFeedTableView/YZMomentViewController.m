//
//  YZMomentViewController.m
//  CardBasedFeedTableView
//
//  Created by Yong Zeng on 11/14/16.
//  Copyright © 2016 Yong Zeng. All rights reserved.
//

#import "YZMomentViewController.h"
#import "YZStatus.h"
#import "YZStatusFrame.h"
#import "YZStatusTableViewCell.h"

@interface YZMomentViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *statusFrames;
@end

@implementation YZMomentViewController


// lazy load
- (NSArray *)statusFrames{
    if (!_statusFrames) {
        NSArray* statusArray = [YZStatus statusList];
        NSMutableArray* statusFrames = [NSMutableArray array];
        for (YZStatus* status in statusArray) {
            YZStatusFrame* statusFrame = [[YZStatusFrame alloc] init];
            statusFrame.status = status;
            [statusFrames addObject:statusFrame];
        }
        _statusFrames = statusFrames;
    }
    return _statusFrames;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor redColor];
    
    self.title = @"直播";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:_tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.statusFrames.count;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // 1.create reuseable cell
    YZStatusTableViewCell * cell = [YZStatusTableViewCell statusCellWithTableView:tableView];
    // 2. set child component's value
    YZStatusFrame *frame = self.statusFrames[indexPath.row];
    cell.statusFrame = frame;
    
    return cell;
}


#pragma tableview delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    YZStatusFrame *frame = self.statusFrames[indexPath.row];
    return frame.rowHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
