<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL(표현언어) 연산자</title>
</head>
<body>
	<ul>
		<li>${param.num1} + ${param.num2} = ${param.num1 + param.num2}</li>
		<li>${param.num1} - ${param.num2} = ${param.num1 - param.num2}</li>
		<li>${param.num1} * ${param.num2} = ${param.num1 * param.num2}</li>
		<li>${param.num1} / ${param.num2} = ${param.num1 / param.num2}</li>
		<li>${param.num1} % ${param.num2} = ${param.num1 % param.num2}</li>
		<li>${param.num1} 을 ${param.num2} 로 나눈 몫 = ${param.num1 div param.num2 }</li>
		<li>${param.num1} 을 ${param.num2} 로 나눈 나머지 = ${param.num1 mod param.num2 }</li>
		<li>${param.num1} > ${param.num2} = ${param.num1 - param.num2 > 0}</li>
		<li>${param.num1} < ${param.num2} = ${param.num1 - param.num2 < 0}</li>
		<li>${param.num1} == ${param.num2} = ${param.num1 eq param.num2}</li>
		<li>${param.num1} != ${param.num2} = ${param.num1 ne param.num2}</li>
		<li> 둘 다 양수 = ${param.num1 gt 0 and param.num2 gt 0 }</li> 
		<li> 둘 다 양수 = ${param.num1 > 0 && param.num2 > 0 }</li> 
		<li> 둘 다 양수(>=) = ${param.num1 ge 0 and param.num2 ge 0 }</li> 
		<li> 둘 다 양수(>=) = ${param.num1 >= 0 && param.num2 >= 0 }</li> 
		<li> 하나라도 양수 = ${param.num1 gt 0 || param.num2 gt 0 } </li>
		
		<li> 하나라도 음수 = ${param.num1 lt 0 || param.num2 lt 0 } </li>
		<li> 하나라도 음수 = ${param.num1 < 0 or param.num2 < 0 } </li>
		<li> 하나라도 음수(＜=)  =  ${param.num1 le 0 || param.num2 le 0 } </li>
		<li> 하나라도 음수(＜=)  = ${param.num1 <= 0 or param.num2 <= 0 } </li>
		<li> 큰 수 출력 = ${param.num1 > param.num2 ? param.num1 : param.num2 }</li>
	</ul>
</body>
</html>