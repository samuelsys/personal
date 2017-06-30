//
//  MainView.m
//  FourViewsV2
//
//  Created by Samuel Furtado e Silva on 30/06/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "MainView.h"

static CGFloat const kGeneralComponentsWidthPercentage = 42.5;
static CGFloat const kBigComponentPercentage = 38;
static CGFloat const kSmallComponentPercentage = 24;
static CGFloat const kBlankSpacesPercentage = 5;
static CGFloat const kBottomAndTopPercentage = 17;
static CGFloat const kMarginRepeats = 2;

@interface MainView ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

@implementation MainView

#pragma Public Methods

- (void)setupScreenCoordinates {
    
    NSInteger widthAllRects = [self calculeWidthForComponent:self.containerView percentage:kGeneralComponentsWidthPercentage];
    NSInteger heightSmallRects = [self calculeExactHeightForComponent:self.containerView componentSize:kSmallComponentPercentage];
    NSInteger heightBigRects = [self calculeExactHeightForComponent:self.containerView componentSize:kBigComponentPercentage];
    NSInteger spaceForMargins = [self calculeWidthForComponent:self.containerView percentage:kBlankSpacesPercentage];
    NSInteger spaceForBottomAndTop = [self calculeExactTopAndBottomSpaces:self.containerView];
    
    CGRect rect1 = CGRectMake(spaceForMargins, spaceForBottomAndTop, widthAllRects, heightBigRects );
    CGRect rect2 = CGRectMake(widthAllRects + spaceForMargins * kMarginRepeats, spaceForBottomAndTop, widthAllRects, heightSmallRects);
    CGRect rect3 = CGRectMake(spaceForMargins, heightBigRects + spaceForMargins + spaceForBottomAndTop, widthAllRects, heightSmallRects);
    CGRect rect4 = CGRectMake(widthAllRects + spaceForMargins * kMarginRepeats, heightSmallRects + spaceForMargins + spaceForBottomAndTop, widthAllRects, heightBigRects);
    
    [self createView:rect1 viewToAdd:self.containerView color:[UIColor brownColor]];
    [self createView:rect2 viewToAdd:self.containerView color:[UIColor brownColor]];
    [self createView:rect3 viewToAdd:self.containerView color:[UIColor brownColor]];
    [self createView:rect4 viewToAdd:self.containerView color:[UIColor brownColor]];
}

#pragma Private Methods

- (NSInteger)calculeExactHeightForComponent:(UIView*)view componentSize:(CGFloat)componentSize {
    NSInteger viewHeight = CGRectGetHeight(view.frame);
    NSInteger percentage = kSmallComponentPercentage;
    if (componentSize == kBigComponentPercentage){
        percentage = kBigComponentPercentage;
    }
    return (viewHeight * percentage) / 100;
    
}

- (NSInteger)calculeExactTopAndBottomSpaces:(UIView *)view {
    NSInteger viewHeight = CGRectGetHeight(view.frame);
    return (viewHeight * kBottomAndTopPercentage) / 100;
}

- (NSInteger)calculeWidthForComponent:(UIView *)view percentage:(CGFloat)percentage {
    NSInteger viewWidth = CGRectGetWidth(view.frame);
    return (viewWidth * percentage) / 100;
}

- (UIView *)createView:(CGRect)rect viewToAdd:(UIView *)viewToAdd color:(UIColor *) color {
    UIView *newView = [[UIView alloc] initWithFrame:rect];
    newView.backgroundColor = color;
    if (viewToAdd){
        [viewToAdd addSubview:newView];
    }
    return newView;
}

@end
