//
//  CustomCell.m
//  customTableview
//
//  Created by gyuchan jeon on 12. 10. 9..
//  Copyright (c) 2012년 gyuchan jeon. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

@synthesize name, title, bottomView, background, likeLabel, imageView;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)likeTouched:(id)sender{
    if(!firstLike){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"좋아요!를 눌렀습니다."
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"확인", nil];
        [alert show];
        likeNumber++;
        [likeLabel setText:[NSString stringWithFormat:@"%d",likeNumber]];
        firstLike = TRUE;
    }else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:@"이미 했습니다."
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"확인", nil];
        [alert show];
    }

}

- (void)initCustomCell:(int)inputLikeNumber likeVisible:(BOOL)likeVisible{
    ///////////////////////
    likeNumber = inputLikeNumber;
    firstLike = likeVisible;
    ///////////////////////
}

@end
