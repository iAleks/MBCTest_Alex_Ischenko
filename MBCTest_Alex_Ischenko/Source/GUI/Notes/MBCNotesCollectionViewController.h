//
//  MBCNotesCollectionViewController.h
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBCNoteDataSource.h"

@interface MBCNotesCollectionViewController : UICollectionViewController<NSFetchedResultsControllerDelegate,MBCNoteDataSourceDelegate>
{
    @protected
    NSOperationQueue           *_operationQueue;
    NSFetchedResultsController *_fetchedResultsController;
    MBCNoteDataSource          *_dataSource;
}

- (instancetype)initWithDataSource:(MBCNoteDataSource *)source;

- (void)setupCollectionView;

+ (NSString *)collectionViewCellIdentifier;

- (NSFetchedResultsController *)createFetchedResultsController;

@end
