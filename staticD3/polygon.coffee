# Defining a function
polygon = (sides, size, radius, center) ->
    circle = 2 * Math.PI
    angle = circle / sides
    points = []

    for i in [0..sides]
        x = (Math.cos(angle * i) * size) + center[0]
        y = (Math.sin(angle * i) * size) + center[1]
        points[i] = {"x": x, "y": y, "r": radius}

    return points

polyGoneCrazy = (sides, size, radius, center) ->
    circle = 2 * Math.PI
    angle = circle / sides
    points = []

    for i in [0..sides]
        random = Math.floor(Math.random() * (size + 1))
        x = (Math.cos(angle * i) * random) + center[0]
        y = (Math.sin(angle * i) * random) + center[1]
        points[i] = {"x": x, "y": y, "r": radius}

    return points
 
polyData = polygon(6, 150, 20, [250, 250])

polyCrazy = polyGoneCrazy(100, 150, 20, [250, 250])

svg1 = d3.select("#experimental-circles-only")
    .append("svg")
    .attr("width", 500)
    .attr("height", 500)

circles = svg1.selectAll("circle")
    .data(polyData)
    .enter()
    .append("circle")
    .style("fill", "gray")
    .style("stroke", "none")
    .style("stroke-width", 2)

circleAttributes = circles
    .attr("cx",  (d) -> (d.x))
    .attr("cy",  (d) -> (d.y))
    .attr("r",  (d) -> (d.r))


svg2 = d3.select("#experimental-circles-polygon")
    .append("svg")
    .attr("width", 500)
    .attr("height", 500)

circles = svg2.selectAll("circle")
    .data(polyData)
    .enter()
    .append("circle")
    .style("fill", "gray")
    .style("stroke", "none")
    .style("stroke-width", 1)

circleAttributes = circles
    .attr("cx",  (d) -> (d.x))
    .attr("cy",  (d) -> (d.y))
    .attr("r",  (d) -> (d.r))

polygons = svg2.selectAll("polygon")
    .data([polyData])
    .enter()
    .append('polygon')
    .style("stroke", "gray")
    .style("stroke-width",10)  
    .style("fill", 'none')

polygonAttributes = polygons
    .attr("points",(d) -> (d.map((d) -> ([d.x, d.y]).join(",")).join(" ")))


svg3 = d3.select("#experimental-poly-gone-crazy")
    .append("svg")
    .attr("width", 500)
    .attr("height", 500)

polygons = svg3.selectAll("polygon")
    .data([polyCrazy])
    .enter()
    .append('polygon')
    .style("stroke", "gray")
    .style("stroke-width",1)  
    .style("fill", 'gray')

polygonAttributes = polygons
    .attr("points",(d) -> (d.map((d) -> ([d.x, d.y]).join(",")).join(" ")))

