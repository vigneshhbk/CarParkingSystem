$(document).ready(function(){
	$('.clockpicker').clockpicker();
	$('#fromDatePicker').datepicker();
	$('#toDatePicker').datepicker();
});

function urlParam(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
}

function displayBuildings(){
	alert('display buildings');
	jQuery('#fromDate').val(urlParam('fromDate'));
	jQuery('#toDate').val(urlParam('toDate'));
	jQuery('#fromTime').val(urlParam('fromTime'));
	jQuery('#toTime').val(urlParam('toTime'));
	jQuery.ajax({
		url: "AjaxHandler",
		type: 'GET',
	    dataType: 'json',
	    data: {FieldId: "viewBuildings"},
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function (data) {
	    	jQuery('#map').show();
	    	$("#map").googleMap({
	    	      zoom: 17, // Initial zoom level (optional)
	    	      coords: [35.30757, -80.728552], // Map center (optional)
	    	      type: "ROADMAP" // Map type (optional)
	    	});
	    	jQuery.each(data, function(index){
	    		var buildingId = data[index].buildingId;
	    		var dataString = "<a onclick=displayNearbyLots("+buildingId+");>Click here to view nearby parking lots</a>";
	    	    $("#map").addMarker({
	    	    	coords: [data[index].latitude, data[index].longitude],
	    	    	title: data[index].name,
	    	    	text: dataString,
	    	    	id: data[index].name,
	    	    });
	    	});
	    },
	    error:function(data, status, er){
	    	alert("error: "+data+" status: "+status+" er:"+er);
	    }
	});
}

function displayNearbyLots(buildingId){
	var fromDate = jQuery('#fromDate').val();
	var toDate = jQuery('#toDate').val();
	var fromTime = jQuery('#fromTime').val();
	var toTime = jQuery('#toTime').val();
	alert(fromDate);
	alert(toDate);
	fromTime = fromTime + ':00';
	toTime = toTime + ':00';
	jQuery.ajax({
		url: "AjaxHandler",
		type: 'GET',
	    dataType: 'json',
	    data: {FieldId: "viewNearbyLots", BuildingId: buildingId, FromDate: fromDate,
	    	ToDate: toDate, FromTime: fromTime, ToTime: toTime},
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function (data) {
	    	jQuery('#map').show();
	    	$("#map").googleMap({
	    	      zoom: 17, // Initial zoom level (optional)
	    	      coords: [35.30757, -80.728552], // Map center (optional)
	    	      type: "ROADMAP" // Map type (optional)
	    	});
	    	jQuery.each(data, function(index){
	    		var dataString = "Name: "+data[index].name+"\nSlotID: "+data[index].slotID;
	    	    $("#map").addMarker({
	    	    	coords: [data[index].latitude, data[index].longitude],
	    	    	title: data[index].name,
	    	    	text: dataString,
	    	    	id: data[index].name,
	    	    });
	    	});
	    },
	    error:function(data, status, er){
	    	alert("error: "+data+" status: "+status+" er:"+er);
	    }
	});
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

function redirectToViewParkings(){
	var fromDate = jQuery('#fromDate').val();
	var toDate = jQuery('#toDate').val();
	var fromTime = jQuery('#fromTime').val();
	var toTime = jQuery('#toTime').val();
	var url = window.location.origin + "/" + window.location.pathname.split("/")[1];
	window.location = url+"/ViewParking.jsp?fromDate="+fromDate+"&toDate="+toDate+"&fromTime="+fromTime+"&toTime="+toTime;
}