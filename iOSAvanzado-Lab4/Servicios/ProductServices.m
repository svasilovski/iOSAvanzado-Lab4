//
//  ProductServices.m
//  iOSAvanzado-Lab4
//
//  Created by Samuel Vasilovski on 19/11/18.
//  Copyright © 2018 SAMUEL VASILOVSKI. All rights reserved.
//
#import "ProductServices.h"

@interface ProductServices()

@end

@implementation ProductServices

+(void)getProductsOnCompletion: (ServiceCompleteBlock) onCompletion{
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.webkathon.com/pruebasit/products.php"]];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithURL: url
            completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error)
      {
          [NSOperationQueue.mainQueue addOperationWithBlock:^{
              ServiceError* serviceError;
              if (data) {
                  onCompletion([self parseData:data],serviceError);
              } else {
                  serviceError = [ServiceError errorWithReason:@"Missing data."];
                  onCompletion(nil,serviceError);
              }
              
              if (error) {
                  serviceError = [ServiceError errorWithReason:error.localizedDescription];
                  onCompletion(nil, serviceError);
              }
              
          }];
      }] resume];
}

+(NSArray<Product*>*)parseData:(NSData*)data {
    NSMutableArray* products = [NSMutableArray new];
    NSArray<NSDictionary*>* productsDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    for (NSDictionary* dict in productsDictionary) {
        Product* product = [Product new];
        product.name = (NSString*) [dict valueForKey:@"description"];
        product.urlImageString = (NSString*) [dict valueForKey:@"image"];
        product.identifier = (NSString*) [dict valueForKey:@"id"];
        product.price = (NSNumber*) [dict valueForKey:@"price"];
        [products addObject:product];
    }
    return products;
}

@end
