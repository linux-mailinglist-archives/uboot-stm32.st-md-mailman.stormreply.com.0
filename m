Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C455B1DA6
	for <lists+uboot-stm32@lfdr.de>; Thu,  8 Sep 2022 14:50:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95F13C6410D;
	Thu,  8 Sep 2022 12:50:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BD8AC64107
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Sep 2022 12:50:35 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 288C35m1018759;
 Thu, 8 Sep 2022 14:50:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=hSL0Rq/0ujWh7Vgcm8NdsB59GFdDTpbRtKeqPpzp4Gc=;
 b=ab1s/u6YhWO3nmYm/79vNGoB+PI3PJGsrhnDx4fUD50OEpdkganm2pYr1f4pLtvSAwcU
 RqIplLb2HeykQTh8dGpb8bPXIitf8ynHvJKBfAuyKjLgrF4iPc1nHyzOR/uO95YvTuCT
 6bkH9G8xFS9LZnl7/xj5HdAK6RWUASarQScSVmjE6qDB+KRbWXFHtYoRlJJZrDqrHVpS
 p3DyyYTRd7RkebX1K+o8Bd2ZXY/UHLjVbXnebGvzBx65m9dkNbieBkg4NoCeHFXV82EV
 ltCQWWPiyScQHaPQ41YIQQK0wIPuUJbNA6VM6SOLj3Mku20O452Jb360r5G7gT4g2AHe gQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jerfv9m5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Sep 2022 14:50:32 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E1D0410002A;
 Thu,  8 Sep 2022 14:50:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DCF1821FE8F;
 Thu,  8 Sep 2022 14:50:31 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.50) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Thu, 8 Sep
 2022 14:50:30 +0200
Message-ID: <d7370841-4ba2-7e1f-596c-187de27e51b3@foss.st.com>
Date: Thu, 8 Sep 2022 14:50:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220908105934.1764482-1-alain.volmat@foss.st.com>
 <20220908105934.1764482-4-alain.volmat@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220908105934.1764482-4-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-08_08,2022-09-07_02,2022-06-22_01
Cc: oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v2 3/3] i2c: stm32: only send a STOP upon
 transfer completion
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
> Current function stm32_i2c_message_xfer is sending a STOP
> whatever the result of the transaction is.  This can cause issues
> such as making the bus busy since the controller itself is already
> sending automatically a STOP when a NACK is generated.  This can
> be especially seen when the processing get slower (ex: enabling lots
> of debug messages), ending up send 2 STOP (one automatically by the
> controller and a 2nd one at the end of the stm32_i2c_message_xfer
> function).
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
>   drivers/i2c/stm32f7_i2c.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 0ec67b5c12..8803979d3e 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -477,16 +477,16 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>   			if (ret)
>   				break;
>   
> +			/* End of transfer, send stop condition */
> +			mask = STM32_I2C_CR2_STOP;
> +			setbits_le32(&regs->cr2, mask);
> +
>   			if (!stop)
>   				/* Message sent, new message has to be sent */
>   				return 0;
>   		}
>   	}
>   
> -	/* End of transfer, send stop condition */
> -	mask = STM32_I2C_CR2_STOP;
> -	setbits_le32(&regs->cr2, mask);
> -
>   	return stm32_i2c_check_end_of_message(i2c_priv);
>   }
>   


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
