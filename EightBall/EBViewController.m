//
//  EBViewController.m
//  EightBall
//
//  Created by Eric Waring on 14/04/2014.
//  Copyright (c) 2014 Eric Waring. All rights reserved.
//

#import "EBViewController.h"

@interface EBViewController ()

@end

static NSString* gAnswers[] = {
    @"\rYES",
    @"\rNO",
    @"\rMAYBE",
    @"I\rDON'T\rKNOW",
    @"TRY\rAGAIN\rSOON",
    @"\rRTFM"
};

#define kNumberOfAnswers (sizeof(gAnswers)/sizeof(NSString*))

@interface EBViewController ()
- (void)fadeFortune;
- (void)newFortune;
@end

@implementation EBViewController

- (void)fadeFortune
{
    [UIView animateWithDuration:0.75 animations:^{
        self.answerView.alpha = 0.0;
    }];
}

- (void)newFortune
{
    self.answerView.text = gAnswers[arc4random_uniform(kNumberOfAnswers)];
    [UIView animateWithDuration:2.0 animations:^{
        self.answerView.alpha = 1.0;
    }];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion==UIEventSubtypeMotionShake)
        [self fadeFortune];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion==UIEventSubtypeMotionShake)
        [self newFortune];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion==UIEventSubtypeMotionShake)
        [self newFortune];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
