//
//  MyView.m
//  CGLayer
//
//  Created by Lucian Boboc on 5/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyView.h"
#define degree2radians(x) ((x * M_PI)/180)

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
     
    [[UIColor yellowColor] setFill];
    CGContextFillRect(context, self.bounds);
    
    CGLayerRef patternLayer = CGLayerCreateWithContext(context, CGSizeMake(20.0, 20.0), NULL);
    CGContextRef patternLayerContext = CGLayerGetContext(patternLayer);
    
    CGContextSetRGBFillColor(patternLayerContext, 1.0, 0.0, 0.0, 1.0);
    CGContextFillRect(patternLayerContext, CGRectMake(5.0, 5.0, 10.0, 10.0));
    
    CGContextSaveGState(context);
    int i;
    int j;

    for(i = 0; i < self.bounds.size.height / 20; i++)
    {
        for(j = 0; j < self.bounds.size.width / 20; j++)
        {
            CGContextDrawLayerAtPoint(context, CGPointZero, patternLayer);
            CGContextTranslateCTM(context, 20, 0);         
        }
        CGContextTranslateCTM(context, -j*20, 20);
    }
    
    CGContextRestoreGState(context);
    CGLayerRelease(patternLayer);
}


@end
