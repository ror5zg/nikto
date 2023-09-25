const sketch = function(p) {
    p.setup = function() {
        p.createCanvas(500, 500);
    }
    p.draw = function() {
        p.background(200);
        p.fill(100);
        // p.noStroke();
        p.ellipse(p.width/2, p.height/2, 50);
    }
}

// p5-sketchクラスを持つ要素へスケッチを描画
new p5(sketch, 'p5-sketch');