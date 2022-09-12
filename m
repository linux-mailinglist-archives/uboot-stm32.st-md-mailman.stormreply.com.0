Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD9E5B56BA
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:52:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 904E1C6410F;
	Mon, 12 Sep 2022 08:52:37 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BD74C640E7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:52:36 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C6nB3s025278;
 Mon, 12 Sep 2022 10:52:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yUwca3YbuPWkrCX/WI4fpozXeLVlInUdXHMNBcXG2tM=;
 b=i9K+hbMPWFwhfuGHdDuMDQ6asxYsm0LWF+cIb69NWUacjHvm+DzFGQdEXrl5IvPqEWiU
 1c9fYCxv5YH0fARVAFnzGavtsn1AFBVMhX3ayuiUTS+MfQL+KquoR5ne4Tv0KTCfdE42
 kdJWuK8dgS6nwJhQGeYTcVrOluyt4lOTzc5R1MqbmL7Gpj4RpF53a6u+bYb24DZpYTlG
 8uXu3skwoOa+m8SbQDLHIZ0r8kpaAbLi2fT2C7SI1VtMaJPw/muVU9I8jVxUg32tknB7
 XFUy0OFI9BS6O/wd/vk5BrNnKyUlL+D6gUpdwvMonR3esQYYTZSo9BCmlF7hrIo8PraI 0w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjxnrpm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:52:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4858710002A;
 Mon, 12 Sep 2022 10:52:29 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4369821A205;
 Mon, 12 Sep 2022 10:52:29 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.123) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 10:52:28 +0200
Message-ID: <b6bb0d53-032a-f76f-ca33-38c2d00b4ede@foss.st.com>
Date: Mon, 12 Sep 2022 10:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-4-alain.volmat@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220912084201.1826979-4-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v4 3/4] i2c: stm32: do not set the STOP
	condition on error
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



On 9/12/22 10:42, Alain Volmat wrote:
> Current function stm32_i2c_message_xfer is sending a STOP
> whatever the result of the transaction is.  This can cause issues
> such as making the bus busy since the controller itself is already
> sending automatically a STOP when a NACK is generated.
> 
> Thanks to Jorge Ramirez-Ortiz for diagnosing and proposing a first
> fix for this. [1]
> 
> [1] https://lore.kernel.org/u-boot/20220815145211.31342-2-jorge@foundries.io/
> 
> Reported-by: Jorge Ramirez-Ortiz, Foundries <jorge@foundries.io>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/stm32f7_i2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 0ec67b5c12..2db7f44d44 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -483,9 +483,9 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>  		}
>  	}
>  
> -	/* End of transfer, send stop condition */
> -	mask = STM32_I2C_CR2_STOP;
> -	setbits_le32(&regs->cr2, mask);
> +	/* End of transfer, send stop condition if appropriate */
> +	if (!ret && !(status & (STM32_I2C_ISR_NACKF | STM32_I2C_ISR_ERRORS)))
> +		setbits_le32(&regs->cr2, STM32_I2C_CR2_STOP);
>  
>  	return stm32_i2c_check_end_of_message(i2c_priv);
>  }
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks 
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
