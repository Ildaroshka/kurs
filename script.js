function openModal(id) {
    document.getElementById(id).style.display = "flex";
}

function closeModal(id) {
    document.getElementById(id).style.display = "none";
}

function switchModal(openId, closeId) {
    closeModal(closeId);
    openModal(openId);
}

// Закрытие по клику вне модального окна
window.onclick = function(event) {
    const modals = document.querySelectorAll('.modal');
    modals.forEach(modal => {
        if(event.target == modal) {
            modal.style.display = "none";
        }
    });
}


// Регистрация
document.querySelector("#registerModal .modal-btn").onclick = () => {
    const name = document.querySelector("#registerModal input[placeholder='Имя']").value;
    const email = document.querySelector("#registerModal input[placeholder='Email']").value;
    const password = document.querySelector("#registerModal input[placeholder='Пароль']").value;

    fetch('register.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `name=${encodeURIComponent(name)}&email=${encodeURIComponent(email)}&password=${encodeURIComponent(password)}`
    })
    .then(res => res.json())
    .then(data => alert(data.message));
};

// Вход
document.querySelector("#loginModal .modal-btn").onclick = () => {
    const email = document.querySelector("#loginModal input[placeholder='Email или логин']").value;
    const password = document.querySelector("#loginModal input[placeholder='Пароль']").value;

    fetch('login.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        body: `email=${encodeURIComponent(email)}&password=${encodeURIComponent(password)}`
    })
    .then(res => res.json())
    .then(data => alert(data.message));
};

