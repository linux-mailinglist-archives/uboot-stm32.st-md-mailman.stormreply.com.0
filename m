Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E74FF5EBD90
	for <lists+uboot-stm32@lfdr.de>; Tue, 27 Sep 2022 10:39:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1C19C63325;
	Tue, 27 Sep 2022 08:39:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8512BC5F1D3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 08:39:21 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R61ECo011790;
 Tue, 27 Sep 2022 10:39:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=9QtP/4KUffbWJbiMFON6o6AHB5QO+gHpa+WodFFNO/s=;
 b=kI77qDIO+OsOy+QAlTrQ/Ko8GYRND70fgRuqlQ1tGYTpCdylNJNe5wpa+YjEO1YKoDo7
 Zccgwh7nMDT1a0si/xrkc7LiUnsmqroVM+uZrAmBD/PasM7X1o2ke0l+wtyrt40qHqYi
 Sj5XqSkLF91SAnITw2O6GplRhAO4c8WhQegTzgsxKvVq1snlg111gEhhMCw7XDefE93E
 Wp+KqFAXTqdHYuQ6Y/ZuG8xdfQkGdRaEyjRCnO5P67glVlXHbhxNBadMmPWvET2c4rCh
 qLYH3GKEss3XqKCqxEBFDtWCIu4BRqgpotwjbc8WVT7QfwEqlNaH7DxkAkz7kEb702L6 xQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jss8280mp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Sep 2022 10:39:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DC04610002A;
 Tue, 27 Sep 2022 10:39:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D7B81216EEA;
 Tue, 27 Sep 2022 10:39:19 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.44) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 10:39:16 +0200
Message-ID: <5aa3eff0-2477-a121-a5cc-008147d24c3b@foss.st.com>
Date: Tue, 27 Sep 2022 10:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220926155936.550320-1-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220926155936.550320-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Dillon Min <dillon.minfei@gmail.com>, Vikas Manocha <vikas.manocha@st.com>,
 Kamil Lulko <kamil.lulko@gmail.com>
Subject: Re: [Uboot-stm32] [PATCH] configs: increase SYS_MALLOC_F_LEN for
	STM32 MCU's board
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

On 9/26/22 17:59, Patrice Chotard wrote:
> Some STM32 MCU's board need their SYS_MALLOC_F_LEN value enlarged
> to avoid the "alloc space exhausted" error message during their boot
> process.
> Use the default SYS_MALLOC_F_LEN value which is set to 0x2000 in
> Kconfig.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   configs/stm32746g-eval_defconfig       | 1 -
>   configs/stm32746g-eval_spl_defconfig   | 1 -
>   configs/stm32f429-discovery_defconfig  | 1 -
>   configs/stm32f429-evaluation_defconfig | 1 -
>   configs/stm32f469-discovery_defconfig  | 1 -
>   configs/stm32f746-disco_defconfig      | 1 -
>   configs/stm32f746-disco_spl_defconfig  | 1 -
>   configs/stm32f769-disco_defconfig      | 1 -
>   configs/stm32f769-disco_spl_defconfig  | 1 -
>   configs/stm32h743-disco_defconfig      | 1 -
>   configs/stm32h743-eval_defconfig       | 1 -
>   configs/stm32h750-art-pi_defconfig     | 1 -
>   12 files changed, 12 deletions(-)
>
> diff --git a/configs/stm32746g-eval_defconfig b/configs/stm32746g-eval_defconfig
> index 58232a7114..7200446d28 100644
> --- a/configs/stm32746g-eval_defconfig
> +++ b/configs/stm32746g-eval_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08000000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xE00
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x2000
>   CONFIG_DEFAULT_DEVICE_TREE="stm32746g-eval"
> diff --git a/configs/stm32746g-eval_spl_defconfig b/configs/stm32746g-eval_spl_defconfig
> index 28f522b15e..ff42952a76 100644
> --- a/configs/stm32746g-eval_spl_defconfig
> +++ b/configs/stm32746g-eval_spl_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08009000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xE00
>   CONFIG_SPL_GPIO=y
>   CONFIG_SPL_LIBCOMMON_SUPPORT=y
>   CONFIG_SPL_LIBGENERIC_SUPPORT=y
> diff --git a/configs/stm32f429-discovery_defconfig b/configs/stm32f429-discovery_defconfig
> index e6e595d495..914ac14641 100644
> --- a/configs/stm32f429-discovery_defconfig
> +++ b/configs/stm32f429-discovery_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08000000
>   CONFIG_SYS_MALLOC_LEN=0x0200000
> -CONFIG_SYS_MALLOC_F_LEN=0xF00
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x2000
>   CONFIG_ENV_SECT_SIZE=0x20000
> diff --git a/configs/stm32f429-evaluation_defconfig b/configs/stm32f429-evaluation_defconfig
> index 073f27168a..af7a8bf076 100644
> --- a/configs/stm32f429-evaluation_defconfig
> +++ b/configs/stm32f429-evaluation_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08000000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xF00
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x2000
>   CONFIG_DEFAULT_DEVICE_TREE="stm32429i-eval"
> diff --git a/configs/stm32f469-discovery_defconfig b/configs/stm32f469-discovery_defconfig
> index bd3693275e..90680fdb05 100644
> --- a/configs/stm32f469-discovery_defconfig
> +++ b/configs/stm32f469-discovery_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08000000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xF00
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x2000
>   CONFIG_DEFAULT_DEVICE_TREE="stm32f469-disco"
> diff --git a/configs/stm32f746-disco_defconfig b/configs/stm32f746-disco_defconfig
> index ed537b0578..a8edf11b40 100644
> --- a/configs/stm32f746-disco_defconfig
> +++ b/configs/stm32f746-disco_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08000000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xE00
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x2000
>   CONFIG_DEFAULT_DEVICE_TREE="stm32f746-disco"
> diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
> index d4a65bde24..0e358e86ff 100644
> --- a/configs/stm32f746-disco_spl_defconfig
> +++ b/configs/stm32f746-disco_spl_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08009000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xE00
>   CONFIG_SPL_GPIO=y
>   CONFIG_SPL_LIBCOMMON_SUPPORT=y
>   CONFIG_SPL_LIBGENERIC_SUPPORT=y
> diff --git a/configs/stm32f769-disco_defconfig b/configs/stm32f769-disco_defconfig
> index 5b5307ca1d..3e7b5bd06e 100644
> --- a/configs/stm32f769-disco_defconfig
> +++ b/configs/stm32f769-disco_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08000000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xE00
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x2000
>   CONFIG_DEFAULT_DEVICE_TREE="stm32f769-disco"
> diff --git a/configs/stm32f769-disco_spl_defconfig b/configs/stm32f769-disco_spl_defconfig
> index b5d54b48ec..f0a1b667b8 100644
> --- a/configs/stm32f769-disco_spl_defconfig
> +++ b/configs/stm32f769-disco_spl_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08009000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xE00
>   CONFIG_SPL_GPIO=y
>   CONFIG_SPL_LIBCOMMON_SUPPORT=y
>   CONFIG_SPL_LIBGENERIC_SUPPORT=y
> diff --git a/configs/stm32h743-disco_defconfig b/configs/stm32h743-disco_defconfig
> index d33da43065..8c62c70a57 100644
> --- a/configs/stm32h743-disco_defconfig
> +++ b/configs/stm32h743-disco_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08000000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xF00
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x2000
>   CONFIG_DEFAULT_DEVICE_TREE="stm32h743i-disco"
> diff --git a/configs/stm32h743-eval_defconfig b/configs/stm32h743-eval_defconfig
> index a72de48690..1ff6b50819 100644
> --- a/configs/stm32h743-eval_defconfig
> +++ b/configs/stm32h743-eval_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x08000000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xF00
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x2000
>   CONFIG_DEFAULT_DEVICE_TREE="stm32h743i-eval"
> diff --git a/configs/stm32h750-art-pi_defconfig b/configs/stm32h750-art-pi_defconfig
> index b8296a98b4..a5fce5e866 100644
> --- a/configs/stm32h750-art-pi_defconfig
> +++ b/configs/stm32h750-art-pi_defconfig
> @@ -2,7 +2,6 @@ CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
>   CONFIG_SYS_TEXT_BASE=0x90000000
>   CONFIG_SYS_MALLOC_LEN=0x100000
> -CONFIG_SYS_MALLOC_F_LEN=0xF00
>   CONFIG_NR_DRAM_BANKS=1
>   CONFIG_ENV_SIZE=0x2000
>   CONFIG_DEFAULT_DEVICE_TREE="stm32h750i-art-pi"




Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
