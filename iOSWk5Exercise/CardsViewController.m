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

@property (assign, nonatomic) CGPoint imageCenterPoint;

@end

@implementation CardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.imageCenterPoint = self.imagePerson.center;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [sender translationInView:self.view];
        self.imagePerson.center = CGPointMake(self.imageCenterPoint.x + translation.x, self.imageCenterPoint.y + translation.y);
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
