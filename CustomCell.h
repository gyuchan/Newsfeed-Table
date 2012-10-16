//
//  CustomCell.h
//  customTableview
//
//  Created by gyuchan jeon on 12. 10. 9..
//  Copyright (c) 2012년 gyuchan jeon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell {
    UILabel *name;
    UILabel *title;
    UILabel *likeLabel;
    UIView *background;
    UIView *bottomView;
    UIImageView *imageView;
    
    BOOL firstLike;
    int likeNumber;
}

@property (nonatomic, retain) IBOutlet UILabel *name, *title, *likeLabel;
@property (nonatomic, retain) IBOutlet UIView *background, *bottomView;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;

- (void)initCustomCell:(int)inputLikeNumber likeVisible:(BOOL)likeVisible;

@end
