draw_pie_chart_for_stat = (div, data, total) ->
  w = 200;
  h = 200;
  dw = w+100;
  dh = h+100;
  dr = dw/2;
  m = w/4; 
  r = h/2;
  labelr = r+25;
  color = d3.scale.category20c();

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
    # log the result of the arc generator to show how cool it is :)
    console.log(arc(d))
    arc(d)

  # add the label for each slice
  arcs.append("svg:text").attr "transform", (d) ->
    c = arc.centroid(d)
    x = c[0]
    y = c[1]
    h = Math.sqrt(x*x + y*y)
    "translate( #{(x/h * labelr)} , #{(y/h * labelr)} )" 
  .style("font-size", '24px')
  .attr("dy", ".35em")
  .attr("text-anchor", "middle").text (d, i) ->
    data[i].label
  
  # add the center text
  arcs.append("svg:text").attr "transform", (d) ->
    "translate(" + 0 + ")"
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
        