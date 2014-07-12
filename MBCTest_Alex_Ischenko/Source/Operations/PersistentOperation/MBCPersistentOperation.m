//
//  MBCPersistentOperation.m
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCPersistentOperation.h"

@implementation MBCPersistentOperation

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)context
{
    self = [super init];
    if(self)
    {
        _persistentManagedObjectContext = context;
    }
    return self;
}

- (void)concurentOperationStart
{
    
    _mapper        = [self createObjectMapper];
    NSArray *notes = [self getData];
    
    NSManagedObjectContext *childContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    childContext.parentContext           = self.persistentManagedObjectContext;
    
    NSArray *mappedObjects = [_mapper mapObjectsFromArray:notes context:childContext];
    
    [childContext performBlock:^{
        for(NSManagedObject *object in mappedObjects)
        {
            [childContext insertObject:object];
        }
        NSError *savingError = nil;
        [childContext save:&savingError];
        if(savingError)
            NSLog(@"Error occured while saving:%@",savingError.description);
        else
            NSLog(@"OK");
        
        [self concurentOperationCompleted];
    }];
    
}

- (id<MBCManagedObjectMapper>)createObjectMapper
{
    return nil;
}

- (NSArray *)getData
{
    return nil;
}

@end
