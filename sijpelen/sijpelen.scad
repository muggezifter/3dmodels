    l = 600; //length of shortest pipe
    function n(x)=x-(x/17.817); // get the next smaller pipe
    
    lengths=[
    n(n(n(n(n(n(n(n(n(n(n(n(l*2)))))))))))),
    n(n(n(n(n(n(n(n(n(n(n(l*2))))))))))),
    n(n(n(n(n(n(n(n(n(n(l*2)))))))))),
    n(n(n(n(n(n(n(n(n(l*2))))))))),
    n(n(n(n(n(n(n(n(l*2)))))))),
    n(n(n(n(n(n(n(l*2))))))),
    n(n(n(n(n(n(l*2)))))),
    n(n(n(n(n(l*2))))),
    n(n(n(n(l*2)))),
    n(n(n(l*2))),
    n(n(l*2)),
    n(l*2)
    ];
    
    echo(lengths);