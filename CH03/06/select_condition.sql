-- (1) 단순질의
-- 1. 모든 극장의 이름과 위치를 보이시오.
SELECT 
    theaterName, theaterLocation
FROM
    theater;

-- 2. '잠실'에 있는 극장을 보이시오.
SELECT 
    *
FROM
    theater
WHERE
    theaterLocation = '잠실';

-- 3. '잠실'에 사는 고객의 이름을 오름차순으로 보이시오.
SELECT 
    userName
FROM
    users
WHERE
    userAddress = '잠실';

-- 4. 가격이 8,000원 이하인 영화의 극장번호, 상영관번호, 영화제목을 보이시오.
SELECT 
    theaterNum, cinemaNum, movieName
FROM
    cinema
WHERE
    price <= 8000;

-- 5. 극장 위치와 고객의 주소가 같은 고객을 보이시오.
SELECT DISTINCT
    theater.theaterLocation, users.userName
FROM
    theater,
    users
WHERE
    theater.theaterLocation = users.userAddress;

-- (2) 집계질의
-- 1. 극장의 수는 몇 개인가?
SELECT 
    COUNT(*) AS '극장 수'
FROM
    theater;

-- 2. 상영되는 영화의 평균 가격은 얼마인가?
SELECT 
    ROUND(AVG(price))
FROM
    cinema;

-- 3. 2014년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?
SELECT 
    COUNT(*) AS '고객 수'
FROM
    reservation,
    users
WHERE
    reservation.userNum = users.userNum
        AND date = '2014-09-01';

-- (3) 부속질의와 조인
-- 1. '대한' 극장에서 상영된 영화제목을 보이시오.
SELECT 
    movieName
FROM
    theater,
    cinema
WHERE
    theater.theaterName = '대한'
        AND theater.theaterNum = cinema.theaterNum;
        
-- 2. '대한' 극장에서 영화를 본 고객의 이름을 보이시오.
SELECT 
    *
FROM
    theater,
    users,
    reservation
WHERE
    theater.theaterName = '대한'
        AND reservation.theaterNum = theater.theaterNum
        AND reservation.userNum = users.userNum;
    
SELECT 
    userName
FROM
    users
WHERE
    userNum IN (SELECT 
            userNum
        FROM
            reservation
        WHERE
            theaterNum = (SELECT 
                    theaterNum
                FROM
                    theater
                WHERE
                    theaterName = '대한'));
                    
-- 대한 극장의 전체 수입을 보이시오.
SELECT 
    SUM(price)
FROM
    cinema
WHERE
    cinemaNum IN (SELECT 
            cinemaNum
        FROM
            reservation
        WHERE
            theaterNum = (SELECT 
                    theaterNum
                FROM
                    theater
                WHERE
                    theaterName = '대한'));

SELECT 
    SUM(price)
FROM
    theater,
    cinema,
    reservation
WHERE
    theater.theaterName = '대한'
        AND reservation.theaterNum = theater.theaterNum
        AND cinema.cinemaNum = reservation.cinemaNum;
    
-- (4) 그룹질의
-- 1. 극장별 상영관 수를 보이시오.
SELECT 
    theater.theaterName, COUNT(*)
FROM
    cinema
        JOIN
    theater ON cinema.theaterNum = theater.theaterNum
GROUP BY cinema.theaterNum;

-- 2. '잠실'에 있는 극장의 상영관을 보이시오.
SELECT 
    *
FROM
    cinema
WHERE
    theaterNum IN (SELECT 
            theaterNum
        FROM
            theater
        WHERE
            theaterLocation = '잠실');

-- 3. 2014년09월01일의 극장별 평균 관람 고객 수를 보이시오.
SELECT 
    theater.theaterName, COUNT(*)
FROM
    reservation
        JOIN
    theater ON reservation.theaterNum = theater.theaterNum
WHERE
    reservation.date = '2014-09-01'
GROUP BY reservation.theaterNum;

-- 4. 2014년09월01일에 가장 많은 고객이 관람한 영화를 보이시오.
SELECT 
    movieName
FROM
    cinema,
    reservation
WHERE
    cinema.theaterNum = reservation.theaterNum
        AND cinema.cinemaNum = reservation.cinemaNum
        AND date LIKE '2014-09-01'
GROUP BY reservation.theaterNum , reservation.cinemaNum; 


-- DML
-- 1. 각 테이블에 데이터를 삽입하는 INSERT 문을 하나씩 실행시켜 보시오.
-- (위 insert문 참조)

-- 2. 영화의 가격을 10%씩 인상하시오.
set sql_safe_updates = 0;
UPDATE cinema 
SET 
    price = price + (price * 0.1);