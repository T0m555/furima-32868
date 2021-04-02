
function chargeCalc (){
  const priceText = document.getElementById("item-price");
  priceText.addEventListener("keyup", () => {
    const priceVal = priceText.value;
    const taxText = document.getElementById("add-tax-price");
    taxText.innerHTML = `${Math.floor(priceVal*0.1)}`
    const profitText = document.getElementById("profit");
    profitText.innerHTML = `${priceVal - Math.floor(priceVal*0.1)}`
  })
}

window.addEventListener('load', chargeCalc);