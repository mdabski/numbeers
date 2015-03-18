$ ->
  $.ajax
    url: "/pour_count"
    dataType: "json"
    success: (data,status,jqXHR) ->
      this.data
      
      w = 250;
      h = 250;
      m = w/4; 
      r = h/2;
      color = d3.scale.category20c();

      vis = d3.select('#pours_by_user_keg').append("svg:svg").data([data]).attr("width", w).attr("height", h).append("svg:g").attr("transform", "translate(" + r + "," + r + ")");
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

      # add the text
      arcs.append("svg:text").attr "transform", (d) ->
        d.innerRadius = 0
        d.outerRadius = r
        "translate(" + arc.centroid(d) + ")"
      .style("font-size", '24px')
      .attr("text-anchor", "middle").text (d, i) ->
        data[i].label

  $.ajax
    url: "/pour_count_lifetime"
    dataType: "json"
    success: (data,status,jqXHR) ->
      this.data
      
      w = 250;
      h = 250;
      m = w/4; 
      r = h/2;
      color = d3.scale.category20c();

      vis = d3.select('#pours_by_user_lifetime').append("svg:svg").data([data]).attr("width", w).attr("height", h).append("svg:g").attr("transform", "translate(" + r + "," + r + ")");
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

      # add the text
      arcs.append("svg:text").attr "transform", (d) ->
        d.innerRadius = 0
        d.outerRadius = r
        "translate(" + arc.centroid(d) + ")"
      .style("font-size", '24px')
      .attr("text-anchor", "middle").text (d, i) ->
        data[i].label
 
        