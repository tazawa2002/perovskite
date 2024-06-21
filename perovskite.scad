// モジュールの中身はいじらない！
module perovskite(r_in,d_in){
    // r:原子の半径
    // d:原子間距離
    r = r_in;
    d = d_in;

    // r_b:結合の棒の太さ
    r_b = r/4;

    // Br用の配列
    CubePoints = [
      [-d/2, 0, 0],  //0
      [d/2, 0, 0],  //1
      [0, -d/2, 0],  //2
      [0, d/2, 0],  //3
      [0,  0, -d/2],  //4
      [0,  0, d/2]];  //5

    CubeFaces = [
        [0,5,2],
        [2,5,1],
        [1,5,3],
        [3,5,0],
        [0,4,3],
        [3,4,1],
        [1,4,2],
        [2,4,0]
    ];

    // セシウム
    for(i=[0:1]){
        for(j=[0:1]){
            for(k=[0:1]){
                color("#808080") translate([i*d,j*d,k*d]) sphere(r, $fs=0.01);
            }
        }
    }
    
    // 結合の棒
    color("#ffffff"){
        for(i=[0:1]){
            for(j=[0:1]){
                translate([i*d,j*d,d/2]) cylinder(h=d, r=r_b, center=true, $fs=0.01);
            }
        }
        for(i=[0:1]){
            for(j=[0:1]){
                translate([0,i*d,j*d]) rotate([0,90,0]) translate([0,0,d/2]) cylinder(h=d, r=r_b, center=true, $fs=0.01);
            }
        }
        for(i=[0:1]){
            for(j=[0:1]){
                translate([i*d,0,j*d]) rotate([-90,0,0]) translate([0,0,d/2]) cylinder(h=d, r=r_b, center=true, $fs=0.01);
            }
        }
        for(i=[0:3]){
            translate([d/2,d/2,d/2]) rotate([0,0,90*i]) rotate(a=55, v=[1,-1,0]) cylinder(h=sqrt(3)*d, r=r_b, center=true, $fs=0.01);
        }
    }


    // パラジウム
    translate([d/2,d/2,d/2]){
        color("#FF6347") for(i=[0:1]){
            translate([i*d-d/2,0,0]) sphere(r, $fs=0.01);
            translate([0,i*d-d/2,0]) sphere(r, $fs=0.01);
            translate([0,0,i*d-d/2]) sphere(r, $fs=0.01);
        }
    }

    // Br
    color("#7FFFD4") translate([d/2,d/2,d/2]) polyhedron(CubePoints, CubeFaces);
}

module perovskite2(r_in,d_in){
    // r:原子の半径
    // d:原子間距離
    r = r_in;
    d = d_in;

    // r_b:結合の棒の太さ
    r_b =2*r/12;

    // Br用の配列
    CubePoints = [
      [-d/2, 0, 0],  //0
      [d/2, 0, 0],  //1
      [0, -d/2, 0],  //2
      [0, d/2, 0],  //3
      [0,  0, -d/2],  //4
      [0,  0, d/2]];  //5

    CubeFaces = [
        [0,5,2],
        [2,5,1],
        [1,5,3],
        [3,5,0],
        [0,4,3],
        [3,4,1],
        [1,4,2],
        [2,4,0]
    ];

    // セシウム
    color("#808080") translate([d/2,d/2,d/2]) sphere(r, $fs=0.01);
    
    // 結合の棒
        
    // 斜めの棒
    color("#FFFFFF") for(i=[0:3]){
        translate([d/2,d/2,d/2]) rotate([0,0,90*i]) rotate(a=55, v=[1,-1,0]) cylinder(h=sqrt(3)*d, r=r_b, center=true, $fs=0.01);
    }
    
    color("#FFFFFF"){
        for(i=[-1:2:1])translate([d/2,d/2,d/2]) rotate([0,0,45*i]) rotate([0,90,0]){
            cylinder(h=sqrt(2)*d, r=r_b, center=true, $fs=0.01);
        }
        for(i=[-1:2:1])translate([d/2,d/2,d/2]) rotate([45*i,0,0]){
            cylinder(h=sqrt(2)*d, r=r_b, center=true, $fs=0.01);
        }
        for(i=[-1:2:1])translate([d/2,d/2,d/2]) rotate([0,45*i,0]){
            cylinder(h=sqrt(2)*d, r=r_b, center=true, $fs=0.01);
        }
    }


    for(i=[0:1])for(j=[0:1])for(k=[0:1])translate([i*d,j*d,k*d]){
        // パラジウム
        color("#FF6347") for(i=[0:1]){
            translate([i*d-d/2,0,0]) sphere(r, $fs=0.01);
            translate([0,i*d-d/2,0]) sphere(r, $fs=0.01);
            translate([0,0,i*d-d/2]) sphere(r, $fs=0.01);
        }
        // Br
        color("#7FFFD4") polyhedron(CubePoints, CubeFaces);
    }
    
}

// r:原子の半径
// d:原子間距離
r = 3;
d = 20;

// 単位格子の数を指定(０や負の値を入れるとバグる)
x = 1;
y = 1;
z = 1;

for(i=[0:x-1]){
    for(j=[0:y-1]){
        for(k=[0:z-1]){
            translate([d*i,d*j,d*k]) perovskite2(r,d);
        }
    }
}