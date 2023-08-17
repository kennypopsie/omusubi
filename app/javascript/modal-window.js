document.addEventListener('turbo:load', (event) => {
  // モーダルを開くボタンを全て取得
  const buttons = document.querySelectorAll('.js-modal-button');

  buttons.forEach(button => {
    button.addEventListener('click', (e) => {
      // ボタンのdata-target属性からモーダルのIDを取得
      const target = button.dataset.target;
      // モーダルに is-open クラスを追加
      document.querySelector(target).classList.add('is-open');
    });
  });

  // モーダルを閉じるボタンを全て取得
  const closeButtons = document.querySelectorAll('.js-close-button');

  closeButtons.forEach(button => {
    button.addEventListener('click', (e) => {
      // ボタンが含まれるモーダルから is-open クラスを削除
      button.closest('.js-modal').classList.remove('is-open');
    });
  });
});