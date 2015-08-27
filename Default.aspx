<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vibe</title>

    <!-- Bootstrap -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/css/datepicker.css" rel="stylesheet" />

    <!-- Google Font -->
    <link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css' />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style type="text/css">
        body {
            background: url(imgs/geometry.png);
            color: #00000f;        
            font-family: 'PT Sans', sans-serif;
            font-size: 30px;
            padding: 1%;
        }
        img {
            width: 100%;
            height: auto;
        }
        .container {
            max-width: 800px;
            margin: auto;
        }
        .header {
            margin-bottom: 20px;
            line-height: 1.9;
            font-size: x-large;
        }
             .header img {
                 max-width: 175px;
             }
             .header input {
                  margin: 0 10% 0 10%;
                  display: inline-block;
                  width: 80%;
                  height: 40px;
                  font-size: large;
                  text-align: center;

                  -webkit-transition: all 0.30s ease-in-out;
                  -moz-transition: all 0.30s ease-in-out;
                  -ms-transition: all 0.30s ease-in-out;
                  -o-transition: all 0.30s ease-in-out;
                  outline: none;
                  border: 1px solid #CCC;
                  border-radius: 5px;
             }
             .header input[type=submit] {
                  font-size: medium;
                  width: 100%;
                  background: #5CFF5C;
                  color: #017500;
                  font-weight: bold;
             }
             .header input[type=text]:focus {
                    box-shadow: 0 0 5px rgba(255,0,255, 1);
                    padding: 3px 0px 3px 3px;

                    border: 1px solid rgba(255,0,255, 1);
             }
              .header input[type=submit]:focus {

              }
        .dateTable{
             width: 100%;

        }
        .dateTable input {
             width: 80%;
        }
        .selectDate {
            padding: 20px;
        }
        .graph {
             padding: 20px;
        }
          .graph p {
               font-size: medium;
          }
        .chartContainer {
             max-width: 500px;
             max-height: 500px;
             margin: 0 auto;
        }
        .submitRow {
             /*display: inline-flex;
             vertical-align: middle;*/
        }
    </style>

     <script src="chart/src/Chart.Core.js"></script>
	<script src="chart/src/Chart.Doughnut.js"></script>
       
</head>
<body>
     <div class="container">
          <div class="header">
               <div class="row">
                    <div class="col-md-4 col-sm-12 text-center">
                         <img src="imgs/logo2.png" alt="vibe" />
                    </div>
                    <div style="margin-top: 8px;">
                         <div class="col-md-2 col-sm-3 col-xs-3 text-right">
                              <div class="row">
                                   From :
                              </div>
                              <div class="row">
                                   To :
                              </div>
                         </div>
                         <form id="form1" runat="server">
                              <div class="col-md-4 col-sm-9 col-xs-9">
                                   <div class="row">
                                        <asp:TextBox ID="FromDate" runat="server"></asp:TextBox>
                                   </div>
                                   <div class="row">
                                        <input type="text" placeholder="Coming soon!" disabled>
                                        <!--<input type="text" placeholder="" id="toDate" />-->
                                   </div>
                              </div>
                              <div class="col-md-2 col-sm-12 col-xs-12 text-center">
                                   <div class="row submitRow">
                                        <asp:Button ID="SubmitDate" runat="server" Text="Submit" type="submit" class="submitBtn" />
                                   </div>
                              </div>
                         </form>
                    </div>
               </div>
          </div><!-- /header -->

          <div class="content">
               <div class="row text-center graph">

                    <div class="chartContainer">
                         <script src="Chart.js"></script>
                         <canvas id="chart-area"></canvas>


                         <script>
		                    var doughnutData = [
				                    {
					                    value: <%= this.nocount %>,
					                    label: "Unhappy",
					                    color: "#FF3333"
				                    },
				                    {
					                    value: <%= this.yescount %>,
					                    label: "Happy",
					                    color: "#5CFF5C",
				                    }
		                    ];
			                    window.onload = function(){
				                    var ctx = document.getElementById("chart-area").getContext("2d");
				                    window.myDoughnut = new Chart(ctx).Doughnut(doughnutData, {responsive : true});
			                    };
			                    legend(document.getElementById('placeholder'), data);
	                    </script>
                    </div>

                    <br /><br />
                    <p class="well">
                         <asp:Literal ID="wellFeedback" runat ="server"></asp:Literal>
                         
                    </p>
               </div><!-- /row graph -->
          </div><!-- /content -->
     </div><!-- /container -->
         
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="bootstrap/js/jquery-1.9.1.min.js"></script>
    <script src="bootstrap/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
          // When the document is ready
          $(document).ready(function () {
                
               $('#FromDate').datepicker({
                    format: "yyyy/mm/dd"
               });
               
               $('#toDate').datepicker({
                    format: "yyyy/mm/dd"
               });  
            
          });
    </script>
</body>
</html>
