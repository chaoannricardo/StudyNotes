//const { blue } = require("color-name");

const hamburger = document.querySelector('.header .nav-bar .nav-list .hamburger');
const mobile_menu = document.querySelector('.header .nav-bar .nav-list ul');
const menu_item = document.querySelectorAll('.header .nav-bar .nav-list ul li a');
const header = document.querySelector('.header.container');

hamburger.addEventListener('click', () => {
	hamburger.classList.toggle('active');
	mobile_menu.classList.toggle('active');
});

document.addEventListener('scroll', () => {
	var scroll_position = window.scrollY;
	if (scroll_position > 250) {
		header.style.backgroundColor = '#29323c';
	} else {
		header.style.backgroundColor = 'transparent';
	}
});

menu_item.forEach((item) => {
	item.addEventListener('click', () => {
		hamburger.classList.toggle('active');
		mobile_menu.classList.toggle('active');
	});
});
// 點擊次數變數
var click_num = 0;
var pic_file;
var detailfile;
var drivefile;
// 初始化函式
// function init(){
//     // 使用alert函式，會印出wellcom to my web
//     alert("Wellcom to my Web");
// }
// 移除一列表格
// $(function(){
//     $('.upload').change(function(){
//         var oFReader = new FileReader();
//         var file = document.getElementById('picfile').files[0];
//         oFReader.readAsDataURL(file);
//         oFReader.onloadend = function(oFRevent){
//         pic_file = oFRevent.target.result;
//         }
//     })
// })
function DeleteRow(){
    // 設定變數New_Table等於Motor_Table的元素
    var New_Table = document.getElementById("Motor_Table")
    // 設定變數row_length等於Motor_Table表格裡面有幾列
    var row_length = Motor_Table.rows.length;
    // 假如列數大於3(初始表格為3列)則可以刪除最後一列，刪除使用函式deleteRow(-1)
    if(row_length>4)
    {
        Motor_Table.deleteRow(-1);
    }
}
// 改變圖片
function Show(img_name,img_src,det,det_ref,dri,dri_ref) {
    if(click_num == 0){
    // 變數click_num+1
    click_num++;
    // 假如變數click_num等於0，將img_name呼叫的id的圖片顯示出來
    document.getElementById(img_name).style.display = 'inline';
    // 假如變數click_num等於0，將img_name呼叫的id的圖片更換成呼叫的img_src
    document.getElementById(img_name).src=img_src;
    // 假如變數click_num等於0，將det呼叫的id的按鈕顯示出來
    document.getElementById(det).style.display = 'inline';
    // 假如變數click_num等於0，將det呼叫的id的檔案更換成呼叫的det_ref
    document.getElementById(det).href = det_ref;
     // 假如變數click_num等於0，將dri呼叫的id的按鈕顯示出來
    document.getElementById(dri).style.display = 'inline';
    // 假如變數click_num等於0，將dri呼叫的id的檔案更換成呼叫的dri_ref
    document.getElementById(dri).href = dri_ref;
    }
    else{
    // 變數click_num-1
    click_num--;
    // 假如變數click_num不是0，將img_name呼叫的id的圖片隱藏
    document.getElementById(img_name).style.display = 'none';
    // 假如變數click_num不是0，將det呼叫的id的按鈕隱藏
    document.getElementById(det).style.display = 'none';
    // 假如變數click_num不是0，將dri呼叫的id的按鈕隱藏
    document.getElementById(dri).style.display = 'none';
    }
}
// 新增一列表格
function AddRow(input){
        // 設定變數New_Table等於Motor_Table的元素
    var New_Table = document.getElementById("Motor_Table")
    // 設定變數row_length等於Motor_Table表格裡面有幾列
    var row_length = Motor_Table.rows.length;
    // 設定變數column_length等於Motor_Table表格裡面每一列有幾行
    var column_length = Motor_Table.rows.item(0).cells.length;
    // 使用insertRow()函式，可以插入表格
    var insert = Motor_Table.insertRow(row_length);
    // 設定inputElement取得input裡面的元素
    var inputElement = document.getElementsByTagName("input");
    // 在此列中插入每一行，每一行的名稱(insert.insertCell(i).innerHTML)為剛剛所取得的input裡面元素的值
    for(i=0;i<column_length;i++){
    insert.insertCell(i).innerHTML = inputElement[i].value ;
    }

    var file = new Array(2);
    file[0] = document.getElementById("detail_file").files[0].name;
    file[1] = document.getElementById("drive_file").files[0].name;
    
    var picture = pic_file;

        insert.addEventListener("click",function (){ 
        document.getElementById("image").src= picture;
        document.getElementById("Detail").href = file[0];
        document.getElementById("Drive").href = file[1];
        if(click_num == 0){
            // 變數click_num+1
            click_num++;
            // 假如變數click_num等於0，將img_name呼叫的id的圖片顯示出來
            document.getElementById("image").style.display = 'inline';
            document.getElementById("Det").style.display = 'inline';
            document.getElementById("Dri").style.display = 'inline';
            }
            else{
            // 變數click_num-1
            click_num--;
            // 假如變數click_num不是0，將img_name呼叫的id的圖片隱藏
            document.getElementById("image").style.display = 'none';
            document.getElementById("Det").style.display = 'none';
            document.getElementById("Dri").style.display = 'none';
    }});    
}

//*************************chart************************************ */
window.onload=()=>{
var dataLabels = ['1h', '2h', '3h', '4h', '5h', '6h', '7h', '8h', '9h', '10h', '11h', '12h', '13h', '14h', '15h', '16h', '17h', '18h', '19h', '20h', '21h', '22h', '23h', '0h'];
var dataPV = [133058,253219,255194,233058,253219,277318,277714,273337,255194,277318,277714,273337,233058,253219,277318,253219,277318,277714,273337,255194,277714,273337,255194,293058];
var dataUV = [10651,22039,23955,23754,22664,10651,22039,23765,23955,23754,22664,23765,23955,23754,22664,10651,22039,23765,10651,22039,23765,23955,23754,22664];
var dataVV = [10,25,39,77,86,106,40,67,99,77,66,57,49,87,66,71,80,45,81,99,55,65,74,84];

var config = {
    type: 'line',
    data: {
        labels: dataLabels,
        datasets: [
            {
                label: '轉速',
                data: dataPV,
                backgroundColor: 'rgb(255, 99, 132)',
                borderColor: 'rgb(255, 99, 132)',
                fill: false,
            },
            {
                label: '電流',
                data: dataUV, 
                backgroundColor: 'rgb(75, 192, 192)',
                borderColor: 'rgb(75, 192, 192)',
                fill: false, 
            },
        ]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: 'Realtime Chart'
        },
    }
};
var config2 = {
    type: 'line',
    data: {
        labels: dataLabels,
        datasets: [
            {
                label: '溫度',
                data: dataVV, 
                backgroundColor: 'rgb(10, 12, 150)',
                borderColor: 'rgb(10, 12, 150)',
                fill: false, 
            }
        ]
    },
    options: {
        responsive: true,
        title: {
            display: true,
            text: 'Realtime Chart'
        },
    }
};

var ctx = document.getElementById('chart').getContext('2d');
var chart = new Chart(ctx, config);
var ctx2 = document.getElementById('chart2').getContext('2d');
var chart2 = new Chart(ctx2, config2);
setInterval(function() {
    if (config.data.datasets.length > 0) {

        var last = parseInt(dataLabels[dataLabels.length - 1]);
        var label = last + 1;
        if (last >= 23) {
            label = 0;
        }
        label = label + 'h';

        dataLabels.push(label);
        let PV_ran = getRandomNum(200000, 300000);
        let UV_ran = getRandomNum(10000, 80000);
        let VV_ran = getRandomNum(10, 150);
        dataPV.push(PV_ran);
        dataUV.push(UV_ran);
        dataVV.push(VV_ran);
        if (PV_ran>299000){
            alert(`轉速過快 現在轉速${PV_ran} `);
        }
        if (UV_ran>78000){
            alert(`電流過大 現在電流${UV_ran} mA`);
        }
        if(VV_ran>280){
            alert(`溫度過高 現在溫度 ${VV_ran}`);
        }
        dataLabels.shift();
        dataPV.shift();
        dataUV.shift();
        dataVV.shift();

        chart.update();
        chart2.update();
    }
}, 1000);

function getRandomNum(min, max) {
    var range = max - min;
    var rand = Math.random();
    return(min + Math.round(rand * range));
}
}
