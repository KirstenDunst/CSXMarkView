/*      __.--'\     \.__./     /'--.__
    _.-'       '.__.'    '.__.'       '-._
  .'                曹世鑫                 '.
/                                           \
|    CSDN:https://me.csdn.net/BUG_delete     |
|   GitHub:https://github.com/KirstenDunst   |
\         .---.              .---.          /
  '._    .'     '.''.    .''.'     '.    _.'
     '-./            \  /            \.-'
                      ''*/
//
//  CSXMarkView.h
//  CSXMarkView
//
//  Created by 曹世鑫 on 2019/5/5.
//  Copyright © 2019 曹世鑫. All rights reserved.
//

//做一个像优惠券的打折标签一样的view

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CSXMarkView : UIView

/**
 标签显示样式,是否是垂直的，默认NO:水平显示
 */
@property (nonatomic, assign)BOOL isVertical;

#pragma mark =========底部的大view背景设置

/**
 左右两边的两个缺角中心（虚线）距离（水平距离左边，垂直距离顶部）的距离,默认0
 */
@property (nonatomic, assign)float speDistance;

/**
 中间分隔弧的radius，默认弧度0
 */
@property (nonatomic, assign)float speRadius;

/**
 视图外部的弧度角，默认弧度0
 */
@property (nonatomic, assign)float borderRadius;

/**
 外部阴影的颜色.默认黑色
 */
@property(nullable) CGColorRef shadowColor;

/**
 外部阴影的宽度，默认0
 */
@property (nonatomic, assign)float shadowWidth;

/**
 内部填充色.默认白色
 */
@property(nullable) CGColorRef contentColor;

#pragma mark  ===============分割线设置
/**
 虚线两端距离分隔弧的最小间距，默认0
 */
@property (nonatomic, assign)float imaginaryLineDistance;

/**
 虚线分割线的颜色，默认黑色
 */
@property(nullable) CGColorRef imaginaryLineColor;


/**
 创建子视图，继承组件重写方法
 */
- (void)mark_createView;

@end

NS_ASSUME_NONNULL_END
