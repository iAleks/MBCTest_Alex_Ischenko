//
//  MBCNoteFactory.h
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MBCPersistentFactory.h"
#import "MBCGetNotesOperation.h"

@interface MBCNoteFactory : NSObject<MBCPersistentFactory>
{
    @protected
    NSManagedObjectContext *_managedObjectContext;
}

- (NSFetchRequest *)defaultRequest;

- (NSFetchedResultsController *)defaultFetchedController;

- (MBCPersistentOperation *)defaultGetNotesOperation;

@end
