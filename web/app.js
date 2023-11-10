let health = document.querySelector(".heart")
let hunger = document.querySelector(".hunger")
let thirst = document.querySelector(".thirst")
let amour = document.querySelector(".shield")

window.addEventListener("message", (e) => {
    let data = e.data
    if (data.showui) {
        if (data.health < 0) {
            data.health = 0 
        }
        $('body').show();
        health.style.height = `${data.health}%`
        amour.style.height = `${data.armour}%`
        hunger.style.height = `${data.hunger}%`
        thirst.style.height = `${data.thirst}%`
    }
})