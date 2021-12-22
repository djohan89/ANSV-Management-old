
	$(document).ready(function(){
		var groupColumn = 2;
		/*Option table 1  */
		$('#example_1').DataTable( {
		    "scrollY": 300,
		    "scrollX": true,
		    "scrollCollapse": true,
		    "paging":         false,
		    "responsive": true,
		    "displayLength": 25,
		    "columnDefs": [
	            { "visible": false, "targets": groupColumn },
	            ],
		    "order": [
	            [groupColumn, 'asc']
	        ],
		    "drawCallback": function(settings) {
	            var api = this.api();
	            var rows = api.rows({ page: 'current' }).nodes();
	            var last = null;

	            api.column(groupColumn, { page: 'current' }).data().each(function(group, i) {
	                if (last !== group) {
	                    $(rows).eq(i).before(
	                        '<tr class="group">' + 
	                        	'<td colspan="18" align="center" style="background-color: #D3D3D3;">' + 
	                        		'<b>----- ' + group + ' -----</b>' + 
	                        	'</td>' + 
	                        '</tr>'
	                    );

	                    last = group;
	                }
	            });
	        },

		} );
		$('#example_1 tbody').on('click', 'tr.group', function() {
	        var currentOrder = example_1.order()[0];
	        if (currentOrder[0] === groupColumn && currentOrder[1] === 'asc') {
	            example_1.order([groupColumn, 'desc']).draw();
	        } else {
	            example_1.order([groupColumn, 'asc']).draw();
	        }
	    });
		
		/* Option table 2 */
		
		$('#example_2').DataTable( {
		    "scrollY": 300,
		    "scrollX": true,
		    "scrollCollapse": true,
		    "paging":         false,
		    "responsive": true,
		    "displayLength": 25,
		    "columnDefs": [
	            { "visible": false, "targets": groupColumn },
	            ],
		    "order": [
	            [groupColumn, 'asc']
	        ],
		    "drawCallback": function(settings) {
	            var api = this.api();
	            var rows = api.rows({ page: 'current' }).nodes();
	            var last = null;

	            api.column(groupColumn, { page: 'current' }).data().each(function(group, i) {
	                if (last !== group) {
	                    $(rows).eq(i).before(
	                        '<tr class="group">' + 
	                        	'<td colspan="18" align="center" style="background-color: #D3D3D3;">' + 
	                        		'<b>----- ' + group + ' -----</b>' + 
	                        	'</td>' + 
	                        '</tr>'
	                    );

	                    last = group;
	                }
	            });
	        },

		} );
		$('#example_2 tbody').on('click', 'tr.group', function() {
	        var currentOrder = example_1.order()[0];
	        if (currentOrder[0] === groupColumn && currentOrder[1] === 'asc') {
	            example_1.order([groupColumn, 'desc']).draw();
	        } else {
	            example_1.order([groupColumn, 'asc']).draw();
	        }
	    });
		
		/*Option table 3  */
		$('#example_3').DataTable( {
		    "scrollY": 300,
		    "scrollX": true,
		    "scrollCollapse": true,
		    "paging":         false,
		    "responsive": true,
		    "displayLength": 25,
		    "columnDefs": [
	            { "visible": false, "targets": groupColumn },
	            ],
		    "order": [
	            [groupColumn, 'asc']
	        ],
		    "drawCallback": function(settings) {
	            var api = this.api();
	            var rows = api.rows({ page: 'current' }).nodes();
	            var last = null;

	            api.column(groupColumn, { page: 'current' }).data().each(function(group, i) {
	                if (last !== group) {
	                    $(rows).eq(i).before(
	                        '<tr class="group">' + 
	                        	'<td colspan="18" align="center" style="background-color: #D3D3D3;">' + 
	                        		'<b>----- ' + group + ' -----</b>' + 
	                        	'</td>' + 
	                        '</tr>'
	                    );

	                    last = group;
	                }
	            });
	        },

		} );
		$('#example_3 tbody').on('click', 'tr.group', function() {
	        var currentOrder = example_1.order()[0];
	        if (currentOrder[0] === groupColumn && currentOrder[1] === 'asc') {
	            example_1.order([groupColumn, 'desc']).draw();
	        } else {
	            example_1.order([groupColumn, 'asc']).draw();
	        }
	    });
		
		var owl = $('.owl-carousel');
	  	owl.owlCarousel({
	       items: 1,
	       loop: true,
	       nav: true,
	       margin: 10,
	       autoplay: true,
	       autoplayTimeout: 5000,
	       responsiveClass: true,
	       autoplayHoverPause: true
	   	});
	    
	  	owl.on('mousewheel', '.owl-stage', function (e) {
	        if (e.deltaY>0) {
	            owl.trigger('next.owl');
	        } else {
	            owl.trigger('prev.owl');
	        }
	        e.preventDefault();
	    });
		
	  	$('#myModal').modal('show');
		$('div.dataTables_wrapper').addClass("change_font_size");
	});