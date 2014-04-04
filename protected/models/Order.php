<?php

/**
 * This is the model class for table "order".
 *
 * The followings are the available columns in table 'order':
 * @property integer $id
 * @property string $customer_email
 * @property string $customer_name
 * @property string $customer_address
 * @property string $customer_city
 * @property string $customer_postcode
 * @property string $shipping_name
 * @property string $shipping_address
 * @property string $shipping_city
 * @property string $shipping_postcode
 * @property string $total
 *
 * The followings are the available model relations:
 * @property OrderProduct[] $orderProducts
 */
class Order extends CActiveRecord
{
	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'order';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('customer_email, customer_name, customer_address, customer_city, customer_postcode, shipping_name, shipping_address, shipping_city, shipping_postcode, total', 'required'),
			array('customer_email, customer_name, customer_city, shipping_name, shipping_city', 'length', 'max'=>45),
			array('customer_address, shipping_address', 'length', 'max'=>100),
			array('customer_postcode, shipping_postcode', 'length', 'max'=>10),
			array('total', 'length', 'max'=>8),
			array('customer_email', 'email'),
			// The following rule is used by search().
			// @todo Please remove those attributes that should not be searched.
			array('id, customer_email, customer_name, customer_address, customer_city, customer_postcode, shipping_name, shipping_address, shipping_city, shipping_postcode, total', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'orderProducts' => array(self::HAS_MANY, 'OrderProduct', 'order_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'customer_email' => 'Email pessoal',
			'customer_name' => 'Nome',
			'customer_address' => 'Endereço',
			'customer_city' => 'Cidade',
			'customer_postcode' => 'CEP',
			'shipping_name' => 'Dados de entrega: Nome',
			'shipping_address' => 'Dados de entrega: Endereço',
			'shipping_city' => 'Dados de entrega: Cidade',
			'shipping_postcode' => 'Dados de entrega: CEP',
			'total' => 'Total',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 *
	 * Typical usecase:
	 * - Initialize the model fields with values from filter form.
	 * - Execute this method to get CActiveDataProvider instance which will filter
	 * models according to data in model fields.
	 * - Pass data provider to CGridView, CListView or any similar widget.
	 *
	 * @return CActiveDataProvider the data provider that can return the models
	 * based on the search/filter conditions.
	 */
	public function search()
	{
		// @todo Please modify the following code to remove attributes that should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('customer_email',$this->customer_email,true);
		$criteria->compare('customer_name',$this->customer_name,true);
		$criteria->compare('customer_address',$this->customer_address,true);
		$criteria->compare('customer_city',$this->customer_city,true);
		$criteria->compare('customer_postcode',$this->customer_postcode,true);
		$criteria->compare('shipping_name',$this->shipping_name,true);
		$criteria->compare('shipping_address',$this->shipping_address,true);
		$criteria->compare('shipping_city',$this->shipping_city,true);
		$criteria->compare('shipping_postcode',$this->shipping_postcode,true);
		$criteria->compare('total',$this->total,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

	/**
	 * Returns the static model of the specified AR class.
	 * Please note that you should have this exact method in all your CActiveRecord descendants!
	 * @param string $className active record class name.
	 * @return Order the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
}
