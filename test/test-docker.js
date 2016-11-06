var app = require('..')
var superagent = require('superagent')
var prefix = require('superagent-prefix')('http://0.0.0.0:2345')

describe('Docker', function(){
  
  before(function(done){
    app.start()
    app.on('started', done)
  })
  
  it('should ok', function(done){
    superagent.get('/apps/fankahui-backend').use(prefix).end(function (err, res) {
      res.should.have.status(200);
      done();
    })
  })
  
  it('should error', function(done){
    superagent.get('/apps').use(prefix).end(function (err, res) {
      res.should.have.status(404);
      done()
    })
  })
  
})