Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 787E352E5A0
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 09:02:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 28B03C03FEB;
	Fri, 20 May 2022 07:02:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4434C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 07:02:48 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K3tLP5028145;
 Fri, 20 May 2022 09:02:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=J+l86/UQVLp4KqZmJVWLQ1uv1veSS7R3fPgkHBYsu8I=;
 b=tWYNxYr6GHcTuO0/ierCDf1J2gb5gfkKdydGhqVTSg2QyY45cjSapAIFVKr89JoD9/Xq
 ojK63xaN05dfU+h588aNQ0SnAd0q1eg3c8zxKs53IXwZcEg2F5dCw8r4k/iej4DFwaHP
 sDwRb/NeIG8UE3qNov3d6zJChg/Qx8mfVpJuoS9AqD0ZVV7dUWGo3/OT5xck+nxCN4/x
 If3WnfVrWBqHIFqm9C1LoTroMGB4rFaOq/OJN0rErv4i3OGtt9mwNcfZ+fMWa7yR5ztN
 cKuXkQa3LPUvixZuecO1FnmRXOAOuHCGHmx9RP6siXatMYvaDmglXFjoQqIvyAeYfHkD bw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23s2292x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:02:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7715E10002A;
 Fri, 20 May 2022 09:02:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 700A721230D;
 Fri, 20 May 2022 09:02:47 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 09:02:47 +0200
Message-ID: <7b37356a-89fb-58f4-fe77-1623f1e15729@foss.st.com>
Date: Fri, 20 May 2022 09:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.11.I35fae2ba5868b79e66ccef249270e1cf1bf3f04b@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.11.I35fae2ba5868b79e66ccef249270e1cf1bf3f04b@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH 11/16] board: stm32pm1: add stm32mp13
	board support
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

One typo and one remark below

On 5/6/22 16:06, Patrick Delaunay wrote:
> Add stm32mp15x prefix to all STM32MP15x board specific function,
> this patch is a preliminary step for STM32MP13x support.
> 
> This patch also add the RCC probe to avoid circular access with

s/add/adds

> usbphyc probe as clk provider.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index fff1880e5b..4ba7201ffb 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -547,8 +547,7 @@ static void sysconf_init(void)
>  	clrbits_le32(syscfg + SYSCFG_CMPCR, SYSCFG_CMPCR_SW_CTRL);
>  }
>  
> -/* Fix to make I2C1 usable on DK2 for touchscreen usage in kernel */
> -static int dk2_i2c1_fix(void)
> +static int board_stm32mp15x_dk2_init(void)
>  {
>  	ofnode node;
>  	struct gpio_desc hdmi, audio;
> @@ -557,6 +556,7 @@ static int dk2_i2c1_fix(void)
>  	if (!IS_ENABLED(CONFIG_DM_REGULATOR))
>  		return -ENODEV;
>  
> +	/* Fix to make I2C1 usable on DK2 for touchscreen usage in kernel */
>  	node = ofnode_path("/soc/i2c@40012000/hdmi-transmitter@39");
>  	if (!ofnode_valid(node)) {
>  		log_debug("no hdmi-transmitter@39 ?\n");
> @@ -604,7 +604,7 @@ error:
>  	return ret;
>  }
>  
> -static bool board_is_dk2(void)
> +static bool board_is_stm32mp15x_dk2(void)
>  {
>  	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
>  	    of_machine_is_compatible("st,stm32mp157c-dk2"))
> @@ -613,7 +613,7 @@ static bool board_is_dk2(void)
>  	return false;
>  }
>  
> -static bool board_is_ev1(void)
> +static bool board_is_stm32mp15x_ev1(void)
>  {
>  	if (CONFIG_IS_ENABLED(TARGET_ST_STM32MP15x) &&
>  	    (of_machine_is_compatible("st,stm32mp157a-ev1") ||
> @@ -637,7 +637,7 @@ U_BOOT_DRIVER(goodix) = {
>  	.of_match	= goodix_ids,
>  };
>  
> -static void board_ev1_init(void)
> +static void board_stm32mp15x_ev1_init(void)
>  {
>  	struct udevice *dev;
>  
> @@ -648,13 +648,22 @@ static void board_ev1_init(void)
>  /* board dependent setup after realloc */
>  int board_init(void)
>  {
> +	struct udevice *dev;
> +	int ret;
> +
> +	/* probe RCC to avoid circular access with usbphyc probe as clk provider */
> +	if (IS_ENABLED(CONFIG_CLK_STM32MP13)) {
> +		ret = uclass_get_device_by_driver(UCLASS_CLK, DM_DRIVER_GET(stm32mp1_clock), &dev);
> +		log_debug("Clock init failed: %d\n", ret);

I am wondering if usage of DM_FLAG_PROBE_AFTER_BIND in flag would avoid this above piece of code ?

> +	}
> +
>  	board_key_check();
>  
> -	if (board_is_ev1())
> -		board_ev1_init();
> +	if (board_is_stm32mp15x_ev1())
> +		board_stm32mp15x_ev1_init();
>  
> -	if (board_is_dk2())
> -		dk2_i2c1_fix();
> +	if (board_is_stm32mp15x_dk2())
> +		board_stm32mp15x_dk2_init();
>  
>  	if (IS_ENABLED(CONFIG_DM_REGULATOR))
>  		regulators_enable_boot_on(_DEBUG);
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
