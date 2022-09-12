Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFF05B56EA
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 11:02:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2955DC03FD5;
	Mon, 12 Sep 2022 09:02:41 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DB233C03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 09:02:39 +0000 (UTC)
Received: from [192.168.1.107] (82-131-156-25.pool.digikabel.hu
 [82.131.156.25])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: hs@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3C98B81F45;
 Mon, 12 Sep 2022 11:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1662973359;
 bh=UvYpxouRPQwUSl9MXJcPxvd4JgI5Ayc4vfUscPUNF28=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ODldvLJAal4VTsyhJHVgLUrGyJNhm/1g0Y08fSFup+Iyj9Uae/2HSg2dbX6FcyHY7
 YZM13QjDFvw8bvAwxZf5RtDG6IrN7xHbXZCVHybGvbbSzYktXPewjctaPGQtrNseYk
 a3KbSaeFfb2SQwo93oAXUAcbtvUX8lDb2ouyrVpuNAzs+Kj6JBtv9Hqjx+PomyJ6IP
 lJXGutHBrKPdAu7sXJ4dHxN21F2wGJci49Y9kWsCrRXmhgePVhIMZyRxZH0TYVKV7t
 wptPSFtXreBiqOFQ30RiM97I9HpXULI04bWG4Y/5GodBjpd8xsyyYPKZD8lmwIqGbp
 ycP0TV7+KemeQ==
To: Alain Volmat <alain.volmat@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-4-alain.volmat@foss.st.com>
From: Heiko Schocher <hs@denx.de>
Message-ID: <dcfc4a5b-a1e3-f043-5c0f-a5c079c7bc26@denx.de>
Date: Mon, 12 Sep 2022 11:02:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220912084201.1826979-4-alain.volmat@foss.st.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io
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
Reply-To: hs@denx.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

Hello Alain,

On 12.09.22 10:42, Alain Volmat wrote:
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


Reviewed-by: Heiko Schocher <hs@denx.de>

Oh... isn;t here missing the Reviewed-by and Tested-by tag from
Patrick?

bye,
Heiko
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
> 

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs@denx.de
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
