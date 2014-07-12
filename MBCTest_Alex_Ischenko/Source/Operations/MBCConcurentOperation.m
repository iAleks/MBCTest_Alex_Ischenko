//
//  MBCNonConcurentOperation.m
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCConcurentOperation.h"

@implementation MBCConcurentOperation

@synthesize startBlock  = _startBlock;
@synthesize completion  = _completion;
@synthesize cancelBlock = _cancelBlock;
@synthesize error       = _error;

#pragma mark - Initialize methods -

- (instancetype) init
{
    self = [super init];
    
    if (self)
    {
        _isFinished  = NO;
        _isExecuting = NO;
        
        __weak MBCConcurentOperation* operation = self;
        
        self.completionBlock = ^ {
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (operation.isCancelled)
                {
                    if (operation.cancelBlock)
                    {
                        operation.cancelBlock (operation);
                    }
                    else if (operation.completion)
                    {
                        operation.completion (operation);
                    }
                }
                else
                {
                    if (operation.completion)
                    {
                        operation.completion (operation);
                    }
                }
            });
        };
    }
    
    return self;
}


#pragma mark - Inherited methods -

- (void)start
{
    if (self.startBlock)
    {
        dispatch_sync(dispatch_get_main_queue(), ^{
            self.startBlock (self);
        });
    }
    
    // Set Executing to YES
    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];
    
    [self willChangeValueForKey:@"isFinished"];
    _isFinished = NO;
    [self didChangeValueForKey:@"isFinished"];
    
    [self concurentOperationStart];
}

- (BOOL)isConcurrent
{
    return YES;
}

- (BOOL)isFinished
{
    return _isFinished;
}

- (BOOL)isExecuting
{
    return _isExecuting;
}

#pragma mark - Public methods -

- (void)concurentOperationStart
{
    [self concurentOperationCompleted];
}

- (void)concurentOperationCompleted
{
    // Set Executing to YES
    [self willChangeValueForKey: @"isExecuting"];
    _isExecuting = NO;
    [self didChangeValueForKey: @"isExecuting"];
    
    
    // Set Finished to NO
    [self willChangeValueForKey: @"isFinished"];
    _isFinished = YES;
    [self didChangeValueForKey: @"isFinished"];
}

@end
