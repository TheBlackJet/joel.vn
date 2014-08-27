function display(view) {
	if (view == 'list') {

		$('#container .box .grid-layout').each(function () {
			if (!$(this).parents('#column-left, #column-right').length) {
				$(this).attr('class', 'box-product product-list list-layout');
			}
		});

		$('#container .box .list-layout > div').each(function(index, element) {

			html = '<div class="left">';

			var image = $(element).find('.image').html();

			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}

			html += '</div>';

			html += '<div class="right">';

			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}

			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';

			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';

			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';

			html += '</div>';

			html += '<div class="name">' + $(element).find('.name').html() + '</div>';

			var rating = $(element).find('.rating').html();

			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}

			html += '<div class="description">' + $(element).find('.description').html() + '</div>';

			$(element).html(html);

		});

		$('.display').html('<span class="icon-list-grey"><?php echo $text_list; ?></span><a class="icon-grid" onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');

		$.totalStorage('display', 'list');
	} else {

		$('#container .box .list-layout').each(function () {
			if (!$(this).parents('#column-left, #column-right').length) {
				$(this).attr('class', 'box-product product-grid grid-layout');
			}
		});

		$('#container .box .grid-layout > div').each(function(index, element) {

			html = '';

			var image = $(element).find('.image').html();

			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}

			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}

			html += '<div class="name" style="width: ' + <?php echo $this->config->get('config_image_product_width'); ?> + 'px">' + $(element).find('.name').html() + '</div>';

			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}

			html += '<div class="description">' + $(element).find('.description').html() + '</div>';

			html += '<div class="details">';

			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';

			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';

			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';

			html += '</div>';
			
			$(element).html(html);
		});

		$('.display').html('<a class="icon-list" onclick="display(\'list\');"><?php echo $text_list; ?></a><span class="icon-grid-grey"><?php echo $text_grid; ?></span>');

		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('list');
}