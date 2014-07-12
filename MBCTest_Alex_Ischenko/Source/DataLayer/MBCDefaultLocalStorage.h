//
//  MBCDefaultLocalStorage.h
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBCLocalStorage.h"

@interface MBCDefaultLocalStorage : NSObject<MBCLocalStorage>
{
    @protected
    UIManagedDocument *_document;
}

@end
