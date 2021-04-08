Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C3C35856A
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Apr 2021 15:58:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE7CC5719D;
	Thu,  8 Apr 2021 13:58:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7BD7BC5718B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Apr 2021 13:58:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 138DpoPC023995; Thu, 8 Apr 2021 15:58:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=XV6F6HL6Nf7aW/BhEwkuz6G+llh83kIW5tPYnUmcXHg=;
 b=l0rZEjfFrBqwGge7vLPsQHTZn5WsHoHikRRVgujY+dxhJB9pl513ZbJglSuBQ9b5cfZB
 OtZJ781cbaVwWt/RhdqXbU7/Poc3DiVnodupB8Tzd40ZcJ5wYeHqPq8YC45suskolh5l
 1M9KeIZvnBQk0Dk4VKl4Wb0uxZ/G3lUF+je0jQGCpdGWlwbSb1UitQRfe2F2R7keBr9o
 vGvAX6x8DSCYwhDiKX9RBUoiKn/aURZJ4WqRy0rAZsPbEuV4oCvShNuSV3kAMeToJbO6
 N6rDIDr53ZgOHN6wNTcX2KFzvSBOz8yfAYiYYdA+sGHTxrIuDecEE81NOXLvaraHQ9rW cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 37ssm3k5cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Apr 2021 15:58:10 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2909110002A;
 Thu,  8 Apr 2021 15:58:10 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1FAFF23C0E3;
 Thu,  8 Apr 2021 15:58:10 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.51) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 8 Apr
 2021 15:58:09 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210406095752.1.I339c57936517e4941007cc421c1e2cad5a08a0d3@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <f8ad7670-8ba8-5f85-b88b-5a96d9958810@foss.st.com>
Date: Thu, 8 Apr 2021 15:58:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210406095752.1.I339c57936517e4941007cc421c1e2cad5a08a0d3@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-08_03:2021-04-08,
 2021-04-08 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: remove the
 board_check_usb_power function when ADC is not activated
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

Hi Patrick

On 4/6/21 9:57 AM, Patrick Delaunay wrote:
> Simplify the code of the function board_check_usb_power
> based in CONFIG_ADC and adc_measurement; the function is removed by the
> linker when the CONFIG_ADC is not activated.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 759181fb5d..261ec15e1b 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -347,6 +347,9 @@ static int board_check_usb_power(void)
>  	u32 nb_blink;
>  	u8 i;
>  
> +	if (!IS_ENABLED(CONFIG_ADC))
> +		return -ENODEV;
> +
>  	node = ofnode_path("/config");
>  	if (!ofnode_valid(node)) {
>  		log_debug("no /config node?\n");
> @@ -370,11 +373,7 @@ static int board_check_usb_power(void)
>  
>  	/* perform maximum of 2 ADC measurements to detect power supply current */
>  	for (i = 0; i < 2; i++) {
> -		if (IS_ENABLED(CONFIG_ADC))
> -			ret = adc_measurement(node, adc_count, &min_uV, &max_uV);
> -		else
> -			ret = -ENODEV;
> -
> +		ret = adc_measurement(node, adc_count, &min_uV, &max_uV);
>  		if (ret)
>  			return ret;
>  
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
