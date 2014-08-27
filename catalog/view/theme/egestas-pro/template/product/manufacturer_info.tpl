<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>

<div id="content"><?php echo $content_top; ?>
	<div class="box">
		<div class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php } ?>
		</div>
		<h1><?php echo $heading_title; ?></h1>
		<?php if ($products) { ?>
		<div class="product-filter clearafter">
			<div class="display"><span class="icon-list-grey"><?php echo $text_list; ?></span><a class="icon-grid" onclick="display('grid');"><?php echo $text_grid; ?></a></div>
			<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total" class="icon-compare-grey"><?php echo $text_compare; ?></a></div>
			<div class="limit"><?php echo $text_limit; ?>
				<select onchange="location = this.value;">
					<?php foreach ($limits as $limits) { ?>
					<?php if ($limits['value'] == $limit) { ?>
					<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
					<?php } ?>
					<?php } ?>
				</select>
			</div>
			<div class="sort"><?php echo $text_sort; ?>
				<select onchange="location = this.value;">
					<?php foreach ($sorts as $sorts) { ?>
					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
					<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
					<?php } ?>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="box-product product-list list-layout">
			<?php foreach ($products as $product) { ?>
			<?php
	  $thumb_width = $this->config->get('config_image_product_width');
	  $thumb_height = $this->config->get('config_image_product_height');
	?>
			<div>
				<?php if ($product['thumb']) { ?>
				<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
				<?php } else { ?>
				<div class="image"><span class="no-image"><img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" /></span></div>
				<?php } ?>
				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
				<div class="description"><?php echo $product['description']; ?></div>
				<?php if ($product['price']) { ?>
				<div class="price">
					<?php if (!$product['special']) { ?>
					<div><span class="price-fixed"><?php echo $product['price']; ?></span></div>
					<?php } else { ?>
					<div class="special-price"><span class="price-old"><?php echo $product['price']; ?></span><span class="price-fixed"><?php echo $product['special']; ?></span></div>
					<?php } ?>
					<?php if ($product['tax']) { ?>
					<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
					<?php } ?>
				</div>
				<?php } ?>
				<?php if ($product['rating']) { ?>
				<div class="rating"><img src="catalog/view/theme/egestas-pro/image/icons/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
				<?php } ?>
				<div class="cart"><a class="button" onclick="addToCart('<?php echo $product['product_id']; ?>');"><span class="icon-cart-white"><?php echo $button_cart; ?></span></a></div>
				<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><span class="icon-wishlist-grey"><?php echo $button_wishlist; ?></span></a></div>
				<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><span class="icon-compare-grey"><?php echo $button_compare; ?></span></a></div>
			</div>
			<?php } ?>
		</div>
		<div class="pagination"><?php echo $pagination; ?></div>
		<?php } else { ?>
		<div class="content">
			<p><?php echo $text_empty; ?></p>
		</div>
		<div class="buttons">
			<div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
		</div>
		<?php } ?>
	</div>
	<?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
	<?php include( DIR_TEMPLATE . '/egestas-pro/includes/list_grid_js.tpl' );?>
//--></script> 
<?php echo $footer; ?>