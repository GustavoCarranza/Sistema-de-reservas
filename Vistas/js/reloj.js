const fecha= document.getElementById("fecha"),
tiempo = document.getElementById("tiempo")

function getCurrentDate () {
  const fecha_actual = new Date(),
  opciones = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
  fecha.innerHTML = fecha_actual.toLocaleDateString('es', opciones)
}

function getCurrentTime () {
  const fecha_actual = new Date(),
  horas = fecha_actual.getHours(),
  minutos = formatTime(fecha_actual.getMinutes()),
  segundos = formatTime(fecha_actual.getSeconds()),
  formato_horas = formatTime(((horas + 11) % 12 + 1)),
  formato_horario = (horas < 12) || (horas == 24)  ? 'AM' : 'PM'
  tiempo.innerHTML = `${formato_horas}:${minutos}:${segundos} <small>${formato_horario}</small>`
}

function formatTime (value)  {
  return value < 10 ? `0${value}` : value
}

setInterval(getCurrentTime, 1000)

getCurrentDate()