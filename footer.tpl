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
					</div><!-- #center_column --><!-- {{$dorFooterSkin}} -->
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
