//
//  TableViewCell.h
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 19/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productCountLabel;

-(void)setProductImage:(UIImage*)image;

@end

NS_ASSUME_NONNULL_END
