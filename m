Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 802595EA6D2
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 15:05:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ABC5C0D2BB;
	Mon, 26 Sep 2022 13:05:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AC915C035BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 13:05:31 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QAnF7L032368;
 Mon, 26 Sep 2022 15:05:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=bROA6kaCUXB9k9wn6JkwUd5td5k/5yA1xCaxUgCeYpg=;
 b=j63oeOTKOslhO5lted9LPFsLA5m+Mk/Vjv2zl9R3EoBcfTW650+VmxkZaVs4XEONYzoZ
 r53B/wDPqKliewAzscSHHTrgZYi6evlGxPfscqQw5N3B+KXhPAMub6TD8GEw8d7Cof2L
 iZwhvihn6JntsTB+oNmbWmQm2s6mZUGRdpP6DOV8lzgj1j1RQwDlEzc3ne+h2u/E4hzu
 yr6kODPNkf4BtzHSQ8GI5kDNMrSVbJ5cY2LibdApPBnd6KefBIc6eeZtmt7AdnMKa144
 JPDwgUqAcy77IRWv+LaCl2t/BQaqVFsEQIZt3Z2PQKliB3APf9XNRk0B53dzr8ibGJxR Ng== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsrsjbmqm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 15:05:31 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 819D410002A;
 Mon, 26 Sep 2022 15:05:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7C4BE22A6FB;
 Mon, 26 Sep 2022 15:05:30 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.47) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 15:05:29 +0200
Message-ID: <a0355dc7-fc90-b57a-9e3a-121430c21688@foss.st.com>
Date: Mon, 26 Sep 2022 15:05:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-7-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220920160436.117811-7-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 6/7] config: stm32f769-disco: Fix
	internal flash size
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

On 9/20/22 18:04, Patrice Chotard wrote:
> arch-stm32f7/stm32.h file is shared between STM32F746 and STM32F769
> MCUs. But STM32F769 embeds 2MB of internal flash instead of 1MB for
> STM32F746. The flash layout is quite similar between the 2 SoCs :
>
> 	STM32F746 			STM32F769
> 4 *  32KB sectors 			4 *  32KB sectors
> 1 * 128KB sector 			1 * 128KB sector
> 3 * 256KB sectors			7 * 256KB sectors
>
> Update sect_sz_kb[] structure and SYS_MAX_FLASH_SECT accordingly.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>
> ---
>
> Changes in v2:
>    - Remove SYS_UBOOT_FLAG from stm32f746-disco.h
>
>   arch/arm/include/asm/arch-stm32f7/stm32.h | 6 +++---
>   configs/stm32f769-disco_defconfig         | 2 +-
>   configs/stm32f769-disco_spl_defconfig     | 2 +-
>   3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/include/asm/arch-stm32f7/stm32.h b/arch/arm/include/asm/arch-stm32f7/stm32.h
> index 3451e74a3d..57db839e8d 100644
> --- a/arch/arm/include/asm/arch-stm32f7/stm32.h
> +++ b/arch/arm/include/asm/arch-stm32f7/stm32.h
> @@ -10,9 +10,9 @@
>   #include <asm/arch-stm32/stm32f.h>
>   
>   static const u32 sect_sz_kb[CONFIG_SYS_MAX_FLASH_SECT] = {
> -	[0 ... 3] =	32 * 1024,
> -	[4] =		128 * 1024,
> -	[5 ... 7] =	256 * 1024
> +	[0 ... 3] =				32 * 1024,
> +	[4] =					128 * 1024,
> +	[5 ... CONFIG_SYS_MAX_FLASH_SECT - 1] =	256 * 1024
>   };
>   
>   #endif /* _ASM_ARCH_HARDWARE_H */
> diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
> index 423af7446a..5b5307ca1d 100644
> --- a/configs/stm32f769-disco_defconfig
> +++ b/configs/stm32f769-disco_defconfig
> @@ -41,7 +41,7 @@ CONFIG_MTD=y
>   CONFIG_DM_MTD=y
>   CONFIG_MTD_NOR_FLASH=y
>   CONFIG_STM32_FLASH=y
> -CONFIG_SYS_MAX_FLASH_SECT=8
> +CONFIG_SYS_MAX_FLASH_SECT=12
>   CONFIG_DM_SPI_FLASH=y
>   CONFIG_SPI_FLASH_MACRONIX=y
>   CONFIG_SPI_FLASH_STMICRO=y
> diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
> index b56d88f9f6..b5d54b48ec 100644
> --- a/configs/stm32f769-disco_spl_defconfig
> +++ b/configs/stm32f769-disco_spl_defconfig
> @@ -63,7 +63,7 @@ CONFIG_MTD=y
>   CONFIG_DM_MTD=y
>   CONFIG_MTD_NOR_FLASH=y
>   CONFIG_STM32_FLASH=y
> -CONFIG_SYS_MAX_FLASH_SECT=8
> +CONFIG_SYS_MAX_FLASH_SECT=12
>   CONFIG_DM_SPI_FLASH=y
>   CONFIG_SPI_FLASH_MACRONIX=y
>   CONFIG_SPI_FLASH_STMICRO=y



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
