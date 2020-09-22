function sellingPrice() {
  const price = document.getElementById('item-price');
  
  price.addEventListener('input', function(){
    const price_value = price.value;
    let profit = price_value * 0.9;
    let fee = price_value * 0.1;
    document.getElementById('add-tax-price').innerHTML = fee;
    document.getElementById('profit').innerHTML = profit;
  }); 

}

window.addEventListener('load', sellingPrice);