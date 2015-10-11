//
//  SplashViewController.m
//  Tortoise
//
//  Created by Namit Nayak on 10/11/15.
//  Copyright © 2015 Namit Nayak. All rights reserved.
//

#import "SplashViewController.h"
@interface SplashViewController()
{
    
    CGFloat scrollViewWidth;
    BOOL pageControlBeingUsed;
}
@property (nonatomic,strong) NSArray *splashImageArra;
@end

@implementation SplashViewController
-(void)viewDidLoad{
    
    [super viewDidLoad];
    

    
    self.splashImageArra = [NSArray arrayWithObjects:@"walkthrough1",@"walkthrough2",@"walkthrough3",@"walkthrough4",@"walkthrough5", nil];
    
    self.scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
     scrollViewWidth = self.scrollView.frame.size.width;
    CGFloat scrollViewHeight = self.scrollView.frame.size.height;
   
    UIImageView *imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, scrollViewWidth, scrollViewHeight)]
    ;
    
    imageViewOne.translatesAutoresizingMaskIntoConstraints = YES;
    imageViewOne.image = [UIImage imageNamed:self.splashImageArra[0]];
    imageViewOne.autoresizesSubviews = YES;
    
    
    
    
    UIImageView *imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(scrollViewWidth, 0, scrollViewWidth, scrollViewHeight)];
    
    
    imageViewTwo.image = [UIImage imageNamed:self.splashImageArra[1]];
    
    
    UIImageView *imageViewThree = [[UIImageView alloc] initWithFrame:CGRectMake((scrollViewWidth)*2, 0, scrollViewWidth, scrollViewHeight)];
    
    
    
    imageViewThree.image = [UIImage imageNamed:self.splashImageArra[2]];
    
    UIImageView *imageViewFour = [[UIImageView alloc] initWithFrame:CGRectMake((scrollViewWidth)*3, 0, scrollViewWidth, scrollViewHeight)];
    
    
    
    imageViewFour.image = [UIImage imageNamed:self.splashImageArra[3]];
    
    UIImageView *imageViewFive = [[UIImageView alloc] initWithFrame:CGRectMake((scrollViewWidth)*4, 0, scrollViewWidth, scrollViewHeight)];
    
    
    
    imageViewFive.image = [UIImage imageNamed:self.splashImageArra[4]];
    
    [self.scrollView addSubview:imageViewOne];
    /*
    NSLayoutConstraint *myConstraint =[NSLayoutConstraint
                                       constraintWithItem:imageViewOne
                                       attribute:NSLayoutAttributeTop
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.scrollView
                                       attribute:NSLayoutAttributeTop
                                       multiplier:1.0
                                       constant:0];
    [self.scrollView addConstraint:myConstraint];
    
    myConstraint =[NSLayoutConstraint
                                       constraintWithItem:imageViewOne
                                       attribute:NSLayoutAttributeHeight
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.scrollView
                                       attribute:NSLayoutAttributeHeight
                                       multiplier:1.0
                                       constant:0];
    
    [self.scrollView addConstraint:myConstraint];
    
   myConstraint =[NSLayoutConstraint
                                       constraintWithItem:imageViewOne
                                       attribute:NSLayoutAttributeWidth
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:self.scrollView
                                       attribute:NSLayoutAttributeWidth
                                       multiplier:1.0
                                       constant:0];
      [self.scrollView addConstraint:myConstraint];
    myConstraint =[NSLayoutConstraint
                   constraintWithItem:imageViewOne
                   attribute:NSLayoutAttributeTrailingMargin
                   relatedBy:NSLayoutRelationEqual
                   toItem:self.scrollView
                   attribute:NSLayoutAttributeTrailing
                   multiplier:1.0
                   constant:-20];

    
    [self.scrollView addConstraint:myConstraint];
    myConstraint =[NSLayoutConstraint
                   constraintWithItem:imageViewOne
                   attribute:NSLayoutAttributeLeadingMargin
                   relatedBy:NSLayoutRelationEqual
                   toItem:self.scrollView
                   attribute:NSLayoutAttributeLeading
                   multiplier:1.0
                   constant:-20];
    [self.scrollView addConstraint:myConstraint];

    [self.scrollView updateConstraints];
    [self.scrollView setNeedsLayout];
    */
    [self.scrollView addSubview:imageViewTwo];
        [self.scrollView addSubview:imageViewThree];
        [self.scrollView addSubview:imageViewFour];
        [self.scrollView addSubview:imageViewFive];
//
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * [self.splashImageArra count], self.scrollView.frame.size.height);
    
    
    self.scrollView.delegate = self;
    
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = [self.splashImageArra count];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}






- (void)scrollViewDidScroll:(UIScrollView *)sender {
    // Update the page when more than 50% of the previous/next page is visible
  
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
    pageControlBeingUsed = NO;
    
    
}

- (IBAction)changePage {
    // Update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    
    // Keep track of when scrolls happen in response to the page control
    // value changing. If we don't do this, a noticeable "flashing" occurs
    // as the the scroll delegate will temporarily switch back the page
    // number.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
   
    
    CGFloat pageWidth = self.scrollView.frame.size.width +4;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
    
    NSNumber* currentIndex = [NSNumber numberWithInt:round(scrollView.contentOffset.x / pageWidth)];
    
    //Then just update your scrollviews offset with
    
    
//    [scrollView setContentOffset:CGPointMake([currentIndex intValue] * pageWidth, 0) animated:YES];
}

@end
