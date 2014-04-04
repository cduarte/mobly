<?php

class OrderController extends Controller
{
	public function actionView()
	{
		$this->render('view');
	}

	public function actionCartAdd($id) {
		$product = Product::model()->findByPK($id);

		$item['id'] = $product['id'];
		$item['name'] = $product['name'];
		$item['price'] = $product['price'];

		$session = new CHttpSession;
		$session->open();

		$_SESSION['cart'][] = $item;

		$this->redirect(array('order/CartView'));
	}

	public function actionCartClear($id) {
		$session = new CHttpSession;
		$session->open();

		unset($_SESSION['cart']);

		$this->redirect(array('order/CartView'));
	}

	public function actionCartView() {
		$session = new CHttpSession;
		$session->open();

		$this->render('cart_view');
	}

	public function actionOrderCreate() {
		$order = new Order;

		if(isset($_POST['Order'])) {
			$order->attributes = $_POST['Order'];
			$order->total = $this->cart_total;

			if ( $order->save() ) {


				foreach (Yii::app()->session['cart'] as $item) {
					$order_product = new OrderProduct();
					$order_product->order_id = $order->id;

					$order_product->product_id = $item['id'];
					$order_product->product_name = $item['name'];
					$order_product->product_price = $item['price'];

					$order_product->save();
				}

				unset($_SESSION['cart']);
				$this->redirect(array('order/orderView','id'=>$order->id));
			}
		}

		$this->render('create_order',array('model'=>$order));
	}

	public function actionOrderView($id) {
		$data['order'] = Order::model()
							->findByPK($id);

		$this->render('order_view', $data);
	}



}