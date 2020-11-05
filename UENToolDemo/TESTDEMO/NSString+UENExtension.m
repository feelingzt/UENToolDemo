//
//  NSString+UENExtension.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/10/27.
//

#import "NSString+UENExtension.h"

@implementation NSString (UENExtension)


#pragma mark - 判断字符串是否为空
+ (BOOL)isBlankString:(NSString *)string
{
    if (![string isKindOfClass:[NSString class]]) {
        return YES;
    }
    
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    
    if ([string isEqualToString:@"<null>"]) {
        return YES;
    }

    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    
    return NO;
}

#pragma mark - 手续费精准计算
+ (NSString *)UEN_ClientFeeCalculationMethod:(NSString *)amountValue with:(NSString *)rateValue{
    rateValue = [NSString stringWithFormat:@"%@%%",rateValue];
    NSDecimalNumber *rateValueNumber = [NSDecimalNumber decimalNumberWithString:rateValue];
    NSDecimalNumber *oneHundredValueNumber = [NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%d", 100]];
    NSDecimalNumber *division = [rateValueNumber decimalNumberByDividingBy:oneHundredValueNumber];
    NSDecimalNumber *amountValueNumber = [NSDecimalNumber decimalNumberWithString:amountValue];
    NSDecimalNumber *product = [amountValueNumber decimalNumberByMultiplyingBy:division];
    NSLog(@"%@", [product stringValue]);
    
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundUp
                                                                                                      scale:2
                                                                                           raiseOnExactness:NO
                                                                                            raiseOnOverflow:NO
                                                                                           raiseOnUnderflow:NO
                                                                                        raiseOnDivideByZero:NO];
    NSString *tempStr =[[product decimalNumberByRoundingAccordingToBehavior:roundingBehavior] stringValue];
    NSLog(@"%@",tempStr);
    
    return tempStr;
}


@end
