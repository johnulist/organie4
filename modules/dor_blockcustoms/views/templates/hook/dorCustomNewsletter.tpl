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
<!-- Block Newsletter module-->
<div id="dor_custom_newsletter_block" class="block col-lg-12 col-sm-12 col-sx-12">
	<div class="row">
		<label class="col-lg-4 col-sm-3 col-md-4 col-sx-12 text-right">
			<span>{l s='Envie d\'être tenu au courant ?' mod='blocknewsletter'}</span>
		</label>
		<div class="block_content col-lg-8 col-sm-9 col-md-8 col-sx-12">
			<form action="{$link->getPageLink('index', null, null, null, false, null, true)|escape:'html':'UTF-8'}" method="post">
				<div class="form-group{if isset($msg) && $msg } {if $nw_error}form-error{else}form-ok{/if}{/if}" >
					<input class="inputNew form-control newsletter-input" id="newsletter-input" type="text" name="email" size="18" placeholder="{if isset($msg) && $msg}{$msg}{elseif isset($value) && $value}{$value}{else}{l s='Entrez votre adresse email...' mod='blocknewsletter'}{/if}" />
	                <button type="submit" name="submitNewsletter" id="dorSubmitNewsletter" class="btn btn-default button button-small">
	                    <span>{l s='Valider' mod='blocknewsletter'}</span>
	                </button>
					<input type="hidden" name="action" value="0" />
				</div>
			</form>
		</div>
	</div>
    {hook h="displayBlockNewsletterBottom" from='blocknewsletter'}
</div>
<!-- /Block Newsletter module-->
{strip}
{if isset($msg) && $msg}
{addJsDef msg_newsl=$msg|@addcslashes:'\''}
{/if}
{if isset($nw_error)}
{addJsDef nw_error=$nw_error}
{/if}
{addJsDefL name=placeholder_blocknewsletter}{l s='Please enter your email' mod='blocknewsletter' js=1}{/addJsDefL}
{if isset($msg) && $msg}
	{addJsDefL name=alert_blocknewsletter}{l s='Newsletter : %1$s' sprintf=$msg js=1 mod="blocknewsletter"}{/addJsDefL}
{/if}
{/strip}
