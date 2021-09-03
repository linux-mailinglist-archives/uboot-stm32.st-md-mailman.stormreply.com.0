Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CC13FFBFB
	for <lists+uboot-stm32@lfdr.de>; Fri,  3 Sep 2021 10:31:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0DBAC58D58;
	Fri,  3 Sep 2021 08:31:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25875C57B51
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 Sep 2021 08:31:19 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 1831nDCt016586;
 Fri, 3 Sep 2021 10:31:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oOgHAiC/BXZcfTbieIct8UIPuHOcq21Q8L3OwH5Gnng=;
 b=sNn1Tdtj475pDJM9puISrrg9jKMhIk59YPcdKbPS773yd5w/f90lxlCKEET3NM+gD2Iv
 DgWcmHUGMkulKpcmLrSZW2/2k4PdVeCnoHFiOK7NqmZMVFtlVnDEoma1aii/ANl4D7/8
 dGICpN2755/wc7kPBcFxfwqQegYbaVQw9cPKxCkInwBsFSUXIfH8TBq8qtK7w1OoY/Q3
 O/ZcRyM8pbKXMCPLdT21ufvatj5wT8R9+Z4NzJzQ1ksA7cNDTzD7WxD+/oDnCOfgIZOG
 1FTGxE+6kW1K+S6fNmTrz66TZE/qiorwgIpIYYwJgqiOkGY5pQ8Z2txadMvV0OOa0OS/ UA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3auacm9x3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 10:31:17 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D955810002A;
 Fri,  3 Sep 2021 10:31:16 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF36C216EE4;
 Fri,  3 Sep 2021 10:31:16 +0200 (CEST)
Received: from lmecxl0994.lme.st.com (10.75.127.49) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 3 Sep
 2021 10:31:16 +0200
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20210901095143.4143-1-patrice.chotard@foss.st.com>
 <20210901095143.4143-2-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
Message-ID: <5e6e9e55-25bc-66e0-4691-481be727f670@foss.st.com>
Date: Fri, 3 Sep 2021 10:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901095143.4143-2-patrice.chotard@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-03_02,2021-09-03_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Marek Vasut <marex@denx.de>, Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 2/2] board: dh_stm32mp1: Remove
 gpio_hog_probe_all() from board
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

Hi Patrice,

On 9/1/21 11:51 AM, Patrice Chotard wrote:
> DM_GPIO_HOG flag has been replaced by GPIO_HOG flag since a while in
> commit 49b10cb49262 ("gpio: fixes for gpio-hog support").
>
> And furthermore, gpio_hog_probe_all() is already called in board_r.c.
> So gpio_hog_probe() can be removed from stm32mp1.c.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
>
>   board/dhelectronics/dh_stm32mp1/board.c | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
> index d7c1857c16..725b438d76 100644
> --- a/board/dhelectronics/dh_stm32mp1/board.c
> +++ b/board/dhelectronics/dh_stm32mp1/board.c
> @@ -593,9 +593,6 @@ int board_init(void)
>   	/* address of boot parameters */
>   	gd->bd->bi_boot_params = STM32_DDR_BASE + 0x100;
>   
> -	if (CONFIG_IS_ENABLED(DM_GPIO_HOG))
> -		gpio_hog_probe_all();
> -
>   	board_key_check();
>   
>   #ifdef CONFIG_DM_REGULATOR


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
