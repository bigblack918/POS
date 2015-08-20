var tabs;
var tip;

var zTreeObj;
var zTreeObj1;
var zTreeObj2;

var RF1 = false;
var RF2 = false;
var RFi = 0;

(function($) {
    // 把 $ bind 成 jQuery
    $(window).bind("beforeunload", function() {
        jQuery.post("${createLink(controller: 'ajax', action: 'close_window_event')}");
    });

    $(function() {
	$("body").layout({ applyDefaultStyles: true, north__padding: 0, north__minSize: 111, west__minSize: 100, west__size: 300 });

	$("#west-accordion").accordion({ fillSpace: true });

	zTreeObj = $("#west-ztree").zTree({
	    async: true,
	    asyncUrl: curApp + "/auth/ztreeMenu",
	    fontCss: { "font-size": "11pt" },
	    addDiyDom: function(treeid, node) {
		var obj = $("#" + node.tId + "_a");
		obj.click(function(ev) {
		    ev.preventDefault();
		    if (node.isParent == false && node.href) {
			add_iframe_tab({id: "TREE-" + node.id, title: node.name, url: node.href, parent_pageid: "0"});
		    }
		});
	    }
	});

	zTreeObj1 = $("#west-ztree-1").zTree({
	    async: true,
	    asyncUrl: curApp + "/auth/ztreeMenu1",
	    fontCss: { "font-size": "11pt" },
	    addDiyDom: function(treeid, node) {
		var obj = $("#" + node.tId + "_a");
		obj.click(function(ev) {
		    ev.preventDefault();
		    if (node.isParent == false && node.href) {
			add_iframe_tab({id: "TREE-" + node.id, title: node.name, url: node.href, parent_pageid: "0"});
		    }
		});
	    }
	});

	zTreeObj2 = $("#west-ztree-2").zTree({
	    async: true,
	    asyncUrl: curApp + "/auth/ztreeMenu2",
	    fontCss: { "font-size": "11pt" },
	    addDiyDom: function(treeid, node) {
		var obj = $("#" + node.tId + "_a");
		obj.click(function(ev) {
		    ev.preventDefault();
		    if (node.isParent == false && node.href) {
			add_iframe_tab({id: "TREE-" + node.id, title: node.name, url: node.href, parent_pageid: "0"});
		    }
		});
	    }
	});

	tabs = $("#app-tabs").tabs({
	    cache: true,
	    closable: true
	}).removeClass("ui-widget-content");

        add_iframe_tab({url: curApp + "/la400/index", parent_pageid: "0", id: "BOOK", title: "行事曆"});
        add_iframe_tab({url: curApp + "/board/list", parent_pageid: "0", id: "BOARD", title: "首頁"});
        tabs.tabs("remove", 0);

        $("#app-tabs a.ui-tabs-close-button").remove();

	var inputVal;
	$("#filter-input").keydown(function() {
	    inputVal = $(this).val();
	}).keyup(function() {
	    var text = $(this).val();
	    if (text != inputVal) {
		RFi += 1;
		RF1 = true;
		RF2 = true;
		RF1_wait(1000, RFi);
		zTreeObj.filter(text);
	    }
	}).blur(function() {
	    filter_input_blur(this);
	}).focus(function() {
	    filter_input_focus(this);
	}).addClass("empty");

	filter_input_blur(document.getElementById("filter-input"));

	$("#filter-clear").click(function() {
	    $("#filter-input").val("");
	    filter_input_blur(document.getElementById("filter-input"));
	    zTreeObj.filter("");
	});

	$(window).resize(function() {
	    delay(function() {
		readjust_size();
	    }, 200);
	});

	readjust_size();

    });
})(jQuery);

function readjust_size() {
    var h1 = jQuery("#west-ztree-container").parent().height();
    var h2 = jQuery("#west-filter").height();
    jQuery("#west-fake").height(h2);
    jQuery("#west-tree-ct").height(h1-h2);

    fit_tabs_height();
}

function filter_input_blur(el) {
    var q = jQuery(el);
    if (q.val() == "") {
	q.addClass("empty");
	q.css("color", "#cccccc");
	q.val("關鍵字");
    } else {
	q.removeClass("empty");
    }
}

// from Stack Overflow
var delay = (function(){
    var timer = 0;
    return function(callback, ms){
	clearTimeout (timer);
	timer = setTimeout(callback, ms);
    };
})();

function UUID() {
    var S4 = function() {
	return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
    };
    return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
}
// END "from Stack Overflow"

function fit_tabs_height() {
    // 減一點 px 微調
    var h2 = jQuery("#layout-center").height();
    var h3 = jQuery("#app-tabs").height(h2 - 10);
    var h4 = jQuery("#app-tabs ul.ui-tabs-nav").height();
    jQuery("#app-tabs div.ui-tabs-panel").height(h2 - h4 - 15);
}

function filter_input_focus(el) {
    var q = jQuery(el);
    if (q.hasClass("empty")) {
	q.val("");
    }
    q.css("color", "black");
}

function filter_input_blur(el) {
    var q = jQuery(el);
    if (q.val() == "") {
	q.addClass("empty");
	q.css("color", "#cccccc");
	q.val("關鍵字");
    } else {
	q.removeClass("empty");
    }
}

function addTab(tabObj, id, title, url, focus, remove_prev) {

    if (typeof(id) === "function") {
        id = id();
    }

    if (focus === undefined) {
	focus = true;
    }

    if (remove_prev === undefined) {
	remove_prev = false;
    }

    var idx = tabObj.tabs("findIndexById", id);
    var prevIdx = tabObj.tabs("option", "selected");

    if (idx === -1) {
	tabs.tabs("appendTabById", curApp + "/ajax/wrapUrlIframe?url=" + escape(url) + "&id=" + escape(id), title, id, true);
	fit_tabs_height();
	idx = tabObj.tabs("findIndexById", id);
    }

    if (focus) {
	tabObj.tabs("select", idx);
    }

    if (remove_prev)
	tabObj.tabs("remove", prevIdx);
}

function recursive_filter(treenode, filt_pattern) {
    var show1 = 0;
    treenode.eachChild(function(node2) {
	if (node2.leaf == false) {
	    // 如果 node2 仍然是 node 目錄就再 call 一次
	    var ret = recursive_filter(node2, filt_pattern);
	    if (ret > 0) {
		// 假如回傳的值 > 0 表示目錄裡面仍然有東西
		node2.ui.show();
	    } else {
		// <= 0 表示目錄裡面完全沒東西符合 pattern，把目錄也隠藏起來
		node2.ui.hide();
	    }
	} else {
	    // 如果符合就 show()，不符合就 hide()
	    if (node2.text.match(filt_pattern) == null) {
		node2.ui.hide();
	    } else {
		node2.ui.show();
		show1 += 1;
	    }
	}
    });
    return show1;
}

function RF1_wait(time, i) {
    setTimeout("if (RFi == " + i + ") { RF1 = false; }" , time);
}

function remove_cur_tab() {
    tabs.tabs("remove", tabs.tabs("option", "selected"));
}

function remove_tab(id) {
    tabs.remove(tabs.getItem(id));
}

function add_iframe_tab(map) {
    if (map.focus === undefined)
	map.focus = true;

    if (map.remove_prev === undefined)
	map.remove_prev = false;

    var idx = tabs.tabs("findIndexById", map.id);
    var prevIdx = tabs.tabs("option", "selected");

    if (idx === -1) {
	tabs.tabs("appendTabById", curApp + "/general/wrap_url_iframe2?url=" + escape(map.url) + "&parent_pageid=" + map.parent_pageid + "&pageid=" + escape(map.id), map.title, map.id, true);
	fit_tabs_height();
	idx = tabs.tabs("findIndexById", map.id);
    }

    if (map.focus)
	tabs.tabs("select", idx);

    if (map.remove_prev)
	tabs.tabs("remove", prevIdx);

    pageid_context.register(map.parent_pageid, map.id);
}

var PageIdContext = function() {
    // root means the root of the tree of all pageid
    // "0" means the node comes directly from function panel (and thus has no parent).
    this.root = {0: {}};
    this.flat = [];
}

PageIdContext.prototype = {
    register: function(pid, cid) {
        var find_key_in_context = function(c, k) {
            var p;
            jQuery.each(c, function(k1, v) {
                if (k1 == k) {
                    p = v;
                    return;
                } else {
                    p = find_key_in_context(v, k);
                }
            });
            if (p) return p;
        }

        if (jQuery.grep(pageid_context.flat, function(v, i) { return ((v.pid == pid) && (v.cid == cid)) }).length == 0)
            this.flat.push({pid: pid, cid: cid});

        var p = find_key_in_context(this.root, pid);
        p[cid] = {};
    },
    parent_of: function(cid) {
        var pid;
        jQuery.each(this.flat, function(i, v) {
            if (v.cid == cid) {
                pid = v.pid;
                return;
            }
        })
        return pid;
    },
    children_of: function(pid) {
        var r = []
        jQuery.each(this.flat, function(i, v) {
            if (v.pid == pid) r.push(v.cid);
        });
        return r;
    }
}

var pageid_context = new PageIdContext();
