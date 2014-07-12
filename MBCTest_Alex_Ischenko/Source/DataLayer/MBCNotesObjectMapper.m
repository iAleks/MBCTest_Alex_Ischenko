//
//  MBCNotesObjectMapper.m
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCNotesObjectMapper.h"
#import "MBCNote.h"

@implementation MBCNotesObjectMapper

- (NSArray */*NSManagedObject*/)mapObjectsFromArray:(NSArray *)objectsToMap context:(NSManagedObjectContext *)contex
{
    NSMutableArray *arrayOfNotes    = [[NSMutableArray alloc] initWithCapacity:[objectsToMap count]];
    
    [objectsToMap enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *object        = (NSDictionary *)obj;
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"MBCNote" inManagedObjectContext:contex];
        MBCNote *note               = [[MBCNote alloc] initWithEntity:entity insertIntoManagedObjectContext:contex];
        note.noteId                 = [object valueForKey:@"id"];
        NSString *text              = [object valueForKey:@"text"];
        
        if([text isEqual:[NSNull null]])
        {
            text = @"";
        }
        
        note.text                   = text;
        
        [arrayOfNotes addObject:note];
    }];
    
    return arrayOfNotes;
}

@end
