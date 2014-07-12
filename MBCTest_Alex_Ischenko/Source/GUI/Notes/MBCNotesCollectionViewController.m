//
//  MBCNotesCollectionViewController.m
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCNotesCollectionViewController.h"
#import "MBCNotesFlowLayout.h"
#import "MBCNote.h"
#import "MBCNotesObjectMapper.h"
#import "MBCNoteCell.h"

@interface MBCNotesCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation MBCNotesCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (instancetype)initWithDataSource:(MBCNoteDataSource *)source
{
    self = [super initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    if(self)
    {
        _operationQueue = [NSOperationQueue new];
        _dataSource     = source;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _dataSource.delegate = self;
    [self setupCollectionView];
}

- (void)setupCollectionView
{
    self.collectionView.backgroundColor = [UIColor redColor];
    [self.collectionView registerClass:[MBCNoteCell class] forCellWithReuseIdentifier:[MBCNotesCollectionViewController collectionViewCellIdentifier]];
}

+ (NSString *)collectionViewCellIdentifier
{
    return @"MBCNoteCell";
}

- (void)performFetch
{
    if([_dataSource isConnectedToStorage])
    {
        MBCPersistentOperation *operation = [[_dataSource getFactory] defaultGetNotesOperation];
        [operation setCompletion:^(NSOperation<MBCOperation>* operation)
         {
             [self createFetchedResultsController];
             NSError *fetchingError = nil;
             [_fetchedResultsController performFetch:&fetchingError];
             if(fetchingError == nil)
             {
                 NSLog(@"Fetched");
                 [self.collectionView reloadData];
             }
         }];
        [_operationQueue addOperation:operation];
    }
}

#pragma mark - MBCNoteDataSourceDelegate -

- (void)dataSourceReadyToFetch:(MBCNoteDataSource *)dataSource
{
    [self performFetch];
}

#pragma mark - UICollectionViewDataSource -

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [_fetchedResultsController sections][section];
    NSUInteger numberOfObjects                   = [sectionInfo numberOfObjects];
    return numberOfObjects;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MBCNote *note     = [_fetchedResultsController objectAtIndexPath:indexPath];
    MBCNoteCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:[MBCNotesCollectionViewController collectionViewCellIdentifier]
                                                                       forIndexPath:indexPath];
    cell.textView.text = note.text;
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize) collectionView:(UICollectionView*) collectionView
                   layout:(UICollectionViewLayout*) collectionViewLayout
   sizeForItemAtIndexPath:(NSIndexPath*) indexPath
{
    MBCNote *note = [_fetchedResultsController objectAtIndexPath:indexPath];
    
    return [MBCNoteCellLayout calculateSizeForText:note.text];
}

- (CGFloat)             collectionView: (UICollectionView*) collectionView
                                layout: (UICollectionViewLayout*) collectionViewLayout
   minimumLineSpacingForSectionAtIndex: (NSInteger) section
{
    return 0.0f;
}

- (CGFloat)                 collectionView: (UICollectionView*) collectionView
                                    layout: (UICollectionViewLayout*) collectionViewLayout
  minimumInteritemSpacingForSectionAtIndex: (NSInteger) section
{
    return 0.0f;
}

#pragma mark - NSFetchedResultsController -

- (NSFetchedResultsController *)createFetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    _fetchedResultsController          = [[_dataSource getFactory] defaultFetchedController];
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    
}


@end
