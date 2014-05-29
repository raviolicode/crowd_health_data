var data = [20,50,110];

var x = d3.scale.linear()
    .domain([0, d3.max(data)])
    .range([0, 200]);

d3.select("#graph1 .chart")
  .selectAll("div")
    .data(data)
      .enter()
        .append("div")
          .attr("class","chart-block-bar")
          .style("width", function(d) {
            return x(d) + "px";
          });

d3.selectAll("#graph1 .chart-block-text > *:nth-child(2)")
    .data(data)
       .text(function(d) {
        return d;
      });

d3.selectAll("#graph1 .chart-block-title")
    .datum(data.reduce(function(p,c) {
      return p + c;
    }))
       .text(function(d) {
        return d;
      });
