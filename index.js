var express = require('express')
var exec = require('child_process').exec;

var app = module.exports = express()

app.get('/apps/:app', function (req, res) {
  var action = req.query.action||'deploy'
  console.log(new Date().toLocaleString(), req.params.app, action);
  exec(__dirname+'/bin/'+action+'.sh '+req.params.app, function () {
    console.log(arguments);
  })
  res.sendStatus(200);
})

app.start = function () {

  app.listen(2345, function () {
    app.emit('started')
    console.log('Webhook app listen on port 2345');
  })
}

if (require.main === module)
  app.start();
