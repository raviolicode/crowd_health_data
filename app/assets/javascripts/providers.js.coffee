data = [
  20
  50
  110
]
x = d3.scale.linear().domain([
  0
  d3.max(data)
]).range([
  0
  200
])
d3.select("#graph1 .chart").selectAll("div").data(data).enter().append("div").attr("class", "chart-block-bar").style "width", (d) ->
  x(d) + "px"

d3.selectAll("#graph1 .chart-block-text > *:nth-child(2)").data(data).text (d) ->
  d

d3.selectAll("#graph1 .chart-block-title").datum(data.reduce((p, c) ->
  p + c
)).text (d) ->
  d

