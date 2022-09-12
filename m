Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 087DE5B561F
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:27:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAB8DC03FD5;
	Mon, 12 Sep 2022 08:27:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 692CAC035BE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:27:09 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C6hj4w006545;
 Mon, 12 Sep 2022 10:27:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=3ZTb9pWxZ9fIwqf7EHrUzDnBIyJyKv4mx3DoEkfkrYw=;
 b=G23iKJLttOSjuUuCwzVqlguYk4pqAWKxFMtpmpsHKJIWBGT3U2dTT0kujsDS4riAUDPV
 GxCmrEdWpk6A9PDa2U0g7gkiGkFXK+bEfcDyHX5E7RlzAcDowTWrCYYrsFVaowWNQVJM
 TKg7qYiZqbiTETiPSS33wbjIVlGQD/9BeKW15TKigpckPDCWueHGvXQs8ikMw8xDhygX
 xQBNumzK4HWykidIHB8v9X5FKND3a9D/QX7NaW49EeP9OuyjoPI+8owA2lEA5phJil+9
 HE6KVY1I6zL6uy9ERuPQ+81Nax8VnVAqqdWoxbL+m5HaFJfUydwx3OlAYXer9/peGoro rw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjvjs1em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:27:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3FCD810002A;
 Mon, 12 Sep 2022 10:27:07 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3AEA62171F9;
 Mon, 12 Sep 2022 10:27:07 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.120) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 10:27:06 +0200
Message-ID: <e77d7594-29fc-5563-c36b-7b493908a155@foss.st.com>
Date: Mon, 12 Sep 2022 10:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220909160627.1793406-1-alain.volmat@foss.st.com>
 <20220909160627.1793406-4-alain.volmat@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220909160627.1793406-4-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 3/3] i2c: stm32: do not set the STOP
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

Hi Alain

On 9/9/22 18:06, Alain Volmat wrote:
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
