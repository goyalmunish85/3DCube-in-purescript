exports.getCtx = function(){
  var canvas = document.getElementById("myC");
  return canvas.getContext("2d");
}

exports.drawLine = function(ctx){
  return function(start){
    return function(end){
      return function(){
        ctx.beginPath();
        ctx.moveTo(start.x, start.y);
        ctx.lineTo(end.x, end.y);
        ctx.lineTo(end.y, end.y);
        ctx.lineTo(end.y, start.y);
        ctx.lineTo(end.x, start.x); 
        ctx.stroke();
      }
    }
  }
}

exports.clearLine = function(ctx){
  return function(start){
    return function(end){
      return function(){
        context.clearRect(0, 0, canvas.width, canvas.height);
      }
    }
  }
}
