<h1>Pedido #<?php echo $order['id']?> enviado</h1>
<br>

<h3>Dados Pessoais</h3>
<table>
	<thead>
		<tr>
			<th>E-mail</th>
			<th>Nome</th>
			<th>Endereço</th>
			<th>Cidade</th>
			<th>CEP</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td><?php echo $order['customer_email']?></td>
			<td><?php echo $order['customer_name']?></td>
			<td><?php echo $order['customer_address']?></td>
			<td><?php echo $order['customer_city']?></td>
			<td><?php echo $order['customer_postcode']?></td>
		</tr>
	</tbody>
</table>

<br>
<h3>Dados de Entrega</h3>
<table>
	<thead>
		<tr>
			<th>Nome</th>
			<th>Endereço</th>
			<th>Cidade</th>
			<th>CEP</th>
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td><?php echo $order['shipping_name']?></td>
			<td><?php echo $order['shipping_address']?></td>
			<td><?php echo $order['shipping_city']?></td>
			<td><?php echo $order['shipping_postcode']?></td>
		</tr>
	</tbody>
</table>

<br>
<h3>Produtos</h3>
<table>
	<thead>
		<tr>
			<th>#id</th>
			<th>Produto</th>
			<th>Preço</th>
		</tr>
	</thead>
	
	<tbody>
		<?php foreach ($order['orderProducts'] as $product) { ?>
		<tr>
			<td><?php echo $product['product_id']?></td>
			<td><?php echo $product['product_name']?></td>
			<td>R$ <?php echo number_format($product['product_price'],2,",",".");?></td>
		</tr>
		<?php } ?>
	</tbody>
</table>

<br><br>

<h3 style="color:red">TOTAL: R$ <?php echo number_format($order['total'],2,",",".");?></h3>




