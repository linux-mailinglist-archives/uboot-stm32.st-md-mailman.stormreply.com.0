Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B8972D9E0
	for <lists+uboot-stm32@lfdr.de>; Tue, 13 Jun 2023 08:25:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D9B1C6A615;
	Tue, 13 Jun 2023 06:25:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62B87C6A60F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jun 2023 06:25:47 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35D65NO6004180; Tue, 13 Jun 2023 08:25:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=7MX7gTgsDVgpY5a7boibnOV3MpqZvQH36A/NmHjdvXI=;
 b=l4XHuF03xOrhuVJKYcDRVG+bew1jTOTHPF8RmxldFzcsZR3g3WWoVtzdqrcMsdlvia0T
 PzFQUgkhXj41LyWnCbDh6GVRFAjz/N1e/J/yGHhmqXuWoRjBGPiCz0gTdD3AhJ4/utH3
 KS1fW/Erj1O9juBLIVBOIwU9LMal4oDk1bjFZcNjNi7VcNMtuhwrWWE9KeOvuzgZtx4m
 pH6qarNg3ie/SOX9bhSVnNEvZz+og9Mk+iN7rcbbiULjYiMkslxhygVIWvEvoHAvFBht
 HJNAkqK0csJCEuqJ/mHt68+SVFQ5+1GrKiW4rDz1t1EiAZDpfNNFx5WKoqE7QTSBGL4t /w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3r6jvjg3nm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 08:25:46 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A4C5C10002A;
 Tue, 13 Jun 2023 08:25:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DFE7212FA6;
 Tue, 13 Jun 2023 08:25:45 +0200 (CEST)
Received: from [10.201.20.56] (10.201.20.56) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 13 Jun
 2023 08:25:45 +0200
Message-ID: <89b9c028-67ad-86ca-59ef-cc84b1a7d873@foss.st.com>
Date: Tue, 13 Jun 2023 08:25:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20230608151648.992505-1-patrick.delaunay@foss.st.com>
 <20230608171614.11.I05a3701d3d8a274af29439ce26900177bfbd8767@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230608171614.11.I05a3701d3d8a274af29439ce26900177bfbd8767@changeid>
X-Originating-IP: [10.201.20.56]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_03,2023-06-12_02,2023-05-22_02
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 11/12] configs: stm32mp1: disable
	CMD_MTDPARTS
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



On 6/8/23 17:16, Patrick Delaunay wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Disable CMD_MTDPARTS as it's no more needed and it is strongly
> encouraged to avoid using this command anymore.
> (see comments in ./cmd/Kconfig:2422).
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  configs/stm32mp13_defconfig         | 1 -
>  configs/stm32mp15_basic_defconfig   | 1 -
>  configs/stm32mp15_defconfig         | 1 -
>  configs/stm32mp15_trusted_defconfig | 1 -
>  4 files changed, 4 deletions(-)
> 
> diff --git a/configs/stm32mp13_defconfig b/configs/stm32mp13_defconfig
> index a9cc7e4d0353..5e9abc5e2625 100644
> --- a/configs/stm32mp13_defconfig
> +++ b/configs/stm32mp13_defconfig
> @@ -39,7 +39,6 @@ CONFIG_CMD_RNG=y
>  CONFIG_CMD_TIMER=y
>  CONFIG_CMD_REGULATOR=y
>  CONFIG_CMD_EXT4_WRITE=y
> -CONFIG_CMD_MTDPARTS=y
>  CONFIG_CMD_LOG=y
>  CONFIG_CMD_UBI=y
>  CONFIG_OF_LIVE=y
> diff --git a/configs/stm32mp15_basic_defconfig b/configs/stm32mp15_basic_defconfig
> index 7661159110e5..94f4dbd4c32b 100644
> --- a/configs/stm32mp15_basic_defconfig
> +++ b/configs/stm32mp15_basic_defconfig
> @@ -75,7 +75,6 @@ CONFIG_CMD_TIMER=y
>  CONFIG_CMD_PMIC=y
>  CONFIG_CMD_REGULATOR=y
>  CONFIG_CMD_EXT4_WRITE=y
> -CONFIG_CMD_MTDPARTS=y
>  CONFIG_CMD_LOG=y
>  CONFIG_CMD_UBI=y
>  # CONFIG_SPL_DOS_PARTITION is not set
> diff --git a/configs/stm32mp15_defconfig b/configs/stm32mp15_defconfig
> index 1ff9f73730d3..37b6d4a7b4ac 100644
> --- a/configs/stm32mp15_defconfig
> +++ b/configs/stm32mp15_defconfig
> @@ -51,7 +51,6 @@ CONFIG_CMD_TIMER=y
>  CONFIG_CMD_PMIC=y
>  CONFIG_CMD_REGULATOR=y
>  CONFIG_CMD_EXT4_WRITE=y
> -CONFIG_CMD_MTDPARTS=y
>  CONFIG_CMD_LOG=y
>  CONFIG_CMD_UBI=y
>  CONFIG_OF_LIVE=y
> diff --git a/configs/stm32mp15_trusted_defconfig b/configs/stm32mp15_trusted_defconfig
> index e7bf2e171ace..9c5446d6d4a2 100644
> --- a/configs/stm32mp15_trusted_defconfig
> +++ b/configs/stm32mp15_trusted_defconfig
> @@ -52,7 +52,6 @@ CONFIG_CMD_TIMER=y
>  CONFIG_CMD_PMIC=y
>  CONFIG_CMD_REGULATOR=y
>  CONFIG_CMD_EXT4_WRITE=y
> -CONFIG_CMD_MTDPARTS=y
>  CONFIG_CMD_LOG=y
>  CONFIG_CMD_UBI=y
>  CONFIG_OF_LIVE=y
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
