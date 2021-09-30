window.addEventListener('load', () => {
  
  const priceInput = document.getElementById("item_price");
  priceInput.addEventListener("input", () => {
    const fee = item_price.value * 0.1;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${fee}`;
    const TotalProfit = item_price.value - fee ;
    const profit = document.getElementById("profit");
    profit.innerHTML = `${TotalProfit}`;
  



  //  const inputValue = priceInput.value;
  //  console.log(inputValue);

  //  const addTaxDom = document.getElementById("add-tax-price");
  //  addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"
})
})