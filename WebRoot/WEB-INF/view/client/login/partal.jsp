<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>RakSmart - 注册</title>
<!-- <base href="http://cn.raksmart.com/whmcs/" /> -->
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="includes/jscript/jquery.js"></script>

</head>
<body>

<div id="top_container">
  <div id="top">
    <div id="company_title">RakSmart</div>
    <div id="welcome_box">请 <a href="clientarea.php" title="登录"><strong>登录</strong></a> 或 <a href="register.php" title="注册"><strong>注册</strong></a></div>
  </div>
</div>
<div id="content_container">
  <div id="content_left">
    <h1>注册</h1>
    <p class="breadcrumb"><a href="index.php">门户主页</a> > <a href="register.php">注册</a></p><script type="text/javascript" src="includes/jscript/statesdropdown.js"></script>
<script type="text/javascript" src="includes/jscript/pwstrength.js"></script>
<p>请在下方填写新账户注册信息。</p>
<form method="post" action="/whmcs/register.php">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
  <input type="hidden" name="register" value="true" />
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="150" class="fieldarea">名</td>
            <td><input type="text" name="firstname" size="30" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">姓</td>
            <td><input type="text" name="lastname" size="30" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">公司名称</td>
            <td><input type="text" name="companyname" size="30" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">邮件地址</td>
            <td><input type="text" name="email" size="50" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">地址1</td>
            <td><input type="text" name="address1" size="40" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">地址2</td>
            <td><input type="text" name="address2" size="30" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">城市</td>
            <td><input type="text" name="city" size="30" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">州/区</td>
            <td><input type="text" name="state" size="25" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">邮编</td>
            <td><input type="text" name="postcode" size="10" value="" /></td>
          </tr>
          <tr>
            <td class="fieldarea">国家</td>
            <td><select name="country" id="country"><option value="AF">Afghanistan</option><option value="AX">Aland Islands</option><option value="AL">Albania</option><option value="DZ">Algeria</option><option value="AS">American Samoa</option><option value="AD">Andorra</option><option value="AO">Angola</option><option value="AI">Anguilla</option><option value="AQ">Antarctica</option><option value="AG">Antigua And Barbuda</option><option value="AR">Argentina</option><option value="AM">Armenia</option><option value="AW">Aruba</option><option value="AU">Australia</option><option value="AT">Austria</option><option value="AZ">Azerbaijan</option><option value="BS">Bahamas</option><option value="BH">Bahrain</option><option value="BD">Bangladesh</option><option value="BB">Barbados</option><option value="BY">Belarus</option><option value="BE">Belgium</option><option value="BZ">Belize</option><option value="BJ">Benin</option><option value="BM">Bermuda</option><option value="BT">Bhutan</option><option value="BO">Bolivia</option><option value="BA">Bosnia And Herzegovina</option><option value="BW">Botswana</option><option value="BV">Bouvet Island</option><option value="BR">Brazil</option><option value="IO">British Indian Ocean Territory</option><option value="BN">Brunei Darussalam</option><option value="BG">Bulgaria</option><option value="BF">Burkina Faso</option><option value="BI">Burundi</option><option value="KH">Cambodia</option><option value="CM">Cameroon</option><option value="CA">Canada</option><option value="CV">Cape Verde</option><option value="KY">Cayman Islands</option><option value="CF">Central African Republic</option><option value="TD">Chad</option><option value="CL">Chile</option><option value="CN" selected="selected">China</option><option value="CX">Christmas Island</option><option value="CC">Cocos (Keeling) Islands</option><option value="CO">Colombia</option><option value="KM">Comoros</option><option value="CG">Congo</option><option value="CD">Congo, Democratic Republic</option><option value="CK">Cook Islands</option><option value="CR">Costa Rica</option><option value="CI">Cote D'Ivoire</option><option value="HR">Croatia</option><option value="CU">Cuba</option><option value="CW">Curacao</option><option value="CY">Cyprus</option><option value="CZ">Czech Republic</option><option value="DK">Denmark</option><option value="DJ">Djibouti</option><option value="DM">Dominica</option><option value="DO">Dominican Republic</option><option value="EC">Ecuador</option><option value="EG">Egypt</option><option value="SV">El Salvador</option><option value="GQ">Equatorial Guinea</option><option value="ER">Eritrea</option><option value="EE">Estonia</option><option value="ET">Ethiopia</option><option value="FK">Falkland Islands (Malvinas)</option><option value="FO">Faroe Islands</option><option value="FJ">Fiji</option><option value="FI">Finland</option><option value="FR">France</option><option value="GF">French Guiana</option><option value="PF">French Polynesia</option><option value="TF">French Southern Territories</option><option value="GA">Gabon</option><option value="GM">Gambia</option><option value="GE">Georgia</option><option value="DE">Germany</option><option value="GH">Ghana</option><option value="GI">Gibraltar</option><option value="GR">Greece</option><option value="GL">Greenland</option><option value="GD">Grenada</option><option value="GP">Guadeloupe</option><option value="GU">Guam</option><option value="GT">Guatemala</option><option value="GG">Guernsey</option><option value="GN">Guinea</option><option value="GW">Guinea-Bissau</option><option value="GY">Guyana</option><option value="HT">Haiti</option><option value="HM">Heard Island & Mcdonald Islands</option><option value="VA">Holy See (Vatican City State)</option><option value="HN">Honduras</option><option value="HK">Hong Kong</option><option value="HU">Hungary</option><option value="IS">Iceland</option><option value="IN">India</option><option value="ID">Indonesia</option><option value="IR">Iran, Islamic Republic Of</option><option value="IQ">Iraq</option><option value="IE">Ireland</option><option value="IM">Isle Of Man</option><option value="IL">Israel</option><option value="IT">Italy</option><option value="JM">Jamaica</option><option value="JP">Japan</option><option value="JE">Jersey</option><option value="JO">Jordan</option><option value="KZ">Kazakhstan</option><option value="KE">Kenya</option><option value="KI">Kiribati</option><option value="KR">Korea</option><option value="KW">Kuwait</option><option value="KG">Kyrgyzstan</option><option value="LA">Lao People's Democratic Republic</option><option value="LV">Latvia</option><option value="LB">Lebanon</option><option value="LS">Lesotho</option><option value="LR">Liberia</option><option value="LY">Libyan Arab Jamahiriya</option><option value="LI">Liechtenstein</option><option value="LT">Lithuania</option><option value="LU">Luxembourg</option><option value="MO">Macao</option><option value="MK">Macedonia</option><option value="MG">Madagascar</option><option value="MW">Malawi</option><option value="MY">Malaysia</option><option value="MV">Maldives</option><option value="ML">Mali</option><option value="MT">Malta</option><option value="MH">Marshall Islands</option><option value="MQ">Martinique</option><option value="MR">Mauritania</option><option value="MU">Mauritius</option><option value="YT">Mayotte</option><option value="MX">Mexico</option><option value="FM">Micronesia, Federated States Of</option><option value="MD">Moldova</option><option value="MC">Monaco</option><option value="MN">Mongolia</option><option value="ME">Montenegro</option><option value="MS">Montserrat</option><option value="MA">Morocco</option><option value="MZ">Mozambique</option><option value="MM">Myanmar</option><option value="NA">Namibia</option><option value="NR">Nauru</option><option value="NP">Nepal</option><option value="NL">Netherlands</option><option value="AN">Netherlands Antilles</option><option value="NC">New Caledonia</option><option value="NZ">New Zealand</option><option value="NI">Nicaragua</option><option value="NE">Niger</option><option value="NG">Nigeria</option><option value="NU">Niue</option><option value="NF">Norfolk Island</option><option value="MP">Northern Mariana Islands</option><option value="NO">Norway</option><option value="OM">Oman</option><option value="PK">Pakistan</option><option value="PW">Palau</option><option value="PS">Palestine, State of</option><option value="PA">Panama</option><option value="PG">Papua New Guinea</option><option value="PY">Paraguay</option><option value="PE">Peru</option><option value="PH">Philippines</option><option value="PN">Pitcairn</option><option value="PL">Poland</option><option value="PT">Portugal</option><option value="PR">Puerto Rico</option><option value="QA">Qatar</option><option value="RE">Reunion</option><option value="RO">Romania</option><option value="RU">Russian Federation</option><option value="RW">Rwanda</option><option value="BL">Saint Barthelemy</option><option value="SH">Saint Helena</option><option value="KN">Saint Kitts And Nevis</option><option value="LC">Saint Lucia</option><option value="MF">Saint Martin</option><option value="PM">Saint Pierre And Miquelon</option><option value="VC">Saint Vincent And Grenadines</option><option value="WS">Samoa</option><option value="SM">San Marino</option><option value="ST">Sao Tome And Principe</option><option value="SA">Saudi Arabia</option><option value="SN">Senegal</option><option value="RS">Serbia</option><option value="SC">Seychelles</option><option value="SL">Sierra Leone</option><option value="SG">Singapore</option><option value="SK">Slovakia</option><option value="SI">Slovenia</option><option value="SB">Solomon Islands</option><option value="SO">Somalia</option><option value="ZA">South Africa</option><option value="GS">South Georgia And Sandwich Isl.</option><option value="ES">Spain</option><option value="LK">Sri Lanka</option><option value="SD">Sudan</option><option value="SR">Suriname</option><option value="SJ">Svalbard And Jan Mayen</option><option value="SZ">Swaziland</option><option value="SE">Sweden</option><option value="CH">Switzerland</option><option value="SY">Syrian Arab Republic</option><option value="TW">Taiwan</option><option value="TJ">Tajikistan</option><option value="TZ">Tanzania</option><option value="TH">Thailand</option><option value="TL">Timor-Leste</option><option value="TG">Togo</option><option value="TK">Tokelau</option><option value="TO">Tonga</option><option value="TT">Trinidad And Tobago</option><option value="TN">Tunisia</option><option value="TR">Turkey</option><option value="TM">Turkmenistan</option><option value="TC">Turks And Caicos Islands</option><option value="TV">Tuvalu</option><option value="UG">Uganda</option><option value="UA">Ukraine</option><option value="AE">United Arab Emirates</option><option value="GB">United Kingdom</option><option value="US">United States</option><option value="UM">United States Outlying Islands</option><option value="UY">Uruguay</option><option value="UZ">Uzbekistan</option><option value="VU">Vanuatu</option><option value="VE">Venezuela</option><option value="VN">Viet Nam</option><option value="VG">Virgin Islands, British</option><option value="VI">Virgin Islands, U.S.</option><option value="WF">Wallis And Futuna</option><option value="EH">Western Sahara</option><option value="YE">Yemen</option><option value="ZM">Zambia</option><option value="ZW">Zimbabwe</option></select></td>
          </tr>
          <tr>
            <td class="fieldarea">电话号码</td>
            <td><input type="text" name="phonenumber" size="20" value="" /></td>
          </tr>
      </table></td>
    </tr>
  </table>

    <br />
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
                              <tr>
            <td width="150" class="fieldarea">选择货币</td>
            <td><select name="currency">
                        <option value="2">CNY</option>
                        <option value="1" selected>USD</option>
                        </select></td>
          </tr>
      </table></td>
    </tr>
  </table>
  
  <h2>登录信息</h2>
  <p>请输入登录密码 RakSmart 客户区信息区别于网站控制面板用户名&amp;密码。</p>
  <table width="100%" cellspacing="0" cellpadding="0" class="frame">
    <tr>
      <td><table width="100%" border="0" cellpadding="10" cellspacing="0">
          <tr>
            <td width="150" class="fieldarea">密码</td>
            <td width="175"><input type="password" name="password" id="newpw" size="25" /></td>
            <td><script language="JavaScript" type="text/javascript">showStrengthBar();</script></td>
          </tr>
          <tr>
            <td class="fieldarea">确认密码</td>
            <td colspan="2"><input type="password" name="password2" size="25" /></td>
          </tr>
      </table></td>
    </tr>
  </table>

    <h2>Spam Bot验证</h2>
  <p>请在文本框中输入下图字符，避免系统自动提交。</p>
    <p align="center"><img src="includes/verifyimage.php" align="middle" /> <input type="text" name="code" size="10" maxlength="5" /></p>
    
    <p> </p>
  <p align="center">
    <input type="submit" value="点击继续>>" />
  </p>
</form>
<br />

<p style="text-align:center;">Powered by <a href="http://www.whmcs.com/" target="_blank">WHMCompleteSolution</a></p>

<div align="right"><form method="post" action="/whmcs/register.php" name="languagefrm" id="languagefrm">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" /><strong>语言:</strong> <select name="language" onchange="languagefrm.submit()"><option>#chinese</option><option>Arabic</option><option>Azerbaijani</option><option>Catalan</option><option selected="selected">Chinese</option><option>Croatian</option><option>Czech</option><option>Danish</option><option>Dutch</option><option>English</option><option>Farsi</option><option>French</option><option>German</option><option>Hungarian</option><option>Italian</option><option>Norwegian</option><option>Portuguese-br</option><option>Portuguese-pt</option><option>Russian</option><option>Spanish</option><option>Swedish</option><option>Turkish</option><option>Ukranian</option></select></form></div><br />  </div>
  <div id="side_menu">
    <p class="header">快速浏览</p>
    <ul>
      <li><a href="index.php"><img src="templates/portal/images/icons/support.gif" alt="门户主页" width="16" height="16" border="0" class="absmiddle" /></a> <a href="index.php" title="门户主页">门户主页</a></li>
      <li><a href="clientarea.php"><img src="templates/portal/images/icons/clientarea.gif" alt="客户区" width="16" height="16" border="0" class="absmiddle" /></a> <a href="clientarea.php" title="客户区">客户区</a></li>
      <li><a href="announcements.php" title="公告"><img src="templates/portal/images/icons/announcement.gif" alt="公告" width="16" height="16" border="0" class="absmiddle" /></a> <a href="announcements.php" title="公告">公告</a></li>
      <li><a href="knowledgebase.php" title="知识库"><img src="templates/portal/images/icons/knowledgebase.gif" alt="知识库" width="16" height="16" border="0" class="absmiddle" /></a> <a href="knowledgebase.php" title="知识库">知识库</a></li>
      <li><a href="submitticket.php" title="提交Ticket"><img src="templates/portal/images/icons/submit-ticket.gif" alt="提交Ticket" width="16" height="16" border="0" class="absmiddle" /></a> <a href="submitticket.php" title="服务Tickets">提交Ticket</a></li>
      <li><a href="downloads.php" title="下载"><img src="templates/portal/images/icons/downloads.gif" alt="下载" width="16" height="16" border="0" class="absmiddle" /></a> <a href="downloads.php" title="下载">下载</a></li>
      <li><a href="cart.php" title="订单"><img src="templates/portal/images/icons/order.gif" alt="订单" width="16" height="16" border="0" class="absmiddle" /></a> <a href="cart.php" title="订单">订单</a></li>
    </ul>
<form method="post" action="dologin.php">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
  <p class="header">客户登录</p>
  <p><strong>邮件</strong><br />
    <input name="username" type="text" size="25" />
  </p>
  <p><strong>密码</strong><br />
    <input name="password" type="password" size="25" />
  </p>
  <p>
    <input type="checkbox" name="rememberme" />
    记住我</p>
  <p>
    <input type="submit" class="submitbutton" value="登录" />
  </p>
</form>
  <p class="header">搜索</p>
<form method="post" action="knowledgebase.php?action=search">
<input type="hidden" name="token" value="5bdff6606c8f3f690487b88679094855b1158390" />
  <p>
    <input name="search" type="text" size="25" /><br />
    <select name="searchin">
      <option value="Knowledgebase">知识库</option>
      <option value="Downloads">下载</option>
    </select>
    <input type="submit" value="Go" />
  </p>
</form>
  </div>
  <div class="clear"></div>
</div>

</body>
</html>