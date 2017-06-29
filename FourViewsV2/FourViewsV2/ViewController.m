//
//  ViewController.m
//  FourViews
//
//  Created by Samuel Furtado e Silva on 27/06/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "ViewController.h"

static CGFloat const kGeneralComponentsWidthPercentage = 42.5;
static CGFloat const kBigComponentPercentage = 38;
static CGFloat const kSmallComponentPercentage = 24;
static CGFloat const kBlankSpacesPercentage = 5;
static CGFloat const kBottomAndTopPercentage = 17;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic) NSInteger MarginLeftRect1;
@property (nonatomic) NSInteger MarginTopRect1;
@property (nonatomic) NSInteger WidthRect1;
@property (nonatomic) NSInteger HeightRect1;

@property (nonatomic) NSInteger MarginLeftRect2;
@property (nonatomic) NSInteger MarginTopRect2;
@property (nonatomic) NSInteger WidthRect2;
@property (nonatomic) NSInteger HeightRect2;

@property (nonatomic) NSInteger MarginLeftRect3;
@property (nonatomic) NSInteger MarginTopRect3;
@property (nonatomic) NSInteger WidthRect3;
@property (nonatomic) NSInteger HeightRect3;

@property (nonatomic) NSInteger MarginLeftRect4;
@property (nonatomic) NSInteger MarginTopRect4;
@property (nonatomic) NSInteger WidthRect4;
@property (nonatomic) NSInteger HeightRect4;

@end

@implementation ViewController

- (void)setupScreenCoordinates {
    
    NSInteger widthAllRects = [self calculeExactWidthForComponent:self.containerView];
    
    NSInteger heightSmallRects = [self calculeExactHeightForComponent:self.containerView componentSize:kSmallComponentPercentage];
    
    NSInteger heightBigRects = [self calculeExactHeightForComponent:self.containerView componentSize:kBigComponentPercentage];
    
    NSInteger spaceForMargins = [self calculeExactWidthForBlankSpaces:self.containerView];
    
    NSInteger spaceForBottomAndTop = [self calculeExactTopAndBottomSpaces:self.containerView];
    
    self.WidthRect1 = widthAllRects;
    self.HeightRect1 = heightBigRects;
    self.MarginLeftRect1 = spaceForMargins;
    self.MarginTopRect1 = spaceForBottomAndTop;
    
    self.MarginLeftRect2 = widthAllRects + spaceForMargins * 2;
    self.MarginTopRect2 = spaceForBottomAndTop;
    self.WidthRect2 = widthAllRects;
    self.HeightRect2 = heightSmallRects;
    
    self.MarginLeftRect3 = spaceForMargins;
    self.MarginTopRect3 = heightBigRects + spaceForMargins + spaceForBottomAndTop;
    self.WidthRect3 = widthAllRects;
    self.HeightRect3 = heightSmallRects;
    
    self.MarginLeftRect4 = widthAllRects + spaceForMargins * 2;
    self.MarginTopRect4 = heightSmallRects + spaceForMargins + spaceForBottomAndTop;
    self.WidthRect4 = widthAllRects;
    self.HeightRect4 = heightBigRects;
    
    [self createSubViews];
    
}

- (NSInteger)calculeExactHeightForComponent:(UIView*)view componentSize:(CGFloat)componentSize {
    NSInteger viewHeight = CGRectGetHeight(view.frame);
    NSInteger percentage = kSmallComponentPercentage;
    if (componentSize == kBigComponentPercentage){
        percentage = kBigComponentPercentage;
    }
    return (viewHeight * percentage) / 100;
    
}

- (NSInteger)calculeExactWidthForComponent:(UIView*)view {
    NSInteger viewWidth = CGRectGetWidth(view.frame);
    return (viewWidth * kGeneralComponentsWidthPercentage) / 100;
}

- (NSInteger)calculeExactWidthForBlankSpaces:(UIView*)view {
    NSInteger viewWidth = CGRectGetWidth(view.frame);
    return (viewWidth * kBlankSpacesPercentage) / 100;
}

- (NSInteger)calculeExactTopAndBottomSpaces:(UIView*)view {
    NSInteger viewHeight = CGRectGetHeight(view.frame);
    return (viewHeight * kBottomAndTopPercentage) / 100;
}

-(void)createSubViews {
    CGRect rect1 = CGRectMake(self.MarginLeftRect1, self.MarginTopRect1, self.WidthRect1, self.HeightRect1);
    CGRect rect2 = CGRectMake(self.MarginLeftRect2, self.MarginTopRect2, self.WidthRect2, self.HeightRect2);
    CGRect rect3 = CGRectMake(self.MarginLeftRect3, self.MarginTopRect3, self.WidthRect3, self.HeightRect3);
    CGRect rect4 = CGRectMake(self.MarginLeftRect4, self.MarginTopRect4, self.WidthRect4, self.HeightRect4);
    
    [self createView:rect1 viewToAdd:self.containerView color:[UIColor brownColor]];
    [self createView:rect2 viewToAdd:self.containerView color:[UIColor brownColor]];
    [self createView:rect3 viewToAdd:self.containerView color:[UIColor brownColor]];
    [self createView:rect4 viewToAdd:self.containerView color:[UIColor brownColor]];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupScreenCoordinates];
}

- (UIView*)createView:(CGRect)rect viewToAdd:(UIView*)viewToAdd color:(UIColor*) color {
    UIView *newView = [[UIView alloc] initWithFrame:rect];
    newView.backgroundColor = color;
    if (viewToAdd){
        [viewToAdd addSubview:newView];
    }
    return newView;
}

@end
