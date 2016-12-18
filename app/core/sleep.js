var args = process.argv.slice(2)

var delay = args[0]

var preamble = '[sleep #' + process.pid + '] '

if (typeof delay === 'undefined'){
  console.log("delay (in ms) not specified");
  delay = 0;
}

if (delay != parseInt(delay))
{
  console.log("invalid delay");
  delay = 0;
}

// console.log(preamble + 'sleeping for ' + delay + ' milliseconds')

setTimeout(function()
  {
    // console.log(preamble + 'woken up after ' + delay + ' milliseconds')
    process.exit(0)
  },
  delay)