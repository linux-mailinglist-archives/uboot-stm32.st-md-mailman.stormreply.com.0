Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B396A5B56B7
	for <lists+uboot-stm32@lfdr.de>; Mon, 12 Sep 2022 10:51:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66CCEC03FD5;
	Mon, 12 Sep 2022 08:51:59 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3B57C03FC7
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Sep 2022 08:51:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C6X8gX025870;
 Mon, 12 Sep 2022 10:51:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=pDSqTMZ7kf59n4O+Z9ahT08WPQjpzhaoLjpJelPqCqs=;
 b=xgjbcxLRaDdv0HKDUyF7JyTeaNxON2XCfJvDXXGjp7sIJqJuAbZkSYopyjbr0wK2zAch
 Ime8/GFljSSWmvwlhsj1PFYB8+4qR0J1bRHZrYPIHInr6o0klxwH7RQdHLagmxeE+DeB
 F+3v5FbuD4/Q8Cu8R4QXlm5KbCrPXl/gBYItqGMSoUCAi1zxA3HchSwjV3RL/dtGFVvO
 UJb1oyP/nKVdDjq2WCmM+I13XdvpA9PDlGh+e0KXksx+xPT3jmvED068iV38Mz58vO8A
 DOMuw/KHWB2SuPn8sB3tk6xOHK6UbrTv/RTclpBw0RML3IKyvmhA090yJ1QjN57S8jbt qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jgjxnrpgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Sep 2022 10:51:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9793E10002A;
 Mon, 12 Sep 2022 10:51:54 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92B2721A204;
 Mon, 12 Sep 2022 10:51:54 +0200 (CEST)
Received: from [10.201.21.72] (10.75.127.120) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 12 Sep
 2022 10:51:54 +0200
Message-ID: <f4d08aef-9892-03e6-4d71-60e437c8667d@foss.st.com>
Date: Mon, 12 Sep 2022 10:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Alain Volmat <alain.volmat@foss.st.com>,
 <uboot-stm32@st-md-mailman.stormreply.com>, <u-boot@lists.denx.de>
References: <20220912084201.1826979-1-alain.volmat@foss.st.com>
 <20220912084201.1826979-5-alain.volmat@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220912084201.1826979-5-alain.volmat@foss.st.com>
X-Originating-IP: [10.75.127.120]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
Cc: patrick.delaunay@foss.st.com, oleksandr.suvorov@foundries.io, hs@denx.de
Subject: Re: [Uboot-stm32] [PATCH v4 4/4] i2c: stm32: fix usage of rise/fall
 device tree properties
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

Hi Alain, Jorge

On 9/12/22 10:42, Alain Volmat wrote:
> From: Jorge Ramirez-Ortiz <jorge@foundries.io>
> 
> These two device tree properties were not being applied.
> 
> Fixes: 1fd9eb68d6 ("i2c: stm32f7: move driver data of each instance in a privdata")
> Signed-off-by: Jorge Ramirez-Ortiz <jorge@foundries.io>
> Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  drivers/i2c/stm32f7_i2c.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
> index 2db7f44d44..1d2dd8e25d 100644
> --- a/drivers/i2c/stm32f7_i2c.c
> +++ b/drivers/i2c/stm32f7_i2c.c
> @@ -914,18 +914,19 @@ static int stm32_of_to_plat(struct udevice *dev)
>  {
>  	const struct stm32_i2c_data *data;
>  	struct stm32_i2c_priv *i2c_priv = dev_get_priv(dev);
> -	u32 rise_time, fall_time;
>  	int ret;
>  
>  	data = (const struct stm32_i2c_data *)dev_get_driver_data(dev);
>  	if (!data)
>  		return -EINVAL;
>  
> -	rise_time = dev_read_u32_default(dev, "i2c-scl-rising-time-ns",
> -					 STM32_I2C_RISE_TIME_DEFAULT);
> +	i2c_priv->setup.rise_time = dev_read_u32_default(dev,
> +							 "i2c-scl-rising-time-ns",
> +							 STM32_I2C_RISE_TIME_DEFAULT);
>  
> -	fall_time = dev_read_u32_default(dev, "i2c-scl-falling-time-ns",
> -					 STM32_I2C_FALL_TIME_DEFAULT);
> +	i2c_priv->setup.fall_time = dev_read_u32_default(dev,
> +							 "i2c-scl-falling-time-ns",
> +							 STM32_I2C_FALL_TIME_DEFAULT);
>  
>  	i2c_priv->dnf_dt = dev_read_u32_default(dev, "i2c-digital-filter-width-ns", 0);
>  	if (!dev_read_bool(dev, "i2c-digital-filter"))

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks 
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
