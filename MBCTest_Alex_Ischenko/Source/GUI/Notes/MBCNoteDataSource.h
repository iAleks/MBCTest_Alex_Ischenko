//
//  MBCNoteDataSource.h
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBCLocalStorage.h"
#import "MBCNoteFactory.h"

@protocol MBCNoteDataSourceDelegate;

@interface MBCNoteDataSource : NSObject<MBCLocalStorageDelegate>
{
    @protected
    id<MBCLocalStorage> _storage;
    MBCNoteFactory     *_factory;
    BOOL               _isConnected;
}

@property(nonatomic,weak) id<MBCNoteDataSourceDelegate> delegate;

- (instancetype)initWithLocalStorage:(id<MBCLocalStorage>)storage;

- (MBCNoteFactory *)getFactory;

- (BOOL)isConnectedToStorage;

@end

@protocol MBCNoteDataSourceDelegate <NSObject>

- (void)dataSourceReadyToFetch:(MBCNoteDataSource *)dataSource;

@end
