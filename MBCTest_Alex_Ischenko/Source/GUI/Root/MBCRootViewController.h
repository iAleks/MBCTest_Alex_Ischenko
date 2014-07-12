//
//  MBCRootViewController.h
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MBCRootViewController : UIViewController

@property(nonatomic,strong,readonly) UIViewController* mainAppViewController;

- (UIViewController *)createMainApplicationController;

@end
