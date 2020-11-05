//
//  NSString+UENExtension.h
//  TESTDEMO
//
//  Created by 张涛 on 2020/10/27.
//

#import <Foundation/Foundation.h>

@interface NSString (UENExtension)

/*
 * 判断字符串是否为空
 */
+ (BOOL)isBlankString:(NSString *)string;

/*
 * 手续费精准计算
 */
+ (NSString *)UEN_ClientFeeCalculationMethod:(NSString *)amountValue with:(NSString *)rateValue;

@end

