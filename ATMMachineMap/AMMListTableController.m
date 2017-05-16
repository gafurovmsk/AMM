//
//  ViewController.m
//  ATMMachineMap
//
//  Created by Nik on 11.05.17.
//  Copyright © 2017 Gafurov. All rights reserved.
//

#import "AMMListTableController.h"
@import Masonry;

@interface AMMListTableController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchBar *searchBar;

@end

@implementation AMMListTableController

- (void)viewDidLoad {
  [super viewDidLoad];
 
  self.view.backgroundColor = UIColor.whiteColor;
  self.tableView = [UITableView new];
  self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
  
  [self.searchBar sizeToFit];
  self.searchBar.placeholder = @"Search ATM Machine";
  self.tableView.tableHeaderView = self.searchBar;
  
  //  self.searchBar.delegate = self;
  
  [self.view addSubview: self.tableView];
  
  UIEdgeInsets edges = UIEdgeInsetsMake(20, 0, 0, 0);
  
  [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.edges.equalTo(self.view).with.insets(edges);
  }];
  
  // self.tableView.delegate = self;
  // self.tableView.dataSource = self;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cellId"];
  
  return cell;
  
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 10;
}


@end
