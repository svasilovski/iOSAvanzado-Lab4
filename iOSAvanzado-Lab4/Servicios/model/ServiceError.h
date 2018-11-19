//
//  ServiceError.h
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 19/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ServiceError : NSError
@property (nonatomic, strong) NSString* reason;

+(instancetype) errorWithReason: (NSString*) reason;
@end
