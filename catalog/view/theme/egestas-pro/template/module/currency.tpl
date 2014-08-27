<?php if (count($currencies) > 1) { ?>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	<div id="currency">
		<select class="custom-select" name="currency_code" onchange="$(this).parent().parent().submit();">
			<?php foreach ($currencies as $currency) { ?>
			<option value="<?php echo $currency['code']; ?>"<?php if ($currency['code'] == $currency_code) echo ' selected="selected"'; ?>><?php echo $currency['code']; ?></option>
			<?php } ?>
		</select>
		<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	</div>
</form>
<?php } ?>
