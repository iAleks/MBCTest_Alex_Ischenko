//
//  MBCDefaultLocalStorage.m
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCDefaultLocalStorage.h"

@implementation MBCDefaultLocalStorage

@synthesize delegate;

- (instancetype)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

#pragma mark - MBCLocalStorage -

- (NSManagedObjectContext *)objectContext
{
    return _document.managedObjectContext;
}

- (void)setupStorage
{
    NSURL *databaseURL  = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                  inDomains:NSUserDomainMask]
                           lastObject];
    databaseURL         = [databaseURL URLByAppendingPathComponent:@"MBCDataBase.sqlite"];
    _document           = [[UIManagedDocument alloc] initWithFileURL:databaseURL];
    
    if(![[NSFileManager defaultManager] fileExistsAtPath:_document.fileURL.path])
    {
        [_document saveToURL:_document.fileURL
                      forSaveOperation:UIDocumentSaveForCreating
                     completionHandler:^(BOOL success) {
                         
                         if([self.delegate respondsToSelector:@selector(localStorageDidConnect:)])
                             [self.delegate localStorageDidConnect:self];
                         
                     }];
    }
    else if (_document.documentState == UIDocumentStateClosed)
    {
        [_document openWithCompletionHandler:^(BOOL success) {
            
            if(success)
            {
                if([self.delegate respondsToSelector:@selector(localStorageDidConnect:)])
                    [self.delegate localStorageDidConnect:self];
            }
            
        }];
    }
}

@end
