//
//  TableViewCell.m
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 19/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinnerActivityIndicator;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self prepareForReuse];
}
-(void)setProductImage:(UIImage *)image{
    [self.spinnerActivityIndicator stopAnimating];
    [self.imageView setImage:image];
}

-(void)prepareForReuse{
    [self.spinnerActivityIndicator startAnimating];
    [self.productImageView setImage:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
