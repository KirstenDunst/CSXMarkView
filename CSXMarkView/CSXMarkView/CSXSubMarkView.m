//
//  CSXSubMarkView.m
//  CSXMarkView
//
//  Created by 曹世鑫 on 2019/6/27.
//  Copyright © 2019 曹世鑫. All rights reserved.
//

#import "CSXSubMarkView.h"

@implementation CSXSubMarkView

- (void)mark_createView {
    UILabel *norLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 20)];
    norLabel.backgroundColor = [UIColor redColor];
    norLabel.text = @"测试一下45678";
    [self addSubview:norLabel];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
