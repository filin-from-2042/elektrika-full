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

<link href="<?=base_url('css/bootstrap.min.css')?>" rel="stylesheet">
<link href="<?=base_url('css/bootstrap-theme.min.css')?>" rel="stylesheet">

<link href="<?=base_url('css/style.css')?>" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/general.js"></script>
<?
    if($this->cJsFiles)
    {
        foreach($this->cJsFiles as $cJsFile)
        {
           echo  '<script type="text/javascript" src="' . $cJsFile . '"></script>';

        }
    }
?>
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
                <a  id="logo" href="<?=site_url('/')?>" class="navbar-brand"><img style="width: 300px;" src="/images/logo-el.png"></a>
            </div>
            <div class="navbar-collapse collapse navbar-right">
                <ul class="nav navbar-nav">
                    <li><?= anchor('/', '<img src="/images/home.png">')?></li>
                    <li><?= anchor('about','Партнерство')?></li>
                    <li><?= anchor('actions','Акции')?></a></li>
                    <li class="dropdown">
                        <?= anchor('','Новости<span class="caret"></span>',array('class'=>'dropdown-toggle','data-toggle'=>'dropdown'))?>
                        <ul  class="dropdown-menu" role="menu">
                            <li id="arrow-sub" class="hidden-xs"><img src="/images/arrow-sub.png"></li>
                            <li><a href="<?=site_url('news')?>">Все новости</a></li>
                            <?php
                                foreach($this->data->aCategories as $aCategory)
                                {
                                    echo '<li>'.anchor('news/categories' . '/' . $aCategory["id"],$aCategory["categories_name"]).'</li>';
                                }
                            ?>
                        </ul>
                    </li>
                    <li><?= anchor('contact','Контакты')?></a></li>
                </ul>
            </div>
        </div>
    </div>
</header>
<div class="content">
    <?php
        $this->load->view($this->cViewDIR.'/index.php',$this->data);
    ?>
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3">
                    <span class="title-menu">Навигация</span>
                    <ul>
                        <li><?= anchor('','Главная')?></li>
                        <li><?= anchor('about','О компании')?></li>
                        <li><?= anchor('news','Новости')?></li>
                        <li><?= anchor('actions','Акции')?></li>
                        <li><?= anchor('contact','Контакты')?></li>
                        <li><?= anchor('job','Вакансии')?></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3">
                    <span class="title-menu">Новости</span>
                    <ul>
                        <li><?= anchor('news/categories/1','Освещение')?></li>
                        <li><?= anchor('news/categories/2','Электромонтаж')?></li>
                        <li><?= anchor('news/categories/3','Электроустановочные изделия')?></li>
                        <li><?= anchor('news/categories/4','Кабели')?></li>
                        <li><?= anchor('news/categories/5','Компании')?></li>
                    </ul></div>
                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3">
<!--                    <span class="title-menu">Доска вакансий</span>-->
<!--                    <ul>-->
<!--                        <li>--><?//= anchor('home','Animation')?><!--</li>-->
<!--                        <li>--><?//= anchor('home','Brand Identy')?><!--</li>-->
<!--                        <li>--><?//= anchor('home','Development')?><!--</li>-->
<!--                        <li>--><?//= anchor('home','Graphic Design')?><!--</li>-->
<!--                        <li>--><?//= anchor('home','Marketing')?><!--</li>-->
<!--                        <li>--><?//= anchor('home','Web Design')?><!--</li>-->
<!--                    </ul>-->
                </div>
<!--                <div class="col-lg-1 col-md-1 col-sm-3 col-xs-3">-->
<!--                    <span class="title-menu">Connect</span>-->
<!--                    <ul>-->
<!--                        <li>--><?//= anchor('home','Twitter')?><!--</li>-->
<!--                        <li>--><?//= anchor('home','Facebook')?><!--</li>-->
<!--                        <li>--><?//= anchor('home','Youtube')?><!--</li>-->
<!--                        <li>--><?//= anchor('home','Flickr')?><!--</li>-->
<!--                        <li>--><?//= anchor('home','Vimeo')?><!--</li>-->
<!--                        <li>--><?//= anchor('home','Tumblr')?><!--</li>-->
<!--                    </ul>-->
<!--                </div>-->
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 copy-text">
                    <a href="http://intelweb-nsk.ru">
                        <img src="/images/image-footer.png"/>
                    </a>
                    <div class="col-lg-8 col-md-8">
                        <p class="title-copyright">Электрика &trade;</p>
                        <p class="copyright"><?=$this->config->item('company_copyright')?></p>
                        <p class="bottom-links">
                           <!-- <?= anchor('http://www.intelweb-nsk.ru/','Terms & Conditions')?>&nbsp;&#124;&nbsp;<?= anchor('http://www.intelweb-nsk.ru/','Privacy')?>&nbsp;&#124;&nbsp;--><?= anchor('http://www.intelweb-nsk.ru/kontakty/','Свяжитесь с нами')?>
                        </p>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>