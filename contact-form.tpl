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
{capture name=path}{l s='Contact'}{/capture}
<h1 class="page-heading bottom-indent hidden">
	{l s='Contact Us'}
</h1>
{if $dorContactStyle == 1}
	{if isset($confirmation)}
		<p class="alert alert-success">{l s='Your message has been successfully sent to our team.'}</p>
		<ul class="footer_links clearfix">
			<li>
				<a class="btn btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}">
					<span>
						<i class="icon-chevron-left"></i>{l s='Home'}
					</span>
				</a>
			</li>
		</ul>
	{elseif isset($alreadySent)}
		<p class="alert alert-warning">{l s='Your message has already been sent.'}</p>
		<ul class="footer_links clearfix">
			<li>
				<a class="btn btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}">
					<span>
						<i class="icon-chevron-left"></i>{l s='Home'}
					</span>
				</a>
			</li>
		</ul>
	{else}
		{include file="$tpl_dir./errors.tpl"}
		<div id="contact-form-style1">
			<form action="{$request_uri}" method="post" class="contact-form-box" enctype="multipart/form-data">
				<fieldset>
					<h3 class="page-subheading hidden">{l s='send a message'}</h3>
					<div class="clearfix">
						<div class="group-contact-form">
							<div class="text-info-contact col-xs-12 col-sm-4 col-md-4">
								<ul class="list-contact-info">
									<li>
										<h3>{l s='Address'}</h3>
										<p>1800 Abbot Kinney Blvd. Unit D&E</p>
										<p>Venice, CA 90291</p>
									</li>
									<li>
										<h3>{l s='Phone'}</h3>
										<p>{l s='Mobile:'} (+88)-1990-6886</p>
										<p>{l s='Hotline:'} 1800-1102</p>
									</li>
									<li>
										<h3>{l s='Email'}</h3>
										<p>support@organie.com</p>
										<p>contact@organie.com</p>
									</li>
									<li class="contact-social">
										<h3>{l s='Social'}</h3>
										<div class="list-icon-social-contact">
											<div class="social-connect-icon"><a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a> <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a> <a href="#" data-toggle="tooltip" data-placement="top" title="Youtube"><i class="fa fa-youtube-play" aria-hidden="true"></i></a> <a href="#" data-toggle="tooltip" data-placement="top" title="Vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></div>
										</div>
									</li>
								</ul>
							</div>
							<div class="form-info-contact col-xs-12 col-sm-8 col-md-8">
								<h2>{l s='Get in touch'}</h2>
								<div class="form-group selector1 hidden">
									<label for="id_contact">{l s='Subject Heading'}</label>
								{if isset($customerThread.id_contact) && $customerThread.id_contact && $contacts|count}
										{assign var=flag value=true}
										{foreach from=$contacts item=contact}
											{if $contact.id_contact == $customerThread.id_contact}
												<input type="text" class="form-control" id="contact_name" name="contact_name" value="{$contact.name|escape:'html':'UTF-8'}" readonly="readonly" />
												<input type="hidden" name="id_contact" value="{$contact.id_contact|intval}" />
												{$flag=false}
											{/if}
										{/foreach}
										{if $flag && isset($contacts.0.id_contact)}
												<input type="text" class="form-control" id="contact_name" name="contact_name" value="{$contacts.0.name|escape:'html':'UTF-8'}" readonly="readonly" />
												<input type="hidden" name="id_contact" value="{$contacts.0.id_contact|intval}" />
										{/if}
								</div>
								{else}
									<select id="id_contact" class="form-control" name="id_contact">
										<option value="0">{l s='-- Choose --'}</option>
										{foreach from=$contacts item=contact key=i}
											<option value="{$contact.id_contact|intval}"{if $i == 1} selected="selected"{/if}>{$contact.name|escape:'html':'UTF-8'}</option>
										{/foreach}
									</select>
								</div>
									<p id="desc_contact0" class="desc_contact{if isset($smarty.request.id_contact)} unvisible{/if}">&nbsp;</p>
									{foreach from=$contacts item=contact}
										<p id="desc_contact{$contact.id_contact|intval}" class="desc_contact contact-title{if !isset($smarty.request.id_contact) || $smarty.request.id_contact|intval != $contact.id_contact|intval} unvisible{/if}">
											<i class="icon-comment-alt"></i>{$contact.description|escape:'html':'UTF-8'}
										</p>
									{/foreach}
								{/if}
								<div class="form-group-input row">
									<div class="form-group col-lg-4 col-sm-4 col-xs-12">
										<label for="contactname" class="hidden">{l s='Your name'}</label>
										<input class="form-control grey" type="text" id="contactname" name="contactname" value="" placeholder="{l s='Your name'}"/>
									</div>
									<div class="form-group col-lg-4 col-sm-4 col-xs-12">
										<label for="email" class="hidden">{l s='Email address'}</label>
										{if isset($customerThread.email)}
											<input class="form-control grey" type="text" id="email" name="from" value="{$customerThread.email|escape:'html':'UTF-8'}" readonly="readonly" />
										{else}
											<input class="form-control grey validate" type="text" id="email" name="from" data-validate="isEmail" value="{$email|escape:'html':'UTF-8'}" placeholder="{l s='E-mail'}"/>
										{/if}
									</div>
									<div class="form-group col-lg-4 col-sm-4 col-xs-12">
										<label for="contactweb" class="hidden">{l s='Website'}</label>
										<input class="form-control grey" type="text" id="contactweb" name="contactweb" value="" placeholder="{l s='Website'}"/>
									</div>
								</div>
								{if !$PS_CATALOG_MODE}
									{if (!isset($customerThread.id_order) || $customerThread.id_order > 0)}
										<div class="form-group selector1 hidden">
											<label>{l s='Order reference'}</label>
											{if !isset($customerThread.id_order) && isset($is_logged) && $is_logged}
												<select name="id_order" class="form-control">
													<option value="0">{l s='-- Choose --'}</option>
													{foreach from=$orderList item=order}
														<option value="{$order.value|intval}"{if $order.selected|intval} selected="selected"{/if}>{$order.label|escape:'html':'UTF-8'}</option>
													{/foreach}
												</select>
											{elseif !isset($customerThread.id_order) && empty($is_logged)}
												<input class="form-control grey" type="text" name="id_order" id="id_order" value="{if isset($customerThread.id_order) && $customerThread.id_order|intval > 0}{$customerThread.id_order|intval}{else}{if isset($smarty.post.id_order) && !empty($smarty.post.id_order)}{$smarty.post.id_order|escape:'html':'UTF-8'}{/if}{/if}" />
											{elseif $customerThread.id_order|intval > 0}
												<input class="form-control grey" type="text" name="id_order" id="id_order" value="{if isset($customerThread.reference) && $customerThread.reference}{$customerThread.reference|escape:'html':'UTF-8'}{else}{$customerThread.id_order|intval}{/if}" readonly="readonly" />
											{/if}
										</div>
									{/if}
									{if isset($is_logged) && $is_logged}
										<div class="form-group selector1 hidden">
											<label class="unvisible">{l s='Product'}</label>
											{if !isset($customerThread.id_product)}
												{foreach from=$orderedProductList key=id_order item=products name=products}
													<select name="id_product" id="{$id_order}_order_products" class="unvisible product_select form-control"{if !$smarty.foreach.products.first} style="display:none;"{/if}{if !$smarty.foreach.products.first} disabled="disabled"{/if}>
														<option value="0">{l s='-- Choose --'}</option>
														{foreach from=$products item=product}
															<option value="{$product.value|intval}">{$product.label|escape:'html':'UTF-8'}</option>
														{/foreach}
													</select>
												{/foreach}
											{elseif $customerThread.id_product > 0}
												<input  type="hidden" name="id_product" id="id_product" value="{$customerThread.id_product|intval}" readonly="readonly" />
											{/if}
										</div>
									{/if}
								{/if}
								{if $fileupload == 1}
									<p class="form-group hidden">
										<label for="fileUpload">{l s='Attach File'}</label>
										<input type="hidden" name="MAX_FILE_SIZE" value="{if isset($max_upload_size) && $max_upload_size}{$max_upload_size|intval}{else}2000000{/if}" />
										<input type="file" name="fileUpload" id="fileUpload" class="form-control" />
									</p>
								{/if}
								<div class="form-group-area">
									<div class="form-group">
										<label for="message" class="hidden">{l s='Message'}</label>
										<textarea class="form-control" rows="7" id="message" name="message" placeholder="{l s='Comment'}">{if isset($message)}{$message|escape:'html':'UTF-8'|stripslashes}{/if}</textarea>
									</div>
								</div>
								<div class="submit">
									<button type="submit" name="submitMessage" id="submitMessage" class="button btn btn-default button-medium"><span>{l s='Post Comment'}<i class="icon-chevron-right right hidden"></i></span></button>
								</div>
							</div>
						</div>
						<div class="contact-map clearfix">
					        <div id="mapContact" style="width:100%; height:500px; margin: auto; margin-top: 20px;"></div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	{/if}
{elseif $dorContactStyle == 2}
	{if isset($confirmation)}
		<p class="alert alert-success">{l s='Your message has been successfully sent to our team.'}</p>
		<ul class="footer_links clearfix">
			<li>
				<a class="btn btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}">
					<span>
						<i class="icon-chevron-left"></i>{l s='Home'}
					</span>
				</a>
			</li>
		</ul>
	{elseif isset($alreadySent)}
		<p class="alert alert-warning">{l s='Your message has already been sent.'}</p>
		<ul class="footer_links clearfix">
			<li>
				<a class="btn btn-default button button-small" href="{if isset($force_ssl) && $force_ssl}{$base_dir_ssl}{else}{$base_dir}{/if}">
					<span>
						<i class="icon-chevron-left"></i>{l s='Home'}
					</span>
				</a>
			</li>
		</ul>
	{else}
		{include file="$tpl_dir./errors.tpl"}
		<div id="contact-form-style2">
			<div class="style2InfoContact">
				<div class="container">
					<div class="row">
						<div class="media-info-contact col-xs-12 col-sm-6 col-md-6">
							<div class="media-contact-inner">
								<img src="{$tpl_uri|escape:'html':'UTF-8'}img/dorado/contact/contact-image.png" alt="{$shop_name|escape:'html':'UTF-8'}"/>
							</div>
						</div>
						<div class="text-info-contact col-xs-12 col-sm-6 col-md-6">
							<h3>{l s="Get in touch"}</h3>
							<p class="txt-info">{l s="Vestibulum quis posuere ligula. Fusce in odio ac diam finibus tempus. Suspen disse potenti. Etiam accu msan purus magna, ever ara mus consequat, felis at aliquam consect etur."}</p>			
							<ul class="list-contact-info">
								<li>
									<h3>{l s='Address'}</h3>
									<p>1800 Abbot Kinney Blvd. Unit D&E</p>
									<p>Venice, CA 90291</p>
								</li>
								<li>
									<h3>{l s='Phone'}</h3>
									<p>{l s='Mobile:'} (+88)-1990-6886</p>
									<p>{l s='Hotline:'} 1800-1102</p>
								</li>
								<li>
									<h3>{l s='Email'}</h3>
									<p>support@organie.com</p>
									<p>contact@organie.com</p>
								</li>
								<li class="contact-social">
									<h3>{l s='Social'}</h3>
									<div class="list-icon-social-contact">
										<div class="social-connect-icon"><a href="#" data-toggle="tooltip" data-placement="top" title="Facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a> <a href="#" data-toggle="tooltip" data-placement="top" title="Twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a> <a href="#" data-toggle="tooltip" data-placement="top" title="Youtube"><i class="fa fa-youtube-play" aria-hidden="true"></i></a> <a href="#" data-toggle="tooltip" data-placement="top" title="Vimeo"><i class="fa fa-vimeo" aria-hidden="true"></i></a></div>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="contact-map clearfix">
		        <div id="mapContact" style="width:100%; height:500px; margin: auto; margin-top: 20px;"></div>
			</div>
			<div class="style2FormContact container">
				<form action="{$request_uri}" method="post" class="contact-form-box" enctype="multipart/form-data">
					<fieldset>
						<h3 class="page-subheading hidden">{l s='send a message'}</h3>
						<div class="clearfix">
							<div class="group-contact-form">
								<div class="form-info-contact col-xs-12 col-sm-8 col-md-8">
									<div class="txt-head-contact"><h2>{l s='Leave us a message'}</h2><span>- {l s='Good for nature, good for you'} -</span></div>
									<div class="form-group selector1 hidden">
										<label for="id_contact">{l s='Subject Heading'}</label>
									{if isset($customerThread.id_contact) && $customerThread.id_contact && $contacts|count}
											{assign var=flag value=true}
											{foreach from=$contacts item=contact}
												{if $contact.id_contact == $customerThread.id_contact}
													<input type="text" class="form-control" id="contact_name" name="contact_name" value="{$contact.name|escape:'html':'UTF-8'}" readonly="readonly" />
													<input type="hidden" name="id_contact" value="{$contact.id_contact|intval}" />
													{$flag=false}
												{/if}
											{/foreach}
											{if $flag && isset($contacts.0.id_contact)}
													<input type="text" class="form-control" id="contact_name" name="contact_name" value="{$contacts.0.name|escape:'html':'UTF-8'}" readonly="readonly" />
													<input type="hidden" name="id_contact" value="{$contacts.0.id_contact|intval}" />
											{/if}
									</div>
									{else}
										<select id="id_contact" class="form-control" name="id_contact">
											<option value="0">{l s='-- Choose --'}</option>
											{foreach from=$contacts item=contact key=i}
												<option value="{$contact.id_contact|intval}"{if $i == 1} selected="selected"{/if}>{$contact.name|escape:'html':'UTF-8'}</option>
											{/foreach}
										</select>
									</div>
										<p id="desc_contact0" class="desc_contact{if isset($smarty.request.id_contact)} unvisible{/if}">&nbsp;</p>
										{foreach from=$contacts item=contact}
											<p id="desc_contact{$contact.id_contact|intval}" class="desc_contact contact-title{if !isset($smarty.request.id_contact) || $smarty.request.id_contact|intval != $contact.id_contact|intval} unvisible{/if}">
												<i class="icon-comment-alt"></i>{$contact.description|escape:'html':'UTF-8'}
											</p>
										{/foreach}
									{/if}
									<div class="form-group-input row">
										<div class="form-group col-lg-4 col-sm-4 col-xs-12">
											<label for="contactname" class="hidden">{l s='Your name'}</label>
											<input class="form-control grey" type="text" id="contactname" name="contactname" value="" placeholder="{l s='Your name'}"/>
										</div>
										<div class="form-group col-lg-4 col-sm-4 col-xs-12">
											<label for="email" class="hidden">{l s='Email address'}</label>
											{if isset($customerThread.email)}
												<input class="form-control grey" type="text" id="email" name="from" value="{$customerThread.email|escape:'html':'UTF-8'}" readonly="readonly" />
											{else}
												<input class="form-control grey validate" type="text" id="email" name="from" data-validate="isEmail" value="{$email|escape:'html':'UTF-8'}" placeholder="{l s='E-mail'}"/>
											{/if}
										</div>
										<div class="form-group col-lg-4 col-sm-4 col-xs-12">
											<label for="contactweb" class="hidden">{l s='Website'}</label>
											<input class="form-control grey" type="text" id="contactweb" name="contactweb" value="" placeholder="{l s='Website'}"/>
										</div>
									</div>
									{if !$PS_CATALOG_MODE}
										{if (!isset($customerThread.id_order) || $customerThread.id_order > 0)}
											<div class="form-group selector1 hidden">
												<label>{l s='Order reference'}</label>
												{if !isset($customerThread.id_order) && isset($is_logged) && $is_logged}
													<select name="id_order" class="form-control">
														<option value="0">{l s='-- Choose --'}</option>
														{foreach from=$orderList item=order}
															<option value="{$order.value|intval}"{if $order.selected|intval} selected="selected"{/if}>{$order.label|escape:'html':'UTF-8'}</option>
														{/foreach}
													</select>
												{elseif !isset($customerThread.id_order) && empty($is_logged)}
													<input class="form-control grey" type="text" name="id_order" id="id_order" value="{if isset($customerThread.id_order) && $customerThread.id_order|intval > 0}{$customerThread.id_order|intval}{else}{if isset($smarty.post.id_order) && !empty($smarty.post.id_order)}{$smarty.post.id_order|escape:'html':'UTF-8'}{/if}{/if}" />
												{elseif $customerThread.id_order|intval > 0}
													<input class="form-control grey" type="text" name="id_order" id="id_order" value="{if isset($customerThread.reference) && $customerThread.reference}{$customerThread.reference|escape:'html':'UTF-8'}{else}{$customerThread.id_order|intval}{/if}" readonly="readonly" />
												{/if}
											</div>
										{/if}
										{if isset($is_logged) && $is_logged}
											<div class="form-group selector1 hidden">
												<label class="unvisible">{l s='Product'}</label>
												{if !isset($customerThread.id_product)}
													{foreach from=$orderedProductList key=id_order item=products name=products}
														<select name="id_product" id="{$id_order}_order_products" class="unvisible product_select form-control"{if !$smarty.foreach.products.first} style="display:none;"{/if}{if !$smarty.foreach.products.first} disabled="disabled"{/if}>
															<option value="0">{l s='-- Choose --'}</option>
															{foreach from=$products item=product}
																<option value="{$product.value|intval}">{$product.label|escape:'html':'UTF-8'}</option>
															{/foreach}
														</select>
													{/foreach}
												{elseif $customerThread.id_product > 0}
													<input  type="hidden" name="id_product" id="id_product" value="{$customerThread.id_product|intval}" readonly="readonly" />
												{/if}
											</div>
										{/if}
									{/if}
									{if $fileupload == 1}
										<p class="form-group hidden">
											<label for="fileUpload">{l s='Attach File'}</label>
											<input type="hidden" name="MAX_FILE_SIZE" value="{if isset($max_upload_size) && $max_upload_size}{$max_upload_size|intval}{else}2000000{/if}" />
											<input type="file" name="fileUpload" id="fileUpload" class="form-control" />
										</p>
									{/if}
									<div class="form-group-area">
										<div class="form-group">
											<label for="message" class="hidden">{l s='Message'}</label>
											<textarea class="form-control" rows="7" id="message" name="message" placeholder="{l s='Comment'}">{if isset($message)}{$message|escape:'html':'UTF-8'|stripslashes}{/if}</textarea>
										</div>
									</div>
									<div class="submit">
										<button type="submit" name="submitMessage" id="submitMessage" class="button btn btn-default button-medium"><span>{l s='Post Comment'}<i class="icon-chevron-right right hidden"></i></span></button>
									</div>
								</div>
							</div>
							
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	{/if}
{/if}
{addJsDefL name='contact_fileDefaultHtml'}{l s='No file selected' js=1}{/addJsDefL}
{addJsDefL name='contact_fileButtonHtml'}{l s='Choose File' js=1}{/addJsDefL}
