//
//  SmallToHighLoadingBar.m
//  ImageProgressBar
//
//  Created by martin on 19/03/2013.
//  Copyright (c) 2013 martin magakian. All rights reserved.
//

#import "SmallToHighProgressBar.h"

@implementation SmallToHighProgressBar

-(void) createEmptyFeedAndFullImageResource{
    empty = [[ImageResizer alloc] initWithImage:[UIImage imageNamed:@"avancement_jauge_0.png"] progressType:progressTypeRightToLeft];
    feed = [[ImageResizer alloc] initWithImage:[UIImage imageNamed:@"avancement_jauge_99.png"] progressType:progressTypeLeftToRight];
    full = [[ImageResizer alloc] initWithImage:[UIImage imageNamed:@"avancement_jauge_100.png"] progressType:progressTypeLeftToRight];
}

@end
