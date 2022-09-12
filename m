Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEE35B55A5
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:00:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8DAB7C03FD5;
	Mon, 12 Sep 2022 08:00:14 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C750FC035BB
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:00:13 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C6kehi021684;
 Mon, 12 Sep 2022 10:00:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=8XBJG6GLfRpqV1wtDOT+hyu4XgVe9Sn9P7DXetiprLU=;
 b=EGYxO551cFMagpNVY+0bYntBEEyYI9W1Oxllcbbsub31kEtlNz7lNc+pffug1Ix05Igy
 x5OogCURfOt9ygw3dEui2Xqdn0O/8pXy0Fg+oy2V+30fLOc3IOPkDvPBxgykZeCzVTdP
 74WAqKaHfPrDqWfGbWdVFwGjDifXi1gwC7+3eT48/fwKst+StPVaOqmcwpNOTtad16J9
 cQOb41yF9Ud8J4rDJS16+9tRHL32GXoQPyUZ20YTID6D/9SxKePjviZWz0JZJXnEwWP3
 nvnTfggTbmCXwyEhda3og/p2BFw161/UcQriKL77rLEc8GpvLXZ5+MsuNELrZ5n0hbRB mw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjvjru1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:00:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9F06710003B;
 Mon, 12 Sep 2022 10:00:09 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9A81221684B;
 Mon, 12 Sep 2022 10:00:09 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.121) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 10:00:09 +0200
Message-ID: <8b83c7d0-5811-8d0d-d421-2eb638cde3af@foss.st.com>
Date: Mon, 12 Sep 2022 10:00:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220909160627.1793406-1-alain.volmat@foss.st.com>
 <20220909160627.1793406-3-alain.volmat@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220909160627.1793406-3-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.121]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v3 2/3] i2c: stm32: remove unused stop
 parameter in start & reload handling
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
> Functions stm32_i2c_message_start and stm32_i2c_handle_reload
> both get a stop boolean indicating if the transfer should end with
> a STOP or not.  However no specific handling is needed in those
> functions hence remove the parameter.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
>  drivers/i2c/stm32f7_i2c.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 78d7156492..0ec67b5c12 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -282,7 +282,7 @@ static int stm32_i2c_check_device_busy(struct stm32_i2c_priv *i2c_priv)
>  }
>  
>  static void stm32_i2c_message_start(struct stm32_i2c_priv *i2c_priv,
> -				    struct i2c_msg *msg, bool stop)
> +				    struct i2c_msg *msg)
>  {
>  	struct stm32_i2c_regs *regs = i2c_priv->regs;
>  	u32 cr2 = readl(&regs->cr2);
> @@ -325,7 +325,7 @@ static void stm32_i2c_message_start(struct stm32_i2c_priv *i2c_priv,
>   */
>  
>  static void stm32_i2c_handle_reload(struct stm32_i2c_priv *i2c_priv,
> -				    struct i2c_msg *msg, bool stop)
> +				    struct i2c_msg *msg)
>  {
>  	struct stm32_i2c_regs *regs = i2c_priv->regs;
>  	u32 cr2 = readl(&regs->cr2);
> @@ -431,7 +431,7 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>  	/* Add errors */
>  	mask |= STM32_I2C_ISR_ERRORS;
>  
> -	stm32_i2c_message_start(i2c_priv, msg, stop);
> +	stm32_i2c_message_start(i2c_priv, msg);
>  
>  	while (msg->len) {
>  		/*
> @@ -469,7 +469,7 @@ static int stm32_i2c_message_xfer(struct stm32_i2c_priv *i2c_priv,
>  			mask = msg->flags & I2C_M_RD ? STM32_I2C_ISR_RXNE :
>  			       STM32_I2C_ISR_TXIS | STM32_I2C_ISR_NACKF;
>  
> -			stm32_i2c_handle_reload(i2c_priv, msg, stop);
> +			stm32_i2c_handle_reload(i2c_priv, msg);
>  		} else if (!bytes_to_rw) {
>  			/* Wait until TC flag is set */
>  			mask = STM32_I2C_ISR_TC;

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
