alert("OLAAAAAA MUNDOOOOOO");

$(document).ready(function() {
		
		var color = d3.scale.ordinal().domain([0, 1, 2, 3, 4, 5, -1]).range(["#FFF", "#EFF3FF", "#BDD7E7", "#6BAED6", "#3182BD", "#08519C", "#CCCCCC"]);
		console.log("ready!");
		CriaColmeias("#comunicacao-1");
	});
	
	function CriaColmeias(idContainer) {
		var width = 428,
		    height = 270,
		    svg = d3.select(idContainer).append("svg").attr("preserveAspectRatio", "xMinYMin meet")// Way to Go!!
		.attr("viewBox", "0 0 " + width + " " + height)// Essas duas linhas deixam os gráficos reponsivos! =D
		.append('svg:g');

		d3.json("/polygons.json", function(data) {
			var dimensoes = data.pdm;
			dimensoes.forEach(function(d) {
				var h2 = (Math.sqrt(3) / 2),
				    radius = 40,
				    xp = 80,
				    yp = 30,
				    hexagonData = [{
					"x" : radius + xp,
					"y" : yp
				}, {
					"x" : radius / 2 + xp,
					"y" : radius * h2 + yp
				}, {
					"x" : -radius / 2 + xp,
					"y" : radius * h2 + yp
				}, {
					"x" : -radius + xp,
					"y" : yp
				}, {
					"x" : -radius / 2 + xp,
					"y" : -radius * h2 + yp
				}, {
					"x" : radius / 2 + xp,
					"y" : -radius * h2 + yp
				}];
				drawHexagon = d3.svg.line().x(function(d) {
					return d.x;
				}).y(function(d) {
					return d.y;
				}).interpolate("cardinal-closed").tension("0.25");

				var elemento = d;
				var enterElements = svg.selectAll("path").data(data.pdm).enter().append("path").attr("id", function(d) {
					return d.id;
				}).attr("d", drawHexagon(hexagonData)).attr("transform", function(d) {
					return "translate(" + d.translade_x + "," + d.translade_y + ") rotate(30 30 0)";
				}).attr("stroke", "#383838").attr("fill", "white").attr("cursor", "pointer").attr("stroke-width", function(d) {
					if (d.id == "NUL") {
						return 0;
					} else {
						return 1;
					}
				}).on('click', function(d) {
					var titulo = "";
					var comentario = "";
					titulo += "<p class='titulo'>" + d.name + "</p>";
					comentario += "<p class='comentario'>" + d.description + "</p>";

					exibeComentarios(comentario, titulo);
					$("#comentariosModalDialog").modal("show");
				});

				var rotulos = svg.selectAll("text").data(data.pdm).enter().append("text").attr("id", function(d) {
					return d.id + "-rotulo";
				}).attr("cursor", "pointer").attr("font-size", function(d) {
					if (d.id == "NUL") {
						return 9;
					} else {
						return 10;
					}
				});

				var nome = d.name;
				var rotulos = [];
				var palavras = nome.split(' ');
				var rotulo = svg.select("#" + d.id + "-rotulo");

				if (palavras.length == 3) {

					rotulos.push(palavras.shift());
					rotulos.push(palavras.join(' '));
					palavras = [];
					palavras = rotulos.slice();

				}
				palavras.forEach(function(d, i) {

					rotulo.append('tspan').attr('x', function(d) {
						return d.translade_x + 58;
					}).attr('y', function(d) {
						return d.translade_y + 48;
					}).attr('dy', function(d) {
						return i * 12;
					}).attr('text-anchor', 'middle').text(d);
				});
			});
		});
	}


	