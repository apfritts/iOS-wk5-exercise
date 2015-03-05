//
//  DraggableImageView.m
//  iOSWk5Exercise
//
//  Created by AP Fritts on 3/4/15.
//  Copyright (c) 2015 AP Fritts. All rights reserved.
//

#import "DraggableImageView.h"

@interface DraggableImageView()

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *ryanPan;
@property (weak, nonatomic) IBOutlet UIImageView *imageNav;
@property (weak, nonatomic) IBOutlet UIImageView *imageAction;
@property (weak, nonatomic) IBOutlet UIImageView *imagePerson;


@end

@implementation DraggableImageView

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initSubviews];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

-(void)initSubviews {
    UINib *nib = [UINib nibWithNibName:@"CardsViewController" bundle:nil];
    [nib instantiateWithOwner:self options:nil];
    self.view.frame = self.bounds;
    [self addSubview:self.view];
    
    // Other custom logic here
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
