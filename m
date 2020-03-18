Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942FC1898BB
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 11:00:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60B48C36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:00:39 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 010FEC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 10:00:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9x6jp028970; Wed, 18 Mar 2020 11:00:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=DC2jzi/s9xxT7xv3/qNdgUCa0HgpTCiyePgae5ckJqI=;
 b=zJ7mos1oUdCuYUpgW+4OlJlpaDBXZmF3FsvzxOZOWTgamWpFuqZaV6uhaTMiYp8DhC2l
 U220/+q1xZnP0fMAKfqpnh5gvbbmBw/H0wDxt0zR77NQd/f/z0bpumuIAV4/5rBowiU5
 HpzuiJvkwHIyZjZhjiz3ScjPOl7w+36WEhdHDL7DPCA+q120+csdZNq6JD/8k/2787qS
 gs+HrImmLPOe4OP4QwDxtg4YKE8gVQU0arzJXGDBYLBPokmBwOm/CxpXfl1gapv93x1E
 UmGVTK4peTNBm5EfrNJ4pAEVva+pC8Dbs45s0E37QeAdo5O71dKdQjGS0S71ebTlSfj4 Gw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yua4wack0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:00:37 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66DC710002A;
 Wed, 18 Mar 2020 11:00:33 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5A67521F67C;
 Wed, 18 Mar 2020 11:00:33 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 11:00:32 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 11:00:32 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH] stm32mp1: add 800 MHz profile support
Thread-Index: AQHV7I9JSBshfTyXfU2uY1TEVA1o96hOLj0A
Date: Wed, 18 Mar 2020 10:00:32 +0000
Message-ID: <1febf557-e4a4-a440-0d1c-84cd2bc8f27b@st.com>
References: <20200226102643.11273-1-patrick.delaunay@st.com>
In-Reply-To: <20200226102643.11273-1-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <2620174663B3F04B8B6E89F8E0970310@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
Cc: Marek Vasut <marex@denx.de>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH] stm32mp1: add 800 MHz profile support
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


On 2/26/20 11:26 AM, Patrick Delaunay wrote:
> The STM32MP1 series is available in 3 different lines which are pin-to-pin
> compatible:
> - STM32MP157: Dual Cortex-A7 cores, Cortex-M4 core @ 209 MHz,
>               3D GPU, DSI display interface and CAN FD
> - STM32MP153: Dual Cortex-A7 cores, Cortex-M4 core @ 209 MHz
>               and CAN FD
> - STM32MP151: Single Cortex-A7 core, Cortex-M4 core @ 209 MHz
>
> Each line comes with a security option (cryptography & secure boot)
> & a Cortex-A frequency option :
>
> - A : Cortex-A7 @ 650 MHz
> - C : Secure Boot + HW Crypto + Cortex-A7 @ 650 MHz
> - D : Cortex-A7 @ 800 MHz
> - F : Secure Boot + HW Crypto + Cortex-A7 @ 800 MHz
>
> This patch adds the support of STM32MP15xD and STM32MP15xF in U-Boot.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/cpu.c                    | 18 ++++++++++++++++++
>  arch/arm/mach-stm32mp/fdt.c                    |  7 +++++++
>  arch/arm/mach-stm32mp/include/mach/sys_proto.h |  8 +++++++-
>  doc/board/st/stm32mp1.rst                      |  8 ++++++++
>  4 files changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
> index 9c5e0448ce..9aa5794334 100644
> --- a/arch/arm/mach-stm32mp/cpu.c
> +++ b/arch/arm/mach-stm32mp/cpu.c
> @@ -285,18 +285,36 @@ void get_soc_name(char name[SOC_NAME_SIZE])
>  
>  	/* MPUs Part Numbers */
>  	switch (get_cpu_type()) {
> +	case CPU_STM32MP157Fxx:
> +		cpu_s = "157F";
> +		break;
> +	case CPU_STM32MP157Dxx:
> +		cpu_s = "157D";
> +		break;
>  	case CPU_STM32MP157Cxx:
>  		cpu_s = "157C";
>  		break;
>  	case CPU_STM32MP157Axx:
>  		cpu_s = "157A";
>  		break;
> +	case CPU_STM32MP153Fxx:
> +		cpu_s = "153F";
> +		break;
> +	case CPU_STM32MP153Dxx:
> +		cpu_s = "153D";
> +		break;
>  	case CPU_STM32MP153Cxx:
>  		cpu_s = "153C";
>  		break;
>  	case CPU_STM32MP153Axx:
>  		cpu_s = "153A";
>  		break;
> +	case CPU_STM32MP151Fxx:
> +		cpu_s = "151F";
> +		break;
> +	case CPU_STM32MP151Dxx:
> +		cpu_s = "151D";
> +		break;
>  	case CPU_STM32MP151Cxx:
>  		cpu_s = "151C";
>  		break;
> diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
> index a3db86dc46..3ee7d6a833 100644
> --- a/arch/arm/mach-stm32mp/fdt.c
> +++ b/arch/arm/mach-stm32mp/fdt.c
> @@ -244,6 +244,8 @@ int ft_system_setup(void *blob, bd_t *bd)
>  	get_soc_name(name);
>  
>  	switch (cpu) {
> +	case CPU_STM32MP151Fxx:
> +	case CPU_STM32MP151Dxx:
>  	case CPU_STM32MP151Cxx:
>  	case CPU_STM32MP151Axx:
>  		stm32_fdt_fixup_cpu(blob, name);
> @@ -251,6 +253,8 @@ int ft_system_setup(void *blob, bd_t *bd)
>  		soc = fdt_path_offset(blob, "/soc");
>  		stm32_fdt_disable(blob, soc, STM32_FDCAN_BASE, "can", name);
>  		/* fall through */
> +	case CPU_STM32MP153Fxx:
> +	case CPU_STM32MP153Dxx:
>  	case CPU_STM32MP153Cxx:
>  	case CPU_STM32MP153Axx:
>  		stm32_fdt_disable(blob, soc, STM32_GPU_BASE, "gpu", name);
> @@ -261,8 +265,11 @@ int ft_system_setup(void *blob, bd_t *bd)
>  	}
>  
>  	switch (cpu) {
> +	case CPU_STM32MP157Dxx:
>  	case CPU_STM32MP157Axx:
> +	case CPU_STM32MP153Dxx:
>  	case CPU_STM32MP153Axx:
> +	case CPU_STM32MP151Dxx:
>  	case CPU_STM32MP151Axx:
>  		stm32_fdt_disable(blob, soc, STM32_CRYP1_BASE, "cryp", name);
>  		stm32_fdt_disable(blob, soc, STM32_CRYP2_BASE, "cryp", name);
> diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> index 065b7b2856..1617126bea 100644
> --- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> +++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
> @@ -3,13 +3,19 @@
>   * Copyright (C) 2015-2017, STMicroelectronics - All Rights Reserved
>   */
>  
> -/* ID = Device Version (bit31:16) + Device Part Number (RPN) (bit15:0)*/
> +/* ID = Device Version (bit31:16) + Device Part Number (RPN) (bit7:0) */
>  #define CPU_STM32MP157Cxx	0x05000000
>  #define CPU_STM32MP157Axx	0x05000001
>  #define CPU_STM32MP153Cxx	0x05000024
>  #define CPU_STM32MP153Axx	0x05000025
>  #define CPU_STM32MP151Cxx	0x0500002E
>  #define CPU_STM32MP151Axx	0x0500002F
> +#define CPU_STM32MP157Fxx	0x05000080
> +#define CPU_STM32MP157Dxx	0x05000081
> +#define CPU_STM32MP153Fxx	0x050000A4
> +#define CPU_STM32MP153Dxx	0x050000A5
> +#define CPU_STM32MP151Fxx	0x050000AE
> +#define CPU_STM32MP151Dxx	0x050000AF
>  
>  /* return CPU_STMP32MP...Xxx constants */
>  u32 get_cpu_type(void);
> diff --git a/doc/board/st/stm32mp1.rst b/doc/board/st/stm32mp1.rst
> index ee42af6579..b7a0fbfd03 100644
> --- a/doc/board/st/stm32mp1.rst
> +++ b/doc/board/st/stm32mp1.rst
> @@ -25,6 +25,14 @@ It features:
>   - Standard connectivity, widely inherited from the STM32 MCU family
>   - Comprehensive security support
>  
> +Each line comes with a security option (cryptography & secure boot) and
> +a Cortex-A frequency option:
> +
> + - A : Cortex-A7 @ 650 MHz
> + - C : Secure Boot + HW Crypto + Cortex-A7 @ 650 MHz
> + - D : Cortex-A7 @ 800 MHz
> + - F : Secure Boot + HW Crypto + Cortex-A7 @ 800 MHz
> +
>  Everything is supported in Linux but U-Boot is limited to:
>  
>   1. UART

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
