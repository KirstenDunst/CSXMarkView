//
//  FBMarkView.m
//  FSFuBei
//
//  Created by 曹世鑫 on 2019/5/5.
//  Copyright © 2019 曹世鑫. All rights reserved.
//

#import "FBMarkView.h"

#define imaginaryLineWidth 1
//虚线 线的宽度
#define imaginaryLineFullLineWidth 3
//虚线 每条线的间距
#define imaginaryLineSpeWidth 1

@implementation FBMarkView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self defaultAttribute];
    }
    return self;
}

- (void)defaultAttribute {
    self.isVertical = NO;
    self.speDistance = 10;
    self.speRadius = 0;
    self.borderRadius = 0;
    self.shadowColor = [UIColor blackColor].CGColor;
    self.shadowWidth = 0;
    self.imaginaryLineDistance = 0;
    self.imaginaryLineColor = [UIColor blackColor].CGColor;
    self.contentColor = [UIColor whiteColor].CGColor;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    if (self.isVertical) {
        [bezierPath moveToPoint:CGPointMake(self.borderRadius,self.frame.size.height)];
        [bezierPath addLineToPoint:CGPointMake(self.speDistance-self.speRadius,self.frame.size.height)];
        [bezierPath addArcWithCenter:CGPointMake(self.speDistance,self.frame.size.height) radius:self.speRadius startAngle:-M_PI endAngle:0 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(self.frame.size.width-self.borderRadius,self.frame.size.height)];
        [bezierPath addArcWithCenter:CGPointMake(self.frame.size.width-self.borderRadius,self.frame.size.height-self.borderRadius) radius:self.borderRadius startAngle:M_PI_2 endAngle:0 clockwise:NO];
        [bezierPath addLineToPoint:CGPointMake(self.frame.size.width, self.borderRadius)];
        [bezierPath addArcWithCenter:CGPointMake(self.frame.size.width-self.borderRadius, self.borderRadius) radius:self.borderRadius startAngle:0 endAngle:-M_PI_2 clockwise:NO];
        [bezierPath addLineToPoint:CGPointMake(self.speDistance+self.speRadius, 0)];
        [bezierPath addArcWithCenter:CGPointMake(self.speDistance, 0) radius:self.speRadius startAngle:0 endAngle:M_PI clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(self.borderRadius, 0)];
        [bezierPath addArcWithCenter:CGPointMake(self.borderRadius, self.borderRadius) radius:self.borderRadius startAngle:-M_PI_2 endAngle:-M_PI clockwise:NO];
        [bezierPath addLineToPoint:CGPointMake(0,self.frame.size.height-self.borderRadius)];
        [bezierPath addArcWithCenter:CGPointMake(self.borderRadius, self.frame.size.height-self.borderRadius) radius:self.borderRadius startAngle:M_PI endAngle:M_PI_2 clockwise:NO];
    }else {
        [bezierPath moveToPoint:CGPointMake(0,self.borderRadius)];
        [bezierPath addLineToPoint:CGPointMake(0, self.speDistance-self.speRadius)];
        [bezierPath addArcWithCenter:CGPointMake(0, self.speDistance) radius:self.speRadius startAngle:-M_PI_2 endAngle:M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(0, self.frame.size.height-self.borderRadius)];
        [bezierPath addArcWithCenter:CGPointMake(self.borderRadius, self.frame.size.height-self.borderRadius) radius:self.borderRadius startAngle:M_PI endAngle:M_PI_2 clockwise:NO];
        [bezierPath addLineToPoint:CGPointMake(self.frame.size.width-self.borderRadius, self.frame.size.height)];
        [bezierPath addArcWithCenter:CGPointMake(self.frame.size.width-self.borderRadius, self.frame.size.height-self.borderRadius) radius:self.borderRadius startAngle:M_PI_2 endAngle:0 clockwise:NO];
        [bezierPath addLineToPoint:CGPointMake(self.frame.size.width, self.speDistance+self.speRadius)];
        [bezierPath addArcWithCenter:CGPointMake(self.frame.size.width, self.speDistance) radius:self.speRadius startAngle:M_PI_2 endAngle:-M_PI_2 clockwise:YES];
        [bezierPath addLineToPoint:CGPointMake(self.frame.size.width, self.borderRadius)];
        [bezierPath addArcWithCenter:CGPointMake(self.frame.size.width-self.borderRadius, self.borderRadius) radius:self.borderRadius startAngle:0 endAngle:-M_PI_2 clockwise:NO];
        [bezierPath addLineToPoint:CGPointMake(self.borderRadius, 0)];
        [bezierPath addArcWithCenter:CGPointMake(self.borderRadius, self.borderRadius) radius:self.borderRadius startAngle:-M_PI_2 endAngle:-M_PI clockwise:NO];
    }
    [bezierPath closePath];
    
//    [[UIColor cyanColor] setFill];
//    [[UIColor orangeColor] setStroke];
//    bezierPath.lineWidth=1.0;
//    [bezierPath stroke];
//    [bezierPath addClip];
    
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.lineWidth = 1;
    pathLayer.fillColor = self.contentColor; // 默认为blackColor
    pathLayer.path = bezierPath.CGPath;
    pathLayer.shadowColor = self.shadowColor;
    // 阴影偏移，默认(0, -3)
    pathLayer.shadowOffset = CGSizeMake(0,0);
    pathLayer.shadowOpacity = 1;
    // 阴影半径，默认3
    pathLayer.shadowRadius = self.shadowWidth;
    [self.layer addSublayer:pathLayer];
    
    [self drawLineOfDashByCAShapeLayer];
}

- (void)drawLineOfDashByCAShapeLayer {
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    if (self.isVertical) {
        [shapeLayer setBounds:CGRectMake(0, 0, 1+imaginaryLineWidth,self.frame.size.height)];
        [shapeLayer setPosition:CGPointMake(self.speDistance,self.frame.size.height/2)];
    }else {
        [shapeLayer setBounds:CGRectMake(0, 0, self.frame.size.width, 1+imaginaryLineWidth)];
        [shapeLayer setPosition:CGPointMake(self.frame.size.width/2, self.speDistance)];
    }
    [shapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    // 设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:self.imaginaryLineColor];
    // 3.0f设置虚线的宽度
    [shapeLayer setLineWidth:imaginaryLineWidth];
    [shapeLayer setLineJoin:kCALineJoinRound];
    
    [shapeLayer setLineDashPattern: [NSArray arrayWithObjects:[NSNumber numberWithInt:imaginaryLineFullLineWidth],[NSNumber numberWithInt:imaginaryLineSpeWidth],nil]];
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    if (self.isVertical) {
        CGPathMoveToPoint(path, NULL, 0.5, self.borderRadius+self.imaginaryLineDistance);
        CGPathAddLineToPoint(path, NULL, 0.5, self.frame.size.height-self.borderRadius-self.imaginaryLineDistance);
    }else {
        CGPathMoveToPoint(path, NULL, self.borderRadius+self.imaginaryLineDistance, 0.5);
        CGPathAddLineToPoint(path, NULL, self.frame.size.width-self.borderRadius-self.imaginaryLineDistance,0.5);
    }
    [shapeLayer setPath:path];
    CGPathRelease(path);
    
    [self.layer addSublayer:shapeLayer];
}

@end
