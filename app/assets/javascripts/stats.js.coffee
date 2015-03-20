draw_pie_chart_for_stat = (div, data, total) ->
  w = 200;
  h = 200;
  m = w/4; 
  r = h/2;
  dw = w+100;
  dh = h+100;
  dr = dw/2;
  color = d3.scale.category20c();

  # setup the svg container for the pie chart
  vis = d3.select(div).append("svg:svg").data([data]).attr("width", dw).attr("height", dh).append("svg:g").attr("transform", "translate("+ dr + "," + dr + ")");
  pie = d3.layout.pie().value (d) -> 
    d.value

  # declare an arc generator function
  arc = d3.svg.arc().innerRadius(m).outerRadius(r);

  # select paths, use arc generator to draw
  arcs = vis.selectAll("g.slice").data(pie).enter().append("svg:g").attr("class", "slice");
  arcs.append("svg:path")
  .attr "fill", (d, i) ->
    color(i)
  .attr "d", (d) ->
    arc(d)

  # add the label for each slice
  arcs.append("svg:text").attr "transform", (d) ->
    c = arc.centroid(d)
    "translate( #{c[0] * 1.7 } , #{c[1] * 1.7} )" 
  .style("font-size", '24px')
  .attr("dy", ".35em")
  .attr("text-anchor", "middle").text (d, i) ->
    data[i].label
  
  # add the center text
  arcs.append("svg:text").attr "transform", (d) ->
    "translate( 0 )"
  .style("font-size", '30px')
  .attr("dy", ".35em")
  .attr("text-anchor", "middle").text (d, i) ->
    total

$ ->
  $.ajax
    url: "/stats_charts"
    dataType: "json"
    success: (data,status,jqXHR) ->
      
      draw_pie_chart_for_stat('#pours_by_user_keg', data.pours_current_keg, data.pours_current_keg_total)
      draw_pie_chart_for_stat('#pours_by_user_lifetime', data.pours_lifetime, data.pours_lifetime_total)
        