//
//  ViewController.m
//  CSXMarkView
//
//  Created by 曹世鑫 on 2019/5/6.
//  Copyright © 2019 曹世鑫. All rights reserved.
//

#import "ViewController.h"
#import "CSXMarkView.h"
#import "CSXSubMarkView.h"

@interface ViewController ()
@property (nonatomic, strong)CSXSubMarkView *markView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.markView];
    
}

#pragma mark =======lazy
- (CSXSubMarkView *)markView {
    if (!_markView) {
        _markView = [[CSXSubMarkView alloc]initWithFrame:CGRectMake(50, 100, 200, 400)];
        _markView.isVertical = NO;
        _markView.speDistance = 50;
        _markView.speRadius = 10;
        _markView.borderRadius = 5;
        _markView.shadowColor = [UIColor cyanColor].CGColor;
        _markView.shadowWidth = 5;
        _markView.contentColor = [UIColor whiteColor].CGColor;
        _markView.imaginaryLineColor = [UIColor orangeColor].CGColor;
        _markView.imaginaryLineDistance = 10;
    }
    return _markView;
}

@end
