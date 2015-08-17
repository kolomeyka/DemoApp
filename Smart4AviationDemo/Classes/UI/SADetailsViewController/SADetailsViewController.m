//
//  SADetailsViewController.m
//  Smart4AviationDemo
//
//  Created by Diana Evlakhova on 8/17/15.
//  Copyright (c) 2015 Diana Evlakhova. All rights reserved.
//

#import "SADetailsViewController.h"

@interface SADetailsViewController ()

@property (nonatomic, weak) IBOutlet UITextView *detailsTextView;

@end

@implementation SADetailsViewController

- (void)viewDidLoad {
    self.detailsTextView.text = _vacancy.vacancyDescription;
    
}


@end
