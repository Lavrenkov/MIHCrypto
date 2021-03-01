//
// Copyright (C) 2014 Michael Hohl <http://www.michaelhohl.net/>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
// documentation files (the "Software"), to deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the
// Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
// WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
// OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "MIHMessageDigest5.h"
#import "MIHInternal.h"
#import <OpenSSL/OpenSSL.h>


@implementation MIHMessageDigest5

- (NSData *)hashValueOfData:(NSData *)data
{
    MD5_CTX md5Ctx;
    unsigned char hashValue[MD5_DIGEST_LENGTH];
    if(!MD5_Init(&md5Ctx)) {
        @throw [NSException openSSLException];
    }
    if (!MD5_Update(&md5Ctx, data.bytes, data.length)) {
        @throw [NSException openSSLException];
    }
    if (!MD5_Final(hashValue, &md5Ctx)) {
        @throw [NSException openSSLException];
    }
    return [NSData dataWithBytes:hashValue length:MD5_DIGEST_LENGTH];
}

@end
