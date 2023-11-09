Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4919A7E64A3
	for <lists+uboot-stm32@lfdr.de>; Thu,  9 Nov 2023 08:48:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E46C2C6B479;
	Thu,  9 Nov 2023 07:48:02 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8E81C6A61D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Nov 2023 07:48:01 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3A96ff0W015720; Thu, 9 Nov 2023 08:48:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=VNR1oaBI1o+A90Rl04W20YNUUZjDH0Gz9H+zDoumGOA=; b=oX
 0m9MfFY0LFJHXDeig9kESYOglE9hIEDhJ48pfzTYZxmdSWv0rxMOp9Ef9QAM7aAD
 /NwuZD1anavQBkhsXSMAfZWV1+wAHaQxJmv11YlA99scXnwuaIg8Hh1gaTqjwevO
 /ZWOYj5b3+47sP6hxG3dvMmsMkwrYXuuwb5KHZbD4vIc9+4iILtw9/k7qeS0KWUu
 LePG2/K/1hi757GSt5nwUI0XKeS8k6GN68stRfrsSGO98g861U2Yl/8Im802/tcn
 cPQlxaR9c0JLO+9Xj4gs65OZf3peZp2cvnI0zAEb2mUKPSbUmKLOs8dvx7b3+ZA/
 KDGyRA40wkKaWrXL8T4Q==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3u7w22f40k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Nov 2023 08:48:00 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7CC9D10005A;
 Thu,  9 Nov 2023 08:47:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7521F2115E3;
 Thu,  9 Nov 2023 08:47:59 +0100 (CET)
Received: from [10.201.20.54] (10.201.20.54) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 9 Nov
 2023 08:47:58 +0100
Message-ID: <9df74274-1121-4f91-8662-d5297ccc54a0@foss.st.com>
Date: Thu, 9 Nov 2023 08:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Igor Opaniuk <igor.opaniuk@foundries.io>, <u-boot@lists.denx.de>,
 <uboot-stm32@st-md-mailman.stormreply.com>
References: <20231106104152.140495-1-igor.opaniuk@foundries.io>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20231106104152.140495-1-igor.opaniuk@foundries.io>
X-Originating-IP: [10.201.20.54]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-09_06,2023-11-08_01,2023-05-22_02
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Marek Vasut <marex@denx.de>
Subject: Re: [Uboot-stm32] [PATCH v1] stm32mp1: read auth stats and
	boot_partition from tamp
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



On 11/6/23 11:41, Igor Opaniuk wrote:
> Obtain from TAMP backup register information about image authorization
> status and partition id used for booting. Store this info in
> environmental variables ("boot_auth" and "boot_part" correspondingly).
> 
> Image authorization supported values:
> 0x0 - No authentication done
> 0x1 - Authentication done and failed
> 0x2 - Authentication done and succeeded
> 
> These values are stored to TAMP backup register by Trusted Firmware-A [1].
> 
> Testing:
> STM32MP> print boot_part
> boot_part=1
> STM32MP> print boot_auth
> boot_auth=2
> 
> [1] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?h=refs/heads/integration&id=ab2b325c1ab895e626d4e11a9f26b9e7c968f8d8
> 
> Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
> Co-developed-by: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
> Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
> 
> ---
> 
>  arch/arm/mach-stm32mp/cpu.c                   | 23 +++++++++++++++++++
>  arch/arm/mach-stm32mp/include/mach/stm32.h    |  4 ++++
>  .../arm/mach-stm32mp/include/mach/sys_proto.h |  3 +++
>  3 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index e07abbe21c1..ba5942848bd 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -40,6 +40,13 @@ u32 get_bootmode(void)
>  		    TAMP_BOOT_MODE_SHIFT;
>  }
>  
> +u32 get_bootauth(void)
> +{
> +	/* read boot auth status and partition from TAMP backup register */
> +	return (readl(TAMP_BOOT_CONTEXT) & TAMP_BOOT_AUTH_MASK) >>
> +		    TAMP_BOOT_AUTH_SHIFT;
> +}
> +
>  /*
>   * weak function overidde: set the DDR/SYSRAM executable before to enable the
>   * MMU and configure DACR, for early early_enable_caches (SPL or pre-reloc)
> @@ -371,8 +378,24 @@ __weak void stm32mp_misc_init(void)
>  {
>  }
>  
> +static int setup_boot_auth_info(void)
> +{
> +	char buf[10];
> +	u32 bootauth = get_bootauth();
> +
> +	snprintf(buf, sizeof(buf), "%d", bootauth >> 4);
> +	env_set("boot_auth", buf);
> +
> +	snprintf(buf, sizeof(buf), "%d", bootauth &
> +		 (u32)TAMP_BOOT_PARTITION_MASK);
> +	env_set("boot_part", buf);
> +
> +	return 0;
> +}
> +
>  int arch_misc_init(void)
>  {
> +	setup_boot_auth_info();
>  	setup_boot_mode();
>  	setup_mac_address();
>  	setup_serial_number();
> diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
> index 1cdc5e3b186..ac0deced67e 100644
> --- a/arch/arm/mach-stm32mp/include/mach/stm32.h
> +++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
> @@ -139,8 +139,12 @@ enum boot_device {
>  
>  #define TAMP_BOOT_MODE_MASK		GENMASK(15, 8)
>  #define TAMP_BOOT_MODE_SHIFT		8
> +#define TAMP_BOOT_AUTH_MASK		GENMASK(23, 16)
> +#define TAMP_BOOT_AUTH_SHIFT		16
>  #define TAMP_BOOT_DEVICE_MASK		GENMASK(7, 4)
>  #define TAMP_BOOT_INSTANCE_MASK		GENMASK(3, 0)
> +#define TAMP_BOOT_AUTH_ST_MASK		GENMASK(7, 4)
> +#define TAMP_BOOT_PARTITION_MASK	GENMASK(3, 0)
>  #define TAMP_BOOT_FORCED_MASK		GENMASK(7, 0)
>  
>  enum forced_boot_mode {
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 83fb32a45fc..52aca1e23e1 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -66,6 +66,9 @@ void get_soc_name(char name[SOC_NAME_SIZE]);
>  /* return boot mode */
>  u32 get_bootmode(void);
>  
> +/* return auth status and partition */
> +u32 get_bootauth(void);
> +
>  int get_eth_nb(void);
>  int setup_mac_address(void);
>  

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
