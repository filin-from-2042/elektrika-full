<?php
    $this->load->helper('url');
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="<?=$this->cDescription?>">
    <meta name="keywords" content="<?=$this->cKeywords?>">
    <meta name="author" content="">
    <link rel="icon" href="/images/favicon.ico">

<title><?=$this->cTitle?></title>

<!-- Bootstrap core CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="/css/bootstrap-theme.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/css/style.css" rel="stylesheet">

</head>
<body>
<header>
    <div class="navbar navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a id="logo" href="#" class="navbar-brand"><img src="/images/logo.png"></a>
            </div>
            <div class="navbar-collapse collapse navbar-right">
                <ul class="nav navbar-nav">
                    <li><?= anchor('home', '<img src="/images/home.png">')?></li>
                    <li><a href="<?=site_url('about')?>">О Компании</a></li>
<!--                    <li><a href="">PORTFOLIO</a></li>-->
                    <li><a href="<?=site_url('services')?>">Услуги</a></li>
                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown">BLOG<span class="caret"></span></a>
                        <ul  class="dropdown-menu" role="menu">
                            <li id="arrow-sub" class="hidden-xs"><img src="/images/arrow-sub.png"></li>
                            <li><a href="">App Media</a></li>
                            <li><a href="">Branding</a></li>
                            <li><a href="">Case Study</a></li>
                            <li><a href="">Devices</a></li>
                            <li><a href="">obs</a></li>
                            <li><a href="">Networks</a></li>
                            <li><a href="">Staff</a></li>
                            <li><a href="">Tutorials</a></li>
                        </ul>
                    </li>
                    <li><a href="<?=site_url('contact')?>">Контакты</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<div class="content">
    <?php
        $this->load->view($this->cPageName.'/index.php',$this->data);
    ?>
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">
                    <span class="title-menu">Site Navigation</span>
                    <ul>
                        <li><a href="<?=site_url('home')?>">Home</a></li>
                        <li><a href="">About</a></li>
                        <li><a href="">Portfolio</a></li>
                        <li><a href="">Services</a></li>
                        <li><a href="">Blog</a></li>
                        <li><a href="">Contact</a></li>
                    </ul>
                </div>
                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">
                    <span class="title-menu">Blog Categories</span>
                    <ul>
                        <li><a href="">App Media</a></li>
                        <li><a href="">Branding</a></li>
                        <li><a href="">Case studio</a></li>
                        <li><a href="">Devices</a></li>
                        <li><a href="">Jobs</a></li>
                        <li><a href="">Networks</a></li>
                    </ul></div>
                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">
                    <span class="title-menu">Jobs Board</span>
                    <ul>
                        <li><a href="">Animation</a></li>
                        <li><a href="">Brand Identy</a></li>
                        <li><a href="">Development</a></li>
                        <li><a href="">Graphic Design</a></li>
                        <li><a href="">Marketing</a></li>
                        <li><a href="">Web Design</a></li>
                    </ul></div>
                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">
                    <span class="title-menu">Connect</span>
                    <ul>
                        <li><a href="">Twitter</a></li>
                        <li><a href="">Facebook</a></li>
                        <li><a href="">Youtube</a></li>
                        <li><a href="">Flickr</a></li>
                        <li><a href="">Vimeo</a></li>
                        <li><a href="">Tumblr</a></li>
                    </ul></div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 copy-text">
                    <img src="/images/image-footer.png"/>
                    <div class="col-lg-8 col-md-8">
                        <p class="title-copyright">BrandMedia &trade;</p>
                        <p class="copyright">Copyright © 2010-2011 BrandMedia. All rights reserved.
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                            Nullam elit turpis, semper sed consequat a, malesuada
                            vel neque.</p>
                        <p class="bottom-links">
                            <a href="#">Terms & Conditions&nbsp;&#124;&nbsp;</a><a href="#">Privacy&nbsp;&#124;&nbsp;</a><a href="#">Contact Us</a>
                        </p>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/js/bootstrap.min.js"></script>
</body>
</html>