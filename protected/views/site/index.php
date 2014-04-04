
<h1>Lista de produtos</h1>

<div class="span-24">
	<?php foreach ($products as $product) { ?>
		<div class="span-5 product-list">
			<?php
				$image = CHtml::image($product['image'], $product['image'], array('class'=>'product-img'));
				echo CHtml::link($image, array('product/view', 'id'=>$product['id']));
			?>
			<div>
				<?php echo CHtml::link($product['name'], array('product/view', 'id'=>$product['id'])); ?>
			</div>
			<div>
				R$ <?php echo number_format($product['price'],2,",",".");?>
			</div>
		</div>
	<?php } ?>
</div>

