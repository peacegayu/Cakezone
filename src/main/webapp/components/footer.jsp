

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="common_css_js.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer Page</title>
        
    </head>
    <%@include file="common_css_js.jsp" %>
<div class="heading" id="contact">
    <h1>Contact us</h1>
</div>

<section class="contact">
    <div class="icons-container">

        <div class="icons">
            <i class="fas fa-phone"></i>
            <h3>our number</h3>
            <p>+91-7972609065</p>
            <p>+91-7249789065</p>
        </div>

        <div class="icons">
            <i class="fas fa-envelope"></i>
            <h3>our email</h3>
            <p>gschaudhari2704@gmail.com</p>
            <p>cgayatri044@gmail.com</p>
        </div>

        <div class="icons">
            <i class="fas fa-map-marker-alt"></i>
            <h3>our address</h3>
            <p>Chopda Dist-Jalgaon, Maharashtra, india - 4</p>
        </div>

    </div>

     <div class="row">
         <form action="">
             <h3>get in touch</h3>
             <div class="inputBox">
             <input type="text" placeholder="enter your name" class="box">
             <input type="text" placeholder="enter your email" class="box">
            </div>
            <div class="inputBox">
                <input type="number" placeholder="enter your number" class="box">
                <input type="text" placeholder="enter your subject" class="box">
               </div>
               <textarea placeholder=" your message" cols="30" rows="10"></textarea>
               <input type="submit" value="send message" class="btn">
         </form>
         <iframe class="map" src="https://maps.google.com/maps?width=600&amp;height=400&amp;hl=en&amp;q=chopda bus stand jalgaon maharashtra&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
         <!-- <div class="mapouter"><div class="gmap_canvas"><iframe class="gmap_iframe" width="100%" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?width=600&amp;height=400&amp;hl=en&amp;q=chopda bus stand jalgaon maharashtra&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe><a href="https://connectionsgame.org/">Connections NYT</a></div><style>.mapouter{position:relative;text-align:right;width:100%;height:400px;}.gmap_canvas {overflow:hidden;background:none!important;width:100%;height:400px;}.gmap_iframe {height:400px!important;}</style></div>-->
        </div>

</section>

      
</html>
