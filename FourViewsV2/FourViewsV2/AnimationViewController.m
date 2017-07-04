//
//  AnimationViewController.m
//  FourViewsV2
//
//  Created by Samuel Furtado e Silva on 30/06/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "AnimationViewController.h"
#import "AnimationView.h"

@interface AnimationViewController ()

@property (strong, nonatomic) IBOutlet AnimationView *animationView;
@end

@implementation AnimationViewController

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.animationView configureViews];
}

@end
