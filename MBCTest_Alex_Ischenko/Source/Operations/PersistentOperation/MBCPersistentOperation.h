//
//  MBCPersistentOperation.h
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCManagedObjectMapper.h"
#import "MBCConcurentOperation.h"

@interface MBCPersistentOperation : MBCConcurentOperation
{
    @protected
    id<MBCManagedObjectMapper> _mapper;
}

@property(nonatomic,strong,readonly) NSManagedObjectContext *persistentManagedObjectContext;

- (id<MBCManagedObjectMapper>)createObjectMapper;

- (NSArray *)getData;

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context;

@end
