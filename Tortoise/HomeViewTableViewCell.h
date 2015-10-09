//
//  HomeViewTableViewCell.h
//  Tortoise
//
//  Created by Namit Nayak on 10/8/15.
//  Copyright © 2015 Namit Nayak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *placeImageView;
@property (weak, nonatomic) IBOutlet UILabel *placeTitleLbl;
@property (weak, nonatomic) IBOutlet UITextView *descriptionLbl;

@end
