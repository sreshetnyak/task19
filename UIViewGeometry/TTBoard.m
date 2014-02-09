//
//  TTBoard.m
//  UIViewGeometry
//
//  Created by sergey on 2/9/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTBoard.h"

@interface TTBoard ()

@end

@implementation TTBoard

- (UIView *)initBoardWithSize:(CGRect)rect numberOfCells:(NSUInteger)number {

    if (self = [super init]) {
        
        int width = rect.size.width/number;
        int height = rect.size.height/number;
        for (int i = 0; i < number; i++) {
            
            for (int j = 0; j < number; j++) {
                UIView *view = [[UIView alloc]init];
                
                if ((i % 2) == 0) {
                    
                    if ((j % 2) == 0) {
                        [view setBackgroundColor:[UIColor whiteColor]];
                        [view setTag:1];
                    } else {
                        [view setBackgroundColor:[UIColor blackColor]];
                        [view setTag:2];
                    }
                    
                } else {
                    
                    if ((j % 2) == 0) {
                        [view setBackgroundColor:[UIColor blackColor]];
                        [view setTag:2];
                    } else {
                        [view setBackgroundColor:[UIColor whiteColor]];
                        [view setTag:1];
                    }
                }
                view.frame = CGRectMake(i*width, j*height, width, height);
                [self addSubview:view];
            }
            
        }
        
        self.backgroundColor = [UIColor clearColor];
        self.frame = rect;
        
        self.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    
    return self;
}

- (void)changeColorBoard {
    
    UIInterfaceOrientation orientations = [UIApplication sharedApplication].statusBarOrientation;
    
    if(orientations == 1) {
         [self changeColor:[UIColor blackColor]];
    } else if(orientations == 2) {
        [self changeColor:[UIColor yellowColor]];
    } else if(orientations == 3) {
        [self changeColor:[UIColor redColor]];
    } else if(orientations == 4) {
        [self changeColor:[UIColor greenColor]];
    }
    
}

- (void)changeColor:(UIColor *)color {
    for (UIView *view in [self subviews]) {
        if (view.tag == 2) {
            [UIView animateWithDuration:1.0 animations:^{
                [view setBackgroundColor:color];
            } completion:^(BOOL finished) {
                
            }];
        }
    }
}


@end