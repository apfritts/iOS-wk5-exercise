//
//  CardsViewController.m
//  iOSWk5Exercise
//
//  Created by AP Fritts on 3/4/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import "CardsViewController.h"
#import "ProfileViewController.h"

@interface CardsViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *imagePerson;

@property (weak, nonatomic) IBOutlet UIImageView *imageNav;
- (IBAction)onPan:(UIPanGestureRecognizer *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageAction;

@property (assign, nonatomic) CGPoint touchStartPoint;
@property (assign, nonatomic) CGPoint imageCenterPoint;
@property (assign, nonatomic) BOOL panningOnTop;

@end

@implementation CardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.imageCenterPoint = self.imagePerson.center;
        self.touchStartPoint = [sender locationInView:self.view];
        self.panningOnTop = self.touchStartPoint.y < self.imageCenterPoint.y;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [sender translationInView:self.view];
        CGPoint touchPoint = [sender locationInView:self.view];
        self.imagePerson.center = CGPointMake(self.imageCenterPoint.x + translation.x, self.imageCenterPoint.y + translation.y);
        if ((self.panningOnTop && translation.x > 0) || (!self.panningOnTop && translation.x <= 0)) {
            // rotate clockwise
            float dx = touchPoint.x - self.imageCenterPoint.x;
            float dy = touchPoint.y - self.imageCenterPoint.y;
            float deltaAngle = atan2f(dy, dx);
            self.imagePerson.transform = CGAffineTransformMakeRotation(deltaAngle);
        } else {
            // rotate counter clockwise
            float dx = touchPoint.x - self.imageCenterPoint.x;
            float dy = touchPoint.y - self.imageCenterPoint.y;
            float deltaAngle = atan2f(dy, dx);
            self.imagePerson.transform = CGAffineTransformMakeRotation(-1 * deltaAngle);
        }
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        //CGPoint velocity = [sender velocityInView:self.view];
    }
}

- (IBAction)onRyanTap:(UIGestureRecognizer *)sender {
    ProfileViewController *pvc = [[ProfileViewController alloc] init];
    pvc.hotRyan = self.imagePerson.image;
    [self presentViewController:pvc animated:YES completion:^{
        //
    }];
}

@end
