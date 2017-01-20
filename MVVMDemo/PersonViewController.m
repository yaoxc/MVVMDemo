//
//  PersonViewController.m
//  MVVMDemo
//
//  Created by buoumall on 2017/1/20.
//  Copyright © 2017年 buoumall. All rights reserved.
//

#import "PersonViewController.h"
#import "Person.h"
#import "PersonViewModel.h"

@interface PersonViewController ()<UIScrollViewDelegate>
{
    NSArray *colors;
}

//@property (nonatomic, strong) Person *model;

@property (nonatomic, strong) PersonViewModel *viewModel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *birthdateLabel;
@property (nonatomic, assign) CGPoint preOffset;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    colors=@[[UIColor redColor],[UIColor blueColor],[UIColor orangeColor],[UIColor grayColor],[UIColor greenColor],[UIColor darkGrayColor],[UIColor orangeColor],[UIColor grayColor],[UIColor greenColor],[UIColor darkGrayColor]];
    
//    
//    if (self.model.salutation.length > 0) {
//        self.nameLabel.text = [NSString stringWithFormat:@"%@ %@ %@", self.model.salutation, self.model.firstName, self.model.lastName];
//    } else {
//        self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", self.model.firstName, self.model.lastName];
//    }
//    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"EEEE MMMM d, yyyy"];
//    self.birthdateLabel.text = [dateFormatter stringFromDate:self.model.birthdate];
    
    /*
     MVVM 相比 MVC 到底有哪些好处呢？我想，主要可以归纳为以下三点：
     
     由于展示逻辑被抽取到了 viewModel 中，所以 view 中的代码将会变得非常轻量级；
     由于 viewModel 中的代码是与 UI 无关的，所以它具有良好的可测试性；
     对于一个封装了大量业务逻辑的 model 来说，改变它可能会比较困难，并且存在一定的风险。在这种场景下，viewModel 可以作为 model 的适配器使用，从而避免对 model 进行较大的改动
     */
    self.nameLabel.text = self.viewModel.nameText;
    self.birthdateLabel.text = self.viewModel.birthdateText;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    [cell setBackgroundColor:colors[indexPath.row]];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGPoint offset = scrollView.contentOffset;
    CGFloat delta = offset.y - self.preOffset.y;
    self.preOffset = offset;
    
    CGRect rect = self.navigationController.navigationBar.frame;
    rect.origin.y += delta;
    self.navigationController.navigationBar.frame = rect;
    NSLog(@"%f --- %f",delta,rect.origin.y);
}

@end
