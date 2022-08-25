Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 877095A0BEB
	for <lists+uboot-stm32@lfdr.de>; Thu, 25 Aug 2022 10:53:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F844C5EC6B;
	Thu, 25 Aug 2022 08:53:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4EF2C08D1F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 08:53:00 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27P8Zxxd031342;
 Thu, 25 Aug 2022 10:52:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=HZIaZe/IA0VieQ4m90Y40lE/wGrAOKt8g4Gxa+pWMxo=;
 b=2CptUhhR0K865vUpgaw1Avo6OR1Ykggi4SQOTnD01FBFXvmmYOJ7UgLxajG8ryFNO4zn
 hhQZVRyvnELKDVJMlZTlSzzyl7yep8qwCBuAaEqzLLoe3YjLsHoQZdtquHLRp5P3UcQD
 2BhwG+xdOZzkbZCz01GK80Nz70/qF308C2z8Qlu7PuLUjzTjNzuAKCUpLTtzbBYxDROA
 nFFnhWfsjhtEIQFgIUnNysc4VTyt3+ck4eCGw6sHeAcZtfxWACn/2hB71JF7IeXAVPzH
 VBthTIp6MTNN+ZjjviyNzxVa+FFKYQbEKRcgm7MQQf6ZUYxYG15DSpsKv/sqUEgOc8ga 8A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j4w3dd916-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Aug 2022 10:52:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4AFD10002A;
 Thu, 25 Aug 2022 10:52:53 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB1B621A215;
 Thu, 25 Aug 2022 10:52:53 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.45) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 25 Aug
 2022 10:52:53 +0200
Message-ID: <be7c932a-cf42-aeed-5215-4882c61fa3d0@foss.st.com>
Date: Thu, 25 Aug 2022 10:52:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jorge Ramirez-Ortiz <jorge@foundries.io>, <hs@denx.de>,
 <patrick.delaunay@foss.st.com>, <oleksandr.suvorov@foundries.io>, Alain
 Volmat <avolmat@me.com>
References: <20220815145211.31342-1-jorge@foundries.io>
 <20220815145211.31342-2-jorge@foundries.io>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220815145211.31342-2-jorge@foundries.io>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-25_03,2022-08-22_02,2022-06-22_01
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
Subject: Re: [Uboot-stm32] [PATCHv2 2/2] i2c: stm32f7: do not set the STOP
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

+Alain

Alain, can you have a look a this patch and give your feedback on it.

On my side i tested it on stm32mp157c-ev1 and stm32mp157c-dk2, i didn't see any regression
but i prefer to get expert feedback ;-)

Thanks
Patrice

On 8/15/22 16:52, Jorge Ramirez-Ortiz wrote:
> Sending the stop condition without waiting for transfer complete
> has been found to lock the bus (BUSY) when NACKF is raised.
> 
> Tested accessing the NXP SE05X I2C device.
> https://www.nxp.com/docs/en/application-note/AN12399.pdf
> 
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> Reviewed-by: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
> ---
>  drivers/i2c/stm32f7_i2c.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 3a727e68ac..14827e5cec 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -485,9 +485,11 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>  		}
>  	}
>  
> -	/* End of transfer, send stop condition */
> -	mask = STM32_I2C_CR2_STOP;
> -	setbits_le32(&regs->cr2, mask);
> +	if (!ret) {
> +		/* End of transfer, send stop condition */
> +		mask = STM32_I2C_CR2_STOP;
> +		setbits_le32(&regs->cr2, mask);
> +	}
>  
>  	return stm32_i2c_check_end_of_message(i2c_priv);
>  }
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
