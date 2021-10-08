Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 136BB4264CE
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 08:43:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CFB8BC597B3;
	Fri,  8 Oct 2021 06:43:55 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D56B8C597B2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 06:43:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1984ZaxS021946; 
 Fri, 8 Oct 2021 08:43:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=0dUeAZNN6DqS+asWtPaQzK/jNjgAx3phcM1L+GYCG7c=;
 b=V2KAm2rkbmhZ8qRgRlJXcWG/YpTiYda2TOyK0212HFhNsgavfI6FLI/ffVKbcJNg9GMy
 BT2fnh1V9FqNxqeNcYEhXo6YdY0vrchc4A4NE3rYKVcznN6pEiB2ZmpzZkfJgqVgYR42
 tkmFxrmDdscSwEfmzE4HtCWJ6BIGrg7AXqy1PQPo89PbzUnQe92dj94TDjj2zoQ+gv+R
 2macaRQ8sBGZzmHv1g29L69UTx+YT6JIch4qsWd2H5yKsQLiJLAH7ZZ5Le3RFnpllLLs
 K7CRn8Fe5WlElhZ9wNGbunbf8bQk5KRqQ5P7Evd5UzoNOimcdVNkrLoGxQGTbSaXy+6T Xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3bjbxn9mfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Oct 2021 08:43:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id EC5C910002A;
 Fri,  8 Oct 2021 08:43:52 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3F44214D26;
 Fri,  8 Oct 2021 08:43:52 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct
 2021 08:43:52 +0200
To: <u-boot@lists.denx.de>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
 <20210803100515.29383-5-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <988941cd-d7fc-f72e-2f81-33255cc21a24@foss.st.com>
Date: Fri, 8 Oct 2021 08:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210803100515.29383-5-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_02,2021-10-07_02,2020-04-07_01
Cc: Patrick DELAUNAY <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v1 4/7] i2c: stm32f7: support DT binding
	i2c-analog-filter
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

Hi

On 8/3/21 12:05 PM, Patrice Chotard wrote:
> From: Patrick Delaunay <patrick.delaunay@foss.st.com>
> 
> Replace driver internally coded enabling/disabling of the
> analog-filter with the DT binding "i2c-analog-filter".
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
> 
>  drivers/i2c/stm32f7_i2c.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index b449084b5f..e71a0e0aa3 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -108,7 +108,6 @@ struct stm32_i2c_regs {
>  #define STM32_I2C_DNF_DEFAULT			0
>  #define STM32_I2C_DNF_MAX			16
>  
> -#define STM32_I2C_ANALOG_FILTER_ENABLE	1
>  #define STM32_I2C_ANALOG_FILTER_DELAY_MIN	50	/* ns */
>  #define STM32_I2C_ANALOG_FILTER_DELAY_MAX	260	/* ns */
>  
> @@ -919,7 +918,7 @@ static int stm32_of_to_plat(struct udevice *dev)
>  					 STM32_I2C_FALL_TIME_DEFAULT);
>  
>  	i2c_priv->setup.dnf = STM32_I2C_DNF_DEFAULT;
> -	i2c_priv->setup.analog_filter = STM32_I2C_ANALOG_FILTER_ENABLE;
> +	i2c_priv->setup.analog_filter = dev_read_bool(dev, "i2c-analog-filter");
>  
>  	/* Optional */
>  	i2c_priv->regmap = syscon_regmap_lookup_by_phandle(dev,
> 
Applied on u-boot-stm32 for next
Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
