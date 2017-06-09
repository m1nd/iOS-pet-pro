//
//  HorizontalScroller.h
//  BlueLibrary
//
//  Created by m1nd on 29.01.14.
//  Copyright (c) 2014 m1nd. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalScrollerDelegate;

@interface HorizontalScroller : UIView

@property (weak)id<HorizontalScrollerDelegate> delegate;

- (void)reload;

@end

@protocol HorizontalScrollerDelegate <NSObject>

@required

- (NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller *)scroller;

- (UIView *)horizontalScroller:(HorizontalScroller *)scroller viewAtIndex:(int)index;

- (void)horizontalScroller:(HorizontalScroller *)scroller clickedViewAtIndex:(int)index;



@optional

- (NSInteger)initialViewIndexForHorisontalScroller:(HorizontalScroller *)scroller;

@end
