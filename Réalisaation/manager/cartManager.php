<?php
include "../entites/cart.php";
include "../entites/cartLine.php";
include "../entites/productClass.php";


class CartManager {

    public $name ;

    private $Connection = Null;

    private function getConnection(){
      
            $this->Connection = mysqli_connect('localhost', 'oussama', '678dhHQ)oQZVte!H', 'e-commerce');
           
         
       
        
        return $this->Connection;
    }


  public function initCode() {
    if(!isset($_COOKIE['cartCookie']))
    {
        $expire=time() + (86400 * 30);//however long you want
        $cookieId = uniqid();
        setcookie('cartCookie', $cookieId, $expire);
        $_SESSION["product"] = array();
        $_SESSION["quantity"] = 0;
        $_SESSION["product"] = array();
        $this->addCartCookie($cookieId);
    }
  }
    
    // Add product to cart
    public function addProduct($cart, $product){
        $cartId = $cart->getId();
        $productId = $product->getId();
        $sql = "INSERT INTO cart_line(idProduct,idCart) VALUES('$productId', '$cartId')";
        $result = mysqli_query($this->getConnection(), $sql);
        if($result){
            $this->getConnection()->close();
        }

    }

    public function getCartLine($id){
        $sql = "SELECT * FROM cart_line INNER JOIN produit on produit.id_produit=cart_line.idProduct WHERE idCart='$id'";
        $query = mysqli_query($this->getConnection(), $sql);
        $result = mysqli_fetch_all($query, MYSQLI_ASSOC);
        
       
        $cartLineList = array();
        foreach($result as $value){
            $product = new Product();
            $cartLine = new CartLine();
            $cartLine->setIdCartLine($value['idCartLine']);
            $cartLine->setIdCart($value['idCart']);
            $cartLine->setIdProduct($value['idProduct']);
            $cartLine->setProductCartQuantity($value['productCartQuantity']);
            $product->setId($value['id_produit']);
            $product->setName($value['nom_produit']);
            $product->setDescription($value['description']);
            $product->setReference($value['reference']);      
            $product->setCategory($value['categorie_produit']);
            $product->setImage($value["photo"]);   

            $cartLine->setProduct($product);
            array_push($cartLineList, $cartLine);
        }
        return $cartLineList;
    }
    
    // pour ajouter session
    public function set($cart, $product){
        session_start();
        $_SESSION["cart"] = $cart;
        array_push($_SESSION["product"], $product);


    }

      // afficher session

      public function getCartProducts($cartId){

        $sql = "SELECT * FROM cart_line INNER JOIN produit on cart_line.idCartLine = produit.id_produit WHERE idCart = $cartId";
        $query = mysqli_query($this->getConnection(), $sql);
        $result =  mysqli_fetch_all($query, MYSQLI_ASSOC);
        return $result;
        $product = new Product();
        $productsList = array();
        foreach ($result as $value_Data) {
            $product->setId($value_Data['id_produit']);
            $product->setName($value_Data['nom_produit']);
            $product->setPrice($value_Data['prix']);
            $product->setDescription($value_Data['description']);
            $produit->setReference($value_Data['reference']);      
            $product->setCategory($value_Data['categorie_produit']);
            array_push($productsList, $product);
        }
          return $productsList;
        // if(isset($_SESSION["product"])){
        //     return $_SESSION["product"];
        // }

      }

      public function getCartQuantity(){
          if(isset($_SESSION["quantity"])){
              return $_SESSION["quantity"];
          }
      }

          //supprimer session
    public function delete($id){
        if(isset($_SESSION["paniers"]["products"][$id])){
            unset($_SESSION["paniers"]["products"][$id]);
        }
    }

    
    // pour afficher  session 
    public function getProductCart($idCartLine){
        $sql = "SELECT * FROM cart_line INNER JOIN produit on cart_line.idProduct = produit.id_produit WHERE idCartLine = $idCartLine";
        $query = mysqli_query($this->getConnection(),$sql);
        $result = mysqli_fetch_assoc($query);

        $cartLine = new CartLine();
        $cartLine->setIdCartLine($result['idCartLine']);
        $cartLine->setIdCart($result['idCart']);
        $cartLine->setIdProduct($result['idProduct']);
        $cartLine->setProductCartQuantity($result['productCartQuantity']);
        
        $product = new Product();
        $product->setId($result['id_produit']);
        $product->setName($result['nom_produit']);
        $product->setPrice($result['prix']);
        $product->setDescription($result['description']);
        $produit->setReference($value_Data['reference']);      
        $product->setDateOfExpiration($result["date_d'expiration"]);
        $product->setQuantity($result['quantite_stock']);
        $product->setCategory($result['categorie_produit']);
        $product->setImage($result['photo']);

        $cartLine->setProduct($product);

        return $cartLine;
    }

    // Edit  cart line
    public function editCartLine($idCartLine, $quantity){
        $sql = "UPDATE cart_line SET productCartQuantity = '$quantity' WHERE idCartLine=$idCartLine";
        mysqli_query($this->getConnection(), $sql);
        
    }

  
  

// afficher  les produits : page index
    
public function getAllProducts(){
    $SelctRow = "SELECT * FROM produit
     INNER JOIN categorie ON produit.categorie_produit = categorie.id_categorie ";
    $query = mysqli_query($this->getConnection() ,$SelctRow);
    $produits_data = mysqli_fetch_all($query, MYSQLI_ASSOC);
    $TableData = array();
    foreach ( $produits_data as $value_Data) {
              
                
                $product = new Product();
                $product->setId($value_Data['id_produit']);
                $product->setName($value_Data['nom_produit']);
                $product->setDescription($value_Data['description']);
                $product->setReference($value_Data['reference']);      
                $product->setCategory($value_Data['categorie_produit']); 
                $product->setImage($value_Data["photo"]);   
                array_push($TableData, $product);
               
            }
         
         
               return $TableData;
}
 
        
// afficher  les produits : page panier

        public function afficherProduit($id){
            $SelctRow =  "SELECT * FROM produit
            INNER JOIN categorie ON produit.categorie_produit = categorie.id_categorie where id_produit = '$id' ";
            $query = mysqli_query($this->getConnection() ,$SelctRow);
            $produits_data = mysqli_fetch_all($query, MYSQLI_ASSOC);
            $product = new Product();

            
            foreach ($produits_data as $value) {
            $product->setId($value['id_produit']);
            $product->setName($value['nom_produit']);
            $product->setDescription($value['description']);
            $product->setReference($value['reference']);      
            $product->setCategory($value['categorie_produit']);
            $product->setImage($value["photo"]);   

               
            }
              return $product;
        }
      
 

        function compteur(){ 
        if(isset($_SESSION["paniers"]) != null){
                $compteur = count($_SESSION["paniers"]["products"]) ;
            
            }else {
                $compteur = 0;
            
            }
            return $compteur;
        }

        function addCartCookie($cookie){
            $sql = "INSERT INTO carts(userReference) VALUES('$cookie')";
            mysqli_query($this->getConnection(), $sql);
        }

        function getCart($userRefe){
            $sql = "SELECT * from carts WHERE userReference = '$userRefe'";
            $query = mysqli_query($this->getConnection(), $sql);
            $result = mysqli_fetch_assoc($query);

            
            $cart = new Cart();
            $cart->setId($result["id"]);
            $cart->setUserReference($result["userReference"]);

            $cartLine = $this->getCartLine($cart->getId());
            $cart->setCartLineList($cartLine);
            return $cart;
        }

        function getProductCartLine($id){
            $sql =  "SELECT * FROM produit
            INNER JOIN cart_line ON cart_line.idCartLine = produit.id_produit WHERE idCartLine = '$id' ";
            $query = mysqli_query($this->getConnection(), $sql);
            $result = mysqli_fetch_assoc($query);
            $product = new Product();
            $product->setId($result['id_produit']);
            $product->setName($result['nom_produit']);
            $product->setPrice($result['prix']);
            $product->setDescription($result['description']);
            $produit->setReference($value_Data['reference']);      
            $product->setDateOfExpiration($result["date_d'expiration"]);
            $product->setQuantity($result['quantite_stock']);
            $product->setCategory($result['categorie_produit']);
            $product->setImage($result['photo']);
            
            return $product;
        }


        function deleteCartLine($id){
            $sql = "DELETE FROM cart_line WHERE idCartLine = '$id'";
            mysqli_query($this->getConnection(), $sql);

        }
    }