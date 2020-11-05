//
//  ConvenientPublicFunc.h
//  TESTDEMO
//
//  Created by 张涛 on 2020/10/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ConvenientPublicFunc : NSObject

/*
 * UIView转成UIImage
 * @param  tempView  传入的view
 */

- (UIImage *)convertViewToImage:(UIView *)tempView;


/*
 * Image图片中间加Logo图片效果
 * @param  originalImage  原图片
 * @param  logoImage      logo图片
 * @param  logoImageSize  logo图片尺寸
 * @return 返回加上Logo的图片
 */
+ (UIImage *)addImageLogo:(UIImage*)originalImage
         centerlogoImage:(UIImage*)logoImage
           logoImageSize:(CGSize)logoImageSize;


/*
 * 展示弹框(UIAlertController)
 * @param currentVc  当前控制器
 * @param titleStr   提示标题
 * @param messageStr 提示内容
 * @param leftTextStr     左边按钮文字
 * @param leftClickBlock  左边按钮回调
 * @param rightTextStr    右边按钮文字
 * @param rightClickBlock 右边按钮回调
 */
+ (void)showAlterViewWithVC:(UIViewController *)currentVc
              WithReadTitle:(NSString *)titleStr
            WithReadMessage:(NSString *)messageStr
               WithLeftText:(NSString *)leftTextStr
                  LeftBlock:(dispatch_block_t)leftClickBlock
              WithRightText:(NSString *)rightTextStr
                RightBliock:(dispatch_block_t)rightClickBlock;

@end

