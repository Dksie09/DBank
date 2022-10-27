import { DBank } from "../../declarations/DBank";


window.addEventListener("load", async function(){
  const currentAmt = await DBank.checkBalance();
  console.log("dead");
  console.log(currentAmt);
  this.document.getElementById("value").innerText=Math.round(currentAmt*100)/100
})

document.querySelector("form").addEventListener("submit", async function(){
  event.preventDefault();
  const button = document.querySelector("#submit-btn")
  
  // console.log(topUpAmt);
  if(document.getElementById("input-amount").value.length!=0){
    const topUpAmt = parseFloat(document.getElementById("input-amount").value)
    button.setAttribute("disabled", true)
    await DBank.topUp(topUpAmt);
    document.getElementById("input-amount").value=""
  }
  if(document.getElementById("withdrawal-amount").value.length!=0){
    const widthdrawalAmt = parseFloat(document.getElementById("withdrawal-amount").value)
    button.setAttribute("disabled", true)
    await DBank.withdraw(widthdrawalAmt);
    document.getElementById("withdrawal-amount").value=""
  }

  await DBank.compound()

  const currentAmt = await DBank.checkBalance();
  document.getElementById("value").innerText=Math.round(currentAmt*100)/100
  button.removeAttribute("disabled")
  console.log(currentAmt);
})