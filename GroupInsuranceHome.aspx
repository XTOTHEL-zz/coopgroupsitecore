<%@ Import Namespace="Sitecore.Analytics" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupInsuranceHome.aspx.cs" Inherits="GroupInsuranceUI.layouts.GroupInsurance.Layouts.CooperatorsGroupInsurance.GroupInsuranceHome" %>

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
        <script src="/scripts/GroupInsurance/html5shiv.js"></script>
    <script src="/scripts/GroupInsurance/respond.min.js"></script>
    <![endif]-->

    <script src="/scripts/GroupInsurance/bootstrap/jquery-1.10.2.js"></script>
    <script src="/scripts/GroupInsurance/bootstrap/bootstrap.min.js"></script>

    <title>
        <sc:FieldRenderer runat="server" ID="text" FieldName="Title" />
    </title>

    <script type="text/javascript">
        $(document).ready(function () {

            //jaws to read the menu
            $("ul[role='menubar']>li>a").on("focus mouseover", function () {
                if ($(this).parent('ul').attr('aria-hidden') == 'false') return;//don't fire if already set to this item
                $("ul[role='menubar']>li>ul[aria-hidden='false']").attr('aria-hidden', 'true');
                $(this).parent().children('ul').attr('aria-hidden', 'false');
                //console.log($(this).parent().children('ul').html());
            });
            /*
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
            */
            /*
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

            var $window = $(window);
            checkWidth();
            equalHeight($(".bottomNav"));
            equalHeight($(".white"));
            equalHeight($('.highlight'));

            $("#searchClick").click(function () {
                //alert('click');
                if ($(this).hasClass('ini')) {

                    $('#search').appendTo('#gen');
                    $('#search').css('display', 'block');
                    $(this).removeClass('ini');
                    $(this).addClass('ini1');
                    $('#gen').fadeIn(50);
                    $(".gsc-input").focus();
                    $('#gen').css('position', 'relative').css('z-index', '500').css('margin-left', '-200px');
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
                //$('#bannerDesk').css('display', 'none');
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
                $('#newh').css('display', 'block').css("padding-top", "5px"); //display the row with the new added content

                $('#navM').css('display', 'block');
                $('#topS').css('display', 'block');

                $('#osb').css('display', 'none');
                //$('#osbnew').css('display', 'none');

                $('#topheader').css('display', 'none');        //remove the highlight1 and highlight2 from the original pos //.container {
                $('#Div1').css('display', 'block');

                //display the row with the new added content
                $('#grayLinks').css('display', 'none');

                $('#hr').css('display', 'none');
                $("#tabCampaign").css('display', 'none');

                $('#CollTabs').css('display', 'none');
                $('#CollPills').css('display', 'block');

                $('#box1').appendTo($('#container_box1a'));
                $('#box2').appendTo($('#container_box2a'));
                $('#box3').appendTo($('#container_box3a'));
                $('#osh').css('padding-left', '0px');
                $('#bnrCont').css('padding-right', '30px').css('padding', '5px').css('padding-bottom', '0px');
                $('#oSearch').css('padding-left', '7%');
                $('#oSearch').css('width', '49%');
                $('#oLang').css('width', '51%');

            }

            function UpdateTablet() {
                UpdateDesktop();
                $('.thumbnail').css('margin-top', '5px !important');
                $('#oSearch').css('padding-left', '10%');
                $('#bnrCont').css('padding-right', '30px');

                $('#bnrCont').css('padding', '5px').css('padding-bottom', '0px');;

                $('#osh').css('padding-left', '30px');
                $('#image2').css('display', 'block');
                $('#box1').appendTo($('#container_box1'));
                $('#box2').appendTo($('#container_box2'));
                $('#box3').appendTo($('#container_box3'));

                $('#img_box1').append($('#image1'));
                $('#img_box2').append($('#image2'));
                $('#newLogo').append($('#img_box1'));
                $('#newLogo').append($('#img_box2'));

                //$('#lang').css('padding-top', '8px');

                $('#h1a').append($('#h1r'))
                $('#h2a').append($('#h2r')); //add highlight 2 and 1
                $('#ctbr').remove();        //remove the highlight1 and highlight2 from the original pos
                $('#newh').css('display', 'block').css("padding-top", "0px");  //display the row with the new added content
                $('#search').css('display', 'none');
                $('#searchClick').css('display', 'block');
                $('#hr').css('display', 'none');

                //$('#oSearch').css('padding-top', '8px').css('height', '50px').css('display', 'block').css('z-index', '99999');
                //   $('#oSearch').css('display', 'block').css('z-index', '99999');

                $('#oSearch').css('width', '49%');
                $('#oLang').css('width', '51%');

                $('#ons').removeClass('col-xs-9').addClass('col-xs-10');
                $('#xs').removeClass('col-xs-3').addClass('col-xs-2');


            }

            function UpdateDesktop() {

                $('.thumbnail').css('margin-top', '0px !important');
                if ($("#btnSearch").hasClass('ini1')) {
                    $("#btnSearch").removeClass('ini1');
                    $("#btnSearch").addClass('ini');
                }
                if ($("#searchClick").hasClass('ini1')) {
                    $("#searchClick").removeClass('ini1');
                    $("#searchClick").addClass('ini');
                }

                $('#oSearch').css('padding-left', '0px');
                $('#image2').css('display', 'block');
                $('#bnrCont').css('padding', '30px');
                $('#bnrCont').css('padding-right', '0px');

                $('#osh').css('padding-left', '30px');

                $('#box1').appendTo($('#container_box1a'));
                $('#box2').appendTo($('#container_box2a'));
                $('#box3').appendTo($('#container_box3a'));

                $('.container').css('max-width', '');
                $("#tabCampaign").css('display', 'none');
                $('#oSearch').css('padding-top', '0px');
                $('#hr').css('display', 'block');
                $('#mobileSearch').css('display', 'none');
                $('#oSearch').append($("#search"));
                $('#search').css('display', 'block');


                //  $('#oSearch').append($('#search'));


                $('#searchClick').css('display', 'none');

                //$('#osh').css('margin-right', '0px');

                //$('#bannerDesk').css('display', 'block');
                $('#mBanner').css('display', 'none');
                $('#grayLinks').css('display', 'block');

                $('#navM').css('display', 'none');
                $('#topS').css('display', 'none');
                $('#newh').css('display', 'none').css("padding-top", "0px");
                $('#hr').append($('#h1r')).append($('#h2r')).append($('#cp'));
                $('#hr').css('display', 'block');

                $('#newOnlineServices').css('display', 'none');
                $('#newheaderrow').css('display', 'none');

                $('#osb').css('display', 'block');

                $('#topheader').css('display', 'block');

                $('#oNav').append($('#nav'));

                $('#img_box1').append($('#image1'));
                $('#img_box2').append($('#image2'));
                $('#newLogo').append($('#img_box1'));
                $('#newLogo').append($('#img_box2'));

                $('#oServices').append($('#osh'));
                //reset the original layout
                $('#newheader').append($('#origHeader'));

                $('#CollTabs').css('display', 'block');
                $('#CollPills').css('display', 'none');

                $('#oSearch').css('width', '80%');
                $('#oLang').css('width', '20%');

            }

            function checkWidth() {
                //mobile
                if ($window.width() < 768) { //extra small devices = phones         
                    UpdateMobile();

                }
                    //tablet
                else if ($window.width() >= 768 && $window.width() < 992) {
                    UpdateTablet();

                }
                    //desktop
                else {




                    UpdateDesktop();
                }
            }

            $(window).resize(function () {

                $("#gen").hide();
                checkWidth();
                equalHeight($(".bottomNav"));
                equalHeight($(".white"));
                equalHeight($('.highlight'));



                $("#btnSearch").addClass('ini');
                $("#btnSearch").removeClass('ini1');
                $("#searchClick").addClass('ini');
                $("#searchClick").removeClass('ini1');

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

            $(":button").focusin(function () {
                $(this).css('border', '2px solid #F2CB7F');

            });

            $(":button").focusout(function () {
                $(this).css('border', '0px solid #F2CB7F');

            });

        */
        });
    </script>

    <script type="text/javascript" id="js">
        $(document).ready(function () {
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
    <sc:VisitorIdentification ID="VisitorIdentification1" runat="server" />
    
</head>
<body runat="server" id="body">
        <!-- inline custom js --> 
    <link rel="noscript" id="noscript" runat="server" visible="false" enableviewstate="false" />
    <link rel="javascript" id="inlineJavascript" runat="server" visible="false" enableviewstate="false" />
    <!-- inline custom js -->   


    <form id="form1" runat="server">
        <asp:hiddenfield runat="server" id="baseURL" clientidmode="Static"></asp:hiddenfield>
        <asp:hiddenfield runat="server" id="language" clientidmode="Static"></asp:hiddenfield>

    <sc:placeholder runat="server" id="GroupInsuranceScroll" key="GroupInsuranceScroll"></sc:placeholder>
    <div class="container">

        <div class="row" id="osbnew">

            <div class="col-xs-9 col-sm-10 col-md-8 col-lg-8 oLang" id="ons">
                <sc:placeholder runat="server" id="GroupInsuranceOnlineServices" key="GroupInsuranceOnlineServices"></sc:placeholder>
            </div>

            <div id="wb-skip">
                <sc:placeholder runat="server" id="GroupInsuranceSkipTo" key="GroupInsuranceSkipTo"></sc:placeholder>
            </div>

            <div class="col-xs-3 col-sm-2 col-md-4 col-lg-4 pull-right oLang" id="xs">

                <div id="oSearch">
                    <button id="searchClick" class="btn btn-default ini" style="display: none;" type="button"><i class="icon-search"></i></button>
                    <div class="gen" id="gen" style="display:none;">
                    </div>
                    <div id="search">
                        <sc:placeholder runat="server" id="GroupInsuranceSearch" key="GroupInsuranceSearch"></sc:placeholder>
                    </div>
                </div>
                <div id="oLang">
                    <sc:placeholder runat="server" id="GroupInsuranceLanguage" key="GroupInsuranceLanguage"></sc:placeholder>
                </div>
                <div style="clear: both"></div>

            </div>

            <div style="clear: both"></div>
        </div>

        <!--logo-->
        <div class="row" id="newLogo" style="position: relative; z-index: 1;">
            <sc:placeholder runat="server" id="GroupInsuranceLogo" key="GroupInsuranceLogo"></sc:placeholder>
        </div>

        <!--mobile nav-->
        <div class="row navM" id="navM" style="display: none;">
            <div id="newMenu3" class="col-xs-12 col-sm-12 col-md-12 col-lg-12"></div>
        </div>

        <!--nav-->
        <div class="row" id="osb" style="display: block;">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="oNav" aria-label="Main menu">
                <sc:placeholder runat="server" id="GroupInsuranceNavbar" key="GroupInsuranceNavbar"></sc:placeholder>
            </div>
        </div>

        <!--alerts-->
        <sc:placeholder runat="server" id="GroupInsuranceAlerts" key="GroupInsuranceAlerts"></sc:placeholder>

        <!--banner and rightCTA-->
        <div id="banners" class="row">
            <!--main banner-->
            <div id="bnrCont" class="col-xs-12 col-sm-7 col-md-9 col-lg-9">
                <sc:placeholder runat="server" id="Placeholder1" key="GroupInsuranceQuoteBanner"></sc:placeholder>
            </div>
                    
            <!--Manage policy circle callout -->    
            <div id="bnrCTA" class="col-xs-12 col-sm-5 col-md-3 col-lg-3">
                <sc:placeholder runat="server" id="Placeholder2" key="GroupInsuranceContestCampaignETC"></sc:placeholder>
            </div>
        </div>

        <!--teasers-->
        <div id="teasers" class="row cta">
            <div class="col-sm-6 col-md-3 col-lg-3 col-xs-12 text-center">
                <sc:placeholder runat="server" id="GroupInsuranceHighlightbox1" key="GroupInsuranceHighlightbox1"></sc:placeholder>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3 col-xs-12 text-center">
                <sc:placeholder runat="server" id="GroupInsuranceHighlightbox2" key="GroupInsuranceHighlightbox2"></sc:placeholder>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3 col-xs-12 text-center">
                <sc:placeholder runat="server" id="GroupInsuranceHighlightbox3" key="GroupInsuranceHighlightbox3"></sc:placeholder>
            </div>
            <div class="col-sm-6 col-md-3 col-lg-3 col-xs-12 text-center">
                <sc:placeholder runat="server" id="GroupInsuranceHighlightbox4" key="GroupInsuranceHighlightbox4"></sc:placeholder>
            </div>
        </div>

    </div>

    <!--footer-->
    <footer class="footerCopyright">
        <sc:placeholder runat="server" id="GroupInsuranceFooter" key="GroupInsuranceFooter"></sc:placeholder>
    </footer>

    </form></body>
</html>