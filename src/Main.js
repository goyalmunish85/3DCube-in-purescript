exports.getCtx = function(){
  var canvas = document.getElementById("myC");
  return canvas.getContext("2d");
}


exports.drawCanvas = function(ctx){
  return function(canvas){
      return function(){
        ctx.fillRect(canvas.x, canvas.y, canvas.width, canvas.height);
      }
    }
}
