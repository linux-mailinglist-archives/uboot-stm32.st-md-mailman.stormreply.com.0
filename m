Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A69425B1DA1
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 14:50:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7AE91C64107;
	Thu,  8 Sep 2022 12:50:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 907D3C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 12:50:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288CZuSv011892;
 Thu, 8 Sep 2022 14:50:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=A2w1QapLJYUY468TT1YXaypbiLFS0zZcqfhUo4pXT5o=;
 b=Uf4td8tJNni4dPqzGXt9UWDAamu4tmlQt6fgofSezqqQbBJQptZ5GEJycoVRH3f91Yh5
 BbMnKGKebpyMwF+WJ5/EudiMkssKTShHCp2KaqagijW1/3FtDhQ0wcnQrVFAXR4u7txm
 5QgpUyg5H0XotAQDKKgniDD98uNf+b9YTnoHPKVCydE2dFdxkZvfi84iptiC1WNBYQut
 6YrYRB6zqJ3lnJLPN/3/2dLYL8myJv+E3osCa8sxhTRGRGUizkpQCiK4Rdx4tIyt4uGK
 f7JfdEuMpgoKEIUshqSKkDMIAl6fabizefMqJfNR6Hro3+gyiBYsFzGtjG5rArBCD29R DA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jbvbnpnxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 14:50:04 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C794F100034;
 Thu,  8 Sep 2022 14:50:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C276E22A6DE;
 Thu,  8 Sep 2022 14:50:03 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 8 Sep
 2022 14:50:01 +0200
Message-ID: <c0b27f37-5c4b-2810-f936-d4e5812673fa@foss.st.com>
Date: Thu, 8 Sep 2022 14:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220908105934.1764482-1-alain.volmat@foss.st.com>
 <20220908105934.1764482-2-alain.volmat@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220908105934.1764482-2-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_08,2022-09-07_02,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 1/3] i2c: stm32: fix comment and remove
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 9/8/22 12:59, Alain Volmat wrote:
> Comment within stm32_i2c_message_start is misleading, indicating
> that AUTOEND bit is setted while it is actually cleared.
> Moreover, the bit is actually never setted so there is no need
> to clear it hence get rid of this bit clear and the bit macro
> as well.
>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>   drivers/i2c/stm32f7_i2c.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index bf2a6c9b4b..78d7156492 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -57,7 +57,6 @@ struct stm32_i2c_regs {
>   #define STM32_I2C_CR1_PE			BIT(0)
>   
>   /* STM32 I2C control 2 */
> -#define STM32_I2C_CR2_AUTOEND			BIT(25)
>   #define STM32_I2C_CR2_RELOAD			BIT(24)
>   #define STM32_I2C_CR2_NBYTES_MASK		GENMASK(23, 16)
>   #define STM32_I2C_CR2_NBYTES(n)			((n & 0xff) << 16)
> @@ -304,9 +303,8 @@ static void stm32_i2c_message_start(struct stm32_i2c_priv *i2c_priv,
>   		cr2 |= STM32_I2C_CR2_SADD7(msg->addr);
>   	}
>   
> -	/* Set nb bytes to transfer and reload or autoend bits */
> -	cr2 &= ~(STM32_I2C_CR2_NBYTES_MASK | STM32_I2C_CR2_RELOAD |
> -		 STM32_I2C_CR2_AUTOEND);
> +	/* Set nb bytes to transfer and reload (if needed) */
> +	cr2 &= ~(STM32_I2C_CR2_NBYTES_MASK | STM32_I2C_CR2_RELOAD);
>   	if (msg->len > STM32_I2C_MAX_LEN) {
>   		cr2 |= STM32_I2C_CR2_NBYTES(STM32_I2C_MAX_LEN);
>   		cr2 |= STM32_I2C_CR2_RELOAD;


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
