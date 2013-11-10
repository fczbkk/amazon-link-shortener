describe('ASIN URL pattern RegExp', function() {
  it('should match valid URLs', function() {
    var url, _i, _len, _ref, _results;
    _ref = ['http://www.amazon.com/gp/product/B00BATNNZY/'];
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      url = _ref[_i];
      _results.push(expect(getAsin(url)).toBeTruthy());
    }
    return _results;
  });
  it('should not match invalid URLs', function() {
    var url, _i, _len, _ref, _results;
    _ref = ['http://www.amazon.com/', 'http://fczbkk.com/', 'aaa'];
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      url = _ref[_i];
      _results.push(expect(getAsin(url)).toBeFalsy());
    }
    return _results;
  });
  return it('should get ASIN', function() {
    var url;
    url = 'http://www.amazon.com/gp/product/B00BATNNZY/';
    return expect(getAsin(url)).toBe('B00BATNNZY');
  });
});

describe('Shortened link generator', function() {
  it('should create blank link if ASIN is not provided', function() {
    return expect(getShortUrl()).toBe('http://amzn.com/');
  });
  it('should create valid link if ASIN is provided', function() {
    return expect(getShortUrl('aaa')).toBe('http://amzn.com/aaa');
  });
  return it('should include affiliate tag if provided', function() {
    return expect(getShortUrl('aaa', 'bbb')).toBe('http://amzn.com/aaa?tag=bbb');
  });
});
