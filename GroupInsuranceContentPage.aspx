<%@ Import Namespace="Sitecore.Analytics" %>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupInsuranceContentPage.aspx.cs" Inherits="GroupInsuranceUI.layouts.GroupInsurance.Layouts.GroupInsuranceContentPage" %>

<%@ Register TagPrefix="sc" Namespace="Sitecore.Web.UI.WebControls" Assembly="Sitecore.Kernel" %>
<%@ OutputCache Location="None" VaryByParam="none" %>
<!DOCTYPE html>

<html>
<head runat="server" id="head">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <link id="shortcutIcon" runat="server" rel="shortcut icon" href="/scripts/GroupInsurance/bootstrap-3.0.0/assets/ico/favicon.png" />
    <link id="alternateLanguage" rel="alternate" runat="server" hreflang="" href="" />
    <link href="/css/GroupInsurance/bootstrap/bootstrap.css" rel="stylesheet" />

    <link href="/css/GroupInsurance/bootstrap/font-awesome.css" rel="stylesheet" />
    <link href="/css/fontDefinitions.css" rel="stylesheet" media="screen" />
    <!--[if IE]>
        <link href="/css/fontDefinitionsIE.css" rel="stylesheet" />
    <![endif]-->

    <link rel="stylesheet" id="stylesheet" runat="server" visible="false" />
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>

    <!--[if lt IE 9]>
    <link rel="stylesheet" id="ltIE9Stylesheet" runat="server" visible="false" />
	<![endif]-->

    <script src="/scripts/GroupInsurance/bootstrap/jquery-1.10.2.js"></script>
    <script src="/scripts/GroupInsurance/bootstrap/bootstrap.min.js"></script>
    <script src="/scripts/GroupInsurance/html5shiv.js"></script>
    <script src="/scripts/GroupInsurance/respond.min.js"></script>
    <title>
        <sc:FieldRenderer runat="server" ID="text" FieldName="Title" />
    </title>


    <script type="text/javascript">

        $(document).ready(function () {

            //jaws to read the menu
            $("ul[role='menubar']>li>a").on("focus mouseover", function ()
            {
                if ($(this).parent('ul').attr('aria-hidden') == 'false') return;//don't fire if already set to this item
                $("ul[role='menubar']>li>ul[aria-hidden='false']").attr('aria-hidden', 'true');
                $(this).parent().children('ul').attr('aria-hidden', 'false');
                //console.log($(this).parent().children('ul').html());
                //to highlight the menu
            });

            $('a[href="' + unescape(document.location.pathname) + '"]').parent().parent().parent().addClass('active');

            //$(document).on('mouseup', function (e) {
            //    var container = $("#gen");
            //    var container1 = $("#searchClick");
            //    var container2 = $("#search");
            //
            //    if ((!container.is(e.target) // if the target of the click isn't the container...
            //        && container.has(e.target).length === 0) ||
            //        (!container1.is(e.target) // if the target of the click isn't the container...
            //        && container1.has(e.target).length === 0) ||
            //        (!container2.is(e.target) // if the target of the click isn't the container...
            //        && container2.has(e.target).length === 0))
            //
            //        // ... nor a descendant of the container
            //    {
            //        container.hide();
            //        $("#btnSearch").addClass('ini');
            //        $("#btnSearch").removeClass('ini1');
            //        $("#searchClick").addClass('ini');
            //        $("#searchClick").removeClass('ini1');
            //    }
            //
            //});

            $(document).keyup(function (e) {

                if (e.keyCode == 27 || e.keyCode == 9) {

                    if ($('#gen').css('display') == 'block' || $('#gn1').css('display') == 'block') {
                        $('#gen').css('display', 'none');
                        $('#gn1').css('display', 'none');

                        $("#btnSearch").addClass('ini');
                        $("#btnSearch").removeClass('ini1');
                        $("#searchClick").addClass('ini');
                        $("#searchClick").removeClass('ini1');
                    }
                }// esc or tab
            });

            function initSelect() {
                var theSelect = document.getElementById("selector");

                theSelect.changed = false;
                theSelect.onfocus = selectFocussed;
                theSelect.onchange = selectChanged;
                theSelect.onkeydown = selectKeyed;
                theSelect.onclick = selectClicked;

                return true;
            }

            function selectChanged(theElement) {
                var theSelect;

                if (theElement && theElement.value) {
                    theSelect = theElement;
                }
                else {
                    theSelect = this;
                }
                if (!theSelect.changed) {
                    return false;
                }
                alert("The select has been changed to " + theSelect.value);
                return true;
            }

            function selectClicked() {
                this.changed = true;
            }

            function selectFocussed() {
                this.initValue = this.value;
                return true;
            }

            function selectKeyed(e) {
                var theEvent;
                var keyCodeTab = "9";
                var keyCodeEnter = "13";
                var keyCodeEsc = "27";

                if (e) {
                    theEvent = e;
                }
                else {
                    theEvent = event;
                }

                if ((theEvent.keyCode == keyCodeEnter || theEvent.keyCode == keyCodeTab) && this.value != this.initValue) {
                    this.changed = true;
                    selectChanged(this);
                }
                else if (theEvent.keyCode == keyCodeEsc) {
                    this.value = this.initValue;
                }
                else {
                    this.changed = false;
                }

                return true;
            }
            if (document.location.hash) {
                var myAnchor = document.location.hash;
                $(myAnchor).attr('tabindex', -1).on('blur focusout', function () {
                    $(this).removeAttr('tabindex');
                }).focus();
            }
         
            
            $(":button").focusin(function () {
                $(this).css('border', '2px solid #F2CB7F');

            });

            $(":button").focusout(function () {
                $(this).css('border', '0px solid #F2CB7F');

            });
            
            // Highlight targets of in-page links when clicked.
            $("a[href^='#']").click(function (event) {
                var clickAnchor = "#" + this.href.split('#')[1];
                $(clickAnchor).attr('tabindex', -1).on('blur focusout', function () {
                    $(this).removeAttr('tabindex');
                }).focus();
            });

            // If there's a 'fade' id (used for error identification), highlight it and set focus to it.
            if ($('#fade').length) {
                $('#fade').attr('tabindex', -1).on('blur focusout', function () {
                    $(this).removeAttr('tabindex');
                }).focus();
            }


            var $window = $(window);

            checkWidth();
            equalHeight($(".bottomNav"));
            equalHeight($(".white"));


            $("a[href^='#']").click(function () {
                // get the href attribute of the internal link
                // then strip the first character off it (#)
                // leaving the corresponding id attribute
                $("#" + $(this).attr("href").slice(1) + "")
                  // give that id focus (for browsers that didn't already do so)
                  .focus();
            });

            $('#wb-skip1').on('keyup', function (e) {

                if (e.keyCode == 27) { //escape
                    $('#wb-cont').focus();
                    // esc
                }


            });

            $('#wb-skip2').on('keyup', function (e) {
                if (e.keyCode == 27) { //escape
                    $('#wb-nav a:first').focus();
                }

            });

            $("#searchClick").click(function () {
                //alert('click');
                if ($(this).hasClass('ini')) {

                    $('#search').appendTo('#gen');
                    $('#search').css('display', 'block');
                    $(this).removeClass('ini');
                    $(this).addClass('ini1');
                    $('#gen').fadeIn(50);
                    $(".gsc-input").focus();
                    $('#gen').css('position', 'relative').css('z-index', '500').css('margin-left','-200px');
                }
                else if ($(this).hasClass('ini1')) {
                    //  alert('click out');
                    $("#btnSearch").removeClass('ini1');
                    $("#btnSearch").addClass('ini');
                    $("#searchClick").removeClass('ini1');
                    $("#searchClick").addClass('ini');

                    $('#gen').fadeOut(50);
                    $(this).focusout();

                }
            });
            //apply equal hight for thumbnails

            function UpdateMobile() {


                if ($window.width() < 400) {
                    $('#ons').removeClass('col-xs-10').addClass('col-xs-9');
                    $('#xs').removeClass('col-xs-2').addClass('col-xs-3');
                }
                else if (($window.width() >= 400) && ($window.width() < 768)) {
                    $('#ons').removeClass('col-xs-9').addClass('col-xs-10');
                    $('#xs').removeClass('col-xs-3').addClass('col-xs-2');
                }
                $('#img_box2').css('display', 'none !important');
                $('#image2').css('display', 'none !important');

                $('#img_box1').removeClass('col-xs-6').addClass('col-xs-12');

                $('.container').css('max-width', 'inherit');
                $('#search').css('display', 'none');
                $('#searchClick').css('display', 'block');
                $('#mobileSearch').css('display', 'none');

                $('#bannerDesk').css('display', 'none');

                $('#mBanner').css('display', 'block');

                $('#img_box1').append($('#image1'));
                $('#img_box2').append($('#image2'));
                $('#newLogo').append($('#img_box1'));
                $('#newLogo').append($('#img_box2'));

                $('#topS').css('display', 'none');
                $('#newMenu3').append($('#nav'));
                $('#newMenu1').css('background-color', '#f2f2f2');


                $('#newOnlineServices').css('display', 'block');
                $('#newheaderrow').css('display', 'block');

                $('#h1a').append($('#h1r'));
                $('#h2a').append($('#h2r')); //add highlight 2 and 1
                $('#ctbr').remove();        //remove the highlight1 and highlight2 from the original pos
                $('#newh').css('display', 'block'); //display the row with the new added content

                $('#navM').css('display', 'block');
                $('#topS').css('display', 'block');

                $('#textMenu').css('display', 'block');


                $('#osb').css('display', 'none');

                $('#topheader').css('display', 'none');        //remove the highlight1 and highlight2 from the original pos //.container {
                $('#Div1').css('display', 'block');

                //display the row with the new added content
                $('#grayLinks').css('display', 'none');
                // $('#copyright').css('display', 'none');
                $('#hr').css('display', 'block');
                $("#tabCampaign").css('display', 'none');

                $('#CollTabs').css('display', 'none');
                $('#CollPills').css('display', 'block');

                $('#box1').appendTo($('#container_box1a'));
                $('#box2').appendTo($('#container_box2a'));
                $('#box3').appendTo($('#container_box3a'));
                $('#osh').css('padding-left', '0px');
                $('#oSearch').css('padding-left', '7%');

                $('#oSearch').css('width', '49%');
                $('#oLang').css('width', '51%');

                $('#oSearch').css('display', 'block').css('z-index', '99999');
                $('#oSearch').css('display', 'block');
            }

            function UpdateTablet() {
                
                $('#tablet_content_boxes1').css('display', 'block'); //
                $('#tablet_content_boxes2').css('display', 'block'); //

                $('#img_box1').append($('#image1'));
                $('#img_box2').append($('#image2'));
                $('#newLogo').append($('#img_box1'));
                $('#newLogo').append($('#img_box2'));

                $('#osh').css('padding-left', '30px');

                $('#h1a').append($('#h1r'))
                $('#h2a').append($('#h2r')); //add highlight 2 and 1
                $('#ctbr').remove();        //remove the highlight1 and highlight2 from the original pos
                $('#newh').css('display', 'block'); //display the row with the new added content
                $('#search').css('display', 'none');
                $('#searchClick').css('display', 'block');
                $('#hr').css('display', 'none');

                $("#tabCampaign").css('display', 'block');
                $('#oSearch').css('display', 'block').css('z-index', '99999');
                $('#oSearch').css('display', 'block');

                $('#navM').css('display', 'none');

                $('#box1').appendTo($('#container_box1'));
                $('#box2').appendTo($('#container_box2'));
                $('#box3').appendTo($('#container_box3'));
                $('#oSearch').css('padding-left', '10%');

                $('#oSearch').css('width', '49%');
                $('#oLang').css('width', '51%');

                $('#ons').removeClass('col-xs-9').addClass('col-xs-10');
                $('#xs').removeClass('col-xs-3').addClass('col-xs-2');

            }

            function UpdateDesktop() {
                
                //  alert('click out');
                if ($("#btnSearch").hasClass('ini1')) {
                    $("#btnSearch").removeClass('ini1');
                    $("#btnSearch").addClass('ini');
                }
                if ($("#searchClick").hasClass('ini1')) {
                    $("#searchClick").removeClass('ini1');
                    $("#searchClick").addClass('ini');
                }

                $('#oSearch').css('padding-left', '0px');
                $('.container').css('max-width', '');
                $("#tabCampaign").css('display', 'none');
                $('#oSearch').css('padding-top', '0px');
                $('#oSearch').append($("#search"));
                $('#hr').css('display', 'block');

                $('#mobileSearch').css('display', 'none');
                $('#search').css('display', 'block');
                $('#searchClick').css('display', 'none');

                $('#bannerDesk').css('display', 'block');
                $('#mBanner').css('display', 'none');
                $('#grayLinks').css('display', 'block');
                //$('#copyright').css('display', 'block');

                $('#navM').css('display', 'none');

                $('#textMenu').css('display', 'none');

                $('#topS').css('display', 'none');
                $('#newh').css('display', 'none');
                $('#hr').append($('#h1r')).append($('#h2r')).append($('#cp'));
                $('#hr').css('display', 'block');

                $('#newOnlineServices').css('display', 'none');
                $('#newheaderrow').css('display', 'none');

                $('#osb').css('display', 'block');
                $('#osh').css('padding-left', '30px');

                $('#topheader').css('display', 'block');

                $('#oNav').append($('#nav'));

                $('#img_box1').append($('#image1'));
                $('#img_box2').append($('#image2'));
                $('#newLogo').append($('#img_box1'));
                $('#newLogo').append($('#img_box2'));

                //reset the original layout
                $('#newheader').append($('#origHeader'));

                $('#CollTabs').css('display', 'block');
                $('#CollPills').css('display', 'none');

                $('#box1').appendTo($('#container_box1a'));
                $('#box2').appendTo($('#container_box2a'));
                $('#box3').appendTo($('#container_box3a'));

                $('#oServices').append($('#osh'));

                $('#oSearch').css('width', '80%');
                $('#oLang').css('width', '20%');


                $('#ons').removeClass('col-xs-9').addClass('col-xs-10');
                $('#xs').removeClass('col-xs-3').addClass('col-xs-2');

            }

            function checkWidth() {
                //mobile
                if ($window.width() < 760) { //extra small devices = phones         
                    UpdateMobile();
                }
                    //tablet
                else if ($window.width() >= 760 && $window.width() < 992) {
                    UpdateTablet();
                }
                    //desktop
                else {
                    UpdateDesktop();
                }
            }

            $(window).resize(function () {

                $("#gen").hide();
                $("#btnSearch").addClass('ini');
                $("#btnSearch").removeClass('ini1');
                $("#searchClick").addClass('ini');
                $("#searchClick").removeClass('ini1');
                checkWidth();
                equalHeight($(".bottomNav"));
                equalHeight($(".white"));
            });

            function equalHeight(group) {
                tallest = 0;
                group.each(function () {
                    thisHeight = $(this).height();
                    if (thisHeight > tallest) {
                        tallest = thisHeight;
                    }
                });
                group.each(function () { $(this).height(tallest); });
            }

            $(window).scroll(function () {
                if ($(this).scrollTop() > 100) {
                    $('.scrollup').fadeIn();
                } else {
                    $('.scrollup').fadeOut();
                }
            });

            $('.scrollup').click(function () {
                $("html, body").animate({
                    scrollTop: 0
                }, 600);
                return false;
            });

            $('#r').css('height', $('#l').css('height'));

        });

    </script>

    <script type="text/javascript" id="js">
        $(document).ready(function () {
            //extend the content all the way to the right when there is no content on the right hand side

            //$.trim($('#box3').html())
            if ($.trim($('#box1').html()) == "" && $.trim($('#box2').html()) == "" && $.trim($('#box2').html()) == "") {
                $('#pageContent').removeClass('col-lg-8').removeClass('col-md-8').addClass('col-lg-12').addClass('col-lg-12');
            }

            $('#languageSelect').val($('#language').val());
            $('#languageSelect').on('click', function () {

                if ($('#languageSelect').val() != $('#language').val()) // the enter key code
                    window.location.replace('/' + $('#languageSelect option:selected').val() + $('#baseURL').val());
            });

            $('#languageSelect').on('keypress', function (e) {
                var key = e.which;
                if (key == 13 && $('#languageSelect').val() != $('#language').val()) // the enter key code
                {
                    window.location.replace('/' + $('#languageSelect option:selected').val() + $('#baseURL').val());
                }
                else return;
            });


        });
    </script>



    <link rel="javascript" id="javascript" runat="server" visible="false" />
  <%--  <link rel="noscript" id="noscript" runat="server" visible="false" enableviewstate="false" />
    <link rel="javascript" id="inlineJavascript" runat="server" visible="false" enableviewstate="false" />
--%>


    <sc:VisitorIdentification ID="VisitorIdentification1" runat="server" />
</head>
<body runat="server" id="body">
		<!-- Google Tag Manager --> 
    <link rel="noscript" id="noscript" runat="server" visible="false" enableviewstate="false" />
    <link rel="javascript" id="inlineJavascript" runat="server" visible="false" enableviewstate="false" />
    <!-- End Google Tag Manager --> 	

    <form id="form1" runat="server">

        <asp:hiddenfield runat="server" id="baseURL" clientidmode="Static"></asp:hiddenfield>
        <asp:hiddenfield runat="server" id="language" clientidmode="Static"></asp:hiddenfield>
        <sc:placeholder runat="server" id="GroupInsuranceScroll" key="GroupInsuranceScroll"></sc:placeholder>

        <div class="container">
            <div class="row oLang" id="osbnew ">
                    <div class="col-xs-9 col-sm-10 col-md-8 col-lg-8 oLang" id="ons">
                    <sc:placeholder runat="server" id="GroupInsuranceOnlineServices" key="GroupInsuranceOnlineServices"></sc:placeholder>
                </div>

                <div id="wb-skip">
                      <sc:placeholder runat="server" id="GroupInsuranceSkipTo" key="GroupInsuranceSkipTo"></sc:placeholder>
                </div>

               <div class="col-xs-3 col-sm-2 col-md-4 col-lg-4 pull-right oLang" id="xs">

                    <div id="oSearch" style="float:left; width:50%">
                        <button id="searchClick" class="btn btn-default ini" style="display: none;" type="button"><i class="icon-search"></i></button>
                        <div class="gen" id="gen">
                        </div>
                        <div id="search" style="padding-right: 10px;">
                            <sc:placeholder runat="server" id="GroupInsuranceSearch" key="GroupInsuranceSearch"></sc:placeholder>
                        </div>
                    </div>
                     <div id="oLang" style="float:right; width:49%;">
                            <sc:placeholder runat="server" id="GroupInsuranceLanguage" key="GroupInsuranceLanguage"></sc:placeholder>
                        </div>
                   <div style="clear: both"></div>

                </div>

                  <div style="clear: both"></div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-6 col-md-6 col-xs-6" id="img_box1">
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-lg-6 col-md-6 col-xs-6" id="img_box2">
                </div>
            </div>
            <div class="row" id="newLogo" style="position: relative;z-index: 1;">
                <div class="col-sm-12 col-lg-12 col-md-12 col-xs-12">
                    <sc:placeholder runat="server" id="GroupInsuranceLogo" key="GroupInsuranceLogo"></sc:placeholder>
                </div>
            </div>
            <div class="row navM" id="navM">
                <div id="newMenu3" class="col-xs-12 col-sm-12 col-md-12 col-lg-12"></div>
            </div>
            <div class="row" id="osb">
                <div class="col-xs-8 col-sm-12 col-md-12 col-lg-12" id="oNav" aria-label="Main menu">
                    <sc:placeholder runat="server" id="GroupInsuranceNavbar" key="GroupInsuranceNavbar"></sc:placeholder>
                </div>
            </div>
            <!-- secondary nav here-->
            <div class="row" style="background-color: #ffffff;" id="secondaryNavigation">
                <div id="wb-nav">
                    <sc:placeholder runat="server" id="GroupInsurancePageContentMenu" key="GroupInsurancePageContentMenu"></sc:placeholder>
                </div>

                <div class="col-sm-12 col-md-8 col-lg-8" style="margin: auto; padding: 15px; background-color: transparent;" id="pageContent">
                    <!-- content here-->
                    <div id="wb-cont">
                        <sc:placeholder runat="server" id="GroupInsurancePageContent" key="GroupInsurancePageContent"></sc:placeholder>
                    </div>
                </div>

                <div class="col-sm-6 col-md-4 col-lg-4" style="margin: auto; padding: 15px; background-color: transparent;">
                    <div id="container_box1a">
                        <div style="padding: 5px;" id="box1">
                            <sc:placeholder runat="server" id="GroupInsurancePageContentPromotional" key="GroupInsurancePageContentPromotional"></sc:placeholder>
                        </div>
                    </div>

                    <div id="container_box2a">
                        <div style="padding: 5px;" id="box2">
                            <sc:placeholder runat="server" id="GroupInsurancePageContentRelated" key="GroupInsurancePageContentRelated"></sc:placeholder>
                        </div>
                    </div>

                    <div id="container_box3a">
                        <div style="padding: 5px;" id="box3">
                            <sc:placeholder runat="server" id="GroupInsurancePageContentOptional" key="GroupInsurancePageContentOptional"></sc:placeholder>
                        </div>
                    </div>
                </div>
            </div>

            <!-- tablet row-->
            <div id="tablet_content_boxes1" class="row" style="background-color: #ffffff; display: none;">
                <div class="col-sm-6" style="margin: auto; padding: 15px; background-color: transparent;" id="container_box1">
                </div>
                <div class="col-sm-6" style="margin: auto; padding: 15px; background-color: transparent;" id="container_box2">
                </div>
            </div>

            <div class="row" id="tablet_content_boxes2" style="background-color: #ffffff; display: none">
                <div class="col-sm-12" style="margin: auto; padding: 15px; background-color: transparent;" id="container_box3">
                </div>
            </div>

            <div class="row footerDiv" id="grayLinks" style="display: none">

                <sc:placeholder runat="server" id="GroupInsuranceAutoInsurance" key="GroupInsuranceAutoInsurance"></sc:placeholder>
                <sc:placeholder runat="server" id="GroupInsuranceHomeInsurance" key="GroupInsuranceHomeInsurance"></sc:placeholder>
                <sc:placeholder runat="server" id="GroupInsuranceOtherProducts" key="GroupInsuranceOtherProducts"></sc:placeholder>
                <sc:placeholder runat="server" id="GroupInsuranceClaims" key="GroupInsuranceClaims"></sc:placeholder>
                <sc:placeholder runat="server" id="GroupInsuranceGroupSponsors" key="GroupInsuranceGroupSponsors"></sc:placeholder>
                <sc:placeholder runat="server" id="GroupInsuranceAboutUs" key="GroupInsuranceAboutUs"></sc:placeholder>

            </div>

            <div class="row" id="copyright" style="max-height: 40px;">
                <sc:placeholder runat="server" id="GroupInsuranceFooter" key="GroupInsuranceFooter"></sc:placeholder>
            </div>

        </div>
    </form></body>
</html>

