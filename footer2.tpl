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
{if !isset($content_only) || !$content_only}
					</div><!-- #center_column -->
					{if (isset($right_column_size) && !empty($right_column_size)) && $dorCategoryCols == "proCateCol3"}
						{capture name='displayDorRightColumn'}{hook h='displayDorRightColumn'}{/capture}
						{if ($page_name|escape:'html':'UTF-8' == 'product' && !$smarty.capture.displayDorRightColumn) || ($page_name|escape:'html':'UTF-8' != 'product')}
						<div id="right_column" class="col-xs-12 col-sm-{$right_column_size|intval} column">
						{if $page_name|escape:'html':'UTF-8' == 'category'}
						<h3 class="sec-title fsz-25 no-mrgn blk-clr hidden">{l s='FILTER BY'}</h3>
						{/if}
						{$HOOK_RIGHT_COLUMN}</div>
						{/if}
					{/if}
					{if $page_name|escape:'html':'UTF-8' == 'product' && $dorDetailCols == 'proDetailCol2'}
						{capture name='displayDorRightColumn'}{hook h='displayDorRightColumn'}{/capture}
						{if $smarty.capture.displayDorRightColumn}
							<div id="dor_right_column" class="col-xs-12 col-sm-3 column">
								{$smarty.capture.displayDorRightColumn}
							</div>
						{/if}
					{/if}
					{if ($page_name|escape:'html':'UTF-8' == 'dorSmartBlogs' && $dorBlogsCols == 'proBlogCol3') || ($page_name|escape:'html':'UTF-8' == 'dorSmartBlogsDetail' && $dorBlogsDetailCols == 'proBlogDetailCol3')}
						{capture name='displaySmartBlogRight'}{hook h='displaySmartBlogRight'}{/capture}
						{if $smarty.capture.displaySmartBlogRight}
							<div id="right_column_blog" class="col-xs-12 col-sm-3 column">
								{$smarty.capture.displaySmartBlogRight}
							</div>
						{/if}
					{/if}

					</div><!-- .row -->
				</div><!-- #columns -->
			</div><!-- .columns-container -->
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='dorDailyDeal'}{hook h='dorDailyDeal'}{/capture}
				{if $smarty.capture.dorDailyDeal}
					<div class="dorDailyDeal blockPosition dor-bg-white {if $dorCategoryEffect != ''}dor-list-effect-pizza{$dorCategoryEffect}{else}dor-list-effect-pizza1{/if}">
						<div class="container">
							<div class="row">
							{$smarty.capture.dorDailyDeal}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='dorBizproduct'}{hook h='dorBizproduct'}{/capture}
				{if $smarty.capture.dorBizproduct}
					<div class="dorBizproduct blockPosition dor-bg-gray {if $dorCategoryEffect != ''}dor-list-effect-pizza{$dorCategoryEffect}{else}dor-list-effect-pizza1{/if}">
						<div class="container">
							<div class="row">
								{$smarty.capture.dorBizproduct}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='blockDorado4'}{hook h='blockDorado4'}{/capture}
				{if $smarty.capture.blockDorado4}
					<div class="blockDorado4 blockPosition dor-bg-gray {if $dorCategoryEffect != ''}dor-list-effect-pizza{$dorCategoryEffect}{else}dor-list-effect-pizza1{/if}">
						<div class="container">
							<div class="row">
								{$smarty.capture.blockDorado4}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='DorTestimonial'}{hook h='DorTestimonial'}{/capture}
				{if $smarty.capture.DorTestimonial}
					<div class="DorTestimonial blockPosition dor-bg-gray {if $dorCategoryEffect != ''}dor-list-effect-pizza{$dorCategoryEffect}{else}dor-list-effect-pizza1{/if}">
						<div class="container">
							<div class="row">
								{$smarty.capture.DorTestimonial}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='DorHomeLatestNews'}{hook h='DorHomeLatestNews'}{/capture}
				{if $smarty.capture.DorHomeLatestNews}
					<div class="DorHomeLatestNews blockPosition {if $dorCategoryEffect != ''}dor-list-effect-pizza{$dorCategoryEffect}{else}dor-list-effect-pizza1{/if}">
						<div class="container">
							<div class="row">
								{$smarty.capture.DorHomeLatestNews}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='blockDorado7'}{hook h='blockDorado7'}{/capture}
				{if $smarty.capture.blockDorado7}
					<div class="blockDorado7 blockPosition dor-bg-gray">
						<div class="container">
							<div class="row">
								{$smarty.capture.blockDorado7}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='dormanufacturer'}{hook h='dormanufacturer'}{/capture}
				{if $smarty.capture.dormanufacturer}
					<div class="dormanufacturer blockPosition">
						<div class="container">
							<div class="row">
								{$smarty.capture.dormanufacturer}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='blockDorado8'}{hook h='blockDorado8'}{/capture}
				{if $smarty.capture.blockDorado8}
				<div class="blockDorado8 blockDorado8 dor-bg-gray clearfix">
					<div class="container">
						<div class="row">
						{$smarty.capture.blockDorado8}
						</div>
					</div>
				</div>
				{/if}
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='blockDorado9'}{hook h='blockDorado9'}{/capture}
				{if $smarty.capture.blockDorado9}
				<div class="blockDorado9 blockDorado9 dor-bg-white clearfix">
					<div class="container">
						<div class="row">
						{$smarty.capture.blockDorado9}
						</div>
					</div>
				</div>
				{/if}
			{/if}
			{capture name='dorHomepageBar'}{hook h='dorHomepageBar'}{/capture}
			{if $smarty.capture.dorHomepageBar}
				<div class="dorHomepageBar blockPosition dor-bg-white">
					<div class="container">
						<div class="row">
							{$smarty.capture.dorHomepageBar}
						</div>
					</div>
				</div>
			{/if}
			{if $page_name|escape:'html':'UTF-8' != 'index'}
				{capture name='dorNewsletter'}{hook h='dorNewsletter'}{/capture}
				{if $smarty.capture.dorNewsletter}
					<div class="dorNewsletter gst-row gst-color-white row-newsletter ovh">
						<div class="container">
							<div class="row">
								{$smarty.capture.dorNewsletter}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{capture name='blockDorado10'}{hook h='blockDorado10'}{/capture}
			{if $smarty.capture.blockDorado10}
			<div class="blockDorado10 clearfix">
				<div class="container">
					<div class="row">
					{$smarty.capture.blockDorado10}
					</div>
				</div>
			</div>
			{/if}
			{if isset($dorFooterSkin) && $dorFooterSkin != ''}
				{include file="$dorFooterSkin"}
			{else}
			<!-- Footer -->
				{if isset($HOOK_FOOTER)}
				<div class="footer-container">
					<footer id="footer"  class="container">
						<div class="row pouet">
							{capture name='blockDoradoFooter'}{hook h='blockDoradoFooter'}{/capture}
							{if $smarty.capture.blockDoradoFooter}
								{$smarty.capture.blockDoradoFooter}
							{/if}
							{$HOOK_FOOTER}
							<section class="footer-block col-xs-12 col-sm-12 col-md-12 col-lg-6">
                                                                <span style="display: block">Un soucis ? Contactez nous !</span>
                                                                <span style="display: block">contact@mon-savonnier.fr</span>
                                                                <span style="display: block">Téléphone : 07-56-89-44-17</span>
                                                        </section>
						</div>
					</footer>
				</div><!-- #footer -->
				{/if}
			{/if}
			{if !$logged}
				{capture name='dorSmartuser_'}{hook h='dorSmartuser_'}{/capture}
				{if $smarty.capture.dorSmartuser_}
					<div class="dorSmartuser">
						<div class="container">
							<div class="row">
								{$smarty.capture.dorSmartuser_}
							</div>
						</div>
					</div>
				{/if}
			{/if}
			{if $page_name|escape:'html':'UTF-8' == 'index'}
				{capture name='dorthemeoptions'}{hook h='dorthemeoptions'}{/capture}
				{if $smarty.capture.dorthemeoptions}
					{$smarty.capture.dorthemeoptions}
				{/if}
			{/if}
		</div><!-- #page -->
{/if}
<div id="to-top" class="to-top"> <i class="fa fa-angle-up"></i> </div>
{if $dorOptReload == 1}
<div class="dor-page-loading">
  	<div id="loader"></div>
  	<div class="loader-section section-left"></div>
  	<div class="loader-section section-right"></div>
</div>
{/if}
{include file="$tpl_dir./global.tpl"}
{addJsDefL name=max_item}{l s='You cannot add more than %d product(s) to the product comparison' sprintf=$comparator_max_item js=1}{/addJsDefL}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}
{addJsDef floatHeader=$dorFloatHeader}
{if $page_name|escape:'html':'UTF-8' == 'contact'}
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDMH_Sh8EdCWkG1OFhAih3FFhbkRYuo-0U"></script>
<script src="{$tpl_uri|escape:'html':'UTF-8'}js/jquery.googlemap.js"></script>
<script type="text/javascript">
	$(function() {
		$("#mapContact").googleMap();
		$("#mapContact").addMarker({
	      coords: [48.895651, 2.290569],
	      icon: 'http://localhost/DorWork/Projects/dor_organie/img/cms/dorado/icon/market-map.png',
	      url: 'http://www.doradothemes.com'
	    });
	})
</script>
{/if}
<script src="{$tpl_uri|escape:'html':'UTF-8'}js/dor.script.js"></script>
</body>
</html>


