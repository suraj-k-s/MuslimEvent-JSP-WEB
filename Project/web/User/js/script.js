var isSplash = -1;
function start(){
	
};
function startF(){	
	setTimeout(function () {
		//$('.car1').css({marginRight:-500}).stop().delay(100).animate({marginRight:0},1200,'easeOutBack');
	}, 200);
};
function showSplash(){
	setTimeout(function () {		
		$('.main1').stop().animate({'top':'50%', 'marginTop':'-25px'}, 800, "easeInOutBack");		
	}, 400);	
};
function hideSplash(){ 
	//$('.main1').stop().animate({'marginTop':'-70px'}, 800, "easeOutExpo");		
	$('.main1').stop().animate({'top':'0%', 'marginTop':'10px'}, 800, "easeInOutBack");		
};
function hideSplashQ(){
	$('.main1').css({'top':'0%', 'marginTop':'10px'});
};

/////////////////////// ready
$(document).ready(function() {
	MSIE8 = ($.browser.msie) && ($.browser.version == 8),
	$.fn.ajaxJSSwitch({
		classMenu:".menu",
		classSubMenu:".submenu",
		topMargin: 180,//mandatory property for decktop
		bottomMargin: 90,//mandatory property for decktop
		topMarginMobileDevices: 180,//mandatory property for mobile devices
		bottomMarginMobileDevices: 90,//mandatory property for mobile devices
		delaySubMenuHide: 300,
		fullHeight: true,
		bodyMinHeight: 700,
		menuInit:function (classMenu, classSubMenu){
			//classMenu.find(">li").each(function(){
			//	$(">a", this).append("<div class='openPart'></div>");
			//})
		},
		buttonOver:function (item){            
            $('>.txt1',item).stop().animate({'color':'#ffebbb'},300,'easeOutCubic');
		},
		buttonOut:function (item){            
            $('>.txt1',item).stop().animate({'color':'#b29b65'},300,'easeOutCubic');           
		},
		subMenuButtonOver:function (item){
		},
		subMenuButtonOut:function (item){
		},
		subMenuShow:function(subMenu){        	
        	subMenu.stop(true,true).animate({"height":"show"}, 500, "easeOutCubic");
		},
		subMenuHide:function(subMenu){
        	subMenu.stop(true,true).animate({"height":"hide"}, 700, "easeOutCubic");
		},
		pageInit:function (pages){
			//console.log('pageInit');
		},
		currPageAnimate:function (page){
			//console.log('currPageAnimate');
			var Delay=400; // default
			if(isSplash==-1){ // on reload				
				hideSplashQ();
				Delay=0;				
			}
			if(isSplash==0){ // on first time click				
				hideSplash();
				Delay=800;
			}
			isSplash = 2;
			
			// animation of current page
			jQuery('body,html').animate({scrollTop: 0}, 0); 
			
			page.css({"left":$(window).width()}).stop(true).delay(Delay).animate({"left":0}, 1000, "easeOutCubic", function (){
					$(window).trigger('resize');
			});    	
		},
		prevPageAnimate:function (page){
			//console.log('prevPageAnimate');
			page.stop(true).animate({"display":"block", "left":-$(window).width()}, 500, "easeInCubic");
		},
		backToSplash:function (){
			//console.log('backToSplash');
			if(isSplash==-1){
				isSplash = 0;
				startF();				
			}
			else{
				isSplash = 0;				
				showSplash();
			};
			$(window).trigger('resize');			      
		},
		pageLoadComplete:function (){
			//console.log('pageLoadComplete');            
    }
	});  /// ajaxJSSwitch end

	////// sound control	
	$("#jquery_jplayer").jPlayer({
		ready: function () {
			$(this).jPlayer("setMedia", {
				mp3:"music.mp3"
			});
			//$(this).jPlayer("play");
			var click = document.ontouchstart === undefined ? 'click' : 'touchstart';
          	var kickoff = function () {
            $("#jquery_jplayer").jPlayer("play");
            document.documentElement.removeEventListener(click, kickoff, true);
         	};
          	document.documentElement.addEventListener(click, kickoff, true);
		},
		
		repeat: function(event) { // Override the default jPlayer repeat event handler				
				$(this).bind($.jPlayer.event.ended + ".jPlayer.jPlayerRepeat", function() {
					$(this).jPlayer("play");
				});			
		},
		swfPath: "js",
		cssSelectorAncestor: "#jp_container",
		supplied: "mp3",
		wmode: "window"
	});
	


	

	
	
	
	

	
		
});

/////////////////////// load
$(window).load(function() {	
	setTimeout(function () {					
  		$('#spinner').fadeOut();		
  		$(window).trigger('resize');
  		start();
	}, 100);
	setTimeout(function () {$("#jquery_jplayer").jPlayer("play");}, 2000);	
});