var color = d3.scale.ordinal().domain([0, 1, 2, 3, 4, 5, -1])
    .range(["#FFF", "#EFF3FF","#BDD7E7","#6BAED6","#3182BD","#08519C", "#CCCCCC"]);
    
//$(document).on("page:load", function() { CriaVisualizacao(); });	
$(document).on("page:update", function() { CriaVisualizacao(); });
		
	
	function CriaVisualizacao() {
		CriaLegenda();
		CriaColmeias("#container-visualizacao");
	}

	function CriaColmeias(idContainer) {
		var width = 428,
		    height = 270,
		    svg = d3.select(idContainer).append("svg").attr("preserveAspectRatio", "xMinYMin meet")// Way to Go!!
				.attr("viewBox", "0 0 " + width + " " + height)// Essas duas linhas deixam os gráficos reponsivos! =D
				.append('svg:g');

		d3.json("/data/polygons.json", function(data) {
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
			})
			
			.on('click', function(d) {
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
	
	function exibeComentarios(comentario, titulo) {
	  	if ($('.modal-body').has('p').length) {
	  		$( ".modal-title" ).empty();	
	  		$( ".modal-body" ).empty();	  	
	  		$(titulo).appendTo(".modal-title");
	  		$(comentario).appendTo(".modal-body");
	  	} else{
	  		$(titulo).appendTo(".modal-title");
	  		$(comentario).appendTo(".modal-body");
	  	};
	} 
	
	function atualizaGroup(dimensao, valor){
		var hexagono = d3.select('#' + dimensao);
		var hexagonoSemFoco = d3.selectAll('path:not(#' + dimensao + ')');
		var rotulo = d3.selectAll('#' + dimensao + "-rotulo tspan");
		hexagono
			.attr("opacity", 1) 
			.attr("fill", color(valor));
		hexagono.transition().duration(1500)
			.ease('ease')
			.attr("opacity", 1) 
			.attr("fill", color(valor)); 
		rotulo.attr("fill", function(d){	
		if (valor >= 4)
			return "#FFFFFF";
		else
			return "#000000";
		});	
	}
	
	function atualizaLevel(dimensao, valor){
		
		//para corrigir o id recebido
		if(dimensao == 1)
			dimensao = "IS"+dimensao;
		else if(dimensao == 2)
			dimensao = "CS"+dimensao;	
		else if(dimensao == 3)
			dimensao = "TP"+dimensao;
		else if(dimensao == 4)
			dimensao = "II"+dimensao;	
		else if(dimensao == 5)
			dimensao = "AU"+dimensao;
		else if(dimensao == 6)
			dimensao = "NO"+dimensao;
		else if(dimensao == 7)
			dimensao = "ID"+dimensao;
		else if(dimensao == 8)
			dimensao = "SS"+dimensao;
		
		console.log("caso especial:", dimensao);
		console.log("sou a dimensao:", dimensao);
		
		var hexagono = d3.select('#' + dimensao);
		var hexagonoSemFoco = d3.selectAll('path:not(#' + dimensao + ')');
		var tipoLinha;
		var expessura = 1;
			
		if(valor == 2){
			tipoLinha = "6,1,6,1,6,1,6,1";
		}else if (valor == 3){
			tipoLinha = "3, 3";
		}else if (valor == 4){
			tipoLinha = "5,2,2,2,2,2";
		}else if (valor == 5){
			tipoLinha = "1, 1";
		}
		if (valor == 0)
			expessura = 5;
		else if (valor == 2)
			expessura = 1;
		else
			expessura = 2;
		
		hexagonoSemFoco.transition()
				.duration(1500)
				.ease('out')
				.attr("opacity", 0.3); 
		hexagono
			.attr("opacity", 1) 
			.attr("stroke-dasharray", function() { return tipoLinha; })
			.style("stroke-width", expessura)
			.style("stroke", function(){ 
				
				if(valor == 6)
				 	return color(-1);
				else
					return "#000000";
			});
		}
	
	$(document).on("change", "select", function(){		
		console.log("OLA ENTREI NO SELECT: ");	
		var tipo = $(this).attr("id");
		console.log(tipo);
		var campos = tipo.split("_");
		console.log(campos[6]);
		var valor;
		
		if(campos[6] == "controle"){
			//valor = $(this).val();
			valor = $(this).val();
			console.log(valor);
			
			var dimensao = parseInt(campos[5])+1;
			console.log("sou a dimensao por parse", dimensao);
			
			atualizaLevel(dimensao, valor);
		} else {
			valor = $(this).val();
			atualizaLevel(campos[0], valor);
		}
	});


	$(document).on('mouseleave', ".panel", function(){	
		d3.selectAll('path')
			.transition()
			.duration(1250)
			.attr('opacity', 1);	
	}); 

	$(window).load(function(){	
		var sel = d3.select("#II1-form").property("value");
		console.log(sel);	
	});
	
function CriaLegenda(){
	
	var widthLegenda = 210,
	    heightLegenda = 60,
		svgLegenda = d3.select("#container-legenda-edit")
			.append("svg")
			.attr("preserveAspectRatio", "xMinYMin meet")	// Way to Go!! 
	    	.attr("viewBox","0 0 " + widthLegenda + " " + heightLegenda)  // Essas duas linhas deixam os gráficos reponsivos! =D
	    		.append('svg:g');
	var legenda = svgLegenda.append("rect")
		.attr("width", widthLegenda)
		.attr("height", heightLegenda)
		.attr("x", 0)
		.attr("y", 0)
		.attr("class", "legenda")
		.attr("fill", "#FFF");
		
	var legendRectSize = 6;
	var legendSpacingX = 13;
	var legendSpacingY = 6;
	
	var	legend = svgLegenda.selectAll('.legend')
		.data(["0", "1", "2", "3", "4", "5", "-1"])
		.enter().append('g')
		.attr("class", 'legend')
		//.attr("transform", function(d,i) {return "translate("+ ((i*35)+8) + ","+ "16)"; });
		.attr("transform", function(d,i) {return "translate(8 "  + (i * 6.5) + ")"; });
		
	legend.append('rect')
		.attr("width", legendRectSize)
		.attr("height", legendRectSize)
		.attr('x', 0)
	  	.attr('y', 12)
		.attr('stroke', function(d){
			if(d == "0"){
				return "#383838";
			}else{
				return color;
			}	
		})
		.attr('fill', color)
		.style("stroke-width", 1);
		
	legend.append("text")
	  .attr('x', function(d) {
	  	if(d == 0 || d == -1)
		{
			return 14;
		}else if (d == 1){
			return 14;
		}else if (d == 2){
			return 14;
		}else if (d == 3){
			return 14;
		}else if (d == 4){
			return 14;
		}else if (d == 5){
			return 14;
		}
	 })
	  .attr('y', 16)
	  .attr('fill', "#383838")
	  .attr('font-size', 4.5)
	  .text(function(d) { 
	  	if(d == 0)
		{
			return "Definido em tempo de uso";
		}else if (d == 1){
			return "Baixo";
		}else if (d == 2){
			return "Médio baixo";
		}else if (d == 3){
			return "Médio";
		}else if (d == 4){
			return "Médio alto";
		}else if (d == 5){
			return "Alto";
		}else if (d == -1){
			return "Não aplicável";
		}
	});
	svgLegenda.append("text")
	  .attr('x', 21)
	  .attr('y', 8)
	  .attr('fill', "#000")
	  .attr('font-size', 7)
	  .text("Valor");
	
	svgLegenda.append("text")
	  .attr('x', 114)
	  .attr('y', 8)
	  .attr('fill', "#000")
	  .attr('font-size', 7)
	  .text("Controle");
	  
	var espacamentoTextoX = 6;
	var espacamentoTextoY = 2;  
	  
	var	legendLevel = svgLegenda.selectAll('.legend-2')
		.data(["Sistema - Valor Fixo no Sistema", "Sistema - Valor Fixo no Tipo de Comunicação", "Sistema", "Outro Usuário", "Indivíduo", "Definido em Tempo de Uso", "Não Aplicável"])
		.enter().append('g')
		.attr("class", 'legend')
		.attr("transform", function(d,i) {return "translate(90 "  + (i * 6.5) + ")"; });

	legendLevel.append('line')
		.style("stroke", function(d,i){
			if(i == 6){
				return "#CCCCCC";
			}else{
				return "black";
			}
		})
		.attr("x1", 0)
		.attr("y1", 15)
		.attr("x2", 18)
		.attr("y2", 15)
		.attr("stroke-dasharray", function(d,i){ 
			if(i == 2)
			{
				return "6,1,6,1,6,1,6,1";
			}else if (i == 3){
				return "3, 3";
			}else if (i == 4){
				return "5,2,2,2,2,2";
			}else if (i == 5){
				return "1, 1";
			}
		})
		.attr("stroke-width", function(d,i){ 
	     	if(i == 0)
			{
				return 3;
			}else{
				return 1;
			}
		});
		
	legendLevel.append("text")
	  .attr('x', 25)
	  .attr('y', 17)
	  .attr('fill', "#383838")
	  .attr('font-size', 4.5)
	  .text(function(d) { return d; });
	
	};
	
