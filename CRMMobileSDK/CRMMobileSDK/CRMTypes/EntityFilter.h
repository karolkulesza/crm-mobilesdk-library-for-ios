#import "JSONGenerator.h"
#import "JSONParser.h"
#import "SOAPGenerator.h"
#import "SOAPParser.h"

@interface EntityFilter : NSString <JSONGenerator, JSONParser, SOAPGenerator, SOAPParser>

@property (nonatomic, strong) NSString *filter;

@end
