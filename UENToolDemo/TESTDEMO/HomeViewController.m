//
//  HomeViewController.m
//  TESTDEMO
//
//  Created by 张涛 on 2020/11/5.
//

#import "HomeViewController.h"
#import "NSString+UENExtension.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", [NSString UEN_ClientFeeCalculationMethod:@"98" with:@"10"]);
}

@end
