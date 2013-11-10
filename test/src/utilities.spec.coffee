describe 'ASIN URL pattern RegExp', ->

  it 'should match valid URLs', ->
    (expect(getAsin url).toBeTruthy()) for url in [
      'http://www.amazon.com/gp/product/B00BATNNZY/'
    ]
    
  it 'should not match invalid URLs', ->
    (expect(getAsin url).toBeFalsy()) for url in [
      'http://www.amazon.com/'
      'http://fczbkk.com/'
      'aaa'
    ]

  it 'should get ASIN', ->
    url = 'http://www.amazon.com/gp/product/B00BATNNZY/'
    expect(getAsin url).toBe 'B00BATNNZY'

describe 'Shortened link generator', ->

  it 'should create blank link if ASIN is not provided', ->
    expect(getShortUrl()).toBe 'http://amzn.com/'

  it 'should create valid link if ASIN is provided', ->
    expect(getShortUrl 'aaa').toBe 'http://amzn.com/aaa'

  it 'should include affiliate tag if provided', ->
    expect(getShortUrl 'aaa', 'bbb').toBe 'http://amzn.com/aaa?tag=bbb'
    
