<style>
    body{
    font-family: 'napoli-serial-heavy-regular', sans-serif;
}
#footer {
 position: fixed;
 right: 0px;
 bottom: 10px;
 text-align: center;
border-top: 1px solid black;
}
#footer .page:after {
 content: counter(1, decimal);
}
@page {
margin: 0.3cm 0.3cm 0.3cm 0.3cm;
}
/** Define now the real margins of every page in the PDF **/
body {
margin-top: 15%;
 margin-left: 0.3cm;
 margin-right: 0.3cm;
margin-bottom: 3.3cm;
}
/** Define the header rules **/
header {
 position: fixed;
 top:1cm;
left: 0cm;
 right: 0cm;
 text-align:center;
}
/** Define the footer rules **/
footer {
position: fixed;
 bottom: 1.2cm;
 left: 0cm;
 right: 0cm;
height: 1.8cm;
text-align:center;
}

/* Clear floats after the columns */
.row:after {
display: table;
clear: both;
}
.signatures{
padding-bottom:-500px;
}
.column {
float: left;
 width: 20%;
font-size:13px;
height:30px;

}

.columnCenter {
float: right;
width: 65%;
font-size:13px;
height:30px;

}
.columnCenter2 {
display:flex;
justify-content:center;
width: 100%;
font-size:13px;
height:30px;

}
.columnCenter2 img{
    height:65px;
    width:210px;
}
.columnRight {
float: right;
width: 20%;
font-size:13px;
height:30px;
}
.columnRight2 {
float: right;
width: 40%;
font-size:13px;
height:30px;
font-size:12px;

}
.columnLeft {
float:left;
width: 60%;
font-size:13px;
height:30px;
text-align:left;
padding-left:20px;
}
.citiestd13 {
text-align: center;
font-size: 20 px;
padding: 2px;
background-color:#fff;
color:#000;
}
.supAddressFont {
font-size:11px;
margin-top:-12px;
text-align:center;
}
.supAddressFontEmi {
font-size:13px;
}
.supAddressFont img{
height:80px;
width:400px;
}
.underAlignment {
text-align:right;
font-size:13px;
}
.underAlignmentLeft {
text-align:left;
font-size:13px;
}
.textLeft{
text-align: left;
font-size:12px;
}
.textRight{
text-align: right;
}
.textCenter{
text-align: center;
}
.waterMark{
position: relative;
z-index:99999;
}
table {
width:100%;
 border-collapse: collapse;
margin-top: 10px;
font-size: 0.8em;
 min-width: 400px;
box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.main-table{
    display:flex;
    justify-content:center;
}

thead tr {
background-color: #081642;
color: #fff;
text-align: left;
}
/* th, td {
 padding: 12px 15px;
}
*/
.overline {
text-decoration: overline;
}
.emi-table {
width:80%;
padding-left:10%;
}
.emi-table-title {
padding-left:10px;
margin-bottom:-5px;
padding-left:11%;
}
.text-center{
text-align:center;
}
h2 {
 display: block;
font-size: 2.5em;
 margin-top: 0.67em;
 margin-bottom: 0.1em;
 margin-left: 0;
 margin-right: 0;
 font-weight: bold;
}
p {
 display: block;
 margin-top: .5em;
 margin-bottom: 1em;
 margin-left: 0;
 margin-right: 0;
}
.reportLogo{
 width : 230px;
 height: 100px
}
.reportWatermark{
    display:flex;
    justify-content:center;
    width: 90%;
    height:29%;
    margin-top:35%;
    opacity: 0.07;
}
.background-color{
    background-color: #08143f;
}

.text-light{
    color:#fff;
}
.card-body{
    text-align: center;
    font-size: 20 px;
    padding-top: 20px;
}
.QrImage{
    display: block;
    margin-left: auto;
    margin-right: auto;
}




</style>