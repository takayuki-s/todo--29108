window.addEventListener('load', function(){
  document.cookie;
  const todo_num = document.querySelector('.done-box').id;
  const box_num = "box_" + todo_num;
  console.log(`${todo_num}`)

  const target = document.getElementsByClassName('done-box');
  for(let i = 0; i < target.length; i++){
    target[i].addEventListener('click', (event) => {
      if (document.querySelector('.countdown-zone-red').id === box_num ) {
        console.log(target[i].id);
        const delete_box = document.getElementById('box_' + target[i].id);
        if(window.confirm('完了しても良いですか？')) {
          delete_box.remove();
          const m = 60*60*24*14
          document.cookie = "name=" + box_num; ";max-age=" + m;
        }
      }
    }, false);
  }
})

