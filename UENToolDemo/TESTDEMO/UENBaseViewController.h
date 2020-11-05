//
//  UENBaseViewController.h
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/5.
//

#import <UIKit/UIKit.h>

@interface UENBaseViewController : UIViewController


/*
 * 获取状态栏的高度+导航栏的高度
 * 带刘海屏幕返回44+44
 * 非刘海屏幕返回20+44
 */
- (CGFloat)getStatusRectAndNavRect;

/*
 * 获取底部TabBar的高度
 * 所有机型的TabBar高度都为49pt;
 * 包含HomeIndicator, TabBar高度增长为83pt;
 * 注意: 横屏时HomeIndicator的高度为21pt;
 */
- (CGFloat)getBottomTabBarHeightRect;

@end

