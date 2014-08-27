<?php if (count($languages) > 1) { ?>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	<div id="language">
		<select class="custom-select" name="language_code" onchange="$(this).parent().parent().submit();">
			<?php foreach ($languages as $language) { ?>
			<option value="<?php echo $language['code']; ?>"<?php if ($language['code'] == $language_code) echo ' selected="selected"'; ?>><?php echo $language['name']; ?></option>
			<?php } ?>
		</select>
		<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
	</div>
</form>
<?php } ?>
