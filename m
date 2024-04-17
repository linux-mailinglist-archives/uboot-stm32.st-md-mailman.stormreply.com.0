Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D16C78A7F00
	for <lists+uboot-stm32@lfdr.de>; Wed, 17 Apr 2024 11:02:55 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D0A4C6B444;
	Wed, 17 Apr 2024 09:02:55 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23D5EC69067
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 09:02:54 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43H7ix0A005483; Wed, 17 Apr 2024 11:02:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=uM92mgvbt0Xq+1Qci9tM2Fta1RARSIcAxLvdfj+EgBo=; b=sD
 MPBViCCROfwGz7GIdn1B+dMaisUZ+wiNFe9dstCN36KLKIu/BdOLPZ/l9+a7sCf2
 xI+Z725gVmmf0vvALzKGUk0NWKyk1Oh6nhOc2ac9udtvolt3e/MnW71eoPWdnwUS
 72sBHLzNnwnD2gPAC280Y0395xntjQWcdAVGzRHpbO7/SUHYtyscKgZRZvh+l0A4
 rXXvtSu4QxwoRZi6Pr+PNVIbcXk4oft6n5R9ImI6Tekr+jg3kbu55Xvf9qtovvC5
 cKX1xgHMzK9bbx9XvDDwxsMYTe5hA92KCPUuz9LD63XlfoVMaKJX9G/2fcg+tDS8
 0R00vSGEmH6LUfh4SgxA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xg50hx9x8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2024 11:02:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DBD0340044;
 Wed, 17 Apr 2024 11:02:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 873BB21058A;
 Wed, 17 Apr 2024 11:02:12 +0200 (CEST)
Received: from [10.48.86.112] (10.48.86.112) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 11:02:11 +0200
Message-ID: <8602799a-7c52-4308-a58e-4986de57210b@foss.st.com>
Date: Wed, 17 Apr 2024 11:02:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20240308142614.2700185-1-patrice.chotard@foss.st.com>
 <20240308142614.2700185-2-patrice.chotard@foss.st.com>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20240308142614.2700185-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.48.86.112]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Peng Fan <peng.fan@nxp.com>,
 Simon Glass <sjg@chromium.org>, Sean Anderson <seanga2@gmail.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 2/2] mmc: stm32_sdmmc2: Fix AARCH64
	compilation warnings
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

Hi,

On 3/8/24 15:26, Patrice Chotard wrote:
> When building with AARCH64 defconfig, we got warnings, fix them.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/mmc/stm32_sdmmc2.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index d4982a14281..39ae79ba129 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -220,9 +220,9 @@ static void stm32_sdmmc2_start_data(struct udevice *dev,
>   
>   	if (data->flags & MMC_DATA_READ) {
>   		data_ctrl |= SDMMC_DCTRL_DTDIR;
> -		idmabase0 = (u32)data->dest;
> +		idmabase0 = (u32)(long)data->dest;
>   	} else {
> -		idmabase0 = (u32)data->src;
> +		idmabase0 = (u32)(long)data->src;
>   	}
>   
>   	/* Set the SDMMC DataLength value */
> @@ -463,8 +463,8 @@ retry_cmd:
>   
>   	stm32_sdmmc2_start_cmd(dev, cmd, cmdat, &ctx);
>   
> -	dev_dbg(dev, "send cmd %d data: 0x%x @ 0x%x\n",
> -		cmd->cmdidx, data ? ctx.data_length : 0, (unsigned int)data);
> +	dev_dbg(dev, "send cmd %d data: 0x%x @ 0x%p\n",
> +		cmd->cmdidx, data ? ctx.data_length : 0, data);
>   
>   	ret = stm32_sdmmc2_end_cmd(dev, cmd, &ctx);
>   



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
