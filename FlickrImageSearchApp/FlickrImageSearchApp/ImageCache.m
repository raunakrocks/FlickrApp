//
//  ImageCache.m
//  FlickrImageSearchApp
//
//  Created by Raunak Talwar on 19/05/19.
//  Copyright © 2019 Raunak Talwar. All rights reserved.
//

#import "ImageCache.h"

@interface ImageCache ()
    @property (nonatomic, strong) NSMutableDictionary<NSString *, UIImage *> *cache;
@end

@implementation ImageCache
    
    
+(id)instance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
  
-(id) init {
    self = [super init];
    if(self) {
        self.cache = [NSMutableDictionary dictionary];
    }
    return self;
}
    
-(UIImage *)getImageForModel:(ImageModel *)model {
    UIImage *image = [_cache objectForKey:model.imageID];
    return image;
}

-(void)setImageForModel:(ImageModel *)model image:(UIImage *)image {
    [self.cache setObject:image forKey:model.imageID];
}
@end
