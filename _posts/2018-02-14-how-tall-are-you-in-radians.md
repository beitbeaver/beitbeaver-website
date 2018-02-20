---
layout: post
current: post
cover: assets/images/article-images/tape-measure.jpg
navigation: True
title: How Tall Are You In Radians?
date: 2018-02-14 15:00:00
tags: outside-imperial
class: post-template
subclass: 'post tag-outside-imperial'
author: beaver
excerpt: "Find out your height in radians with our simple calculator."
---

Find out your height in radians with our simple calculator. Enter your height below!

<center>
<form id="form" style="align-self:left" action="javascript:void(0);">
  Your height: <input type="text" name="original"> cm  
  <input style="background-color: black; border-radius: 10px; color: white; padding: 5px 14px; margin-top:15px;" type="submit" onclick="calculate()" value="Calculate!"/>
</form>
<br>
<div id="results" style="display: none;">
  <span id="kelvins"></span> kelvins<br/>
  <span id="degrees"></span> degrees<br/>
  <br/>
  <strong><span style="font-size: 200%;"><span id="radians"></span> radians</span></strong><br/>
</div>
<br/>
</center>

## What is a Kelvin?
This is Kelvin. He is tall.

![Kelvin, who is tall](assets/images/article-images/kelvin.jpg){:width="500px"}

<script>
  function calculate() {
    var cm = document.getElementById("form").elements[0].value;
    if (!isNaN(cm)) {
      var kelvins = cm / 190;
      var degrees = kelvins - 273.15;
      var radians = degrees * Math.PI / 180;

      document.getElementById("results").style.display = "inline";
      document.getElementById("kelvins").innerHTML = kelvins.toFixed(3);
      document.getElementById("degrees").innerHTML = degrees.toFixed(3);
      document.getElementById("radians").innerHTML = radians.toFixed(3);
    }
  }
</script>
