<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head><script src='//static.codepen.io/assets/editor/live/console_runner-ce3034e6bde3912cc25f83cccb7caa2b0f976196f2f2d52303a462c826d54a73.js'></script><script src='//static.codepen.io/assets/editor/live/css_live_reload_init-890dc39bb89183d4642d58b1ae5376a0193342f9aed88ea04330dc14c8d52f55.js'></script><meta charset='UTF-8'><meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//static.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" /><link rel="mask-icon" type="" href="//static.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" /><link rel="canonical" href="https://codepen.io/GrahamWilsdon/pen/OVoaNQ?limit=all&page=16&q=main" />


<style class="cp-pen-styles">
/*! normalize.css v1.0.0 | MIT License | git.io/normalize */
/* =============================================================================
   HTML5 display definitions
   ========================================================================== */
@import url(https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400|Montserrat:400,700);

article,
aside,
details,
figcaption,
figure,
footer,
header,
hgroup,
main,
nav,
section,
summary {
  display: block;
}
audio,
canvas,
video {
  display: inline-block;
  *display: inline;
  *zoom: 1;
}
audio:not([controls]) {
  display: none;
}
[hidden] {
  display: none;
}
/* =============================================================================
   Base
   ========================================================================== */
/*
 * 1. Correct text resizing oddly in IE6/7 when body font-size is set using em units
 * 2. Force vertical scrollbar in non-IE
 * 3. Prevent iOS text size adjust on device orientation change, without disabling user zoom: h5bp.com/g
 */
*,
*:before,
*:after {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  -o-box-sizing: border-box;
  -ms-box-sizing: border-box;
  box-sizing: border-box;
}
html, body {
  height: 100%;
}
html {
  font-size: 100%;
  overflow-y: scroll;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
}
body {
  margin: 0;
  padding: 0;
}

input[type=button],
input[type=submit],
input[type=text],
input[type=search],
input[type=password],
select,
button,
textarea {
  margin: 0;
  cursor: pointer;
  outline: none;
  vertical-align: top;
}
input[type=submit] {
  border: none 0;
  -webkit-appearance: none;
  -webkit-border-radius: 0px;
}
input[type=radio],
input[type=checkbox] {
  margin: 0;
  padding: 0;
}
input[type=text],
input[type=search],
select,
textarea {
  cursor: default;
}
button {
  border: none 0;
}
*:first-child + html input.button {
  overflow: visible;
  /* remove padding from left/right */
  width: auto !important;
}
/*
 * Remove text-shadow in selection highlight: h5bp.com/i
 * These selection declarations have to be separate
 * Also: hot pink! (or customize the background color to match your design)
 */
::selection {
  color: #fff;
  background-color: #328efd;
}
::-moz-selection {
  color: #fff;
  background-color: #328efd;
}
a {
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}
a:hover,
a:focus,
a:active {
  text-decoration: none;
}
a:hover,
a:active {
  outline: 0;
  text-decoration: none;
}
/* =============================================================================
   Typography
   ========================================================================== */
h1,
h2,
h3,
h4,
h5,
h6 {
  margin: 0;
  padding: 0;
}
blockquote {
  margin: 1em 40px;
}
hr {
  display: block;
  height: 1px;
  border: 0;
  border-top: 1px solid #ccc;
  margin: 1em 0;
  padding: 0;
}
/* =============================================================================
   Lists
   ========================================================================== */
ul,
ol {
  margin: 0;
  padding: 0;
}
ul {
  list-style: none;
}
dd {
  margin: 0 0 0 40px;
}
nav ul,
nav ol {
  list-style: none;
  margin: 0;
  padding: 0;
}
/* =============================================================================
   Embedded content
   ========================================================================== */
/*
 * Improve image quality when scaled in IE7
 * code.flickr.com/blog/2008/11/12/on-ui-quality-the-little-things-client-side-image-resizing/
 */
img {
  border: 0;
  -ms-interpolation-mode: bicubic;
}
/*
 * Correct overflow displayed oddly in IE9
 */
svg:not(:root) {
  overflow: hidden;
}
/* =============================================================================
   Figures
   ========================================================================== */
figure {
  margin: 0;
}
/* =============================================================================
   Forms
   ========================================================================== */
form {
  margin: 0;
}
fieldset {
  border: 0;
  margin: 0;
  padding: 0;
}
/* Indicate that 'label' will shift focus to the associated form element */
label {
  cursor: pointer;
}
/*
 * 1. Correct color not inheriting in IE6/7/8/9
 * 2. Correct alignment displayed oddly in IE6/7
 */
legend {
  border: 0;
  *margin-left: -7px;
  padding: 0;
}
/*
 * 1. Correct font-size not inheriting in all browsers
 * 2. Remove margins in FF3/4 S5 Chrome
 * 3. Define consistent vertical alignment display in all browsers
 */
button,
input,
select,
textarea {
  font-size: 100%;
  margin: 0;
  vertical-align: baseline;
  *vertical-align: middle;
}
/* Select styling in Firefox */
@-moz-document url-prefix() {
  select {
    padding: 0.8em 0.75em;
  }
}
/*
 * 1. Define line-height as normal to match FF3/4 (set using !important in the UA stylesheet)
 */
button,
input {
  line-height: normal;
}
*:first-child + html input.button {
  overflow: visible;
  /* remove padding from left/right */
  width: auto !important;
}
/*
 * 1. Display hand cursor for clickable form elements
 * 2. Allow styling of clickable form elements in iOS
 * 3. Correct inner spacing displayed oddly in IE7 (doesn't effect IE6)
 */
button,
input[type="button"],
input[type="reset"],
input[type="submit"] {
  cursor: pointer;
  -webkit-appearance: button;
  *overflow: visible;
}
input[type=submit] {
  -webkit-appearance: none;
  -webkit-border-radius: 0px;
}
/*
 * Consistent box sizing and appearance
 */
input[type="checkbox"],
input[type="radio"] {
  margin: 0;
  padding: 0;
}
input[type="search"] {
  -webkit-appearance: textfield;
  -moz-box-sizing: content-box;
  -webkit-box-sizing: content-box;
  box-sizing: content-box;
}
input[type="search"]::-webkit-search-decoration {
  -webkit-appearance: none;
}
/*
 * Remove inner padding and border in FF3/4: h5bp.com/l
 */
button::-moz-focus-inner,
input::-moz-focus-inner {
  border: 0;
  padding: 0;
}
/*
 * 1. Remove default vertical scrollbar in IE6/7/8/9
 * 2. Allow only vertical resizing
 */
textarea {
  overflow: auto;
  vertical-align: top;
  resize: vertical;
}
/* Colors for form validity */
input:invalid,
textarea:invalid {
  background-color: #f0dddd;
}
/* =============================================================================
   Tables
   ========================================================================== */
table {
  border-collapse: collapse;
  border-spacing: 0;
}
/* =============================================================================
   Non-semantic helper classes
   Please define your styles before this section.
   ========================================================================== */
/* Hide from both screenreaders and browsers: h5bp.com/u */
.hidden {
  display: none !important;
  visibility: hidden;
}
/* Hide only visually, but have it available for screenreaders: h5bp.com/v */
.visuallyhidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}
/* Extends the .visuallyhidden class to allow the element to be focusable when navigated to via the keyboard: h5bp.com/p */
.visuallyhidden.focusable:active,
.visuallyhidden.focusable:focus {
  clip: auto;
  height: auto;
  margin: 0;
  overflow: visible;
  position: static;
  width: auto;
}
/* Hide visually and from screenreaders, but maintain layout */
.invisible {
  visibility: hidden;
}
/* Contain floats: h5bp.com/q */
.clearfix:before,
.clearfix:after {
  content: "";
  display: table;
}
.clearfix:after {
  clear: both;
}
.clearfix {
  *zoom: 1;
}
/* #Typography Variables
================================================== */
/* #Colour Variables
================================================== */
a {
  text-decoration: none;
}
h1 {
  font-size: 2.350em;
  line-height: 1.25;
  font-weight: 300;
}
/* =============================================================================
   Layout
   ========================================================================== */
body {
  font-size: 100%;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  font-family: 'Source Sans Pro', helvetica, sans-serif;
  color: #333333;
  line-height: 1.6;
  font-weight: normal;
  background-color: #3babf1;
}
.container {
  position: relative;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
.container.toggled {
  -webkit-filter: blur(8px);
  -moz-filter: blur(8px);
  -o-filter: blur(8px);
  -ms-filter: blur(8px);
  filter: blur(8px);
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}

/*  */
div.screen {
  margin: 0 auto;
  width: 80%;
  height: 80%;
  overflow: hidden;
  position: relative;
  top: 10%;
  background-color: #333333;
  -webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.25);
  -moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.25);
  box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.25);
}
div.screen nav.main-nav {
  position: absolute;
  left: 0;
  top: 0;
  z-index: 0;
  height: 80%;
  width: 80%;
  padding: 2em;
  -webkit-opacity: 0;
  -moz-opacity: 0;
  opacity: 0;
  -webkit-transform: scale(0.85);
  -ms-transform: scale(0.85);
  transform: scale(0.85);
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
div.screen nav.main-nav.toggled {
  display: block;
  z-index: 10;
  -webkit-transform: scale(1);
  -ms-transform: scale(1);
  transform: scale(1);
  -webkit-opacity: 1;
  -moz-opacity: 1;
  opacity: 1;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
div.screen nav.main-nav ul {
  padding: 2em 0 0 0;
}
div.screen nav.main-nav ul li {
  border-bottom: 1px solid rgba(255, 255, 255, 0.15);
}
div.screen nav.main-nav ul li a {
  font-size: 1.250em;
  color: #fff;
  padding: 1em 0;
  font-weight: 300;
  display: block;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
div.screen nav.main-nav ul li a:last-child {
  border: none;
}
div.screen nav.main-nav ul li a:hover {
  -webkit-opacity: 0.45;
  -moz-opacity: 0.45;
  opacity: 0.45;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
  padding: 1em;
}
div.screen header {
  position: absolute;
  top: 0;
  z-index: 15;
}
div.screen header a.target-burger {
  margin: 1.125em;
  width: 3.250em;
  height: 3.250em;
  position: absolute;
  display: block;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
}
div.screen header a.target-burger:hover {
  cursor: pointer;
  -webkit-opacity: 0.45;
  -moz-opacity: 0.45;
  opacity: 0.45;
}
div.screen header a.target-burger.toggled ul.buns li.bun {
  -webkit-transform: rotate(45deg) translateZ(0);
  transform: rotate(45deg) translateZ(0);
}
div.screen header a.target-burger.toggled ul.buns li.bun:last-child {
  -webkit-transform: rotate(-45deg) translateZ(0);
  transform: rotate(-45deg) translateZ(0);
}
/* 메뉴아이콘 */
div.screen header a.target-burger ul.buns {
  
  list-style: none;
  margin: -0.8125em 0 0 -0.8125em;
  padding: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transition: -webkit-transform 1s cubic-bezier(0.23, 1, 0.32, 1), color 1s cubic-bezier(0.23, 1, 0.32, 1);
  transition: transform 1s cubic-bezier(0.23, 1, 0.32, 1), color 1s cubic-bezier(0.23, 1, 0.32, 1);
  -webkit-transform: translateZ(0);
  transform: translateZ(0);
  color: #fff;
}
@media (min-width:601px) {
	div.screen header a.target-burger ul.buns{
		width: 1.825em;
  		height: 1.825em;
	}
}
@media (min-width:993px) {
	div.screen header a.target-burger ul.buns{
		width: 2.825em;
  		height: 2.825em; 
	}
	
div.screen header a.target-burger ul.buns li.bun {
  width: 100%;
  height: 2px;
  background-color: #fff;
  position: absolute;
  top: 50%;
  margin-top: -0.75px;
  -webkit-transform: translateY(-3.75px) translateZ(0);
  transform: translateY(-3.75px) translateZ(0);
  -webkit-transition: -webkit-transform 1s cubic-bezier(0.23, 1, 0.32, 1), background-color 1s cubic-bezier(0.23, 1, 0.32, 1);
  transition: transform 1s cubic-bezier(0.23, 1, 0.32, 1), background-color 1s cubic-bezier(0.23, 1, 0.32, 1);
}
div.screen header a.target-burger ul.buns li.bun:last-child {
  -webkit-transform: translateY(3.75px) translateZ(0);
  transform: translateY(3.75px) translateZ(0);
}
div.screen div.app-content {
  position: relative;
  z-index: 5;
}
div.screen div.app-content ul.content-list li article figure {
  position: relative;
}
div.screen div.app-content ul.content-list li article figure:before {
  content: '';
  position: absolute;
  z-index: 2;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, 0.35);
}
div.screen div.app-content ul.content-list li article figure img {
  width: 100%;
  line-height: 1;
  display: block;
}
div.screen div.app-content ul.content-list li article figure figcaption {
  color: #fff;
  position: absolute;
  z-index: 5;
  bottom: 0;
  padding: 2em 2em 2.5em 2em;
}
div.screen div.app-content ul.content-list li article figure figcaption h1,
div.screen div.app-content ul.content-list li article figure figcaption span {
  -webkit-text-shadow: 0px 0px 10px rgba(0, 0, 0, 0.25);
  -moz-text-shadow: 0px 0px 10px rgba(0, 0, 0, 0.25);
  text-shadow: 0px 0px 10px rgba(0, 0, 0, 0.25);
}
div.screen div.app-content ul.content-list li article figure figcaption h1 {
  padding: 0 0 0.25em 0 ;
  margin: 0 0 0.25em 0;
  border-bottom: 1px solid rgba(255, 255, 255, 0.25);
}
div.screen div.app-content ul.content-list li article figure figcaption span {
  font-family: 'Montserrat', sans-serif;
  display: block;
}
div.screen div.app-content ul.content-list li article figure figcaption span.category {
  letter-spacing: 0.2em;
  text-transform: uppercase;
  font-size: 0.8em;
  padding: 0 0 0.3em;
  color: rgba(255, 255, 255, 0.7);
}
div.screen div.app-content ul.content-list li article figure figcaption span.price {
  font-size: 1.3em;
  float: right;
}
/* =============================================================================
   Mixins & Functions
   ========================================================================== */
.inline-block {
  display: inline-block;
  *display: inline;
  *zoom: 1;
}


@media (min-width:601px) {
	div.screen{
		width: 500px;
	}
}

@media (min-width:993px) {
	div.screen{
		width: 1500px;
	}

}
</style>
</head>
<body>
<div class="screen">
  <header>
    <a class="target-burger">
      <ul class="buns">
        <li class="bun"></li>
        <li class="bun"></li>
      </ul>
      <!--buns-->
    </a>
    <!--target-burger-->
  </header>
  <nav class="main-nav" role="navigation">
    <ul>
      <li><a href=""><span>My Account</span></a></li>
      <li><a href=""><span>Billing Information</span></a></li>
      <li><a href=""><span>Order Tracker</span></a></li>
      <li><a href=""><span>Change Password</span></a></li>
      <li><a href=""><span>Log Out</span></a></li>
    </ul>
  </nav>
  <!--main-nav-->
  <div class="container">
    <div class="app-content">
      <ul class="content-list">
        <li>
          <article>
            <figure>
              <img src="https://unsplash.imgix.net/photo-1428930377079-45a584b6dd6b?dpr=2&fit=crop&fm=jpg&h=1575&q=75&w=1050" alt="The Jim Lewis Dalaman Briefcase">
              <figcaption>
                <span class="category">Accessories</span>
                <h1>Eli DeFaria Dalaman</h1>
                <span class="price"> &pound;255</span>
              </figcaption>
            </figure>
          </article>
        </li>
      </ul>
      <!--content-list-->
    </div>
    <!--app-content-->
  </div>
  <!--contaienr-->
</div>
<!--screen-->
<script src='//static.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script><script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script >//Custom JS
$(document).ready(function(){
	$('a.target-burger').click(function(e){
		$('div.container, nav.main-nav, a.target-burger').toggleClass('toggled');
		e.preventDefault();
	});//target-burger-click
});//doc-rdy
//# sourceURL=pen.js
</script>
</body></html>