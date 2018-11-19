//
//  Product.h
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 19/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Product : NSObject
@property (nonatomic, strong) NSString* identifier;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSString* urlImageString;
@property (nonatomic, strong) NSNumber* price;
@property (nonatomic, strong) UIImage* image;
@end
