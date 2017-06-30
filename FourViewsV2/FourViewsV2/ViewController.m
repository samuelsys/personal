//
//  ViewController.m
//  FourViews
//
//  Created by Samuel Furtado e Silva on 27/06/17.
//  Copyright © 2017 Samuel Furtado e Silva. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet MainView *mainView;

@end

@implementation ViewController

#pragma LifeCycle Methods

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.mainView setupScreenCoordinates];
}

@end
