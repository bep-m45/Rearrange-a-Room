// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage

//= require jquery
//= require bootstrap-sprockets
//= require_tree .

$(function() {
     $('.hamburger').click(function() {
        $(this).toggleClass('active');
 
        if ($(this).hasClass('active')) {
            $('.globalMenuSp').addClass('active');
        } else {
            $('.globalMenuSp').removeClass('active');
        }
    });
    
 	$('.post_image').on('change', function (e) {
 	    var previewImage;
 	    if ($(".image")){
 	        previewImage = $(".image");
 	    }else{
 	        previewImage = $(".profile_image");
 	    }
 		var reader = new FileReader();
		reader.onload = function (e) {
		  previewImage.attr('src', e.target.result);
		}
  	    reader.readAsDataURL(e.target.files[0]);
    });
    
    $('#modalForm').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var modal = $(this);
        var cusnoVal = button.data('cusno');
        modal.find('.modal-body input#cusno').val(cusnoVal);
        var visitdayVal = button.data('visitday');
        modal.find('.modal-body input#oldday').val(visitdayVal);
    });
});

 //リプライコメント機能でのparent_idをいれる為の記述 
function inputCommentParentId(parentId){
    $("#room_comment_parent_id").val(parentId);
}
