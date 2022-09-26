Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FCF5EA684
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Sep 2022 14:50:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0A7DEC0D2BB;
	Mon, 26 Sep 2022 12:50:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F1E09C035BA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Sep 2022 12:50:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28QAhvL2002166;
 Mon, 26 Sep 2022 14:50:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fC2RgH0IY+y0nnf+K12xb6PAdVn74mPc6rrX4Yjodhg=;
 b=pmbNN+nHGB8IxiLjmyrvJTn7KaWqWF+TMMJ1JhGtIjd+5+2BqmRdytKubzWbL0Sx6Zns
 rMJUfQrAtJOCdOqdYQp1/pCoVUbYX++cHzONcFmlq1LxNu2QTDn4rQfd02n2vA3mZXZX
 segJGOG4SRO/qP7941QFGt2MqrlbmKVZG2DoosFgwlilUL4jIITqJuuIKvccjTPmI9UX
 NCiy2XdEljaKyCNp7JMKQixdQS66oVzBMvIdzmo3gN0OxKpNUOnPFa1uoy4BbZSyXGUI
 RnGK3ws1tXZBZ2Tpiu0qq01DrMMp8l/5TminyLEGitRVBbdQfWuRKf/ZfDHr7gbfRDhM cQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsq1auxb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Sep 2022 14:50:41 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02225100034;
 Mon, 26 Sep 2022 14:50:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DD23A22A6D1;
 Mon, 26 Sep 2022 14:50:40 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.45) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 14:50:39 +0200
Message-ID: <9d3e77da-eed7-2a26-8190-808bd663a180@foss.st.com>
Date: Mon, 26 Sep 2022 14:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220920160436.117811-1-patrice.chotard@foss.st.com>
 <20220920160436.117811-2-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220920160436.117811-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_08,2022-09-22_02,2022-06-22_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Vikas Manocha <vikas.manocha@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2 1/7] configs: stm32f746-disco: Fix SPL
	boot
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
> Commit 'b4b9a00ed593 ("Convert CONFIG_SYS_SPL_ARGS_ADDR to Kconfig")'
> replaces CONFIG_SYS_FDT_BASE by CONFIG_SYS_SPL_ARGS_ADDR.
> As CONFIG_SYS_SPL_ARGS_ADDR enables additional code when enable, it
> increases SPL size over the initial 0x8000 limit.
> Increase the SPL size to 0x9000 to fix SPL boot.
> Set SPL_SIZE_LIMIT to 0x9000 to avoid similar issue in the future.
>
> Fixes 'b4b9a00ed593 ("Convert CONFIG_SYS_SPL_ARGS_ADDR to Kconfig")'
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
> (no changes since v1)
>
>   configs/stm32f746-disco_spl_defconfig | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/configs/stm32f746-disco_spl_defconfig b/configs/stm32f746-disco_spl_defconfig
> index e7b1acc433..5e8a8aaf3c 100644
> --- a/configs/stm32f746-disco_spl_defconfig
> +++ b/configs/stm32f746-disco_spl_defconfig
> @@ -1,6 +1,6 @@
>   CONFIG_ARM=y
>   CONFIG_ARCH_STM32=y
> -CONFIG_SYS_TEXT_BASE=0x08008000
> +CONFIG_SYS_TEXT_BASE=0x08009000
>   CONFIG_SYS_MALLOC_LEN=0x100000
>   CONFIG_SYS_MALLOC_F_LEN=0xE00
>   CONFIG_SPL_GPIO=y
> @@ -13,10 +13,11 @@ CONFIG_SPL_TEXT_BASE=0x8000000
>   CONFIG_SYS_PROMPT="U-Boot > "
>   CONFIG_SPL_SERIAL=y
>   CONFIG_SPL_DRIVERS_MISC=y
> +CONFIG_SPL_SIZE_LIMIT=0x9000
>   CONFIG_STM32F7=y
>   CONFIG_TARGET_STM32F746_DISCO=y
>   CONFIG_SPL=y
> -CONFIG_SYS_LOAD_ADDR=0x8008000
> +CONFIG_SYS_LOAD_ADDR=0x8009000
>   CONFIG_BUILD_TARGET="u-boot-with-spl.bin"
>   CONFIG_DISTRO_DEFAULTS=y
>   CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=y
> @@ -29,7 +30,7 @@ CONFIG_USE_BOOTARGS=y
>   CONFIG_BOOTARGS="console=ttyS0,115200 earlyprintk consoleblank=0 ignore_loglevel"
>   # CONFIG_DISPLAY_CPUINFO is not set
>   CONFIG_BOARD_LATE_INIT=y
> -CONFIG_SPL_PAD_TO=0x8000
> +CONFIG_SPL_PAD_TO=0x9000
>   CONFIG_SPL_NO_BSS_LIMIT=y
>   CONFIG_SPL_BOARD_INIT=y
>   CONFIG_SPL_SYS_MALLOC_SIMPLE=y



Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
