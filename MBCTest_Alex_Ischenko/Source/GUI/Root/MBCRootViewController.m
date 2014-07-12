//
//  MBCRootViewController.m
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCRootViewController.h"
#import "MBCNotesCollectionViewController.h"
#import "MBCDefaultLocalStorage.h"
#import "MBCNoteDataSource.h"

@interface MBCRootViewController ()<UINavigationControllerDelegate>
{
    MBCDefaultLocalStorage *_localStorage;
    
}

@end

@implementation MBCRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _localStorage = [[MBCDefaultLocalStorage alloc] init];
    UIViewController *mainVC = [self createMainApplicationController];
    [self setDisplayController:mainVC];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Factory methods -

- (UIViewController *)createMainApplicationController
{
    MBCNoteDataSource *dataSource             = [[MBCNoteDataSource alloc] initWithLocalStorage:_localStorage];
    
    MBCNotesCollectionViewController *notecVC = [[MBCNotesCollectionViewController alloc] initWithDataSource:dataSource];
    UINavigationController *mainAppController = [[UINavigationController alloc] initWithRootViewController:notecVC];
    _mainAppViewController                    = mainAppController;
    
    return _mainAppViewController;
}

#pragma mark - Private methods -

- (void)setDisplayController:(UIViewController*)displayController
{
    [self addChildViewController:displayController];
    
    displayController.view.frame            = self.view.bounds;
    displayController.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:displayController.view];
}


@end
