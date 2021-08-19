Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E163F187B
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Aug 2021 13:47:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37CF4C58D7A;
	Thu, 19 Aug 2021 11:47:27 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65BD1C58D58
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Aug 2021 11:47:25 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17JBcAhs017479; Thu, 19 Aug 2021 13:47:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=jiuB4sSfWu9fuMMqq+6bImjkzqstd12ENyQj12Wu2Xo=;
 b=fjEWX6o76mBGmX+otroAtTb420kv2pVsb8nLdiFxzu/QNHoVGRBUh9YBAbSSQXp3n08Z
 ob0XBN4Jpana38ltjhI9aEubLGTLCfQqPZFrnJkgupSTxZu/ZBsXuS7sbKOS60nPY5Ew
 8r0CzIsmK40HLhnmbZLOiMCuQSdaX9oZ87AkggtEvm3DKZbA3B0NNNoPoyxiYWNL2vyw
 2eH+Ltu07diFiKq1OzOukyEUrtoJVrAH+3hQ4XmZ8hrgVodZ9cjPBxVrtOWPv/Ucamw+
 Qew3o3VkoBbCS0J3BWTW+sKR3PZDaUphFXWhjRJqZ6C+QRjBzfY9qIDF22TSx2FE1xc1 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3ahjva9n2y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Aug 2021 13:47:24 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A642110002A;
 Thu, 19 Aug 2021 13:47:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B4F9231471;
 Thu, 19 Aug 2021 13:47:23 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 19 Aug
 2021 13:47:23 +0200
To: <u-boot@lists.denx.de>
References: <20210803100515.29383-1-patrice.chotard@foss.st.com>
 <20210803100515.29383-5-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <1a725d8b-d1e6-11d3-d4b6-bb1e36e5d00e@foss.st.com>
Date: Thu, 19 Aug 2021 13:47:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803100515.29383-5-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-19_04:2021-08-17,
 2021-08-19 signatures=0
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

Hi Patrick

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
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
