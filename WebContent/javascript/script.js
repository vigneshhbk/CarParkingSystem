function displayBuildings(){
	jQuery('#map').show();
	$("#map").googleMap({
	      zoom: 17, // Initial zoom level (optional)
	      coords: [35.30757, -80.728552], // Map center (optional)
	      type: "ROADMAP" // Map type (optional)
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.3080687, -80.7248944],
	    	title: 'East Entrance',
	    	text: 'East Entrance'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.31293652, -80.73003352],
	    	title: 'North Entrance',
	    	text: 'North Entrance'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30200978, -80.74168503],
	    	title: 'West Entrance',
	    	text: 'West Entrance'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.29797317, -80.73689997],
	    	title: 'Foundation',
	    	text: 'Foundation'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30122174, -80.73693216],
	    	title: 'South Entrance',
	    	text: 'South Entrance'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.31053767, -80.72952926],
	    	title: 'Student Health Centre',
	    	text: 'Student Health Centre'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30745582, -80.73243678],
	    	title: 'Burson',
	    	text: 'Burson'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30995983, -80.73939979],
	    	title: 'Rose Football Centre',
	    	text: 'Rose Football Centre'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.31261259, -80.74024737],
	    	title: 'Motorsports Research',
	    	text: 'Motorsports Research'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30523192, -80.73321998],
	    	title: 'Cone University Centre',
	    	text: 'Cone University Centre'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30410244, -80.72778046],
	    	title: 'Niner House',
	    	text: 'Niner House'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30864655, -80.73371351],
	    	title: 'Student Union',
	    	text: 'Student Union'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30214112, -80.73361695],
	    	title: 'Residence Dining Hall',
	    	text: 'Residence Dining Hall'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30173835, -80.73535502],
	    	title: 'Scott Hall',
	    	text: 'Scott Hall'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.31155325, -80.72743714],
	    	title: 'Hawthorn Hall',
	    	text: 'Hawthorn Hall'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30841891, -80.73016226],
	    	title: 'Facilities Operations Parking Services',
	    	text: 'Facilities Operations Parking Services'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.31093164, -80.73230803],
	    	title: 'Witherspoon Hall',
	    	text: 'Witherspoon Hall'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30302547, -80.7334882],
	    	title: 'Sanford Hall',
	    	text: 'Sanford Hall'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30541579, -80.7355696],
	    	title: 'Belk Gym',
	    	text: 'Belk Gym'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30377847, -80.73585927],
	    	title: 'Memorial Hall',
	    	text: 'Memorial Hall'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30730698, -80.73667467],
	    	title: 'Halton Wagner Complex',
	    	text: 'Halton Wagner Complex'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30752587, -80.73570907],
	    	title: 'Woodward Hall',
	    	text: 'Woodward Hall'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30908431, -80.74162066],
	    	title: 'EPIC',
	    	text: 'EPIC'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.31220987, -80.73043048],
	    	title: 'Facilities Management',
	    	text: 'Facilities Management'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.31130811, -80.74188888],
	    	title: 'Grigg Hall',
	    	text: 'Grigg Hall'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30549459, -80.7373184],
	    	title: 'Irwin Belk Track & Field',
	    	text: 'Irwin Belk Track & Field'
	    });
	    
	    $("#map").addMarker({
	    	coords: [35.30885668, -80.74379861],
	    	title: 'High School',
	    	text: 'High School'
	    });	    
	    document.getElementById("map").style.display = "block";
	    document.getElementById("btnViewBuildings").style.display="none";
}

function disableCreditCardFields(checkBox){
	if(jQuery(checkBox).is(':checked') == true){
		jQuery('#creditCardNumber').attr("disabled", "disabled");
		jQuery('#cvv').attr("disabled", "disabled");
		jQuery('#cardName').attr("disabled", "disabled");
		jQuery('#validUpto').attr("disabled", "disabled");		
	}
	else{
		jQuery('#creditCardNumber').removeAttr("disabled");
		jQuery('#cvv').removeAttr("disabled");
		jQuery('#cardName').removeAttr("disabled");
		jQuery('#validUpto').removeAttr("disabled");	
	}
}

function confirmPassword(textBox){
	if(textBox.value != jQuery('#password').val()){
		textBox.setCustomValidity('Passwords must match!');
	}
	else{
		textBox.setCustomValidity('');
	}
}