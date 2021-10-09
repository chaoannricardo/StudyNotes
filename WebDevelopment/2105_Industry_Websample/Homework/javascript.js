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
$(function(){
    $('.upload').change(function(){
        var oFReader = new FileReader();
        var file = document.getElementById('picfile').files[0];
        oFReader.readAsDataURL(file);
        oFReader.onloadend = function(oFRevent){
        pic_file = oFRevent.target.result;
        }
    })
})
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