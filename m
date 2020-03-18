Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B864189911
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 11:17:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB80EC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:17:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B4A7C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 10:17:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IA8ZIC030104; Wed, 18 Mar 2020 11:17:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=pYvN8QKc0CdQbBvT93Wr6HzsMRiiGdJfaj/AYlerm2o=;
 b=uRlrpSfxO8C3XhnG8VwOdIqKAgjm/lbTUIk2GBU13uVV2FOsHeZyRNevw6kGGOyB2AEZ
 W2smxuVSOYEmhAQM3Hv1NijP95Dseux0PGf/CB46ZkJiREBpvAmW+c+QiLMLJxRfYV0B
 fVT1EthGJrb22f2nDq1XWO8iDA5GirZLe3yjPgE8s1DJqB++AhK7V6AFvxfNjMKUIzta
 /Z9qD15+YYLlh8EgKvEV+uq2K+IIWtTdv2Gc7QGXN116NF+A3DKQs/7AxdNDA0/lRzkB
 311ONLMtfHy4hBlXYoaK//PjEmNg3RSYdh7k7RYKufxsDz/ZQjaCVECX194kczIgZKU2 2g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu95ujrwk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 11:17:03 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2B93F100034;
 Wed, 18 Mar 2020 11:17:00 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EB26F221012;
 Wed, 18 Mar 2020 11:16:59 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 18 Mar
 2020 11:16:59 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 11:16:59 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 10/10] arm: stm32mp: fdt: update kernel device tree
 according the part number
Thread-Index: AQHV4dOLYerSOfyC306Z4umxxkYTnKhOSE2A
Date: Wed, 18 Mar 2020 10:16:59 +0000
Message-ID: <6ac96b7f-7efc-4d56-9bfa-e65dd3e02b3e@st.com>
References: <20200212183744.5309-1-patrick.delaunay@st.com>
 <20200212183744.5309-11-patrick.delaunay@st.com>
In-Reply-To: <20200212183744.5309-11-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <A31D07C64AC6B04DAB0CCF0ECB4A5B2B@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-18,
 2020-03-18 signatures=0
Cc: U-Boot
 STM32 <uboot-stm32@st-md-mailman.stormreply.com>, Tom Rini <trini@konsulko.com>,
 Simon Glass <sjg@chromium.org>
Subject: Re: [Uboot-stm32] [PATCH 10/10] arm: stm32mp: fdt: update kernel
 device tree according the part number
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


On 2/12/20 7:37 PM, Patrick Delaunay wrote:
> Update the kernel device tree for STM32MP15x product lines according
> the used soc and its part number, when CONFIG_OF_SYSTEM_SETUP is activated:
> - STM32MP15XA hasn't Crypto (cryp1/2)
> - STM32M151 and STM32M153 hasn't 3D GPU and DSI host
> - STM32M151 hasn't CAN FD and has single A7
>
> For example:
>
> FDT: cpu 1 node remove for STM32MP151AAA Rev.B
> FDT: can@4400e000 node disabled for STM32MP151AAA Rev.B
> FDT: gpu@59000000 node disabled for STM32MP151AAA Rev.B
> FDT: dsi@5a000000 node disabled for STM32MP151AAA Rev.B
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  arch/arm/mach-stm32mp/fdt.c | 100 +++++++++++++++++++++++++++++++-----
>  1 file changed, 88 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm/mach-stm32mp/fdt.c b/arch/arm/mach-stm32mp/fdt.c
> index 82c430b7c7..a3db86dc46 100644
> --- a/arch/arm/mach-stm32mp/fdt.c
> +++ b/arch/arm/mach-stm32mp/fdt.c
> @@ -23,6 +23,12 @@
>  
>  #define ETZPC_RESERVED		0xffffffff
>  
> +#define STM32_FDCAN_BASE	0x4400e000
> +#define STM32_CRYP2_BASE	0x4c005000
> +#define STM32_CRYP1_BASE	0x54001000
> +#define STM32_GPU_BASE		0x59000000
> +#define STM32_DSI_BASE		0x5a000000
> +
>  static const u32 stm32mp1_ip_addr[] = {
>  	0x5c008000,	/* 00 stgenc */
>  	0x54000000,	/* 01 bkpsram */
> @@ -33,7 +39,7 @@ static const u32 stm32mp1_ip_addr[] = {
>  	ETZPC_RESERVED,	/* 06 reserved */
>  	0x54003000,	/* 07 rng1 */
>  	0x54002000,	/* 08 hash1 */
> -	0x54001000,	/* 09 cryp1 */
> +	STM32_CRYP1_BASE,	/* 09 cryp1 */
>  	0x5a003000,	/* 0A ddrctrl */
>  	0x5a004000,	/* 0B ddrphyc */
>  	0x5c009000,	/* 0C i2c6 */
> @@ -86,7 +92,7 @@ static const u32 stm32mp1_ip_addr[] = {
>  	0x4400b000,	/* 3B sai2 */
>  	0x4400c000,	/* 3C sai3 */
>  	0x4400d000,	/* 3D dfsdm */
> -	0x4400e000,	/* 3E tt_fdcan */
> +	STM32_FDCAN_BASE,	/* 3E tt_fdcan */
>  	ETZPC_RESERVED,	/* 3F reserved */
>  	0x50021000,	/* 40 lptim2 */
>  	0x50022000,	/* 41 lptim3 */
> @@ -99,7 +105,7 @@ static const u32 stm32mp1_ip_addr[] = {
>  	0x48003000,	/* 48 adc */
>  	0x4c002000,	/* 49 hash2 */
>  	0x4c003000,	/* 4A rng2 */
> -	0x4c005000,	/* 4B cryp2 */
> +	STM32_CRYP2_BASE,	/* 4B cryp2 */
>  	ETZPC_RESERVED,	/* 4C reserved */
>  	ETZPC_RESERVED,	/* 4D reserved */
>  	ETZPC_RESERVED,	/* 4E reserved */
> @@ -126,11 +132,13 @@ static const u32 stm32mp1_ip_addr[] = {
>  static bool fdt_disable_subnode_by_address(void *fdt, int offset, u32 addr)
>  {
>  	int node;
> +	fdt_addr_t regs;
>  
>  	for (node = fdt_first_subnode(fdt, offset);
>  	     node >= 0;
>  	     node = fdt_next_subnode(fdt, node)) {
> -		if (addr == (u32)fdt_getprop(fdt, node, "reg", 0)) {
> +		regs = fdtdec_get_addr(fdt, node, "reg");
> +		if (addr == regs) {
>  			if (fdtdec_get_is_enabled(fdt, node)) {
>  				fdt_status_disabled(fdt, node);
>  
> @@ -143,11 +151,11 @@ static bool fdt_disable_subnode_by_address(void *fdt, int offset, u32 addr)
>  	return false;
>  }
>  
> -static int stm32_fdt_fixup_etzpc(void *fdt)
> +static int stm32_fdt_fixup_etzpc(void *fdt, int soc_node)
>  {
>  	const u32 *array;
>  	int array_size, i;
> -	int soc_node, offset, shift;
> +	int offset, shift;
>  	u32 addr, status, decprot[ETZPC_DECPROT_NB];
>  
>  	array = stm32mp1_ip_addr;
> @@ -156,10 +164,6 @@ static int stm32_fdt_fixup_etzpc(void *fdt)
>  	for (i = 0; i < ETZPC_DECPROT_NB; i++)
>  		decprot[i] = readl(ETZPC_DECPROT(i));
>  
> -	soc_node = fdt_path_offset(fdt, "/soc");
> -	if (soc_node < 0)
> -		return soc_node;
> -
>  	for (i = 0; i < array_size; i++) {
>  		offset = i / NB_PROT_PER_REG;
>  		shift = (i % NB_PROT_PER_REG) * DECPROT_NB_BITS;
> @@ -180,6 +184,40 @@ static int stm32_fdt_fixup_etzpc(void *fdt)
>  	return 0;
>  }
>  
> +/* deactivate all the cpu except core 0 */
> +static void stm32_fdt_fixup_cpu(void *blob, char *name)
> +{
> +	int off;
> +	u32 reg;
> +
> +	off = fdt_path_offset(blob, "/cpus");
> +	if (off < 0) {
> +		printf("%s: couldn't find /cpus node\n", __func__);
> +		return;
> +	}
> +
> +	off = fdt_node_offset_by_prop_value(blob, -1, "device_type", "cpu", 4);
> +	while (off != -FDT_ERR_NOTFOUND) {
> +		reg = fdtdec_get_addr(blob, off, "reg");
> +		if (reg != 0) {
> +			fdt_del_node(blob, off);
> +			printf("FDT: cpu %d node remove for %s\n", reg, name);
> +			/* after delete we can't trust the offsets anymore */
> +			off = -1;
> +		}
> +		off = fdt_node_offset_by_prop_value(blob, off,
> +						    "device_type", "cpu", 4);
> +	}
> +}
> +
> +static void stm32_fdt_disable(void *fdt, int offset, u32 addr,
> +			      const char *string, const char *name)
> +{
> +	if (fdt_disable_subnode_by_address(fdt, offset, addr))
> +		printf("FDT: %s@%08x node disabled for %s\n",
> +		       string, addr, name);
> +}
> +
>  /*
>   * This function is called right before the kernel is booted. "blob" is the
>   * device tree that will be passed to the kernel.
> @@ -187,14 +225,52 @@ static int stm32_fdt_fixup_etzpc(void *fdt)
>  int ft_system_setup(void *blob, bd_t *bd)
>  {
>  	int ret = 0;
> -	u32 pkg;
> +	int soc;
> +	u32 pkg, cpu;
> +	char name[SOC_NAME_SIZE];
> +
> +	soc = fdt_path_offset(blob, "/soc");
> +	if (soc < 0)
> +		return soc;
>  
>  	if (CONFIG_IS_ENABLED(STM32_ETZPC)) {
> -		ret = stm32_fdt_fixup_etzpc(blob);
> +		ret = stm32_fdt_fixup_etzpc(blob, soc);
>  		if (ret)
>  			return ret;
>  	}
>  
> +	/* MPUs Part Numbers and name*/
> +	cpu = get_cpu_type();
> +	get_soc_name(name);
> +
> +	switch (cpu) {
> +	case CPU_STM32MP151Cxx:
> +	case CPU_STM32MP151Axx:
> +		stm32_fdt_fixup_cpu(blob, name);
> +		/* after cpu delete we can't trust the soc offsets anymore */
> +		soc = fdt_path_offset(blob, "/soc");
> +		stm32_fdt_disable(blob, soc, STM32_FDCAN_BASE, "can", name);
> +		/* fall through */
> +	case CPU_STM32MP153Cxx:
> +	case CPU_STM32MP153Axx:
> +		stm32_fdt_disable(blob, soc, STM32_GPU_BASE, "gpu", name);
> +		stm32_fdt_disable(blob, soc, STM32_DSI_BASE, "dsi", name);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	switch (cpu) {
> +	case CPU_STM32MP157Axx:
> +	case CPU_STM32MP153Axx:
> +	case CPU_STM32MP151Axx:
> +		stm32_fdt_disable(blob, soc, STM32_CRYP1_BASE, "cryp", name);
> +		stm32_fdt_disable(blob, soc, STM32_CRYP2_BASE, "cryp", name);
> +		break;
> +	default:
> +		break;
> +	}
> +
>  	switch (get_cpu_package()) {
>  	case PKG_AA_LBGA448:
>  		pkg = STM32MP_PKG_AA;

Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
