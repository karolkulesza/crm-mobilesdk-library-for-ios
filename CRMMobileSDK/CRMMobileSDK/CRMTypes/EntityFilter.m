#import "EntityFilter.h"
#import "NSString+XMLEncode.h"


@implementation EntityFilter

- (instancetype)init
{
  return [self initWithFilter:nil];
}

- (instancetype)initWithFilter:(NSString *)filter
{
  self = [super init];
  if (self) {
    self.filter = filter;
  }
  
  return self;
}

- (NSObject *)generateJSON
{
  return self;
}

- (NSString *)generateSOAP
{
  return [NSString stringWithFormat:
          @"<b:value i:type=\"d:EntityFilters\" xmlns:d=\"http://schemas.microsoft.com/xrm/2011/Metadata\">"
          "%@"
          "</b:value>",
          [self.filter xmlEncode]];
}

+ (instancetype)instanceWithJSONObject:(NSObject *)obj
{
  if (![obj isKindOfClass:[NSString class]]) {
    return nil;
  }
  
  return (EntityFilter *)obj;
}

+ (instancetype)instanceWithObject:(NSObject *)obj
{
  if (![obj isKindOfClass:[NSString class]]) {
    return nil;
  }
  
  return [[EntityFilter alloc] initWithFilter:(NSString *)obj];
}

@end