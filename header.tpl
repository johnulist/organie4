{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2016 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<!DOCTYPE HTML>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9"{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}><![endif]-->
<html{if isset($language_code) && $language_code} lang="{$language_code|escape:'html':'UTF-8'}"{/if}>
	<head>
		<meta charset="utf-8" />
		<title>{$meta_title|escape:'html':'UTF-8'}</title>
		{if isset($meta_description) AND $meta_description}
			<meta name="description" content="{$meta_description|escape:'html':'UTF-8'}" />
		{/if}
		{if isset($meta_keywords) AND $meta_keywords}
			<meta name="keywords" content="{$meta_keywords|escape:'html':'UTF-8'}" />
		{/if}
		<meta name="generator" content="PrestaShop" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
		<meta name="viewport" content="width=device-width, minimum-scale=0.25, maximum-scale=1.6, initial-scale=1.0" />
		<meta name="apple-mobile-web-app-capable" content="yes" />
                <meta property="og:title" content="{$meta_title|escape:'htmlall':'UTF-8'}" />
                <meta property="og:type" content="website" />
                <meta property="og:url" content="https://{$smarty.server.HTTP_HOST}{$smarty.server.REQUEST_URI}" />
                <meta property="og:site_name" content="{$shop_name|escape:'htmlall':'UTF-8'}" />
                <meta property="og:image" content="https://{$smarty.server.HTTP_HOST}/themes/organie4/img/logo.png" />
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
		<link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
		{if isset($css_files)}
			{foreach from=$css_files key=css_uri item=media}
				<link rel="stylesheet" href="{$css_uri|escape:'html':'UTF-8'}" type="text/css" media="{$media|escape:'html':'UTF-8'}" />
			{/foreach}
			<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.css"/>
			<link rel="stylesheet" type="text/css" href="/themes/organie4/css/slick-1.6.0/slick/slick-theme.css" />
		{/if}
		{if $enableAngularJs == 1}
			<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.6/angular.min.js"></script>
		{/if}
		{if isset($js_defer) && !$js_defer && isset($js_files) && isset($js_def)}
			{$js_def}
			{foreach from=$js_files item=js_uri}
			<script type="text/javascript" src="{$js_uri|escape:'html':'UTF-8'}"></script>
			{/foreach}
                        <script type="text/javascript" src="//cdn.jsdelivr.net/jquery.slick/1.6.0/slick.min.js"></script>
                        <script type="text/javascript">
			  $(document).ready(function(){
  			    $('.baniere_site').slick({
                              dots: true,
			      infinite: true,
                              autoplay: true,
			      arrows: false,
			      pauseOnHover: false,
			      autoplaySpeed: 7000,
  			      fade: true,
			      cssEase: 'linear'
			    });
			  });
			</script>
		{/if}
		{$HOOK_HEADER}
		  
		<link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">
		<link href="{$tpl_uri|escape:'html':'UTF-8'}css/style.css" rel="stylesheet" type="text/css"/>
		<link href="{$tpl_uri|escape:'html':'UTF-8'}css/product-list.css" rel="stylesheet" type="text/css"/>
		<link href="{$tpl_uri|escape:'html':'UTF-8'}css/product-detail.css" rel="stylesheet" type="text/css"/>
		<link href="{$tpl_uri|escape:'html':'UTF-8'}css/cart-order.css" rel="stylesheet" type="text/css"/>
		{if $page_name =='dorSmartBlogs' || $page_name == 'dorSmartBlogsDetail' || $page_name == 'dorSmartBlogsDetailV2'}
		<link href="{$tpl_uri|escape:'html':'UTF-8'}css/blog.css" rel="stylesheet" type="text/css"/>
		{/if}
		<link href="{$tpl_uri|escape:'html':'UTF-8'}css/responsive.css" rel="stylesheet" type="text/css"/>
		{if isset($dorthemecolor) && $dorthemecolor != "" && isset($dorEnableThemeColor) && $dorEnableThemeColor == 1}
		<link href="{$tpl_uri|escape:'html':'UTF-8'}css/modules/dor_themeoptions/color/{$dorthemecolor}.css" rel="stylesheet" type="text/css" data-style="color"/>
		{else}
		<link href="{$tpl_uri|escape:'html':'UTF-8'}css/modules/dor_themeoptions/color/color.css" rel="stylesheet" type="text/css" data-style="color"/>
		{/if}
		{if isset($dorFont) && $dorFont != ""}
		<link href="{$tpl_uri|escape:'html':'UTF-8'}css/modules/dor_themeoptions/fonts/{$dorFont}.css" rel="stylesheet" type="text/css" data-style="font" />
		{else}
		<link href="{$tpl_uri|escape:'html':'UTF-8'}css/modules/dor_themeoptions/fonts/font.css" rel="stylesheet" type="text/css" data-style="font"/>
		{/if}
		<!--[if IE 8]>
		<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
		<![endif]-->
	</head>
	<body{if isset($page_name)} id="{$page_name|escape:'html':'UTF-8'}"{/if} class="{if isset($page_name)}{$page_name|escape:'html':'UTF-8'}{/if}{if isset($body_classes) && $body_classes|@count} {implode value=$body_classes separator=' '}{/if}{if $hide_left_column} hide-left-column{else} show-left-column{/if}{if $hide_right_column} hide-right-column{else} show-right-column{/if}{if isset($content_only) && $content_only} content_only{/if} lang_{$lang_iso} {if $dorEnableBgImage == 1 && $dorthemebg != ""}{$dorthemebg}{/if} {if $dorCategoryEffect != ''}dor-list-effect-pizza{$dorCategoryEffect}{else}dor-list-effect-pizza1{/if}">
        {if !isset($content_only) || !$content_only}
		{if isset($restricted_country_mode) && $restricted_country_mode}
			<div id="restricted-country">
				<p>{l s='You cannot place a new order from your country.'}{if isset($geolocation_country) && $geolocation_country} <span class="bold">{$geolocation_country|escape:'html':'UTF-8'}</span>{/if}</p>
			</div>
		{/if}
		<div id="page" class="{if $dorHeaderSkin != ''}{$dorHeaderSkinName}{else}noneHeaderSkin{/if} {if $dorlayoutmode != ''}{$dorlayoutmode}{/if}">
                        {if $dorHeaderSkin != ''}
				{include file="$dorHeaderSkin"}
			{/if}
			{if $page_name =='index' && $page_name !='pagenotfound'}
                          {* Banière du site *}
                          <div class="baniere_site">
			      <div>
			    	<a href="/19-au-lait-d-ânesse">
				  <img src="{$smarty.const._THEME_IMG_DIR_}/baniere_lait_anesse.jpg">
			    	</a>
			      </div>
			    <div>
				<a href="/16-accessoires">
				  <img src="{$smarty.const._THEME_IMG_DIR_}/baniere_accessoires.jpg">
				</a>
			    </div>
			    <div>
                              <a href="/12-savons">
                                <img src="{$smarty.const._THEME_IMG_DIR_}/baniere_accueil.jpg">
                              </a>
			    </div>
			  </div>
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='dorListCategory'}{hook h='dorListCategory'}{/capture}
				{if $smarty.capture.dorListCategory}
					<div class="dorListCategory blockPosition dor-bg-white">
						<div class="container">
							<div class="row">
							{$smarty.capture.dorListCategory}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			
			
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='blockDorado3'}{hook h='blockDorado3'}{/capture}
				{if $smarty.capture.blockDorado3}
					<div class="blockDorado3 blockPosition dor-bg-gray">
						{$smarty.capture.blockDorado3}
					</div>
				{/if}
			{/if}
			{if $page_name !='index' && $page_name !='pagenotfound'}
				{include file="$tpl_dir./breadcrumb.tpl"}
			{/if}
			
			{if $page_name|escape:'html':'UTF-8' == 'dorSmartBlogs'}
			<div class="header-banner-blogs">
				<div class="container">
					<div class="banner-blog">
						<div class="info-title-blog">
							<h1>{l s='News & Blog'}</h1>
							<p>{l s='The Latest News & Blog updated frequently'}</p>
						</div>
					</div>
				</div>
			</div>
			{/if}
			<div class="columns-container">
				<div id="columns" class="container {if $page_name =='contact' && isset($dorContactStyle)}dorContactStyle{$dorContactStyle}{/if}">
					<div class="row">
						{if isset($left_column_size) && !empty($left_column_size) && $dorCategoryCols != "proCateCol1" && $dorCategoryCols != "proCateCol3"}
							{capture name='displayDorLeftColumn'}{hook h='displayDorLeftColumn'}{/capture}
							{if ($page_name|escape:'html':'UTF-8' == 'product' && !$smarty.capture.displayDorLeftColumn) || ($page_name|escape:'html':'UTF-8' != 'product')}
							<div id="left_column" class="column col-xs-12 col-sm-{$left_column_size|intval}">
							{$HOOK_LEFT_COLUMN}</div>
							{/if}
						{/if}

						{if $page_name|escape:'html':'UTF-8' == 'product' && $dorDetailCols == 'proDetailCol3'}
							{capture name='displayDorLeftColumn'}{hook h='displayDorLeftColumn'}{/capture}
							{if $smarty.capture.displayDorLeftColumn}
								<div id="dor_left_column" class="col-xs-12 col-sm-3 column">
									{$smarty.capture.displayDorLeftColumn}
								</div>
							{/if}
						{/if}


						{if ($page_name|escape:'html':'UTF-8' == 'dorSmartBlogs' && $dorBlogsCols == 'proBlogCol2') || ($page_name|escape:'html':'UTF-8' == 'dorSmartBlogsDetail' && $dorBlogsDetailCols == 'proBlogDetailCol2')}
							{capture name='displaySmartBlogLeft'}{hook h='displaySmartBlogLeft'}{/capture}
							{if $smarty.capture.displaySmartBlogLeft}
								<div id="left_column_blog" class="col-xs-12 col-sm-3 column">
									{$smarty.capture.displaySmartBlogLeft}
								</div>
							{/if}
						{/if}


						{assign var='cols' value=(12 - $left_column_size)}
						{assign var='oneColsLists' value=""}
						{assign var='classCols' value='dor-normal-cols'}
						{if isset($left_column_size) && isset($right_column_size) && $dorDetailCols != 'proDetailCol2' && $page_name =='product'}
							{assign var='cols' value=12}
							{assign var='classCols' value='dor-normal-cols'}
						{else if isset($left_column_size) && isset($right_column_size) && $dorCategoryCols == 'proCateCol1' && $page_name =='category'}
							{assign var='cols' value=12}
							{assign var='classCols' value='dor-normal-cols'}
							{assign var='oneColsLists' value="oneColsLists"}
						{else}
							{if $dorCategoryCols == "proCateCol3"}
								{assign var='cols' value=(12 - $right_column_size)}
							{else if $dorCategoryCols == "proCateCol2"}
								{assign var='cols' value=(12 - $left_column_size)}
							{/if}
							{if $dorCategoryCols != ""}
								{assign var='classCols' value=' dor-two-cols'}
							{/if}
						{/if}

						{if $page_name =='product' && ($dorDetailCols == 'proDetailCol2' || $dorDetailCols == 'proDetailCol3')}
							{assign var='cols' value=12}
							{capture name='displayDorLeftColumn'}{hook h='displayDorLeftColumn'}{/capture}
							{if $smarty.capture.displayDorLeftColumn && $dorDetailCols == 'proDetailCol3'}
								{assign var='dor_left_column_size' value=3}
								{assign var='cols' value=(12 - $dor_left_column_size)}
								{assign var='classCols' value=' dor-two-cols'}
							{else}
								{assign var='dor_left_column_size' value=0}
							{/if}

							{capture name='displayDorRightColumn'}{hook h='displayDorRightColumn'}{/capture}
							{if $smarty.capture.displayDorRightColumn && $dorDetailCols == 'proDetailCol2'}
								{assign var='dor_right_column_size' value=3}
								{assign var='cols' value=(12 - $dor_right_column_size)}
								{assign var='classCols' value=' dor-two-cols'}
							{else}
								{assign var='dor_right_column_size' value=0}
							{/if}
						{/if}

						{if $page_name|escape:'html':'UTF-8' == 'dorSmartBlogs' || $page_name|escape:'html':'UTF-8' == 'dorSmartBlogsDetail'}
							{assign var='cols' value=9}
						{/if}


						{if ($page_name|escape:'html':'UTF-8' == 'dorSmartBlogs' && $dorBlogsCols == 'proBlogCol1') || ($page_name|escape:'html':'UTF-8' == 'dorSmartBlogsDetail' && $dorBlogsDetailCols == 'proBlogDetailCol1')}
							{assign var='cols' value=12}
						{/if}

						<div id="center_column" class="center_column {$oneColsLists|strval} {$classCols|strval} col-xs-12 col-sm-{$cols|intval}">
	{/if}


