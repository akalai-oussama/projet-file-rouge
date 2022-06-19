<?php
include '../manager/cartManager.php';



$cartManager = new CartManager();

$cartManager->initCode();

if(isset($_POST['id'])){

    $id=$_POST['id'];
    $cartLine = new CartLine();
    $cart = new Cart();

    $cart = $cartManager->getCart($_COOKIE['cartCookie']);

    $product = $cartManager->afficherProduit($id);
    
    $cartLine->setIdCart($cart->getId());

    $cartLineList = $cart->getCartLineList()[0];

    
    $cartManager->addProduct($cart, $product);

    $cartManager->set($cart, $product, $quantityTotal);

    header("location: index.php");

}
