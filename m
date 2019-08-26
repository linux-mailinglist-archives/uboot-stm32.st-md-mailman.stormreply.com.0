Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 876159D119
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Aug 2019 15:51:58 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E244FC36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Aug 2019 13:51:57 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ACDF4C36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2019 13:51:56 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QDp38W019926; Mon, 26 Aug 2019 15:51:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=3XFUyQry73p1K+sx/WpcKLlAqy5p6/PED1NbidIAzdY=;
 b=Mf8Kgn6N9CcFjn+mK6M6q5+boOQrRPkhnMbwhiDT2SI/cJHWnGv3Yn8d2r52uId2ZHzw
 XqwYRrZIYYKfYGYc8hhv4YBE9Y9HjSE2nkYU2QeV13YO0HRffbI7DXTFDkew6N/Ya28X
 1XgpgFenF9fl8EJfBW4fw2Cp31BAQIT3MrmHnU0RtVmXr8Es+OwjdrF/RQo9mukieZBY
 oawihY647wJZzO4sBnc8mFxf0YUM4832VO02ovtvkwyAdvcrNARvQtPlN1inIvak4FDK
 JChHW67Afu3dLXwGSkpzaDjXxdl8fCPwUe2bMQM5N4nrIeICBGSsSZHCAXT5hskrsebq sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ujtq14387-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 26 Aug 2019 15:51:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F2A2138;
 Mon, 26 Aug 2019 13:51:54 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EAD572220F9;
 Mon, 26 Aug 2019 15:51:54 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Aug
 2019 15:51:54 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 26 Aug 2019 15:51:54 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [U-Boot] [PATCH] rtc: stm32: manage 2 digit limitation on year
Thread-Index: AQHVQLYs6i9TTEGzi0iUU6qKcs5nIKcNh+MA
Date: Mon, 26 Aug 2019 13:51:54 +0000
Message-ID: <5da9c50c-6899-b550-6b47-2ef1aad73c6c@st.com>
References: <1563799821-25922-1-git-send-email-patrick.delaunay@st.com>
In-Reply-To: <1563799821-25922-1-git-send-email-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <7348FA2A6E8827409ADFA7168B8FDCA2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH] rtc: stm32: manage 2 digit
	limitation on year
X-BeenThere: uboot-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <uboot-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/uboot-stm32/>
List-Post: <mailto:uboot-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32>, 
 <mailto:uboot-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>


On 7/22/19 2:50 PM, Patrick Delaunay wrote:
> STM32 RTC manages only 2 digits for YEAR
> (Year tens and units in BCD format in RTC_DR register).
>
> With this patch, RTC driver assumes that tm->tm_years is between
> 2000 and 2099; tm->tm_year - 2000 have only 2 digit
> (0 > and <= 99).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/rtc/stm32_rtc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rtc/stm32_rtc.c b/drivers/rtc/stm32_rtc.c
> index abd3390..2674714 100644
> --- a/drivers/rtc/stm32_rtc.c
> +++ b/drivers/rtc/stm32_rtc.c
> @@ -72,7 +72,8 @@ static int stm32_rtc_get(struct udevice *dev, struct rtc_time *tm)
>  
>  	tm->tm_mday = bcd2bin((dr & STM32_RTC_DATE) >> STM32_RTC_DATE_SHIFT);
>  	tm->tm_mon = bcd2bin((dr & STM32_RTC_MONTH) >> STM32_RTC_MONTH_SHIFT);
> -	tm->tm_year = bcd2bin((dr & STM32_RTC_YEAR) >> STM32_RTC_YEAR_SHIFT);
> +	tm->tm_year = 2000 +
> +		      bcd2bin((dr & STM32_RTC_YEAR) >> STM32_RTC_YEAR_SHIFT);
>  	tm->tm_wday = bcd2bin((dr & STM32_RTC_WDAY) >> STM32_RTC_WDAY_SHIFT);
>  	tm->tm_yday = 0;
>  	tm->tm_isdst = 0;
> @@ -174,6 +175,9 @@ static int stm32_rtc_set(struct udevice *dev, const struct rtc_time *tm)
>  		tm->tm_year, tm->tm_mon, tm->tm_mday, tm->tm_wday,
>  		tm->tm_hour, tm->tm_min, tm->tm_sec);
>  
> +	if (tm->tm_year < 2000 || tm->tm_year > 2099)
> +		return -EINVAL;
> +
>  	/* Time in BCD format */
>  	t = (bin2bcd(tm->tm_sec) << STM32_RTC_SEC_SHIFT) & STM32_RTC_SEC;
>  	t |= (bin2bcd(tm->tm_min) << STM32_RTC_MIN_SHIFT) & STM32_RTC_MIN;
> @@ -182,7 +186,8 @@ static int stm32_rtc_set(struct udevice *dev, const struct rtc_time *tm)
>  	/* Date in BCD format */
>  	d = (bin2bcd(tm->tm_mday) << STM32_RTC_DATE_SHIFT) & STM32_RTC_DATE;
>  	d |= (bin2bcd(tm->tm_mon) << STM32_RTC_MONTH_SHIFT) & STM32_RTC_MONTH;
> -	d |= (bin2bcd(tm->tm_year) << STM32_RTC_YEAR_SHIFT) & STM32_RTC_YEAR;
> +	d |= (bin2bcd(tm->tm_year - 2000) << STM32_RTC_YEAR_SHIFT) &
> +	      STM32_RTC_YEAR;
>  	d |= (bin2bcd(tm->tm_wday) << STM32_RTC_WDAY_SHIFT) & STM32_RTC_WDAY;
>  
>  	return stm32_rtc_set_time(dev, t, d);



Applied on STM32 tree

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
