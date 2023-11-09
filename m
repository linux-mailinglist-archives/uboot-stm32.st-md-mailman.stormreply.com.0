Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AEA7E643B
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Nov 2023 08:19:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C192C6B479;
	Thu,  9 Nov 2023 07:19:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 63237C6B463
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 07:19:24 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3A96PepH032049; Thu, 9 Nov 2023 08:19:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=heqXfm2pUHC9CbNAdByn0vKEE3fSL2iki8Wt0x2sizI=; b=U+
 VaTTFc9qBESGU4pvmtXQ9/Xn8cakiE8KeHB4EHVWC3w759Eht1I880k1IAsbJaJ7
 ycKsqSLpzj9xc2PgN3dnCc1nw/oz+raK6egon2HkrfoB9fi6GlPVji0zCsqxY3+n
 XRe9YOJs3DDU4cuR6PDCvmE3kKUNJ3sb3SZbOe5JuaZvWacIadMsWz2b669dpQgf
 CTWymoo/rTbw9G85s/Br+Flr962VmCFQNnVdTkChrxwO28FaMACQ+MpYbLJJKdBD
 7TlLd6prBIshVqinsaGvHHW/XONBT3vl+2DYhHt0Yud9jxkq/RSHIncUCkxCeETE
 t2ekIlRi52K2gIS2e07A==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u7w21pxf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 08:19:15 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 557F110005A;
 Thu,  9 Nov 2023 08:19:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4B91721058D;
 Thu,  9 Nov 2023 08:19:14 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 9 Nov
 2023 08:19:13 +0100
Message-ID: <30ad1990-03ad-4b57-9085-90f9e9376b33@foss.st.com>
Date: Thu, 9 Nov 2023 08:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, <u-boot@lists.denx.de>
References: <20231104163203.117382-1-marex@denx.de>
 <20231104163203.117382-2-marex@denx.de>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231104163203.117382-2-marex@denx.de>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_05,2023-11-08_01,2023-05-22_02
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Andreas Geisreiter <ageisreiter@dh-electronics.de>, u-boot@dh-electronics.com
Subject: Re: [Uboot-stm32] [PATCH 2/2] arm: stm32: Limit u-boot.itb size to
 0x160000 bytes on DH STM32MP15 DHSOM
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



On 11/4/23 17:31, Marek Vasut wrote:
> The maximum size of u-boot.itb in SPI NOR on DH STM32MP15 DHSOM is
> 0x160000 . Define this size in U-Boot config to prevent misconfigured
> builds from emitting larger u-boot.itb than the one which fits the
> SPI NOR area reserved for the blob.
> 
> The SPI NOR layout is as follows:
> 0x00_0000..0x03_ffff ... SPL 1
> 0x04_0000..0x07_ffff ... SPL 2
> 0x08_0000..0x1d_ffff ... U-Boot
> 0x1e_0000..0x1e_ffff ... Environment 1
> 0x1f_0000..0x1f_ffff ... Environment 2
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Andreas Geisreiter <ageisreiter@dh-electronics.de>
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: u-boot@dh-electronics.com
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  configs/stm32mp15_dhcom_basic_defconfig | 2 ++
>  configs/stm32mp15_dhcor_basic_defconfig | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/configs/stm32mp15_dhcom_basic_defconfig b/configs/stm32mp15_dhcom_basic_defconfig
> index 08aac878f8e..1d241529be7 100644
> --- a/configs/stm32mp15_dhcom_basic_defconfig
> +++ b/configs/stm32mp15_dhcom_basic_defconfig
> @@ -25,6 +25,8 @@ CONFIG_SPL_SPI=y
>  CONFIG_SYS_LOAD_ADDR=0xc2000000
>  CONFIG_SYS_MEMTEST_START=0xc0000000
>  CONFIG_SYS_MEMTEST_END=0xc4000000
> +CONFIG_HAS_BOARD_SIZE_LIMIT=y
> +CONFIG_BOARD_SIZE_LIMIT=1441792
>  CONFIG_FIT=y
>  CONFIG_SPL_LOAD_FIT=y
>  CONFIG_SPL_LOAD_FIT_ADDRESS=0xc1000000
> diff --git a/configs/stm32mp15_dhcor_basic_defconfig b/configs/stm32mp15_dhcor_basic_defconfig
> index 8cd6924b580..6e0c4a8cf9f 100644
> --- a/configs/stm32mp15_dhcor_basic_defconfig
> +++ b/configs/stm32mp15_dhcor_basic_defconfig
> @@ -23,6 +23,8 @@ CONFIG_SPL_SPI_FLASH_SUPPORT=y
>  CONFIG_SPL_SPI=y
>  # CONFIG_ARMV7_VIRT is not set
>  CONFIG_SYS_LOAD_ADDR=0xc2000000
> +CONFIG_HAS_BOARD_SIZE_LIMIT=y
> +CONFIG_BOARD_SIZE_LIMIT=1441792
>  CONFIG_FIT=y
>  CONFIG_SPL_LOAD_FIT=y
>  CONFIG_SPL_LOAD_FIT_ADDRESS=0xc1000000
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
