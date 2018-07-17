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
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
{include file="$tpl_dir./errors.tpl"}
{if $errors|@count == 0}
	{if !isset($priceDisplayPrecision)}
		{assign var='priceDisplayPrecision' value=2}
	{/if}
	{if !$priceDisplay || $priceDisplay == 2}
		{assign var='productPrice' value=$product->getPrice(true, $smarty.const.NULL, 6)}
		{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(false, $smarty.const.NULL)}
	{elseif $priceDisplay == 1}
		{assign var='productPrice' value=$product->getPrice(false, $smarty.const.NULL, 6)}
		{assign var='productPriceWithoutReduction' value=$product->getPriceWithoutReduct(true, $smarty.const.NULL)}
	{/if}
{assign var='classCols' value=' dor-normal-cols'}
{if $page_name =='product' && ($dorDetailCols == 'proDetailCol2' || $dorDetailCols == 'proDetailCol3')}
	{capture name='displayDorLeftColumn'}{hook h='displayDorLeftColumn'}{/capture}
	{if $smarty.capture.displayDorLeftColumn && $dorDetailCols == 'proDetailCol3'}
		{assign var='classCols' value=' dor-two-cols'}
	{/if}

	{capture name='displayDorRightColumn'}{hook h='displayDorRightColumn'}{/capture}
	{if $smarty.capture.displayDorRightColumn && $dorDetailCols == 'proDetailCol2'}
		{assign var='classCols' value=' dor-two-cols'}
	{/if}
{/if}
<div class="{$classCols|strval}" itemscope itemtype="https://schema.org/Product">
	<meta itemprop="url" content="{$link->getProductLink($product)}">
	<div class="primary_block row{if $dorDetailThumbList != ""} dor-media-{$dorDetailThumbList}{else} dor-media-right{/if} {if $dorDetailMainImage != ""} dor-primary-image-{$dorDetailMainImage}{else} dor-primary-image-left{/if}">
		{if !$content_only}
			<div class="container">
				<div class="top-hr"></div>
			</div>
		{/if}
		{if isset($adminActionDisplay) && $adminActionDisplay}
			<div id="admin-action" class="container">
				<p class="alert alert-info">{l s='This product is not visible to your customers.'}
					<input type="hidden" id="admin-action-product-id" value="{$product->id}" />
					<a id="publish_button" class="btn btn-default button button-small" href="#">
						<span>{l s='Publish'}</span>
					</a>
					<a id="lnk_view" class="btn btn-default button button-small" href="#">
						<span>{l s='Back'}</span>
					</a>
				</p>
				<p id="admin-action-result"></p>
			</div>
		{/if}
		{if isset($confirmation) && $confirmation}
			<p class="confirmation">
				{$confirmation}
			</p>
		{/if}
		<!-- left infos-->
		<div class="pb-left-column col-md-6 col-sm-12 col-xs-12 media">
			<!-- product img-->
			<div id="image-block" class="clearfix">
				
				{if $have_image}
					<span id="view_full_size">
						<span class="border-product"></span>
						{if $jqZoomEnabled && $have_image && !$content_only}
							<a class="jqzoom" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" rel="gal1" href="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'thickbox_default')|escape:'html':'UTF-8'}">
								<img data-itemprop="image" src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')|escape:'html':'UTF-8'}" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" alt="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}"/>
							</a>
						{else}
							<img id="bigpic" data-itemprop="image" src="{$link->getImageLink($product->link_rewrite, $cover.id_image, 'large_default')|escape:'html':'UTF-8'}" title="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" alt="{if !empty($cover.legend)}{$cover.legend|escape:'html':'UTF-8'}{else}{$product->name|escape:'html':'UTF-8'}{/if}" width="{$largeSize.width}" height="{$largeSize.height}"/>
							{if !$content_only}
								<span class="span_link no-print"><span class="hidden">{l s='View larger'}</span></span>
							{/if}
						{/if}
					</span>
				{else}
					<span id="view_full_size">
						<img data-itemprop="image" src="{$img_prod_dir}{$lang_iso}-default-large_default.jpg" id="bigpic" alt="" title="{$product->name|escape:'html':'UTF-8'}" width="{$largeSize.width}" height="{$largeSize.height}"/>
						{if !$content_only}
							<span class="span_link">
								<span class="hidden">{l s='View larger'}</span>
							</span>
						{/if}
					</span>
				{/if}
			</div> <!-- end image-block -->
			{if isset($images) && count($images) > 0}
				<!-- thumbnails -->
				<div id="views_block" class="clearfix {if isset($images) && count($images) < 2}hidden{/if}">
					{if isset($images) && count($images) > 2}
						<span class="view_scroll_spacer">
							<a id="view_scroll_left" class="" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">
								<span class="hidden">{l s='Previous'}</span>
								<i aria-hidden="true" class="fa fa-angle-up"></i>
							</a>
						</span>
					{/if}
					<div id="thumbs_list">
						<ul id="thumbs_list_frame">
						{if isset($images)}
							{foreach from=$images item=image name=thumbnails}
								{assign var=imageIds value="`$product->id`-`$image.id_image`"}
								{if !empty($image.legend)}
									{assign var=imageTitle value=$image.legend|escape:'html':'UTF-8'}
								{else}
									{assign var=imageTitle value=$product->name|escape:'html':'UTF-8'}
								{/if}
								<li id="thumbnail_{$image.id_image}"{if $smarty.foreach.thumbnails.last} class="last"{/if}>
									<a{if $jqZoomEnabled && $have_image && !$content_only} href="javascript:void(0);" rel="{literal}{{/literal}gallery: 'gal1', smallimage: '{$link->getImageLink($product->link_rewrite, $imageIds, 'large_default')|escape:'html':'UTF-8'}',largeimage: '{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')|escape:'html':'UTF-8'}'{literal}}{/literal}"{else} href="{$link->getImageLink($product->link_rewrite, $imageIds, 'thickbox_default')|escape:'html':'UTF-8'}"	data-fancybox-group="other-views" class="fancybox{if $image.id_image == $cover.id_image} shown{/if}"{/if} title="{$imageTitle}">
										<img class="img-responsive" id="thumb_{$image.id_image}" src="{$link->getImageLink($product->link_rewrite, $imageIds, 'cart_default')|escape:'html':'UTF-8'}" alt="{$imageTitle}" title="{$imageTitle}"{if isset($cartSize)} height="{$cartSize.height}" width="{$cartSize.width}"{/if} data-itemprop="image" />
									</a>
								</li>
							{/foreach}
						{/if}
						</ul>
					</div> <!-- end thumbs_list -->
					{if isset($images) && count($images) > 2}
						<a id="view_scroll_right" title="{l s='Other views'}" href="javascript:{ldelim}{rdelim}">
							<span class="hidden">{l s='Next'}</span>
							<i aria-hidden="true" class="fa fa-angle-down"></i>
						</a>
					{/if}
				</div> <!-- end views-block -->
				<!-- end thumbnails -->
			{/if}
			{if isset($images) && count($images) > 1}
				<p class="resetimg clear no-print">
					<span id="wrapResetImages" style="display: none;">
						<a href="{$link->getProductLink($product)|escape:'html':'UTF-8'}" data-id="resetImages">
							<i class="icon-repeat"></i>
							{l s='Display all pictures'}
						</a>
					</span>
				</p>
			{/if}
		</div> <!-- end pb-left-column -->
		<!-- end left infos-->
		<!-- center infos -->
		<div class="pb-center-column col-md-6 col-sm-6 col-xs-12 info">
			{if $dorDetailLabel == 1}
				{if $product->new}
					<span class="new-box box-label-detail">
						<span class="new-label">{l s='New'}</span>
					</span>
				{/if}
				{if $product->on_sale}
					<span class="sale-box no-print box-label-detail">
						<span class="sale-label">{l s='Sale!'}</span>
					</span>
				{elseif $product->specificPrice && $product->specificPrice.reduction && $productPriceWithoutReduction > $productPrice}
					<span class="discount box-label-detail">{l s='Reduced price!'}</span>
				{/if}
			{/if}
			{if $product->online_only}
				<p class="online_only">{l s='Online only'}</p>
			{/if}
			<div class="reviewProductItems pull-right">
	            {if $nbComments > -1 && $dorDetailReview == 1}
				<div class="comments_note clearfix">
					<span class="hidden">{l s='Rating' mod='productcomments'}&nbsp;</span>
					<div class="star_content clearfix">
						{section name="i" start=0 loop=5 step=1}
							{if $averageTotal le $smarty.section.i.index}
								<div class="star"></div>
							{else}
								<div class="star star_on"></div>
							{/if}
						{/section}
						<meta itemprop="worstRating" content = "0" />
						<meta itemprop="ratingValue" content = "{if isset($ratings.avg)}{$ratings.avg|round:1|escape:'html':'UTF-8'}{else}{$averageTotal|round:1|escape:'html':'UTF-8'}{/if}" />
						<meta itemprop="bestRating" content = "5" />
					</div>
					{if $nbComments <= 1}
					<span>({l s='Based on'}&nbsp;{$nbComments}&nbsp;{l s='Review' mod='productcomments'})</span>
					{else}
					<span>({l s='Based on'}&nbsp;{$nbComments}&nbsp;{l s='Reviews' mod='productcomments'})</span>
					{/if}
					<ul class="comments_advices">
						{if $nbComments != 0}
							<li class="hidden">
								<a href="#idTab5" class="reviews">
									{l s='Read reviews' mod='productcomments'} (<span data-itemprop="reviewCount">{$nbComments}</span>)
								</a>
							</li>
						{/if}
						{if ($too_early == false AND ($is_logged OR $allow_guests))}
							<li class="hidden">
								<a class="open-comment-form" href="#new_comment_form" title="{l s='Write a review' mod='productcomments'}">
									{l s='Create review' mod='productcomments'}
								</a>
							</li>
						{/if}
					</ul>
				</div> <!-- .comments_note -->
				{/if}
			</div>
            <div class="product_title_wrapper">

                <div class="product_title entry-title" data-itemprop="name">
                    <h1 data-itemprop="name">{$product->name|escape:'html':'UTF-8'}</h1>
                </div>
            </div>
            
			{if ($product->show_price && !isset($restricted_country_mode))}
				<!--Price Detail-->
				<div class="content_prices clearfix">
					{if $product->show_price && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
						<!-- prices -->
						<div>
							{if $dorDetailOldPrice == 1}
								<p id="old_price" class="font-3 fsz-18 no-mrgn" {if (!$product->specificPrice || !$product->specificPrice.reduction)} class="hidden"{/if}>{strip}
									{if $priceDisplay >= 0 && $priceDisplay <= 2}
										{hook h="displayProductPriceBlock" product=$product type="old_price"}
										<span id="old_price_display"><span class="price font-3 fsz-18 no-mrgn">{if $productPriceWithoutReduction > $productPrice}{convertPrice price=$productPriceWithoutReduction|floatval}{/if}</span>{if $productPriceWithoutReduction > $productPrice && $tax_enabled && $display_tax_label == 1} {if $priceDisplay == 1}{l s='tax excl.'}{else}{l s='tax incl.'}{/if}{/if}</span>
									{/if}
								{/strip}</p>
								{if $priceDisplay == 2}
									<br />
									<span id="pretaxe_price">{strip}
										<span id="pretaxe_price_display">{convertPrice price=$product->getPrice(false, $smarty.const.NULL)}</span> {l s='tax excl.'}
									{/strip}</span>
								{/if}
							{/if}
							<p class="our_price_display font-3 fsz-18 no-mrgn price" data-itemprop="offers" itemscope itemtype="https://schema.org/Offer">{strip}
								{if $product->quantity > 0}<link itemprop="availability" href="https://schema.org/InStock"/>{/if}
								{if $priceDisplay >= 0 && $priceDisplay <= 2}
									<span id="our_price_display" class="price" data-itemprop="price" content="{$productPrice}">{convertPrice price=$productPrice|floatval}</span>
									<!-- {if $tax_enabled  && ((isset($display_tax_label) && $display_tax_label == 1) || !isset($display_tax_label))}
										{if $priceDisplay == 1} {l s='tax excl.'}{else} {l s='tax incl.'}{/if}
									{/if} -->
									<meta itemprop="priceCurrency" content="{$currency->iso_code}" />
									{hook h="displayProductPriceBlock" product=$product type="price"}
								{/if}
							{/strip}</p>
							{if $dorDetailReduction == 1}
								<p id="reduction_percent" {if $productPriceWithoutReduction <= 0 || !$product->specificPrice || $product->specificPrice.reduction_type != 'percentage'} style="display:none;"{/if}>{strip}
									<span id="reduction_percent_display">
										{if $product->specificPrice && $product->specificPrice.reduction_type == 'percentage'}-{$product->specificPrice.reduction*100}%{/if}
									</span>
								{/strip}</p>
							
								<p id="reduction_amount" {if $productPriceWithoutReduction <= 0 || !$product->specificPrice || $product->specificPrice.reduction_type != 'amount' || $product->specificPrice.reduction|floatval ==0} style="display:none"{/if}>{strip}
									<span id="reduction_amount_display">
									{if $product->specificPrice && $product->specificPrice.reduction_type == 'amount' && $product->specificPrice.reduction|floatval !=0}
										-{convertPrice price=$productPriceWithoutReduction|floatval-$productPrice|floatval}
									{/if}
									</span>
								{/strip}</p>
							{/if}
							
						</div> <!-- end prices -->
						{if $packItems|@count && $productPrice < $product->getNoPackPrice()}
							<p class="pack_price">{l s='Instead of'} <span style="text-decoration: line-through;">{convertPrice price=$product->getNoPackPrice()}</span></p>
						{/if}
						{if $product->ecotax != 0}
							<p class="price-ecotax">{l s='Including'} <span id="ecotax_price_display">{if $priceDisplay == 2}{$ecotax_tax_exc|convertAndFormatPrice}{else}{$ecotax_tax_inc|convertAndFormatPrice}{/if}</span> {l s='for ecotax'}
								{if $product->specificPrice && $product->specificPrice.reduction}
								<br />{l s='(not impacted by the discount)'}
								{/if}
							</p>
						{/if}
						{if !empty($product->unity) && $product->unit_price_ratio > 0.000000}
							{math equation="pprice / punit_price" pprice=$productPrice  punit_price=$product->unit_price_ratio assign=unit_price}
							<p class="unit-price"><span id="unit_price_display">{convertPrice price=$unit_price}</span> {l s='per'} {$product->unity|escape:'html':'UTF-8'}</p>
							{hook h="displayProductPriceBlock" product=$product type="unit_price"}
						{/if}
					{/if} {*close if for show price*}
					{hook h="displayProductPriceBlock" product=$product type="weight" hook_origin='product_sheet'}
		            {hook h="displayProductPriceBlock" product=$product type="after_price"}
				</div> <!-- end content_prices -->
				<!--End Price Detail-->
				{/if}
			
			{if !$product->is_virtual && $product->condition && $dorDetailCondition == 1}
			<p id="product_condition">
				<label>{l s='Condition:'} </label>
				{if $product->condition == 'new'}
					<link data-itemprop="itemCondition" href="https://schema.org/NewCondition"/>
					<span class="editable">{l s='New product'}</span>
				{elseif $product->condition == 'used'}
					<link data-itemprop="itemCondition" href="https://schema.org/UsedCondition"/>
					<span class="editable">{l s='Used'}</span>
				{elseif $product->condition == 'refurbished'}
					<link data-itemprop="itemCondition" href="https://schema.org/RefurbishedCondition"/>
					<span class="editable">{l s='Refurbished'}</span>
				{/if}
			</p>
			{/if}
			{if $product->description_short || $packItems|@count > 0}
				<div id="short_description_block" class="fsz-15">
					{if $product->description_short}
						<div id="short_description_content" class="rte align_justify" data-itemprop="description">
							{$product->description_short}
							<p style="color: #FF6868; font-size: 1.7em;">{if $product->quantity <= 0}<strong>* Rupture de stock : réapprovisionnement en cours... *</strong>{/if}</p>
						</div>
					{/if}

					{if $product->description}
						<p class="buttons_bottom_block">
							<a href="javascript:{ldelim}{rdelim}" class="button">
								{l s='More details'}
							</a>
						</p>
					{/if}
					
				</div> <!-- end short_description_block -->
			{/if}
			{if ($display_qties == 1 && !$PS_CATALOG_MODE && $PS_STOCK_MANAGEMENT && $product->available_for_order) && $dorDetailpQuantityAvailable == 1}
				<!-- number of item in stock -->
				<p id="pQuantityAvailable"{if $product->quantity <= 0} style="display: none;"{/if}>
					<span id="quantityAvailable">{$product->quantity|intval}</span>
					<span {if $product->quantity > 1} style="display: none;"{/if} id="quantityAvailableTxt">{l s='Item'}</span>
					<span {if $product->quantity == 1} style="display: none;"{/if} id="quantityAvailableTxtMultiple">{l s='Items'}</span>
				</p>
			{/if}
			
			{if $PS_STOCK_MANAGEMENT}
				{if !$product->is_virtual}{hook h="displayProductDeliveryTime" product=$product}{/if}
				<p class="warning_inline" id="last_quantities"{if ($product->quantity > $last_qties || $product->quantity <= 0) || $allow_oosp || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none"{/if} >{l s='Warning: Last items in stock!'}</p>
			{/if}
			<p id="availability_date"{if ($product->quantity > 0) || !$product->available_for_order || $PS_CATALOG_MODE || !isset($product->available_date) || $product->available_date < $smarty.now|date_format:'%Y-%m-%d'} style="display: none;"{/if}>
				<span id="availability_date_label">{l s='Availability date:'}</span>
				<span id="availability_date_value">{if Validate::isDate($product->available_date)}{dateFormat date=$product->available_date full=false}{/if}</span>
			</p>
			<!-- Out of stock hook -->
			<div id="oosHook"{if $product->quantity > 0} style="display: none;"{/if}>
				{$HOOK_PRODUCT_OOS}
			</div>
			<!--Action Form Detail Product-->
			{if isset($groups) || $product->reference || (isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS)}
			<!-- add to cart form-->
			<form id="buy_block"{if $PS_CATALOG_MODE && !isset($groups) && $product->quantity > 0} class="hidden"{/if} action="{$link->getPageLink('cart')|escape:'html':'UTF-8'}" method="post">
				<!-- hidden datas -->
				<p class="hidden">
					<input type="hidden" name="token" value="{$static_token}" />
					<input type="hidden" name="id_product" value="{$product->id|intval}" id="product_page_product_id" />
					<input type="hidden" name="add" value="1" />
					<input type="hidden" name="id_product_attribute" id="idCombination" value="" />
				</p>
				<div class="box-info-product" {if $product->quantity <= 0}style="display: none;"{/if}>
					<div class="list-options-cart clearfix">
						<div class="list-options-cart-inner clearfix">
						<!-- quantity wanted -->
						<span class="quantity_label">{l s='Quantity'}</span>
						<select id="quantity_wanted" name="qty" value="{if isset($quantityBackup)}{$quantityBackup|intval}{else}{if $product->minimal_quantity > 1}{$product->minimal_quantity}{else}1{/if}{/if}">
{for $i=1 to 50} 
  <option value={$i}>{$i}</option>
{/for}
</select>
						<div class="product_attributes">
							{if isset($groups)}
								<!-- attributes -->
								<div id="attributes">
									{foreach from=$groups key=id_attribute_group item=group}
										{if $group.attributes|@count}
											<fieldset class="attribute_fieldset dor-atr-mes col-md-12 col-sm-12 col-xs-12">
												<label class="attribute_label" {if $group.group_type != 'color' && $group.group_type != 'radio'}for="group_{$id_attribute_group|intval}"{/if}>{$group.name|escape:'html':'UTF-8'}&nbsp;</label>
												{assign var="groupName" value="group_$id_attribute_group"}
												<div class="attribute_list">
													{if ($group.group_type == 'select')}
														<select name="{$groupName}" id="group_{$id_attribute_group|intval}" class="selectpicker form-control- attribute_select no-print-"  data-live-search="true" data-width="100%" data-toggle="tooltip">
															{foreach from=$group.attributes key=id_attribute item=group_attribute}
																<option value="{$id_attribute|intval}"{if (isset($smarty.get.$groupName) && $smarty.get.$groupName|intval == $id_attribute) || $group.default == $id_attribute} selected="selected"{/if} title="{$group_attribute|escape:'html':'UTF-8'}">{$group_attribute|escape:'html':'UTF-8'}</option>
															{/foreach}
														</select>
													{elseif ($group.group_type == 'color')}
														<ul id="color_to_pick_list" class="clearfix">
															{assign var="default_colorpicker" value=""}
															{foreach from=$group.attributes key=id_attribute item=group_attribute}
																{assign var='img_color_exists' value=file_exists($col_img_dir|cat:$id_attribute|cat:'.jpg')}
																<li{if $group.default == $id_attribute} class="selected"{/if}>
																	<a href="{$link->getProductLink($product)|escape:'html':'UTF-8'}" data-id="color_{$id_attribute|intval}" name="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" class="color_pick{if ($group.default == $id_attribute)} selected{/if}"{if !$img_color_exists && isset($colors.$id_attribute.value) && $colors.$id_attribute.value} style="background:{$colors.$id_attribute.value|escape:'html':'UTF-8'};"{/if} title="{$colors.$id_attribute.name|escape:'html':'UTF-8'}">
																		{if $img_color_exists}
																			<img src="{$img_col_dir}{$id_attribute|intval}.jpg" alt="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" title="{$colors.$id_attribute.name|escape:'html':'UTF-8'}" width="20" height="20" />
																		{else}
																			{if $colors.$id_attribute.value == ""}
																				{$group_attribute}
																			{/if}
																		{/if}
																	</a>
																</li>
																{if ($group.default == $id_attribute)}
																	{$default_colorpicker = $id_attribute}
																{/if}
															{/foreach}
														</ul>
														<input type="hidden" class="color_pick_hidden" name="{$groupName|escape:'html':'UTF-8'}" value="{$default_colorpicker|intval}" />
													{elseif ($group.group_type == 'radio')}
														<ul>
															{foreach from=$group.attributes key=id_attribute item=group_attribute}
																<li>
																	<input type="radio" class="attribute_radio" name="{$groupName|escape:'html':'UTF-8'}" value="{$id_attribute}" {if ($group.default == $id_attribute)} checked="checked"{/if} />
																	<span>{$group_attribute|escape:'html':'UTF-8'}</span>
																</li>
															{/foreach}
														</ul>
													{/if}
												</div> <!-- end attribute_list -->
											</fieldset>
										{/if}
									{/foreach}
								</div> <!-- end attributes -->
							{/if}
							
						</div> <!-- end product_attributes -->
						<!-- availability or doesntExist -->
							{if $dorDetailavailabilityStatut == 1}
							<p id="availability_statut"{if !$PS_STOCK_MANAGEMENT || ($product->quantity <= 0 && !$product->available_later && $allow_oosp) || ($product->quantity > 0 && !$product->available_now) || !$product->available_for_order || $PS_CATALOG_MODE} style="display: none;"{/if}>
								<span id="availability_label" class="hidden">{l s='Availability:'}</span>
								<i class="fa fa-check-circle"></i><span id="availability_value" class="label{if $product->quantity <= 0 && !$allow_oosp} label-danger{elseif $product->quantity <= 0} label-warning{else} label-success{/if}">{if $product->quantity <= 0}{if $PS_STOCK_MANAGEMENT && $allow_oosp}{$product->available_later}{else}{l s='This product is no longer in stock'}{/if}{elseif $PS_STOCK_MANAGEMENT}{$product->available_now}{/if}</span>
							</p>
							{/if}
						</div>
					</div>
					<div class="productDetailBottomBox">
						<div class="productDetailBottomBox-inner">
							{if $dorDetailReference == 1}
							<p id="product_reference"{if empty($product->reference) || !$product->reference} style="display: none;"{/if}>
								<label>{l s='SKU'} </label>
								<span class="editable" data-itemprop="sku"{if !empty($product->reference) && $product->reference} content="{$product->reference}"{/if}>{if !isset($groups)}{$product->reference|escape:'html':'UTF-8'}{/if}</span>
							</p>
							{/if}
							<div class="posted_in">
								<label>{l s='Category'} </label>
				                <a class="posted-category" href="{$link->getCategoryLink($category->id, $category->link_rewrite)|escape:'htmlall':'UTF-8'}">{$category->name|escape:'html':'UTF-8'}</a>
				            </div>
				            {if isset($product->specificPrice['to'])}
				            	<label>{l s='Expire Date'} </label>
				            	<span>{$product->specificPrice['to']|date_format:"%d/%m/%Y"}</span>
				            {/if}
				            {if $tagProducts}
				            <div class="dor-tag-product-detail">
				            	<label>{l s='Tags'} </label>
								{foreach from=$tagProducts item=tag name=myLoop}
									<a 
									class="dor-effect-hzt {$tag.class} {if $smarty.foreach.myLoop.last}last_item{elseif $smarty.foreach.myLoop.first}first_item{else}item{/if}"
									href="{$link->getPageLink('search', true, NULL, "tag={$tag.name|urlencode}")|escape:'html':'UTF-8'}" 
									title="{l s='More about' mod='blocktags'} {$tag.name|escape:'html':'UTF-8'}" 
									>
										<i class="fa fa-tag hidden"></i>{$tag.name|escape:'html':'UTF-8'}
									</a>
								{/foreach}
							</div>
							{/if}
						</div>
					</div>
					<div class="box-cart-info-wapper">
						<div class="box-cart-bottom pull-left">
							<div class="cart-info-add" {if (!$allow_oosp && $product->quantity <= 0) || !$product->available_for_order || (isset($restricted_country_mode) && $restricted_country_mode) || $PS_CATALOG_MODE} class="unvisible"{/if}>
								<p id="add_to_cart" class="buttons_bottom_block no-print">
									<button type="submit" name="Submit" class="exclusive">
										<span><span class="hidden"><span><i class="fa fa-shopping-cart"></i></span></span><b class="dor-txt-cart">
										{if $content_only && (isset($product->customization_required) && $product->customization_required)}{l s='Customize'}{else}{l s='Add to cart'}{/if}</b></span>
									</button>
								</p>
							</div>
						</div> <!-- end box-cart-bottom -->
						<div class="act-icon-detail pull-left">
							{if isset($HOOK_EXTRA_RIGHT) && $HOOK_EXTRA_RIGHT}{$HOOK_EXTRA_RIGHT}{/if}
							{if isset($HOOK_PRODUCT_ACTIONS) && $HOOK_PRODUCT_ACTIONS}{$HOOK_PRODUCT_ACTIONS}{/if}
							{if !$content_only && $dorDetaillinkblock == 1}
								<!-- usefull links-->
								<ul id="usefull_link_block" class="clearfix no-print">
									{if $HOOK_EXTRA_LEFT}{$HOOK_EXTRA_LEFT}{/if}
									<li class="print">
										<a href="javascript:print();" title="{l s='Print'}">
											<!-- {l s='Print'} -->
										</a>
									</li>
								</ul>
							{/if}
							{if $dorDetailcompare == 1}
							<div class="compare">
								<a class="add_to_compare button--sacnite button--round-l" href="{$link->getProductLink($product)}" data-id-product="{$product->id}" title="{l s='Add to Compare'}" data-toggle="tooltip" data-placement="top"><i class="fa fa-retweet"></i><span>{l s='Add to compare'}</span></a>
							</div>
							{/if}
						</div>
						<div class="dorSharingSocial pull-right">
							<a href="#" onclick="return false" class="dor-social button--sacnite button--round-l" title="{l s='Share this product'}" data-toggle="tooltip" data-placement="top"><i class="fa fa-share-alt" aria-hidden="true"></i></a>
							<div class="dorSharingSocialButton"></div>
						</div>
					</div>
				</div> <!-- end box-info-product -->
				
			</form>
			{/if}
			<!--End Action Form Detail Product-->

			{addJsDef wishlistStatus=$dorDetailwishlist}
			{addJsDef socialsharingStatus=$dorDetailsocialsharing}


			
			
		</div>
		<!-- end center infos-->
	</div> <!-- end primary_block -->
	
	{if !$content_only}
	{assign var='tabClass' value=""}
	{if $dorDetailInfoStyle == 2 || $dorDetailInfoStyle == 3 || $dorDetailInfoStyle == 4}
	{assign var='tabClass' value="tab-pane"}
	{/if}
	<div class="dorTabProductDetail{if $dorDetailInfoStyle == 2} ProductDetailTabs{elseif $dorDetailInfoStyle == 3} ProductDetailTabsCols{elseif $dorDetailInfoStyle == 1} ProductDetailTabsListCols{elseif $dorDetailInfoStyle == 4} ProductDetailTabsStyleRow{/if}">
		<!-- Nav tabs -->
		{if $dorDetailInfoStyle == 2 || $dorDetailInfoStyle == 3 || $dorDetailInfoStyle == 4}
		<ul class="nav nav-tabs" role="tablist">
			{if isset($product) && $product->description}
			<li data-role="presentation" class="active">
				<a href="#productDesc" aria-controls="{l s='data info'}" data-role="tab" data-toggle="tab">{l s='Description'}</a>
			</li>
			{/if}
			{if (isset($quantity_discounts) && count($quantity_discounts) > 0)}
			<li data-role="presentation">
				<a href="#quantityDiscount" aria-controls="{l s='Volume discounts'}" data-role="tab" data-toggle="tab">{l s='Volume discounts'}</a>
			</li>
			{/if}
			
			{if isset($packItems) && $packItems|@count > 0}
			<li data-role="presentation">
				<a href="#packcontent" aria-controls="{l s='Pack content'}" data-role="tab" data-toggle="tab">{l s='Pack content'}</a>
			</li>
			{/if}
			{if isset($features) && $features}
			<li data-role="presentation">
				<a href="#dataSheet" aria-controls="{l s='Additional Information'}" data-role="tab" data-toggle="tab">{l s='Additional Information'}</a>
			</li>
			{/if}
			{*<li data-role="presentation">
				<a href="#productReview" aria-controls="{l s='Reviews'}" data-role="tab" data-toggle="tab">{l s='Reviews'}</a>
			</li>*}
			{if isset($accessories) && $accessories}
			<li data-role="presentation">
				<a href="#accessories" aria-controls="{l s='accessories'}" data-role="tab" data-toggle="tab">{l s='Accessories'}</a>
			</li>
			{/if}
			{$HOOK_PRODUCT_TAB}
		</ul>
		{/if}
		<!-- Tab panes -->
		<div class="tab-content">
		{if (isset($quantity_discounts) && count($quantity_discounts) > 0)}
			<!--Tab Volume discounts-->
			<div data-role="tabpanel" id="quantityDiscount" class="tab-pane">
				<table class="std table-product-discounts">
					<thead>
						<tr>
							<th>{l s='Quantity'}</th>
							<th>{if $display_discount_price}{l s='Price'}{else}{l s='Discount'}{/if}</th>
							<th>{l s='You Save'}</th>
						</tr>
					</thead>
					<tbody>
					{foreach from=$quantity_discounts item='quantity_discount' name='quantity_discounts'}
						{if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
							{$realDiscountPrice=$productPriceWithoutReduction|floatval-$quantity_discount.real_value|floatval}
						{else}
							{$realDiscountPrice=$productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction)|floatval}
						{/if}
						<tr id="quantityDiscount_{$quantity_discount.id_product_attribute}" class="quantityDiscount_{$quantity_discount.id_product_attribute}" data-real-discount-value="{convertPrice price = $realDiscountPrice}" data-discount-type="{$quantity_discount.reduction_type}" data-discount="{$quantity_discount.real_value|floatval}" data-discount-quantity="{$quantity_discount.quantity|intval}">
							<td>
								{$quantity_discount.quantity|intval}
							</td>
							<td>
								{if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
									{if $display_discount_price}
										{if $quantity_discount.reduction_tax == 0 && !$quantity_discount.price}
											{convertPrice price = $productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction_with_tax)|floatval}
										{else}
											{convertPrice price=$productPriceWithoutReduction|floatval-$quantity_discount.real_value|floatval}
										{/if}
									{else}
										{convertPrice price=$quantity_discount.real_value|floatval}
									{/if}
								{else}
									{if $display_discount_price}
										{if $quantity_discount.reduction_tax == 0}
											{convertPrice price = $productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction_with_tax)|floatval}
										{else}
											{convertPrice price = $productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction)|floatval}
										{/if}
									{else}
										{$quantity_discount.real_value|floatval}%
									{/if}
								{/if}
							</td>
							<td>
								<span>{l s='Up to'}</span>
								{if $quantity_discount.price >= 0 || $quantity_discount.reduction_type == 'amount'}
									{$discountPrice=$productPriceWithoutReduction|floatval-$quantity_discount.real_value|floatval}
								{else}
									{$discountPrice=$productPriceWithoutReduction|floatval-($productPriceWithoutReduction*$quantity_discount.reduction)|floatval}
								{/if}
								{$discountPrice=$discountPrice * $quantity_discount.quantity}
								{$qtyProductPrice=$productPriceWithoutReduction|floatval * $quantity_discount.quantity}
								{convertPrice price=$qtyProductPrice - $discountPrice}
							</td>
						</tr>
					{/foreach}
					</tbody>
				</table>
			</div>
			<!--End Tab Volume discounts-->
			{/if}
			
			{if isset($product) && $product->description}
			<div class="entry-content wc-tab {$tabClass} col-lg-4 col-sm-6 col-xs-12 active" data-role="tabpanel" id="productDesc">
				<!-- More info -->
				<!--<h2 class="title-3">{l s='Product Description'}</h2>-->
                <hr class="heading-seperator">
                <div class="scroll-div">
					<div  class="rte">{$product->description}</div>
				</div>
				<!--end  More info -->
			</div>
			{/if}
			{if isset($packItems) && $packItems|@count > 0}
			<div class="entry-content wc-tab col-lg-4 col-sm-6 col-xs-12 hidden" id="packcontent">
				{include file="$tpl_dir./product-list.tpl" products=$packItems}
			</div>
			{/if}
			<div class="entry-content wc-tab {$tabClass} col-lg-4 col-sm-6 col-xs-12" data-role="tabpanel" id="productReview">
				<!--HOOK_PRODUCT_TAB -->
				<!--<h2 class="title-3">{l s='Product Review'}</h2>-->
                <hr class="heading-seperator">
                <div class="scroll-div">
				{if isset($HOOK_PRODUCT_TAB_CONTENT) && $HOOK_PRODUCT_TAB_CONTENT}{$HOOK_PRODUCT_TAB_CONTENT}{/if}
				</div>
				<!--end HOOK_PRODUCT_TAB -->
			</div>
			{if isset($features) && $features}
			<!--Tab Data sheet-->
			<div class="entry-content wc-tab {$tabClass} col-lg-4 col-sm-6 col-xs-12" data-role="tabpanel" id="dataSheet">
				<!--<h2 class="title-3">{l s='Additional Information'}</h2>-->
                <hr class="heading-seperator">
                <div class="scroll-div">
					<table class="table-data-sheet">
						{foreach from=$features item=feature}
						<tr class="{cycle values="odd,even"}">
							{if isset($feature.value)}
							<td>{$feature.name|escape:'html':'UTF-8'}</td>
							<td>{$feature.value|escape:'html':'UTF-8'}</td>
							{/if}
						</tr>
						{/foreach}
					</table>
				</div>
			</div>
			<!--End Tab Data sheet-->
			{/if}
			{if isset($accessories) && $accessories}
			<div data-role="tabpanel" class="tab-pane hidden" id="accessories">
				<div class="block_content">
					<ul id="bxslider" class="bxslider clearfix">
						{foreach from=$accessories item=accessory name=accessories_list}
							{if ($accessory.allow_oosp || $accessory.quantity_all_versions > 0 || $accessory.quantity > 0) && $accessory.available_for_order && !isset($restricted_country_mode)}
								{assign var='accessoryLink' value=$link->getProductLink($accessory.id_product, $accessory.link_rewrite, $accessory.category)}
								<li class="item product-box ajax_block_product{if $smarty.foreach.accessories_list.first} first_item{elseif $smarty.foreach.accessories_list.last} last_item{else} item{/if} product_accessories_description">
									<div class="product_desc">
										<a href="{$accessoryLink|escape:'html':'UTF-8'}" title="{$accessory.legend|escape:'html':'UTF-8'}" class="product-image product_image">
											<img class="lazyOwl" src="{$link->getImageLink($accessory.link_rewrite, $accessory.id_image, 'home_default')|escape:'html':'UTF-8'}" alt="{$accessory.legend|escape:'html':'UTF-8'}" width="{$homeSize.width}" height="{$homeSize.height}"/>
										</a>
										<div class="block_description">
											<a href="{$accessoryLink|escape:'html':'UTF-8'}" title="{l s='More'}" class="product_description">
												{$accessory.description_short|strip_tags|truncate:25:'...'}
											</a>
										</div>
									</div>
									<div class="s_title_block">
										<h5 data-itemprop="name" class="product-name">
											<a href="{$accessoryLink|escape:'html':'UTF-8'}">
												{$accessory.name|truncate:20:'...':true|escape:'html':'UTF-8'}
											</a>
										</h5>
										{if $accessory.show_price && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
										<span class="price">
											{if $priceDisplay != 1}
												{displayWtPrice p=$accessory.price}
											{else}
												{displayWtPrice p=$accessory.price_tax_exc}
											{/if}
											{hook h="displayProductPriceBlock" product=$accessory type="price"}
										</span>
										{/if}
										{hook h="displayProductPriceBlock" product=$accessory type="after_price"}
									</div>
									<div class="clearfix" style="margin-top:5px">
										{if !$PS_CATALOG_MODE && ($accessory.allow_oosp || $accessory.quantity > 0) && isset($add_prod_display) && $add_prod_display == 1}
											<div class="no-print">
												<a class="exclusive button ajax_add_to_cart_button" href="{$link->getPageLink('cart', true, NULL, "qty=1&amp;id_product={$accessory.id_product|intval}&amp;token={$static_token}&amp;add")|escape:'html':'UTF-8'}" data-id-product="{$accessory.id_product|intval}" title="{l s='Add to cart'}">
													<span>{l s='Add to cart'}</span>
												</a>
											</div>
										{/if}
									</div>
								</li>
							{/if}
						{/foreach}
					</ul>
				</div>
			</div>
			{/if}
		</div>
	</div><!-- End Dor Tab Product Detail -->

		<!-- description & features -->
		{if (isset($product) && $product->description) || (isset($features) && $features) || (isset($accessories) && $accessories) || (isset($HOOK_PRODUCT_TAB) && $HOOK_PRODUCT_TAB) || (isset($attachments) && $attachments) || isset($product) && $product->customizable}
			{if isset($attachments) && $attachments}
			<!--Download -->
			<section class="page-product-box">
				<h3 class="page-product-heading">{l s='Download'}</h3>
				{foreach from=$attachments item=attachment name=attachements}
					{if $smarty.foreach.attachements.iteration %3 == 1}<div class="row">{/if}
						<div class="col-lg-4">
							<h4><a href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")|escape:'html':'UTF-8'}">{$attachment.name|escape:'html':'UTF-8'}</a></h4>
							<p class="text-muted">{$attachment.description|escape:'html':'UTF-8'}</p>
							<a class="btn btn-default btn-block" href="{$link->getPageLink('attachment', true, NULL, "id_attachment={$attachment.id_attachment}")|escape:'html':'UTF-8'}">
								<i class="icon-download"></i>
								{l s="Download"} ({Tools::formatBytes($attachment.file_size, 2)})
							</a>
							<hr />
						</div>
					{if $smarty.foreach.attachements.iteration %3 == 0 || $smarty.foreach.attachements.last}</div>{/if}
				{/foreach}
			</section>
			<!--end Download -->
			{/if}
			{if isset($product) && $product->customizable}
			<!--Customization -->
			<section class="page-product-box">
				<h3 class="page-product-heading">{l s='Product customization'}</h3>
				<!-- Customizable products -->
				<form method="post" action="{$customizationFormTarget}" enctype="multipart/form-data" id="customizationForm" class="clearfix">
					<p class="infoCustomizable">
						{l s='After saving your customized product, remember to add it to your cart.'}
						{if $product->uploadable_files}
						<br />
						{l s='Allowed file formats are: GIF, JPG, PNG'}{/if}
					</p>
					{if $product->uploadable_files|intval}
						<div class="customizableProductsFile">
							<h5 class="product-heading-h5">{l s='Pictures'}</h5>
							<ul id="uploadable_files" class="clearfix">
								{counter start=0 assign='customizationField'}
								{foreach from=$customizationFields item='field' name='customizationFields'}
									{if $field.type == 0}
										<li class="customizationUploadLine{if $field.required} required{/if}">{assign var='key' value='pictures_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
											{if isset($pictures.$key)}
												<div class="customizationUploadBrowse">
													<img src="{$pic_dir}{$pictures.$key}_small" alt="" />
														<a href="{$link->getProductDeletePictureLink($product, $field.id_customization_field)|escape:'html':'UTF-8'}" title="{l s='Delete'}" >
															<img src="{$img_dir}icon/delete.gif" alt="{l s='Delete'}" class="customization_delete_icon" width="11" height="13" />
														</a>
												</div>
											{/if}
											<div class="customizationUploadBrowse form-group">
												<label class="customizationUploadBrowseDescription">
													{if !empty($field.name)}
														{$field.name}
													{else}
														{l s='Please select an image file from your computer'}
													{/if}
													{if $field.required}<sup>*</sup>{/if}
												</label>
												<input type="file" name="file{$field.id_customization_field}" id="img{$customizationField}" class="form-control customization_block_input {if isset($pictures.$key)}filled{/if}" />
											</div>
										</li>
										{counter}
									{/if}
								{/foreach}
							</ul>
						</div>
					{/if}
					{if $product->text_fields|intval}
						<div class="customizableProductsText">
							<h5 class="product-heading-h5">{l s='Text'}</h5>
							<ul id="text_fields">
							{counter start=0 assign='customizationField'}
							{foreach from=$customizationFields item='field' name='customizationFields'}
								{if $field.type == 1}
									<li class="customizationUploadLine{if $field.required} required{/if}">
										<label for ="textField{$customizationField}">
											{assign var='key' value='textFields_'|cat:$product->id|cat:'_'|cat:$field.id_customization_field}
											{if !empty($field.name)}
												{$field.name}
											{/if}
											{if $field.required}<sup>*</sup>{/if}
										</label>
										<textarea name="textField{$field.id_customization_field}" class="form-control customization_block_input" id="textField{$customizationField}" rows="3" cols="20">{strip}
											{if isset($textFields.$key)}
												{$textFields.$key|stripslashes}
											{/if}
										{/strip}</textarea>
									</li>
									{counter}
								{/if}
							{/foreach}
							</ul>
						</div>
					{/if}
					<p id="customizedDatas">
						<input type="hidden" name="quantityBackup" id="quantityBackup" value="" />
						<input type="hidden" name="submitCustomizedDatas" value="1" />
						<button class="button btn btn-default button button-small" name="saveCustomization">
							<span>{l s='Save'}</span>
						</button>
						<span id="ajax-loader" class="unvisible">
							<img src="{$img_ps_dir}loader.gif" alt="loader" />
						</span>
					</p>
				</form>
				<p class="clear required"><sup>*</sup> {l s='required fields'}</p>
			</section>
			<!--end Customization -->
			{/if}
		{/if}
		{if isset($HOOK_PRODUCT_FOOTER) && $HOOK_PRODUCT_FOOTER}{$HOOK_PRODUCT_FOOTER}{/if}
	{/if}
</div> <!-- itemscope product wrapper -->
{strip}
{if isset($smarty.get.ad) && $smarty.get.ad}
	{addJsDefL name=ad}{$base_dir|cat:$smarty.get.ad|escape:'html':'UTF-8'}{/addJsDefL}
{/if}
{if isset($smarty.get.adtoken) && $smarty.get.adtoken}
	{addJsDefL name=adtoken}{$smarty.get.adtoken|escape:'html':'UTF-8'}{/addJsDefL}
{/if}
{addJsDef allowBuyWhenOutOfStock=$allow_oosp|boolval}
{addJsDef availableNowValue=$product->available_now|escape:'quotes':'UTF-8'}
{addJsDef availableLaterValue=$product->available_later|escape:'quotes':'UTF-8'}
{addJsDef attribute_anchor_separator=$attribute_anchor_separator|escape:'quotes':'UTF-8'}
{addJsDef attributesCombinations=$attributesCombinations}
{addJsDef currentDate=$smarty.now|date_format:'%Y-%m-%d %H:%M:%S'}
{if isset($combinations) && $combinations}
	{addJsDef combinations=$combinations}
	{addJsDef combinationsFromController=$combinations}
	{addJsDef displayDiscountPrice=$display_discount_price}
	{addJsDefL name='upToTxt'}{l s='Up to' js=1}{/addJsDefL}
{/if}
{if isset($combinationImages) && $combinationImages}
	{addJsDef combinationImages=$combinationImages}
{/if}
{addJsDef customizationId=$id_customization}
{addJsDef customizationFields=$customizationFields}
{addJsDef default_eco_tax=$product->ecotax|floatval}
{addJsDef displayPrice=$priceDisplay|intval}
{addJsDef ecotaxTax_rate=$ecotaxTax_rate|floatval}
{if isset($cover.id_image_only)}
	{addJsDef idDefaultImage=$cover.id_image_only|intval}
{else}
	{addJsDef idDefaultImage=0}
{/if}
{addJsDef img_ps_dir=$img_ps_dir}
{addJsDef img_prod_dir=$img_prod_dir}
{addJsDef id_product=$product->id|intval}
{addJsDef jqZoomEnabled=$jqZoomEnabled|boolval}
{addJsDef maxQuantityToAllowDisplayOfLastQuantityMessage=$last_qties|intval}
{addJsDef minimalQuantity=$product->minimal_quantity|intval}
{addJsDef noTaxForThisProduct=$no_tax|boolval}
{if isset($customer_group_without_tax)}
	{addJsDef customerGroupWithoutTax=$customer_group_without_tax|boolval}
{else}
	{addJsDef customerGroupWithoutTax=false}
{/if}
{if isset($group_reduction)}
	{addJsDef groupReduction=$group_reduction|floatval}
{else}
	{addJsDef groupReduction=false}
{/if}
{addJsDef oosHookJsCodeFunctions=Array()}
{addJsDef productHasAttributes=isset($groups)|boolval}
{addJsDef productPriceTaxExcluded=($product->getPriceWithoutReduct(true)|default:'null' - $product->ecotax)|floatval}
{addJsDef productPriceTaxIncluded=($product->getPriceWithoutReduct(false)|default:'null' - $product->ecotax * (1 + $ecotaxTax_rate / 100))|floatval}
{addJsDef productBasePriceTaxExcluded=($product->getPrice(false, null, 6, null, false, false) - $product->ecotax)|floatval}
{addJsDef productBasePriceTaxExcl=($product->getPrice(false, null, 6, null, false, false)|floatval)}
{addJsDef productBasePriceTaxIncl=($product->getPrice(true, null, 6, null, false, false)|floatval)}
{addJsDef productReference=$product->reference|escape:'html':'UTF-8'}
{addJsDef productAvailableForOrder=$product->available_for_order|boolval}
{addJsDef productPriceWithoutReduction=$productPriceWithoutReduction|floatval}
{addJsDef productPrice=$productPrice|floatval}
{addJsDef productUnitPriceRatio=$product->unit_price_ratio|floatval}
{addJsDef productShowPrice=(!$PS_CATALOG_MODE && $product->show_price)|boolval}
{addJsDef PS_CATALOG_MODE=$PS_CATALOG_MODE}
{if $product->specificPrice && $product->specificPrice|@count}
	{addJsDef product_specific_price=$product->specificPrice}
{else}
	{addJsDef product_specific_price=array()}
{/if}
{if $display_qties == 1 && $product->quantity}
	{addJsDef quantityAvailable=$product->quantity}
{else}
	{addJsDef quantityAvailable=0}
{/if}
{addJsDef quantitiesDisplayAllowed=$display_qties|boolval}
{if $product->specificPrice && $product->specificPrice.reduction && $product->specificPrice.reduction_type == 'percentage'}
	{addJsDef reduction_percent=$product->specificPrice.reduction*100|floatval}
{else}
	{addJsDef reduction_percent=0}
{/if}
{if $product->specificPrice && $product->specificPrice.reduction && $product->specificPrice.reduction_type == 'amount'}
	{addJsDef reduction_price=$product->specificPrice.reduction|floatval}
{else}
	{addJsDef reduction_price=0}
{/if}
{if $product->specificPrice && $product->specificPrice.price}
	{addJsDef specific_price=$product->specificPrice.price|floatval}
{else}
	{addJsDef specific_price=0}
{/if}
{addJsDef specific_currency=($product->specificPrice && $product->specificPrice.id_currency)|boolval} {* TODO: remove if always false *}
{addJsDef stock_management=$PS_STOCK_MANAGEMENT|intval}
{addJsDef taxRate=$tax_rate|floatval}
{addJsDefL name=doesntExist}{l s='This combination does not exist for this product. Please select another combination.' js=1}{/addJsDefL}
{addJsDefL name=doesntExistNoMore}{l s='This product is no longer in stock' js=1}{/addJsDefL}
{addJsDefL name=doesntExistNoMoreBut}{l s='with those attributes but is available with others.' js=1}{/addJsDefL}
{addJsDefL name=fieldRequired}{l s='Please fill in all the required fields before saving your customization.' js=1}{/addJsDefL}
{addJsDefL name=uploading_in_progress}{l s='Uploading in progress, please be patient.' js=1}{/addJsDefL}
{addJsDefL name='product_fileDefaultHtml'}{l s='No file selected' js=1}{/addJsDefL}
{addJsDefL name='product_fileButtonHtml'}{l s='Choose File' js=1}{/addJsDefL}
{/strip}
{/if}
{addJsDef comparator_max_item=$comparator_max_item}
{addJsDef comparedProductsIds=$compared_products}
<script type="text/javascript">
	jQuery(document).ready(function(){
		jQuery(".socialsharing_product").detach().appendTo('.dorSharingSocialButton');
		jQuery(".tags-detail-products").detach().appendTo('#productTags');
		if(parseInt(wishlistStatus) == 0 || wishlistStatus == false){
			$('#wishlist_button_nopop').parent().remove();
		}
		if(parseInt(socialsharingStatus) == 0){
			$('.socialsharing_product').remove();
		}
	});
</script>
