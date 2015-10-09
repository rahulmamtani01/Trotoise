//
//  HomeViewTableViewCell.m
//  Tortoise
//
//  Created by Namit Nayak on 10/8/15.
//  Copyright © 2015 Namit Nayak. All rights reserved.
//

#import "HomeViewTableViewCell.h"

@implementation HomeViewTableViewCell

-(id)init{
    
    if (self=[super init]) {
//        self.placeImageView
        self.placeImageView.layer.cornerRadius = self.placeImageView.frame.size.width / 2;
        self.placeImageView.clipsToBounds = YES;
        self.placeImageView.layer.borderWidth = 3.0f;
        self.placeImageView.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return self;
}
@end
