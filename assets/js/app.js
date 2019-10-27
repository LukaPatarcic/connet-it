/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

// any CSS you require will output into a single css file (app.css in this case)
require('../css/app.css');

import $ from 'jquery';
import jQuery from 'jquery';
import 'jquery-ui/themes/base/core.css';
import 'jquery-ui/themes/base/theme.css';
import 'jquery-ui/themes/base/draggable.css';
import 'jquery-ui/ui/core';
import 'jquery-ui/ui/widgets/draggable';
import 'jquery-ui/ui/widgets/droppable';
global.$ = $;
global.jQuery = jQuery;

var img1 = $('.img1');
var img2 = $('.img2');
var img3 = $('.img3');
var img4 = $('.img4');

img1.draggable();
img2.draggable();
img3.draggable();
img4.draggable();

window.json = {};
window.array = [];
$( ".droppable" ).droppable({
    drop: function( event, ui ) {
        ui.draggable[0].classList.add('d-none');
        var img = ui.draggable[0];
        var questionId = img.closest('.question').getAttribute('data-id');
        array.push(img.getAttribute('data-id'));
        json[questionId] = array;
    }
});

var next = $('.next');
var questionList = $('.question');
var nextCounter = 0;
var number = $('.numberCounter');
var numberCounter = 1;

next.click(function () {
    numberCounter++;
    console.log(number,numberCounter)
    number.text('' + numberCounter);
    nextCounter++;
    window.array = [];
    $(this).closest('.question').addClass('d-none');
    if(nextCounter == questionList.length) {
        $('.finish').removeClass('d-none');
        clearTimeout(t);
        sendGameData();
        timerDiv.classList.add('d-none');
        $('#time').text($('.timer').text())

    } else {
        questionList[nextCounter].classList.remove('d-none');
    }
});




document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems);
});
var timerDiv = document.getElementById('timer'),
    intro = document.getElementById('intro'),
    next = document.getElementById('next'),
    questionDiv = document.getElementsByClassName('question'),
    h1 = document.getElementsByClassName('timer')[0],
    start = document.getElementById('start'),
    seconds = 0, minutes = 0, hours = 0,
    t;

function add() {
    seconds++;
    if (seconds >= 60) {
        seconds = 0;
        minutes++;
        if (minutes >= 60) {
            minutes = 0;
            hours++;
        }
    }

    h1.textContent = (hours ? (hours > 9 ? hours : "0" + hours) : "00") + ":" + (minutes ? (minutes > 9 ? minutes : "0" + minutes) : "00") + ":" + (seconds > 9 ? seconds : "0" + seconds);

    timer();
}
function timer() {
    t = setTimeout(add, 1000);
}


/* Start button */
start.onclick = function() {
    timer();
    timerDiv.classList.remove('d-none');
    intro.style.display = 'none';
    questionDiv[0].classList.remove('d-none');
};

function sendGameData() {
    window.json['time'] = $('.timer').text();
    $.ajax({
        url: '/result/process',
        type: 'POST',
        data: JSON.stringify(window.json),
        success: function (response) {
            var points = $('#points');
            points.text(response.points)
        }
    })
}

// /* Stop button */
// stop.onclick = function() {
//     clearTimeout(t);
// }
//
// /* Clear button */
// clear.onclick = function() {
//     h1.textContent = "00:00:00";
//     seconds = 0; minutes = 0; hours = 0;
// }



