//
//  DiscoveryViewController.h
//  ClassBoxForCityDLUT
//
//  Created by 胡啸晨 on 15/4/13.
//  Copyright (c) 2015年 com.DavidHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoveryViewController : UIViewController

@property (nonatomic, strong)NSString *stuName;

- (IBAction)unwindToLogin:(UIStoryboardSegue *)segue;

@end