//
//  CPMainTableViewCell.h
//  Smart4AviationDemo
//
//  Created by Diana Evlakhova on 8/16/15.
//  Copyright (c) 2015 Diana Evlakhova. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAMainTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView  *thumbnailImageView;

@property (nonatomic, weak) IBOutlet UILabel        *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel        *subTitleLabel;



@end
