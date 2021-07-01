Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBF63B8E3D
	for <lists+uboot-stm32@lfdr.de>; Thu,  1 Jul 2021 09:36:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64C9AC597AA;
	Thu,  1 Jul 2021 07:36:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D564DC59783
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 07:36:07 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1617RLrY026854; Thu, 1 Jul 2021 09:36:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=dqgNGOPY0YaJMTu+pqST4Gn7HTXLqdn/LxVLNrls4qQ=;
 b=tq60+eeWS6P7qItJUAIlY2TsbHlyq4/35sWJ8KNif124jtlFY6kw9CPEQPr/9Z2ROha4
 nRNc5ereU21Qp9Q+wO8hOUqq1imUUhScgBjOM50ijuAveVDYzMuiOxR7HEP12k/KQiNE
 s5uBpsAHjezhPLPLqgRnFBgvbayqOxz9hunXwxTVZEptIW0wnsCjp1M6+RntYGpDUYFu
 pOO2WZR33UBXnKUQmNzAsP8Ke4xfdD8wgCRqq5SnD4qcvUVfvRTk4+wWYOfbBtFBeHlL
 gXYLJWjQ1oAwKIwmYYQHXJYAzbXkcP9qa8Ncg5cWH0uxwt+l4JbjpEyVjVPn2O0TghcZ hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39h7yj194g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 09:36:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AEEB2100034;
 Thu,  1 Jul 2021 09:36:06 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A58172138D0;
 Thu,  1 Jul 2021 09:36:06 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.45) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 09:36:06 +0200
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20210628125603.2936135-1-patrick.delaunay@foss.st.com>
 <20210628145519.5.I38ea9658e6b3f7be161eddb47b792f8af938910e@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <0a8e0fa4-3528-0bd3-51bd-2add7a33e0e9@foss.st.com>
Date: Thu, 1 Jul 2021 09:36:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628145519.5.I38ea9658e6b3f7be161eddb47b792f8af938910e@changeid>
Content-Language: en-US
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_01:2021-06-30,
 2021-07-01 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 5/7] stm32mp: cmd_stm32key: add
	get_misc_dev function
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

On 6/28/21 2:56 PM, Patrick Delaunay wrote:
> Add a helper function to access to BSEC misc driver.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/cmd_stm32key.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/cmd_stm32key.c b/arch/arm/mach-stm32mp/cmd_stm32key.c
> index c4cb6342fa..886c52794f 100644
> --- a/arch/arm/mach-stm32mp/cmd_stm32key.c
> +++ b/arch/arm/mach-stm32mp/cmd_stm32key.c
> @@ -14,6 +14,17 @@
>  #define STM32_OTP_HASH_KEY_START 24
>  #define STM32_OTP_HASH_KEY_SIZE 8
>  
> +static int get_misc_dev(struct udevice **dev)
> +{
> +	int ret;
> +
> +	ret = uclass_get_device_by_driver(UCLASS_MISC, DM_DRIVER_GET(stm32mp_bsec), dev);
> +	if (ret)
> +		log_err("Can't find stm32mp_bsec driver\n");
> +
> +	return ret;
> +}
> +
>  static void read_hash_value(u32 addr)
>  {
>  	int i;
> @@ -31,13 +42,9 @@ static int fuse_hash_value(u32 addr, bool print)
>  	u32 word, val;
>  	int i, ret;
>  
> -	ret = uclass_get_device_by_driver(UCLASS_MISC,
> -					  DM_DRIVER_GET(stm32mp_bsec),
> -					  &dev);
> -	if (ret) {
> -		log_err("Can't find stm32mp_bsec driver\n");
> +	ret = get_misc_dev(&dev);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	for (i = 0, word = STM32_OTP_HASH_KEY_START;
>  	     i < STM32_OTP_HASH_KEY_SIZE;
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
