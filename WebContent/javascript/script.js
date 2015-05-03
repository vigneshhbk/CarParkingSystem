$(document).ready(function(){
	$('.clockpicker').clockpicker();
	var date = new Date();
	date.setDate(date.getDate()-1);
	
	$('#fromDatePicker').datepicker({
		startDate: date
	});
	
	$('#toDatePicker').datepicker({
		startDate: date
	});
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
	jQuery('#fromDate').val(urlParam('fromDate'));
	jQuery('#toDate').val(urlParam('toDate'));
	jQuery('#fromTime').val(urlParam('fromTime'));
	jQuery('#toTime').val(urlParam('toTime'));
	var fromDate = jQuery('#fromDate').val();
	var toDate = jQuery('#toDate').val();
	var fromTime = jQuery('#fromTime').val();
	var toTime = jQuery('#toTime').val();
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
	    		var dataString = '<input type=\'button\' value=\'Book Now\' ' +
	    				'onclick=bookParkingLot('+data[index].lotId+',\''+fromDate+'\',\''+fromTime+'\',\''+toDate+'\',\''+toTime+'\');></input>';
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

function bookParkingLot(lotId, fromDate, fromTime, toDate, toTime){
	jQuery('#fromDate').val(urlParam('fromDate'));
	jQuery('#toDate').val(urlParam('toDate'));
	jQuery('#fromTime').val(urlParam('fromTime'));
	jQuery('#toTime').val(urlParam('toTime'));
	jQuery.ajax({
		url: "AjaxHandler",
		type: 'GET',
	    dataType: 'json',
	    data: {FieldId: "bookLot", LotId: lotId, FromDate: fromDate,
	    	ToDate: toDate, FromTime: fromTime, ToTime: toTime},
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function (data) {
	    	var url = window.location.origin + "/" + window.location.pathname.split("/")[1];
	    	var session;
	    	jQuery.each(data, function(index){
	    		if(data[index] != null){
	    			session = 1;
	    		}
	    		else{
	    			session = 0;
	    		}
	    	});
	    	
	    	if(session == 1){
		    	window.location = url+"/BookingSummary.jsp";
	    	}
	    	else{
	    		window.location = url+"/login.jsp";
	    	}
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
	if(fromDate != "" && toDate != "" && fromTime != "" && toTime != ""){
		var url = window.location.origin + "/" + window.location.pathname.split("/")[1];
		window.location = url+"/ViewParking.jsp?fromDate="+fromDate+"&toDate="+toDate+"&fromTime="+fromTime+"&toTime="+toTime;
	}
	else{
		alert("All fields are mandatory");
	}
	
}

function updateParking(){
	jQuery.ajax({
		url: "AjaxHandler",
		type: 'GET',
	    dataType: 'json',
	    data: {FieldId: "updateParkings"},
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
	    		var lotId = data[index].lotId;
	    		var dataString = "<a onclick=deleteLots("+lotId+");>Click here to delete this lot</a>";
	    	    $("#map").addMarker({
	    	    	coords: [data[index].latitude, data[index].longitude],
	    	    	title: data[index].name,
	    	    	text: dataString,
	    	    	id: data[index].name,
	    	    });
	    	});
	    	
    	    $("#map").addMarker({
    	    	address: "University of North Carolina at Charlotte: Main Office, University City Boulevard, Charlotte, North Carolina, USA",
    	    	title:"drag",
    	    	text:"drag",
    	    	icon: "http://localhost/Room_POC/images/Azure32.png",
    	    	draggable: true,
	    	});
	    },
	    error:function(data, status, er){
	    	alert("error: "+data+" status: "+status+" er:"+er);
	    }
	});
}

function deleteLots(lotId){
	var confirmBox = confirm("Are you sure you want to delete this lot?");
	if(confirmBox == true){
		jQuery.ajax({
			url: "AjaxHandler",
			type: 'GET',
		    dataType: 'json',
		    data: {FieldId: "deleteLots", LotId: lotId},
		    contentType: 'application/json',
		    mimeType: 'application/json',
		    success: function (data) {
		    	if(data == "1"){
		    		alert("A person has currently booked that slot, hence it cannot be deleted");
		    	}
		    	else{
		    		alert("Deleted successfully");
			    	updateParking();
		    	}
		    },
		    error:function(data, status, er){
		    	alert("error: "+data+" status: "+status+" er:"+er);
		    }
		});
	}
}

function displayPopup(){
	$( "#modalPopup" ).dialog({
		autoOpen: false,
		maxWidth:500,
        maxHeight: 235,
        width: 500,
        height: 235,
        modal: true,
		buttons: [
		{
			text: "Add",
			click: function() {
				addParkingLot();
			}
		},
		{
			text: "Cancel",
			click: function() {
				jQuery( this ).dialog( "close" );
			}
		}
		]
	});
}

function displayDetails(){
	jQuery("#ddlBuilding").empty();
	jQuery.ajax({
		url: "AjaxHandler",
		type: 'GET',
	    dataType: 'json',
	    data: {FieldId: "viewBuildings"},
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function (data) {    	
	    	jQuery.each(data, function(index){
	    		jQuery("#ddlBuilding").append('<option value='+data[index].buildingId+'>'+data[index].name+'</option>');
	    	});
	    },
	    error:function(data, status, er){
	    	alert("error: "+data+" status: "+status+" er:"+er);
	    }
	});
	
	jQuery( "#modalPopup" ).dialog( "open" );
	event.preventDefault();
}

function addParkingLot(){
	var lotName = jQuery('#txtLotName').val();
	var buildingId = jQuery('#ddlBuilding').val();
	var latitude = jQuery('#latitude').val();
	var longitude = jQuery('#longitude').val();
	var noOfSlots = jQuery('#txtNoOfSlots').val();
	jQuery.ajax({
		url: "AjaxHandler",
		type: 'GET',
	    dataType: 'json',
	    data: {FieldId: "addLot", LotName: lotName, BuildingId: buildingId, 
	    	Latitude: latitude, Longitude: longitude, NoOfSlots: noOfSlots},
	    contentType: 'application/json',
	    mimeType: 'application/json',
	    success: function (data) {
	    	if(data == "1"){
	    		alert("Lot added successfully");
	    		jQuery( "#modalPopup" ).dialog( "close" );
	    		updateParking();
	    	}
	    	else{
	    		alert("Unable to add lot");
	    	}
	    },
	    error:function(data, status, er){
	    	alert("error: "+data+" status: "+status+" er:"+er);
	    }
	});
}

function updateBuildings(){
	
	window.location = url+"/UpdateParking.jsp"
}

function getCurrentDate(){
	var currentDate = new Date();
	var month = currentDate.getMonth() + 1;
	var date = currentDate.getDate();
	if(month < 10){
		month = "0" + month;
	}
	
	if(date < 10){
		date = "0" + date;
	}
	
	return currentDate.getFullYear() + "-" + month + "-" + date;
}

function getCurrentTime(){
	var currentDate = new Date();
	return currentDate.getHours() + ":" + currentDate.getMinutes();
}

function checkFromDate(){
	if(jQuery("#fromDate").val() == ""){
		alert("Select \"From Date\"");
		return false;
	}
	else{
		return true;
	}
}

function validateFromDate(){
	jQuery("#fromTime").val("");
}

function validateFromTime(){
	var selectedDate = jQuery("#fromDate").val();
	var selectedTime = jQuery("#fromTime").val();
	var currentDate = getCurrentDate();
	var currentTime = getCurrentTime();
	if(!checkFromDate()){
		jQuery("#fromTime").val("");
	}
	else if(selectedDate == currentDate && selectedTime < currentTime){
		alert("You cannot select past date/time");
		jQuery("#fromTime").val("");
	}
}

function validateToDate(){
	if(!checkFromDate()){
		jQuery("#toDate").val("");
	}
	else if(jQuery("#toDate"). val() < jQuery("#fromDate").val()){
			alert("\"To Date\" should occur on or after \"From Date\"");
			jQuery("#toDate").val("");
	}
	
	jQuery("#toTime").val("");
}

function validateToTime(){
	var toDate = jQuery("#toDate").val();
	var fromDate = jQuery("#fromDate").val();
	var fromTime = jQuery("#fromTime").val();
	if(toDate == ""){
		alert("Select \"To Date\"");
		jQuery("#toTime").val("");
	}
	else if(fromTime == ""){
		alert("Select \"From Time\"");
		jQuery("#toTime").val("");
	}
	else{
		var toTime = jQuery("#toTime").val();
		if(fromDate == toDate && toTime <= fromTime){
			alert("\"To Time\" should occur after \"From Time\"");
			jQuery("#toTime").val("");
		}
	}
}