//
//  ProductServices.h
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 19/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "model/Product.h"
#import "model/ServiceError.h"

typedef void (^ServiceCompleteBlock)(id response, ServiceError* error);

@interface ProductServices : NSObject
+(void)getProductsOnCompletion: (ServiceCompleteBlock) onCompletion;
@end
