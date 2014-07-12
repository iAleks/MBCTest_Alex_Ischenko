//
//  MBCLocalStorage.h
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol MBCLocalStorageDelegate;

@protocol MBCLocalStorage <NSObject>

@property(nonatomic,strong,readonly) NSManagedObjectContext *objectContext;

@property(nonatomic,weak) id<MBCLocalStorageDelegate> delegate;

- (void)setupStorage;

@end

@protocol MBCLocalStorageDelegate <NSObject>

- (void)localStorageDidConnect:(id<MBCLocalStorage>)storage;

@end
