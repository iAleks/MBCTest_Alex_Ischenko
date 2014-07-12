//
//  MBCOperation.h
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MBCOperation;

typedef void (^MBCOperationBlock) (NSOperation<MBCOperation>* operation);

@protocol MBCOperation <NSObject>

@property (nonatomic,copy) MBCOperationBlock startBlock;

@property (nonatomic,copy) MBCOperationBlock completion;

@property (nonatomic,copy) MBCOperationBlock cancelBlock;

@property (nonatomic,readonly) NSError* error;

@end
