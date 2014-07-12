//
//  MBCNoteFactory.m
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCNoteFactory.h"

@implementation MBCNoteFactory

- (instancetype)initWithLocalStorage:(id<MBCLocalStorage>)storage
{
    self = [super init];
    if(self)
    {
        _managedObjectContext = [storage objectContext];
    }
    return self;
}

- (NSFetchRequest *)defaultRequest
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity  = [NSEntityDescription entityForName:@"MBCNote" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"noteId" ascending:NO];
    NSArray *sortDescriptors         = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    return fetchRequest;
}

- (NSFetchedResultsController *)defaultFetchedController
{
    NSFetchedResultsController *fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:[self defaultRequest]
                                                                                               managedObjectContext:_managedObjectContext
                                                                                                 sectionNameKeyPath:nil cacheName:@"Master"];
    return fetchedResultsController;
}

- (MBCGetNotesOperation *)defaultGetNotesOperation
{
    return [[MBCGetNotesOperation alloc] initWithManagedObjectContext:_managedObjectContext];
}

@end
