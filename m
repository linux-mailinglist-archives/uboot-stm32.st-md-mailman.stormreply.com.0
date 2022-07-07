Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A16569ABB
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 08:51:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89FBEC0D2BF;
	Thu,  7 Jul 2022 06:51:16 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5651C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 06:51:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675QIbV004699;
 Thu, 7 Jul 2022 08:51:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=yGK6i9XXzJI0qJo3EbA3MThbZyrOaqitj8aUO7L8t1s=;
 b=YuiMCoi3QX5VTenpH00Yl0KmlkAzBOgKnaoOf2OMcqX6eKDFlqzB6zW+9hSneik/fVOV
 PVteMGgJLJl9FawkpoOw6yhkx0tliFS4WldLpUT1AKGJ0L4Az9K8ArLelzIoWG+p6Gh0
 gXphkObAFOgy7XUC1q0TR9Pk5tZQbq90RyYaeJ2HgBKpPm8eALTrgTxIN66XahrgM6eC
 ddSxvn4ebSGByg7T/U6yTdW/kmanm7Vh2B/6vtPrv8aDtBrXrCOY0B08wxAIJG+oifX7
 sspqkDDl8TRd4oAhWOB5zi7RuCyEMmuoZfJG9GZd1B5JCE9R1ggjknS13MK7832KtRba VA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ub43fuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 08:51:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AEFB210002A;
 Thu,  7 Jul 2022 08:51:14 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A79A920F576;
 Thu,  7 Jul 2022 08:51:14 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.51) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 08:51:14 +0200
Message-ID: <99f655f4-6e7a-c0d5-6b23-4ef26dda8b22@foss.st.com>
Date: Thu, 7 Jul 2022 08:51:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220620123605.1.If8c377a910cabf108ec14bc570c381126e1531e9@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220620123605.1.If8c377a910cabf108ec14bc570c381126e1531e9@changeid>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_04,2022-06-28_01,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] board: stm32mp1: remove test on
	CONFIG_DM_REGULATOR
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

On 6/20/22 12:36, Patrick Delaunay wrote:
> The tests on CONFIG_DM_REGULATOR, added to avoid compilation issues, can
> now be removed, they are no more needed since the commit 16cc5ad0b439
> ("power: regulator: add dummy helper").
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  board/st/stm32mp1/stm32mp1.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/board/st/stm32mp1/stm32mp1.c b/board/st/stm32mp1/stm32mp1.c
> index 9496890d164..8c162b42a59 100644
> --- a/board/st/stm32mp1/stm32mp1.c
> +++ b/board/st/stm32mp1/stm32mp1.c
> @@ -494,7 +494,7 @@ static void sysconf_init(void)
>  	ret = uclass_get_device_by_driver(UCLASS_PMIC,
>  					  DM_DRIVER_GET(stm32mp_pwr_pmic),
>  					  &pwr_dev);
> -	if (!ret && IS_ENABLED(CONFIG_DM_REGULATOR)) {
> +	if (!ret) {
>  		ret = uclass_get_device_by_driver(UCLASS_MISC,
>  						  DM_DRIVER_GET(stm32mp_bsec),
>  						  &dev);
> @@ -555,9 +555,6 @@ static int board_stm32mp15x_dk2_init(void)
>  	struct gpio_desc hdmi, audio;
>  	int ret = 0;
>  
> -	if (!IS_ENABLED(CONFIG_DM_REGULATOR))
> -		return -ENODEV;
> -
>  	/* Fix to make I2C1 usable on DK2 for touchscreen usage in kernel */
>  	node = ofnode_path("/soc/i2c@40012000/hdmi-transmitter@39");
>  	if (!ofnode_valid(node)) {
> @@ -658,8 +655,7 @@ int board_init(void)
>  	if (board_is_stm32mp15x_dk2())
>  		board_stm32mp15x_dk2_init();
>  
> -	if (IS_ENABLED(CONFIG_DM_REGULATOR))
> -		regulators_enable_boot_on(_DEBUG);
> +	regulators_enable_boot_on(_DEBUG);
>  
>  	/*
>  	 * sysconf initialisation done only when U-Boot is running in secure


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
