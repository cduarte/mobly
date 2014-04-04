<?php

class ProductController extends Controller
{
	public function actionView($id)
	{
		$data['product'] = Product::model()
				->with('featureValues.feature')
				->with('featureValues.value')
				->findByPK($id);

		$this->render('view', $data);
	}

	public function actionSearch() {
		if ( isset($_POST['product_name']) ) {

			$product_name = $_POST['product_name'];
			$data['products'] = Product::model()
							->findAll(
								'name LIKE :product_name',
								array(':product_name' => "%$product_name%")
							);

			$this->render('/site/index', $data);
		} else {

			$this->redirect(array('site/index'));
		}
	}

}