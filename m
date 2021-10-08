Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3984264CF
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 08:44:06 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC914C597B3;
	Fri,  8 Oct 2021 06:44:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 75754C597B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 06:44:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZJAa016872; 
 Fri, 8 Oct 2021 08:44:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=12aGcmsgypHwBtBhFWqxi1z9pvI9U82Lh1suOA89TBA=;
 b=zxmofnn9qxmIeov+HVF77rLqpWOls174vx/yJzYqA095ZjBR56bQLyhNltTZGNw5czT8
 jHzpGUMI+tqBEGaWULB75Wzw8w3LN4z7dzDAxFlQkygYUamvAk+YJp3ip4d3KD0BYESi
 vHTvxJhXyiGar372wE4AbMKRVMc60JmOy3gIVyWxUPI6GqaKjIzIGOPx4LaHN2hq+A2H
 YysdOEF+TZJhVNzLOGuZPpupMrLQ5tY+5EMVQnPn9Zn3wA7zl4cQhouxxeeQs0Rwzox6
 9EKV1qiiGvzaQHemoduDAoBk8RX3xaF0jX1GjYVsXkKLrW/q5ievR+XcojrIcBPu8ieS Fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjdun90qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:44:02 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3491910002A;
 Fri,  8 Oct 2021 08:44:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D558214D26;
 Fri,  8 Oct 2021 08:44:02 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:44:01 +0200
To: <u-boot@lists.denx.de>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
 <20210803100515.29383-6-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <d8d303e9-052f-a718-2c41-466a523af722@foss.st.com>
Date: Fri, 8 Oct 2021 08:44:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210803100515.29383-6-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v1 5/7] i2c: stm32f7: fix configuration of
 the digital filter
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

HI

On 8/3/21 12:05 PM, Patrice Chotard wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> The digital filter related computation are present in the driver
> however the programming of the filter within the IP is missing.
> The maximum value for the DNF is wrong and should be 15 instead of 16.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  drivers/i2c/stm32f7_i2c.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index e71a0e0aa3..7e6c65fadc 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -45,6 +45,8 @@ struct stm32_i2c_regs {
>  
>  /* STM32 I2C control 1 */
>  #define STM32_I2C_CR1_ANFOFF			BIT(12)
> +#define STM32_I2C_CR1_DNF_MASK			GENMASK(11, 8)
> +#define STM32_I2C_CR1_DNF(n)			(((n) & 0xf) << 8)
>  #define STM32_I2C_CR1_ERRIE			BIT(7)
>  #define STM32_I2C_CR1_TCIE			BIT(6)
>  #define STM32_I2C_CR1_STOPIE			BIT(5)
> @@ -106,7 +108,7 @@ struct stm32_i2c_regs {
>  #define STM32_I2C_MAX_LEN			0xff
>  
>  #define STM32_I2C_DNF_DEFAULT			0
> -#define STM32_I2C_DNF_MAX			16
> +#define STM32_I2C_DNF_MAX			15
>  
>  #define STM32_I2C_ANALOG_FILTER_DELAY_MIN	50	/* ns */
>  #define STM32_I2C_ANALOG_FILTER_DELAY_MAX	260	/* ns */
> @@ -155,7 +157,7 @@ struct stm32_i2c_spec {
>   * @clock_src: I2C clock source frequency (Hz)
>   * @rise_time: Rise time (ns)
>   * @fall_time: Fall time (ns)
> - * @dnf: Digital filter coefficient (0-16)
> + * @dnf: value of digital filter to apply
>   * @analog_filter: Analog filter delay (On/Off)
>   */
>  struct stm32_i2c_setup {
> @@ -842,6 +844,10 @@ static int stm32_i2c_hw_config(struct stm32_i2c_priv *i2c_priv)
>  	else
>  		setbits_le32(&regs->cr1, STM32_I2C_CR1_ANFOFF);
>  
> +	/* Program the Digital Filter */
> +	clrsetbits_le32(&regs->cr1, STM32_I2C_CR1_DNF_MASK,
> +			STM32_I2C_CR1_DNF(i2c_priv->setup.dnf));
> +
>  	setbits_le32(&regs->cr1, STM32_I2C_CR1_PE);
>  
>  	return 0;
> 
Applied on u-boot-stm32 for next
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
