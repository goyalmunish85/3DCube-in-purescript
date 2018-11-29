exports.getCtx = function(){
  var canvas = document.getElementById("myC");
  return canvas.getContext("2d");
}

function project3D(x,y,z) {
  var Qx=Math.PI/4;
  var Qy=Math.PI/3;
  var Qz=Math.PI/4;
  var xRotQz=x*Math.cos(Qz)+y*Math.sin(Qz);
  var yRotQz=y*Math.cos(Qz)-x*Math.sin(Qz);
  var zRotQz=z;
  var xRotQzQx=xRotQz;
  var yRotQzQx=yRotQz*Math.cos(Qx)+zRotQz*Math.sin(Qx);
  var zRotQzQx=zRotQz*Math.cos(Qx)-yRotQz*Math.sin(Qx);
  var xRotQzQxQy=xRotQzQx*Math.cos(Qy)+zRotQzQx*Math.sin(Qy);
  var yRotQzQxQy=yRotQzQx;
  return [xRotQzQxQy,yRotQzQxQy]
}


exports.updateCanvas = function(ctx){
  return function(){
    var rate=0.999;
    dx=t=rate*dx;
    Qx=Qx+dx;
    dy=rate*dy;
    Qy=Qy+dy;
    dz=rate*dz;
    Qz=Qz+dz;
    drawCube();  
    window.requestAnimationFrame(updateCube)
  }
}
exports.drawCanvas = function(ctx){
  return function(vertices){
      return function(){
        var verticesPixLoc = [];
        ctx.clearRect(0,0,650,400);
        for(var i=0;i<vertices.length;i++)
        {
            var xyLoc = project3D(vertices[i][0],vertices[i][1],vertices[i][2]);
            console.log(xyLoc)
            var pixLoc = [xyLoc[0]+650/2,-xyLoc[1]+400/2];
            verticesPixLoc.push(pixLoc);
        }
        console.log(verticesPixLoc)
        for(var i=0;i<vertices.length-1;i++){
            ctx.beginPath();
            ctx.moveTo(verticesPixLoc[i][0],verticesPixLoc[i][1]);
            ctx.lineTo(verticesPixLoc[i+1][0],verticesPixLoc[i+1][1]);
            ctx.stroke();
        }
      }
    }
}
