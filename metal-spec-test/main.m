//
//  main.m
//  metal-spec-test
//
//  Created by Joshua Groves on 2018-05-22.
//  Copyright © 2018 Joshua Groves. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Metal/Metal.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSError *error = NULL;
        id<MTLDevice> device = MTLCreateSystemDefaultDevice();
        id<MTLLibrary> defaultLibrary = [device newDefaultLibrary];
        MTLFunctionConstantValues* constantValues = [MTLFunctionConstantValues new];
        int x = 10;
        int y = 3;
        int z = 4;
        [constantValues setConstantValue:&x type:MTLDataTypeUInt atIndex:0];
        [constantValues setConstantValue:&y type:MTLDataTypeUInt atIndex:1];
        [constantValues setConstantValue:&z type:MTLDataTypeUInt atIndex:2];
        id<MTLFunction> kernelFunction = [defaultLibrary newFunctionWithName:@"main0" constantValues:constantValues error:&error];
    }
    return 0;
}
