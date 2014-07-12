//
//  MBCNoteDataSource.m
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCNoteDataSource.h"

@implementation MBCNoteDataSource

- (instancetype)initWithLocalStorage:(id<MBCLocalStorage>)storage
{
    self = [super init];
    if(self)
    {
        _storage          = storage;
        _storage.delegate = self;
        [_storage setupStorage];
    }
    return self;
}

- (BOOL)isConnectedToStorage
{
    return _isConnected;
}

- (MBCNoteFactory *)getFactory
{
    if(_factory == nil)
    {
        _factory = [[MBCNoteFactory alloc] initWithLocalStorage:_storage];
    }
    return _factory;
}

- (void)localStorageDidConnect:(id<MBCLocalStorage>)storage
{
    _isConnected = YES;
    if([self.delegate respondsToSelector:@selector(dataSourceReadyToFetch:)])
        [self.delegate dataSourceReadyToFetch:self];
}

@end
