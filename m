Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 754505B59E6
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 14:04:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0925BC04003;
	Mon, 12 Sep 2022 12:04:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72047C035BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 12:04:40 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C9kMnW015458;
 Mon, 12 Sep 2022 14:04:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oX//SFCZv/4MYDcmWkMqje33x024o42Mz2iLMzugOW4=;
 b=PC+E4gNqKtWinaWjL+humtpLjDZwAswdu3JxtRx8A3qp5S9hDCOpWQxaeWMpfHetwtvA
 cmpeLfxj2+CBZg5g29tyFR+2rApf5hlQo+ktKd2WCsef3SdB9b6T+AClml+obSqHmgCk
 7PttVPfoovlZCcMo/XZpUonPuhWwCDO9C2+0Qq8r0lfT9CTDO+Un9YS1D2Vj10+2ISYU
 qi1YbUznE+yI3AGhBWI+YutVFU3apQlw7s3dTS49VKTNmxW/VRpYfgfrVCPzM7kGSd7x
 RVDRlcgXpPNj9RR0Rl6NBJSfr9JF7cB2f0/x9VewPIKEwO1J9VEtnfjgT0yEqiVbG0eC Ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjxnstq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 14:04:36 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8B51C10002A;
 Mon, 12 Sep 2022 14:04:35 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node6.st.com [10.75.129.135])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C5C1229A78;
 Mon, 12 Sep 2022 14:04:35 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by EQNDAG1NODE6.st.com
 (10.75.129.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 14:03:41 +0200
Message-ID: <a7e847dc-c1a0-3652-bf82-f6246516e769@foss.st.com>
Date: Mon, 12 Sep 2022 14:03:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-4-alain.volmat@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220912084201.1826979-4-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To EQNDAG1NODE6.st.com
 (10.75.129.135)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_08,2022-09-12_01,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, hs@denx.de
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

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
>   drivers/i2c/stm32f7_i2c.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 0ec67b5c12..2db7f44d44 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -483,9 +483,9 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>   		}
>   	}
>   
> -	/* End of transfer, send stop condition */
> -	mask = STM32_I2C_CR2_STOP;
> -	setbits_le32(&regs->cr2, mask);
> +	/* End of transfer, send stop condition if appropriate */
> +	if (!ret && !(status & (STM32_I2C_ISR_NACKF | STM32_I2C_ISR_ERRORS)))
> +		setbits_le32(&regs->cr2, STM32_I2C_CR2_STOP);
>   
>   	return stm32_i2c_check_end_of_message(i2c_priv);
>   }



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Tested-by: Patrick Delaunay <patrick.delaunay@foss.st.com> 
[stm32mp157c-dk2]

@Jorge: can you test also for your use-case, thanks


Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
