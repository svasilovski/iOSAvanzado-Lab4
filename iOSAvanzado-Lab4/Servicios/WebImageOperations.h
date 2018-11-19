//
//  WebImageOperations.h
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 19/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WebImageOperations : NSObject

+ (void)processImageDataWithURLString:(NSString *)urlString
                             andBlock:(void (^)(NSData *imageData))processImage;

+(UIImage*)getImageFrmUrlString: (NSString*) urlString;

@end

NS_ASSUME_NONNULL_END
