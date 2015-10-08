//
//  ViewController.h
//  Tortoise
//
//  Created by Namit Nayak on 10/6/15.
//  Copyright © 2015 Namit Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;


@end

