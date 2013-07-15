customers = [
  { id: 1, title: 'item 1' }
  { id: 2, title: 'item 2' }
  { id: 3, title: 'item 3' }
]

GET ->
  @res.send customers
GET ':id', ->
  @res.send customers[@req.params.id]
POST ->
  customers.push { id: @req.body.id, title: @req.body.title }
  @res.send customers[@req.params.id]
PUT ':id', ->
  customers[@req.params.id] = { id: @req.body.id, title: @req.body.title }
  @res.send customers[@req.params.id]
DELETE ':id', ->
  @res.send customers[@req.params.id]
  delete customers[@req.params.id]

exampleMiddleware1 = ->
  @test = 5
  @req.log.info { some: 'object' }, 'Some object log record'
  @next()

exampleMiddleware2 = (req, res, next) ->
  next()

GET 'test', exampleMiddleware1, exampleMiddleware2, ->
  @res.send @test