//
//  RootViewController.m
//  头部筛选
//
//  Created by mac on 17/2/15.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "RootViewController.h"
#import "SPullDownMenuView.h"
#import "SecondViewController.h"


@interface RootViewController ()<SPullDownMenuViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) SPullDownMenuView *menu;

@property (nonatomic, strong) NSIndexPath *index;

@property (nonatomic, strong) NSArray *titleA;//文字的数组

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    [self createUI];

}
#pragma mark <布局>
- (void)createUI {
    self.titleA = @[@[@"综合排序", @"价格从高到低", @"价格从低到高", @"人气排序"], @[@"销量优先"], @[@"选择"]];
    self.menu = [[SPullDownMenuView alloc] initWithFrame:CGRectMake(0, 30 + 34, SScreen_Width, 30) withTitle:self.titleA withSelectColor:MColor(241, 125, 174)];
    _menu.delegate = self;
    [self.view addSubview:self.menu];
    
    //UITableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60 + 34, _menu.frame.size.width, SScreen_Height - 60 - 34) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}
#pragma mark <UITableViewDataSource>
//每个分区返回的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}
//返回cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [[self.titleA objectAtIndex:self.index.row] objectAtIndex:self.index.section];
    
    return cell;
}
#pragma mark <SPullDownMenuViewDelegate>
- (void)pullDownMenuView:(SPullDownMenuView *)menu didSelectedIndex:(NSIndexPath *)indexPath {
    
    NSIndexPath *indexP = [indexPath indexPathByAddingIndex:2];
    NSLog(@"%@", indexPath);
    NSLog(@"postion:%lu", [indexPath indexAtPosition:1]);
    
    if ([indexP indexAtPosition:1] == 2) {
        NSLog(@"您点击了选择按钮");
        SecondViewController *vc = [[SecondViewController alloc] init];
        [self.navigationController pushViewController:vc animated:NO];
    } else {
        NSLog(@"%@", indexPath);
        self.index = indexPath;
        [self.tableView reloadData];
    }
    
}


@end
