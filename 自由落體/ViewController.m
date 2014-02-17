//
//  ViewController.m
//  自由落體
//
//  Created by crazypoo on 1/16/14.
//  Copyright (c) 2014 crazypoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBeahvior;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (nonatomic, strong) UIDynamicItemBehavior *itemBehavior;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    [self.view addGestureRecognizer:tap];
    
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    self.gravityBeahvior = [[UIGravityBehavior alloc] initWithItems:nil];
    
    self.collisionBehavior = [[UICollisionBehavior alloc] initWithItems:nil];
    self.collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    
    self.itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:nil];
    self.itemBehavior.elasticity = 0.6;
    self.itemBehavior.friction = 0.5;
    self.itemBehavior.resistance = 0.5;
    
    
    [self.animator addBehavior:self.gravityBeahvior];
    [self.animator addBehavior:self.collisionBehavior];
    [self.animator addBehavior:self.itemBehavior];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
- (void)tapped:(UITapGestureRecognizer *)tap {
    
    NSUInteger num = arc4random() % 1 + 1;
    NSString *filename = [NSString stringWithFormat:@"m%lu", (unsigned long)num];
    UIImage *image = [UIImage imageNamed:filename];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
    
    CGPoint tappedPos = [tap locationInView:tap.view];
    imageView.center = tappedPos;
    
    [self.gravityBeahvior addItem:imageView];
    [self.collisionBehavior addItem:imageView];
    [self.itemBehavior addItem:imageView];
}
@end
