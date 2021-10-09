const postdata = document.querySelector('#post_data');
const config = document.querySelector('#config');
const getdata = document.querySelector('#get_data');
const data = document.querySelector('#data');

const server = new WebSocket('ws://localhost:8080');
server.onopen = () => console.log('Server connected.');
server.onmessage = (m) => {
  const data = (JSON.parse(m.data));
  console.log(data)
};
server.sendEvent = (e) => server.send(JSON.stringify(e));
getdata.addEventListener('click',e=>{
    console.log('get')
      server.sendEvent({
        type: 'get',
        data: { 
            Device : config[0].value, 
        },
      });
    });


postdata.addEventListener('click',e=>{
console.log('post')
  server.sendEvent({
    type: 'post',
    data: { 
        Device : config[0].value, 
        Comm: config[1].value, 
        IP: config[2].value,
        Port:config[3].value,
        Node_0:config[4].value,
        Info_0:config[5].value},
  });
});

// const sendMessage = () => {
//   if (!inputDOM.value || !nameDOM.value || !toDOM.value) {
//     throw new Error('Empty input!');
//   }

//   server.sendEvent({
//     type: 'MESSAGE',
//     data: { to: toDOM.value, name: nameDOM.value, body: inputDOM.value },
//   });
// };

// const renderMessages = () => {
//   resetMessages();

//   messages.forEach(({ body, name }) => {
//     const newEle = document.createElement('li');
//     newEle.innerHTML = `${name}: ${body}`;
//     messagesDOM.appendChild(newEle);
//   });
// };

// const resetMessages = () => {
//   // remove all children
//   messagesDOM.innerHTML = '';
// };

// const onEvent = (e) => {
//   const { type } = e;

//   switch (type) {
//     case 'CHAT': {
//       messages = e.data.messages;
//       break;
//     }
//     case 'MESSAGE': {
//       messages.push(e.data.message);
//       break;
//     }
//   }

//   renderMessages();
// };