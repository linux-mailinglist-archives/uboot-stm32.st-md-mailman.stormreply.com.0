Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5FA1A7761
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 11:32:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CFE2C36B0B
	for <lists+uboot-stm32@lfdr.de>; Tue, 14 Apr 2020 09:32:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E9E98C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2020 09:32:28 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03E9Sske005285; Tue, 14 Apr 2020 11:32:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ahz2tUHbj9Yre8bsA8OoLICkqYYfasJJg9d1l3/SWY4=;
 b=H+kzYb3JDUiJ83BCPcQY+hgTYlcD5cwZMtWnse8EnmH42rAjSz9mCyfp8Ky6O4IrS+0L
 nw669JaFxkNJLOoOOR8lkoA9e8S8OPHhpuLWPEDqas/ld9genEfq8ekazC5bx88Gq7SX
 ieWRibDe7qkkC4V/RMABcBd/DgqwQFNCMDVNBzZt/OslV0UjDnFWoU4zIZ7bnDSEU1L1
 8SYWl1N7vlyZkxoeJMQqKwc9f9hCRzUQdpe8sR7aZoNH8lUaLEcnoHDN+gCFIpEpTbCI
 +H/fJogZBLCMktJNCmy0J1IjaIE4Etd7mBCyu13c5hhCAj2MDQdhXDM0+7mZfOJfmOq7 kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 30b66a4nv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Apr 2020 11:32:27 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7D2F8100038;
 Tue, 14 Apr 2020 11:32:23 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 74FD12AC2F9;
 Tue, 14 Apr 2020 11:32:23 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 14 Apr
 2020 11:32:23 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Tue, 14 Apr 2020 11:32:22 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 07/11] board: stm32mp1: use FDT address provided by TF-A
 at boot time
Thread-Index: AQHV/P5xzUugEsXuVEqgswIpBuZB3Kh4Y64A
Date: Tue, 14 Apr 2020 09:32:22 +0000
Message-ID: <823bb10b-8598-e494-e6f3-4774f57ef1a8@st.com>
References: <20200318082254.7522-1-patrick.delaunay@st.com>
 <20200318092245.7.I918c95d6671221dfaa0bd39f24589baf98bcbd09@changeid>
In-Reply-To: <20200318092245.7.I918c95d6671221dfaa0bd39f24589baf98bcbd09@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <4FD39B56F006EB4E92F6ED192208F0BD@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_02:2020-04-13,
 2020-04-14 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 07/11] board: stm32mp1: use FDT address
 provided by TF-A at boot time
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

Hi

On 3/18/20 9:22 AM, Patrick Delaunay wrote:
> Save and use the FDT address provided by TF-A in r2 at boot time
> (it is NT_FW_CONFIG = Non Trusted Firmware configuration file)
>
> Address is saved in save_boot_params(), called by start.S
> and the used DTB is gd->fdt_blob = board_fdt_blob_setup().
>
> If dtb is not provided or invalid, U-Boot use as fallback
> the builtin DTB.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/Makefile      |  1 +
>  arch/arm/mach-stm32mp/boot_params.c | 45 +++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 arch/arm/mach-stm32mp/boot_params.c
>
> diff --git a/arch/arm/mach-stm32mp/Makefile b/arch/arm/mach-stm32mp/Makefile
> index eee39c27c3..19ca3b08a5 100644
> --- a/arch/arm/mach-stm32mp/Makefile
> +++ b/arch/arm/mach-stm32mp/Makefile
> @@ -13,6 +13,7 @@ else
>  obj-y += bsec.o
>  obj-$(CONFIG_CMD_STM32KEY) += cmd_stm32key.o
>  obj-$(CONFIG_ARMV7_PSCI) += psci.o
> +obj-$(CONFIG_STM32MP1_TRUSTED) += boot_params.o
>  endif
>  
>  obj-$(CONFIG_$(SPL_)DM_REGULATOR) += pwr_regulator.o
> diff --git a/arch/arm/mach-stm32mp/boot_params.c b/arch/arm/mach-stm32mp/boot_params.c
> new file mode 100644
> index 0000000000..e4351de939
> --- /dev/null
> +++ b/arch/arm/mach-stm32mp/boot_params.c
> @@ -0,0 +1,45 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
> +/*
> + * Copyright (C) 2019, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <common.h>
> +#include <asm/sections.h>
> +#include <asm/system.h>
> +
> +/*
> + * Force data-section, as .bss will not be valid
> + * when save_boot_params is invoked.
> + */
> +static unsigned long nt_fw_dtb __section(".data");
> +
> +/*
> + * Save the FDT address provided by TF-A in r2 at boot time
> + * This function is called from start.S
> + */
> +void save_boot_params(unsigned long r0, unsigned long r1, unsigned long r2,
> +		      unsigned long r3)
> +{
> +	nt_fw_dtb = r2;
> +
> +	save_boot_params_ret();
> +}
> +
> +/*
> + * Use the saved FDT address provided by TF-A at boot time (NT_FW_CONFIG =
> + * Non Trusted Firmware configuration file) when the pointer is valid
> + */
> +void *board_fdt_blob_setup(void)
> +{
> +	debug("%s: nt_fw_dtb=%lx\n", __func__, nt_fw_dtb);
> +
> +	/* use external device tree only if address is valid */
> +	if (nt_fw_dtb >= STM32_DDR_BASE) {
> +		if (fdt_magic(nt_fw_dtb) == FDT_MAGIC)
> +			return (void *)nt_fw_dtb;
> +		debug("%s: DTB not found.\n", __func__);
> +	}
> +	debug("%s: fall back to builtin DTB, %p\n", __func__, &_end);
> +
> +	return (void *)&_end;
> +}

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
