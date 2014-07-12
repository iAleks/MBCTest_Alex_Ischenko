//
//  MBCNoteCell.m
//  MBCTest_Alex_Ischenko
//
//  Created by Alex Ischenko on 7/12/14.
//  Copyright (c) 2014 Alex Ischenko. All rights reserved.
//

#import "MBCNoteCell.h"

@interface MBCNoteCell()<UITextViewDelegate>

@end

@implementation MBCNoteCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _textView                   = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _textView.font              = [UIFont systemFontOfSize:13.0f];
        _textView.backgroundColor   = [UIColor greenColor];
        _textView.editable          = NO;
        _textView.scrollEnabled     = NO;
        _textView.dataDetectorTypes = UIDataDetectorTypeAll;
        _textView.delegate          = self;
        _textView.autoresizingMask  = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_textView];
    }
    return self;
}

- (void)prepareForReuse
{
    self.textView.text = @"";
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange
{
    return YES;
}

@end
