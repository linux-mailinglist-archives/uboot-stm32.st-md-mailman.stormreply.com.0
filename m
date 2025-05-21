Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DBCABF808
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 May 2025 16:42:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80700C78F6B;
	Wed, 21 May 2025 14:42:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55492C78F6A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 May 2025 14:42:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LDLpqc032550;
 Wed, 21 May 2025 16:42:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 ONkgdQthQ8fpMJotUI5kS4DiFr/qIe/Nef7eyiZr7I8=; b=uBjBJL6/VzvVkpVU
 FCnVU88SJoZ5c8N9ZD64wwIDhak2LNz/T/Mjo4fLYxNKcnyQ8lAiQZcmuNz+P1t5
 JdnODu2TZ5tOB6ON+cZ4CFjukqdVKSO+UsHOt5egbsr8bB0U3LPHznxB0+YMaUKm
 kj++8rBO/cASe4iFcYFROLf+Z3QIIZLFQ924zdJ83MzT/2bjmIez/gaCBByw9kur
 QVLkeXLOsk6mvMOvkWWNrwwehXTTjGCMW6t8kTKvclipOgLNVBxHvNpt+xDHYjRb
 bYixdukOi4FDzeIftBOM8BrfaluLuSGB/5alk77iRN/jz+vraVl+TIfx1/L9ylaj
 G5T49Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwff4q4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 May 2025 16:42:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5852D40049;
 Wed, 21 May 2025 16:41:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D15BEA187F4;
 Wed, 21 May 2025 16:40:37 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 May
 2025 16:40:37 +0200
Message-ID: <6a97edeb-692b-4959-9624-4fa4d2e6b2c9@foss.st.com>
Date: Wed, 21 May 2025 16:40:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marek.vasut@mailbox.org>, <u-boot@lists.denx.de>
References: <20250512164536.147793-1-marek.vasut@mailbox.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250512164536.147793-1-marek.vasut@mailbox.org>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH] ARM: stm32: Auto-detect ROM API table on
	STM32MP15xx
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



On 5/12/25 18:45, Marek Vasut wrote:
> The ROM API table location is passed to the SPL by BootROM in register r0,
> make use of this, store the content of r0 and later use it to access the
> ROM API table to determine current boot device.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Sughosh Ganu <sughosh.ganu@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: u-boot@lists.denx.de
> Cc: uboot-stm32@st-md-mailman.stormreply.com
> ---
>  arch/arm/mach-stm32mp/stm32mp1/cpu.c        | 3 +--
>  arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/cpu.c b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> index 18175fd12cc..9ab5a3ede52 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/cpu.c
> @@ -330,8 +330,7 @@ static uintptr_t nt_fw_dtb __section(".data");
>  void save_boot_params(unsigned long r0, unsigned long r1, unsigned long r2,
>  		      unsigned long r3)
>  {
> -	if (IS_ENABLED(CONFIG_STM32_ECDSA_VERIFY))
> -		rom_api_table = r0;
> +	rom_api_table = r0;
>  
>  	if (IS_ENABLED(CONFIG_TFABOOT))
>  		nt_fw_dtb = r2;
> diff --git a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
> index caeeeca863c..07d99034861 100644
> --- a/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
> +++ b/arch/arm/mach-stm32mp/stm32mp1/stm32mp15x.c
> @@ -64,7 +64,6 @@
>   * - boot instance = bit 31:16
>   * - boot device = bit 15:0
>   */
> -#define BOOTROM_PARAM_ADDR	0x2FFC0078
>  #define BOOTROM_MODE_MASK	GENMASK(15, 0)
>  #define BOOTROM_MODE_SHIFT	0
>  #define BOOTROM_INSTANCE_MASK	GENMASK(31, 16)
> @@ -189,7 +188,7 @@ void spl_board_init(void)
>  static void update_bootmode(void)
>  {
>  	u32 boot_mode;
> -	u32 bootrom_itf = readl(BOOTROM_PARAM_ADDR);
> +	u32 bootrom_itf = readl(get_stm32mp_rom_api_table());
>  	u32 bootrom_device, bootrom_instance;
>  
>  	/* enable TAMP clock = RTCAPBEN */

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
