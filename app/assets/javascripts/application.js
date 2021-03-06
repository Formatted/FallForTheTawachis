// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function attending(event) {
    if(this.selectedIndex == 0) {
        document.getElementById('attending').style.display = 'block';
    } else if(this.selectedIndex == 1) {
        document.getElementById('attending').style.display = 'none';
    }
}

function partySize(event) {
    if(this.selectedIndex == 0) {
        document.getElementById('person1').style.display = 'none';
        document.getElementById('reservation_persons_attributes_1__destroy').value = true;
        document.getElementById('person2').style.display = 'none';
        document.getElementById('reservation_persons_attributes_2__destroy').value = true;
        document.getElementById('person3').style.display = 'none';
        document.getElementById('reservation_persons_attributes_3__destroy').value = true;
        document.getElementById('person4').style.display = 'none';
        document.getElementById('reservation_persons_attributes_4__destroy').value = true;
        document.getElementById('person5').style.display = 'none';
        document.getElementById('reservation_persons_attributes_5__destroy').value = true;

    } else if(this.selectedIndex == 1) {
        document.getElementById('person1').style.display = 'block';
        document.getElementById('reservation_persons_attributes_1__destroy').value = false;
        document.getElementById('person2').style.display = 'none';
        document.getElementById('reservation_persons_attributes_2__destroy').value = true;
        document.getElementById('person3').style.display = 'none';
        document.getElementById('reservation_persons_attributes_3__destroy').value = true;
        document.getElementById('person4').style.display = 'none';
        document.getElementById('reservation_persons_attributes_4__destroy').value = true;
        document.getElementById('person5').style.display = 'none';
        document.getElementById('reservation_persons_attributes_5__destroy').value = true;
    } else if(this.selectedIndex == 2) {
        document.getElementById('person1').style.display = 'block';
        document.getElementById('reservation_persons_attributes_1__destroy').value = false;
        document.getElementById('person2').style.display = 'block';
        document.getElementById('reservation_persons_attributes_2__destroy').value = false;
        document.getElementById('person3').style.display = 'none';
        document.getElementById('reservation_persons_attributes_3__destroy').value = true;
        document.getElementById('person4').style.display = 'none';
        document.getElementById('reservation_persons_attributes_4__destroy').value = true;
        document.getElementById('person5').style.display = 'none';
        document.getElementById('reservation_persons_attributes_5__destroy').value = true;
    } else if(this.selectedIndex == 3) {
        document.getElementById('person1').style.display = 'block';
        document.getElementById('reservation_persons_attributes_1__destroy').value = false;
        document.getElementById('person2').style.display = 'block';
        document.getElementById('reservation_persons_attributes_2__destroy').value = false;
        document.getElementById('person3').style.display = 'block';
        document.getElementById('reservation_persons_attributes_3__destroy').value = false;
        document.getElementById('person4').style.display = 'none';
        document.getElementById('reservation_persons_attributes_4__destroy').value = true;
        document.getElementById('person5').style.display = 'none';
        document.getElementById('reservation_persons_attributes_5__destroy').value = true;
    } else if(this.selectedIndex == 4) {
        document.getElementById('person1').style.display = 'block';
        document.getElementById('reservation_persons_attributes_1__destroy').value = false;
        document.getElementById('person2').style.display = 'block';
        document.getElementById('reservation_persons_attributes_2__destroy').value = false;
        document.getElementById('person3').style.display = 'block';
        document.getElementById('reservation_persons_attributes_3__destroy').value = false;
        document.getElementById('person4').style.display = 'block';
        document.getElementById('reservation_persons_attributes_4__destroy').value = false;
        document.getElementById('person5').style.display = 'none';
        document.getElementById('reservation_persons_attributes_5__destroy').value = true;
    } else if(this.selectedIndex == 5) {
        document.getElementById('person1').style.display = 'block';
        document.getElementById('reservation_persons_attributes_1__destroy').value = false;
        document.getElementById('person2').style.display = 'block';
        document.getElementById('reservation_persons_attributes_2__destroy').value = false;
        document.getElementById('person3').style.display = 'block';
        document.getElementById('reservation_persons_attributes_3__destroy').value = false;
        document.getElementById('person4').style.display = 'block';
        document.getElementById('reservation_persons_attributes_4__destroy').value = false;
        document.getElementById('person5').style.display = 'block';
        document.getElementById('reservation_persons_attributes_5__destroy').value = false;
    }
}

function reservationSize(event) {
    if(this.selectedIndex == 0) {
        document.getElementById('person1').style.display = 'none';
        document.getElementById('person2').style.display = 'none';
        document.getElementById('person3').style.display = 'none';
        document.getElementById('person4').style.display = 'none';
        document.getElementById('person5').style.display = 'none';

    } else if(this.selectedIndex == 1) {
        document.getElementById('person1').style.display = 'block';
        document.getElementById('person2').style.display = 'none';
        document.getElementById('person3').style.display = 'none';
        document.getElementById('person4').style.display = 'none';
        document.getElementById('person5').style.display = 'none';
    } else if(this.selectedIndex == 2) {
        document.getElementById('person1').style.display = 'block';
        document.getElementById('person2').style.display = 'block';
        document.getElementById('person3').style.display = 'none';
        document.getElementById('person4').style.display = 'none';
        document.getElementById('person5').style.display = 'none';
    } else if(this.selectedIndex == 3) {
        document.getElementById('person1').style.display = 'block';
        document.getElementById('person2').style.display = 'block';
        document.getElementById('person3').style.display = 'block';
        document.getElementById('person4').style.display = 'none';
        document.getElementById('person5').style.display = 'none';
    } else if(this.selectedIndex == 4) {
        document.getElementById('person1').style.display = 'block';
        document.getElementById('person2').style.display = 'block';
        document.getElementById('person3').style.display = 'block';
        document.getElementById('person4').style.display = 'block';
        document.getElementById('person5').style.display = 'none';
    } else if(this.selectedIndex == 5) {
        document.getElementById('person1').style.display = 'block';
        document.getElementById('person2').style.display = 'block';
        document.getElementById('person3').style.display = 'block';
        document.getElementById('person4').style.display = 'block';
        document.getElementById('person5').style.display = 'block';
    }
}

function AlertIt() {
    confirm("This is not available for beta.")
}

function warn() {
    confirm("Changing the email needs to contact support to make sure responses are routed correctly. Please call 310.469.1802 or open a support ticket.")
}

function invitation(event) {
    $("#invitation-link").attr("href", '/email_configurations/' + this.value)
    $("#invitation-link").text('Edit ' + $(this).find('option:selected').text() + ' Template')

}


function confimation(event) {
    $("#confirmation-link").attr("href", '/email_configurations/' + this.value )
    $("#confirmation-link").text('Edit ' + $(this).find('option:selected').text() + ' Template')
}


