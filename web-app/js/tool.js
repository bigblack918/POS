function datepicker(id) {
    jQuery(function(){
        jQuery("#" + id).wrap('<span id="' + id + '_date_chooser_span" />').datepick({
            dateFormat: 'yy/mm/dd',
            showOn: 'button',
            buttonImageOnly: true,
            buttonImage: "/POS/images/calendar.png",
            yearRange: 'c-10:c+2',
            beforeShow: function (input, inst) {
                var rect = input.getBoundingClientRect();
                setTimeout(function () {
                        inst.dpDiv.css({ top: rect.top + 30, left: rect.left + 0 });
                }, 0);
            }
        }).blur(function() {
            var u = jQuery(this);
            var q = u.val().match(/^(\\d{3})(\\d{2})(\\d{2})\$/);
            if (q != null) {
                u.val(q[1] + "/" + q[2] + "/" + q[3]);
            }
        }).addClass("date");
    });
}
