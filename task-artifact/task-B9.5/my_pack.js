// my_pack.js

// Функция для нахождения суммы всех элементов массива
function sumArray(arr) {
  return arr.reduce((total, num) => total + num, 0);
}

// Функция для нахождения среднего значения массива
function averageArray(arr) {
  if (arr.length === 0) {
    return 0;
  }
  return sumArray(arr) / arr.length;
}

module.exports = {
  sumArray,
  averageArray
};
