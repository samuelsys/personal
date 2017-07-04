//
//  AnimationView.m
//  FourViewsV2
//
//  Created by Samuel Furtado e Silva on 30/06/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "AnimationView.h"

static float const kDurationVerticalDirections = 3.0f;
static float const kDurationHorizontalDirections = 1.5f;
static float const kDurationTotal = 6.0f;
static float const kDurationWait = 0.1f;
static float const kDoubleOperator = 2;
static NSInteger const kStartHeightPosition = 15;
static NSInteger const kLabelWidth = 57;
static NSInteger const kLabelHeight = 21;
static NSString *const kDirectionLabelHorizontal = @"transform.translation.x";
static NSString *const kDirectionLabelVertical = @"transform.translation.y";
static NSString *const kKeyPathLabel = @"move";

@interface AnimationView ()

@property (weak, nonatomic) IBOutlet UILabel *button1;

@property  (nonatomic) NSInteger currentX;
@property  (nonatomic) NSInteger currentY;

@end

@implementation AnimationView

typedef void(^AnimationBlock) ();

typedef NS_ENUM (NSInteger, CMDirection){
    CMDirectonHorizontal = 0,
    CMDirectionVertical
};

-(void)configureViews{
    [self startAnimations];
}

-(void)startAnimations {
    
    NSInteger toWidth = CGRectGetWidth(self.frame);
    NSInteger toHeight = CGRectGetHeight(self.frame);
    
    self.currentX = toWidth - kLabelWidth;
    self.currentY = kStartHeightPosition;
    
    [self moveLabel:self.button1 from:0 to:toWidth - kLabelWidth direction:CMDirectonHorizontal duration:kDurationHorizontalDirections completion:^{
        
        self.currentX = toWidth - kLabelWidth;
        self.currentY = toHeight - kLabelHeight;
        
        [self moveLabel:self.button1 from:kStartHeightPosition to:toHeight - kLabelHeight * kDoubleOperator direction:CMDirectionVertical duration:kDurationVerticalDirections completion:^{
            self.currentX = 0;
            self.currentY = toHeight - kLabelHeight;
            
            [self moveLabel:self.button1 from:0 to:-(toWidth - kLabelWidth) direction:CMDirectonHorizontal duration:kDurationHorizontalDirections completion:^{
            
                self.currentX = 0;
                self.currentY = kStartHeightPosition;
                    
                [self moveLabel:self.button1 from:-kLabelHeight to:-(toHeight - kStartHeightPosition * kDoubleOperator) direction:CMDirectionVertical duration:kDurationVerticalDirections completion:^{
                        
                }];
            }];
        }];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kDurationTotal * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startAnimations];
    });
}

-(void)moveLabel:(UILabel *)label from:(NSInteger)from to:(NSInteger)to direction:(NSInteger)direction duration:(float)duration completion:(AnimationBlock)completion {
    
    NSString *directionSelected = kDirectionLabelVertical;
    
    if (direction == CMDirectonHorizontal){
        directionSelected = kDirectionLabelHorizontal;
    }
    
    CABasicAnimation *translateAnim = [CABasicAnimation animationWithKeyPath:directionSelected];
    translateAnim.duration = duration;
    translateAnim.fromValue = [NSNumber numberWithFloat:from];
    translateAnim.toValue = [NSNumber numberWithFloat:to];
    
    [label.layer addAnimation:translateAnim forKey:kKeyPathLabel];
    
    [CATransaction setCompletionBlock:^{
        [NSThread sleepForTimeInterval: duration-kDurationWait];
         CGRect newPosition = CGRectMake(self.currentX , self.currentY, kLabelWidth, kLabelHeight);
         label.frame = newPosition;

         return completion();
        
    }];
}

@end
