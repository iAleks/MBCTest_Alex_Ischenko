//
//  MBCNoteCellLayout.m
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCNoteCellLayout.h"

@implementation MBCNoteCellLayout

+ (CGSize)calculateSizeForText:(NSString *)text
{
    CGSize sizeConstrains = { 320.0f, CGFLOAT_MAX };
    CGSize textSize       = [text sizeWithFont:[UIFont systemFontOfSize:13.0f] constrainedToSize:sizeConstrains];
    return CGSizeMake(320, textSize.height + 20);
}

@end
