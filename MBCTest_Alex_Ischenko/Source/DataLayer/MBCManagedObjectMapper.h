//
//  MBCManagedObjectMapper.h
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol MBCManagedObjectMapper <NSObject>

- (NSArray */*NSManagedObject*/)mapObjectsFromArray:(NSArray *)objectsToMap context:(NSManagedObjectContext *)contex;

@end
