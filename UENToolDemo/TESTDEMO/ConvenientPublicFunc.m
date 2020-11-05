//
//  ConvenientPublicFunc.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/10/28.
//

#import "ConvenientPublicFunc.h"

@implementation ConvenientPublicFunc



/*
 * UIView转成UIImage
 * @param  tempView  传入的view
 */

- (UIImage*)convertViewToImage:(UIView *)tempView{
    CGSize viewSize = tempView.bounds.size;
    
    // 转换后的UIImage显示后会变模糊;
    // UIGraphicsBeginImageContext(viewSize);
    
    /*
     * 上面的方法适用于iPhone4之前的机型;
     * 因为iPhone4后由于采用了Retain高清屏, 在转换时需要根据屏幕密度做个处理;
     * tempView.layer.contentsScale是1.0
     * [UIScreen mainScreen].scale是2.0
     */
    
    // UIGraphicsBeginImageContextWithOptions(viewSize, NO, tempView.layer.contentsScale);
    UIGraphicsBeginImageContextWithOptions(viewSize, NO, [UIScreen mainScreen].scale);
    
    [tempView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}




/*
 * Image图片中间加Logo图片效果
 * @param  originalImage  原图片
 * @param  logoImage      logo图片
 * @param  logoImageSize  logo图片尺寸
 * @return 返回加上Logo的图片
 */
+ (UIImage*)addImageLogo:(UIImage*)originalImage
         centerlogoImage:(UIImage*)logoImage
           logoImageSize:(CGSize)logoImageSize
{
   
    /*
     * fix: 模糊和失真的问题
     * 第一个参数表示区域大小;
     * 第二个参数表示是否是非透明的;
     > 如果需要显示半透明效果，需要传NO，否则传YES;
     * 第三个参数表示屏幕密度;
     */
    UIGraphicsBeginImageContextWithOptions(originalImage.size, NO, [UIScreen mainScreen].scale);
    
    
    [originalImage drawInRect:CGRectMake(0, 0, originalImage.size.width, originalImage.size.height)];
    
    UIImage * backImage = [UIImage imageNamed:@"scanWhite"];//添加logo图片的背景图
    CGFloat backX = originalImage.size.width/2 - logoImageSize.width/2-5;
    CGFloat backY = originalImage.size.height/2-logoImageSize.height/2-5;
    CGRect backRect = CGRectMake(backX, backY, logoImageSize.width+10, logoImageSize.height+10);
    [backImage drawInRect:backRect];
    
    CGFloat logoX = originalImage.size.width/2 - logoImageSize.width/2;
    CGFloat logoY = originalImage.size.height/2 - logoImageSize.height/2;
    CGRect logoRect = CGRectMake(logoX, logoY, logoImageSize.width, logoImageSize.height);
    [logoImage drawInRect:logoRect];
    
    
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resultingImage;
}


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
{
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:titleStr
                                                                   message:messageStr
                                                            preferredStyle:UIAlertControllerStyleAlert];
    if (leftTextStr.length != 0) {
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:leftTextStr
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action){
            !leftClickBlock ? : leftClickBlock();
        }];
        [alter addAction:okAction];
    }
    if (rightTextStr.length != 0) {
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:rightTextStr
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction *action){
            !rightClickBlock ? : rightClickBlock();
        }];
        [alter addAction:okAction];
    }
    [currentVc presentViewController:alter animated:YES completion:nil];
}


@end
