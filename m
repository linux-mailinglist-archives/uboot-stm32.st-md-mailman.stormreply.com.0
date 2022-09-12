Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F6F5B55A1
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 09:59:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7167CC03FD5;
	Mon, 12 Sep 2022 07:59:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28785C035BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 07:59:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C0R2xh021415;
 Mon, 12 Sep 2022 09:59:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cxTbDNQYtLzHeLf4s7bl+Ekeije/Or6X4GouCa55aCk=;
 b=59w9mookqt8Y45iMidjpzcxushsNtGgFFQS8LuTwjY5CelOQiLeCxcJKlWyypE0iWW1u
 yLgicjIIgGBJnMOzdnDoItiVkaYuNO3pbqCPLLEw3ch/qU75AK2tGHf/SJ5QIjkukL+E
 vn34vyKdZKlOXkXLrdAqgz8nsFiC/+5rXoHlbOj8H6+WADJVb3R/idUVajTwUghQpIUQ
 eVSbom7tl8D3UIE/wPVGNNlnbA4BjJphFmTPnudCzXNbH9BP8/cKFspYvGrWke1/HOVL
 5Bj7nCMeKRoNp+pSrwnqeSEk4OAsK66gi9lV/dCoywlfxzLh8M5y3gcmeHF99kDnzrnf zw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjtt8tt2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 09:59:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 965C910002A;
 Mon, 12 Sep 2022 09:59:12 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89508216849;
 Mon, 12 Sep 2022 09:59:12 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.123) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 09:59:12 +0200
Message-ID: <020bc60e-ef5e-4995-f6a0-1f7a158994df@foss.st.com>
Date: Mon, 12 Sep 2022 09:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220909160627.1793406-1-alain.volmat@foss.st.com>
 <20220909160627.1793406-2-alain.volmat@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220909160627.1793406-2-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 1/3] i2c: stm32: fix comment and remove
 unused AUTOEND bit
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

Hi Alain

On 9/9/22 18:06, Alain Volmat wrote:
> Comment within stm32_i2c_message_start is misleading, indicating
> that AUTOEND bit is setted while it is actually cleared.
> Moreover, the bit is actually never setted so there is no need
> to clear it hence get rid of this bit clear and the bit macro
> as well.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>  drivers/i2c/stm32f7_i2c.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index bf2a6c9b4b..78d7156492 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -57,7 +57,6 @@ struct stm32_i2c_regs {
>  #define STM32_I2C_CR1_PE			BIT(0)
>  
>  /* STM32 I2C control 2 */
> -#define STM32_I2C_CR2_AUTOEND			BIT(25)
>  #define STM32_I2C_CR2_RELOAD			BIT(24)
>  #define STM32_I2C_CR2_NBYTES_MASK		GENMASK(23, 16)
>  #define STM32_I2C_CR2_NBYTES(n)			((n & 0xff) << 16)
> @@ -304,9 +303,8 @@ static void stm32_i2c_message_start(struct stm32_i2c_priv *i2c_priv,
>  		cr2 |= STM32_I2C_CR2_SADD7(msg->addr);
>  	}
>  
> -	/* Set nb bytes to transfer and reload or autoend bits */
> -	cr2 &= ~(STM32_I2C_CR2_NBYTES_MASK | STM32_I2C_CR2_RELOAD |
> -		 STM32_I2C_CR2_AUTOEND);
> +	/* Set nb bytes to transfer and reload (if needed) */
> +	cr2 &= ~(STM32_I2C_CR2_NBYTES_MASK | STM32_I2C_CR2_RELOAD);
>  	if (msg->len > STM32_I2C_MAX_LEN) {
>  		cr2 |= STM32_I2C_CR2_NBYTES(STM32_I2C_MAX_LEN);
>  		cr2 |= STM32_I2C_CR2_RELOAD;

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
