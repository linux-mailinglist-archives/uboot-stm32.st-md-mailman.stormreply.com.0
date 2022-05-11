Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E86522D21
	for <lists+uboot-stm32@lfdr.de>; Wed, 11 May 2022 09:23:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5E58C03FC2;
	Wed, 11 May 2022 07:23:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25C25C03FC1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 07:23:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B2d2N0011337;
 Wed, 11 May 2022 09:23:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=gOb+xEhWDz+O4n6Bw/XJ6EwR/nmcKzwe25zAA5SnRBo=;
 b=vkiSwjg+8yuVKNdpC7fRhXq0qSwKOKMEPuxqoum3sg8Mr1blHfYDkcemO+k4ZWlIA/mo
 X12cpZcR5rbtwRFZwTBpITUq4L8J/Z/Suv5dxNdUkgt2gdo16GNQJeTUzey5J643LaBB
 tUfT2Ddk7M37ciMOpSqisdVDlSU/7MWtQK6a8BByQ/HKm8jK1s65EAIdkKzTlBvdfIEg
 HDaxh0VT11TtwpMPT8GuK66ZIvuhIyxNisqEq99UN4Fdr8oJenXvzVkfBpOz5ZsYzlm5
 vdgsKhhJbIbmkAEpCb9ZEQOsxNmz0OlRzWKJ9h9BK3wGJVpj7XkbCzZ+5P+dmY0jd49f Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwe6kwcrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 09:23:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A47A100034;
 Wed, 11 May 2022 09:23:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 627F3210F64;
 Wed, 11 May 2022 09:23:21 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.47) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Wed, 11 May
 2022 09:23:20 +0200
Message-ID: <a37ffbab-07fb-81ba-dae5-a376aa230761@foss.st.com>
Date: Wed, 11 May 2022 09:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220509171309.1.Ie4f29021d76802af1c22e1df1a6a55ae6a5f55d9@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220509171309.1.Ie4f29021d76802af1c22e1df1a6a55ae6a5f55d9@changeid>
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_02,2022-05-10_01,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] stm32mp: fdt: update etzpc for
	STM32MP15x
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

On 5/9/22 17:13, Patrick Delaunay wrote:
> Introduce STM32MP15 function and defines to prepare the
> STM32MP13 introduction.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  arch/arm/mach-stm32mp/fdt.c | 123 ++++++++++++++++++++----------------
>  1 file changed, 67 insertions(+), 56 deletions(-)
> 
> diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
> index ad45728949..5d37a44d97 100644
> --- a/arch/arm/mach-stm32mp/fdt.c
> +++ b/arch/arm/mach-stm32mp/fdt.c
> @@ -28,13 +28,13 @@
>  
>  #define ETZPC_RESERVED		0xffffffff
>  
> -#define STM32_FDCAN_BASE	0x4400e000
> -#define STM32_CRYP2_BASE	0x4c005000
> -#define STM32_CRYP1_BASE	0x54001000
> -#define STM32_GPU_BASE		0x59000000
> -#define STM32_DSI_BASE		0x5a000000
> +#define STM32MP15_FDCAN_BASE	0x4400e000
> +#define STM32MP15_CRYP2_BASE	0x4c005000
> +#define STM32MP15_CRYP1_BASE	0x54001000
> +#define STM32MP15_GPU_BASE	0x59000000
> +#define STM32MP15_DSI_BASE	0x5a000000
>  
> -static const u32 stm32mp1_ip_addr[] = {
> +static const u32 stm32mp15_ip_addr[] = {
>  	0x5c008000,	/* 00 stgenc */
>  	0x54000000,	/* 01 bkpsram */
>  	0x5c003000,	/* 02 iwdg1 */
> @@ -44,7 +44,7 @@ static const u32 stm32mp1_ip_addr[] = {
>  	ETZPC_RESERVED,	/* 06 reserved */
>  	0x54003000,	/* 07 rng1 */
>  	0x54002000,	/* 08 hash1 */
> -	STM32_CRYP1_BASE,	/* 09 cryp1 */
> +	STM32MP15_CRYP1_BASE,	/* 09 cryp1 */
>  	0x5a003000,	/* 0A ddrctrl */
>  	0x5a004000,	/* 0B ddrphyc */
>  	0x5c009000,	/* 0C i2c6 */
> @@ -97,7 +97,7 @@ static const u32 stm32mp1_ip_addr[] = {
>  	0x4400b000,	/* 3B sai2 */
>  	0x4400c000,	/* 3C sai3 */
>  	0x4400d000,	/* 3D dfsdm */
> -	STM32_FDCAN_BASE,	/* 3E tt_fdcan */
> +	STM32MP15_FDCAN_BASE,	/* 3E tt_fdcan */
>  	ETZPC_RESERVED,	/* 3F reserved */
>  	0x50021000,	/* 40 lptim2 */
>  	0x50022000,	/* 41 lptim3 */
> @@ -110,7 +110,7 @@ static const u32 stm32mp1_ip_addr[] = {
>  	0x48003000,	/* 48 adc */
>  	0x4c002000,	/* 49 hash2 */
>  	0x4c003000,	/* 4A rng2 */
> -	STM32_CRYP2_BASE,	/* 4B cryp2 */
> +	STM32MP15_CRYP2_BASE,	/* 4B cryp2 */
>  	ETZPC_RESERVED,	/* 4C reserved */
>  	ETZPC_RESERVED,	/* 4D reserved */
>  	ETZPC_RESERVED,	/* 4E reserved */
> @@ -163,8 +163,13 @@ static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
>  	int offset, shift;
>  	u32 addr, status, decprot[ETZPC_DECPROT_NB];
>  
> -	array = stm32mp1_ip_addr;
> -	array_size = ARRAY_SIZE(stm32mp1_ip_addr);
> +	if (IS_ENABLED(CONFIG_STM32MP13x))
> +		return 0;
> +
> +	if (IS_ENABLED(CONFIG_STM32MP15x)) {
> +		array = stm32mp15_ip_addr;
> +		array_size = ARRAY_SIZE(stm32mp15_ip_addr);
> +	}
>  
>  	for (i = 0; i < ETZPC_DECPROT_NB; i++)
>  		decprot[i] = readl(ETZPC_DECPROT(i));
> @@ -248,33 +253,9 @@ static void stm32_fdt_disable_optee(void *blob)
>  	}
>  }
>  
> -/*
> - * This function is called right before the kernel is booted. "blob" is the
> - * device tree that will be passed to the kernel.
> - */
> -int ft_system_setup(void *blob, struct bd_info *bd)
> +static void stm32mp15_fdt_fixup(void *blob, int soc, u32 cpu, char *name)
>  {
> -	int ret = 0;
> -	int soc;
> -	u32 pkg, cpu;
> -	char name[SOC_NAME_SIZE];
> -
> -	if (IS_ENABLED(CONFIG_STM32MP13x))
> -		return 0;
> -
> -	soc = fdt_path_offset(blob, "/soc");
> -	if (soc < 0)
> -		return soc;
> -
> -	if (CONFIG_IS_ENABLED(STM32_ETZPC)) {
> -		ret = stm32_fdt_fixup_etzpc(blob, soc);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	/* MPUs Part Numbers and name*/
> -	cpu = get_cpu_type();
> -	get_soc_name(name);
> +	u32 pkg;
>  
>  	switch (cpu) {
>  	case CPU_STM32MP151Fxx:
> @@ -284,19 +265,18 @@ int ft_system_setup(void *blob, struct bd_info *bd)
>  		stm32_fdt_fixup_cpu(blob, name);
>  		/* after cpu delete we can't trust the soc offsets anymore */
>  		soc = fdt_path_offset(blob, "/soc");
> -		stm32_fdt_disable(blob, soc, STM32_FDCAN_BASE, "can", name);
> -		/* fall through */
> +		stm32_fdt_disable(blob, soc, STM32MP15_FDCAN_BASE, "can", name);
> +		fallthrough;
>  	case CPU_STM32MP153Fxx:
>  	case CPU_STM32MP153Dxx:
>  	case CPU_STM32MP153Cxx:
>  	case CPU_STM32MP153Axx:
> -		stm32_fdt_disable(blob, soc, STM32_GPU_BASE, "gpu", name);
> -		stm32_fdt_disable(blob, soc, STM32_DSI_BASE, "dsi", name);
> +		stm32_fdt_disable(blob, soc, STM32MP15_GPU_BASE, "gpu", name);
> +		stm32_fdt_disable(blob, soc, STM32MP15_DSI_BASE, "dsi", name);
>  		break;
>  	default:
>  		break;
>  	}
> -
>  	switch (cpu) {
>  	case CPU_STM32MP157Dxx:
>  	case CPU_STM32MP157Axx:
> @@ -304,13 +284,14 @@ int ft_system_setup(void *blob, struct bd_info *bd)
>  	case CPU_STM32MP153Axx:
>  	case CPU_STM32MP151Dxx:
>  	case CPU_STM32MP151Axx:
> -		stm32_fdt_disable(blob, soc, STM32_CRYP1_BASE, "cryp", name);
> -		stm32_fdt_disable(blob, soc, STM32_CRYP2_BASE, "cryp", name);
> +		stm32_fdt_disable(blob, soc, STM32MP15_CRYP1_BASE, "cryp",
> +				  name);
> +		stm32_fdt_disable(blob, soc, STM32MP15_CRYP2_BASE, "cryp",
> +				  name);
>  		break;
>  	default:
>  		break;
>  	}
> -
>  	switch (get_cpu_package()) {
>  	case STM32MP15_PKG_AA_LBGA448:
>  		pkg = STM32MP_PKG_AA;
> @@ -334,18 +315,48 @@ int ft_system_setup(void *blob, struct bd_info *bd)
>  		do_fixup_by_compat_u32(blob, "st,stm32mp157-z-pinctrl",
>  				       "st,package", pkg, false);
>  	}
> +}
> +
> +/*
> + * This function is called right before the kernel is booted. "blob" is the
> + * device tree that will be passed to the kernel.
> + */
> +int ft_system_setup(void *blob, struct bd_info *bd)
> +{
> +	int ret = 0;
> +	int soc;
> +	u32 cpu;
> +	char name[SOC_NAME_SIZE];
> +
> +	soc = fdt_path_offset(blob, "/soc");
> +	if (soc < 0)
> +		return soc;
> +
> +	if (CONFIG_IS_ENABLED(STM32_ETZPC)) {
> +		ret = stm32_fdt_fixup_etzpc(blob, soc);
> +		if (ret)
> +			return ret;
> +	}
>  
> -	/*
> -	 * TEMP: remove OP-TEE nodes in kernel device tree
> -	 *       copied from U-Boot device tree by optee_copy_fdt_nodes
> -	 *       when OP-TEE is not detected (probe failed)
> -	 * these OP-TEE nodes are present in <board>-u-boot.dtsi
> -	 * under CONFIG_STM32MP15x_STM32IMAGE only for compatibility
> -	 * when FIP is not used by TF-A
> -	 */
> -	if (CONFIG_IS_ENABLED(STM32MP15x_STM32IMAGE) &&
> -	    !tee_find_device(NULL, NULL, NULL, NULL))
> -		stm32_fdt_disable_optee(blob);
> +	/* MPUs Part Numbers and name*/
> +	cpu = get_cpu_type();
> +	get_soc_name(name);
> +
> +	if (IS_ENABLED(CONFIG_STM32MP15x)) {
> +		stm32mp15_fdt_fixup(blob, soc, cpu, name);
> +
> +		/*
> +		 * TEMP: remove OP-TEE nodes in kernel device tree
> +		 *       copied from U-Boot device tree by optee_copy_fdt_nodes
> +		 *       when OP-TEE is not detected (probe failed)
> +		 * these OP-TEE nodes are present in <board>-u-boot.dtsi
> +		 * under CONFIG_STM32MP15x_STM32IMAGE only for compatibility
> +		 * when FIP is not used by TF-A
> +		 */
> +		if (CONFIG_IS_ENABLED(STM32MP15x_STM32IMAGE) &&
> +		    !tee_find_device(NULL, NULL, NULL, NULL))
> +			stm32_fdt_disable_optee(blob);
> +	}
>  
>  	return ret;
>  }
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
