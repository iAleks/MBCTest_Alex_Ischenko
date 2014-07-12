//
//  MBCNonConcurentOperation.h
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBCOperation.h"

@interface MBCConcurentOperation : NSOperation<MBCOperation>
{
@protected
    MBCOperationBlock _startBlock;
    MBCOperationBlock _completion;
    MBCOperationBlock _cancelBlock;
    NSError* _error;
    
    BOOL _isFinished;
    BOOL _isExecuting;
}

/* Override point. Use this method instead 'start' */
- (void)concurentOperationStart;

/* Invoke this method once async actions completed' */
- (void)concurentOperationCompleted;

@end
