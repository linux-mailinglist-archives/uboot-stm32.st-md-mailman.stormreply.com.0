Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DC48AAE3B
	for <lists+uboot-stm32@lfdr.de>; Fri, 19 Apr 2024 14:14:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C4474C6DD9A;
	Fri, 19 Apr 2024 12:14:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE84FC6DD72
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Apr 2024 12:14:05 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43J8Eeqn031243; Fri, 19 Apr 2024 14:13:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=6hehqVnB/3Q3PTRPFQxs1lwsqIZJP0QveetDNB1Zrx8=; b=0j
 yCm5EiYTtMCdDmtXy7F2i3ZUQ/6t09IJ/qMEkvZ4mPRZVwFdpL5F3W98b34khmkE
 dcazECFyQb9LkkB9rYwjvyeZMJ6bx7Ow+LgLQdKn/uzIrqiM5O6OjS5MCzz+QcWg
 CxG3QM5A2QOxfIeshBXWRauM6LXMzOMzhPq5XOLl+o2LJbj3ZWdcOiivbeXQO3oL
 tWZfE0O6xsqstpGwZUva5ICgQDen/NRWGjqH54nqrvxQZxmxeJ1ZDxzBPvwNKDR9
 IYVVZVP0NCjJ+Df5Drj+x+Slt1LS9ibxKB0XTjjkLBPbGkMW6NHwS7cymmuI0edE
 QCqwIYownUfXsNCUGT/w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xfhcx43s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Apr 2024 14:13:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id BC9D64002D;
 Fri, 19 Apr 2024 14:13:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CB7B12194EE;
 Fri, 19 Apr 2024 14:13:20 +0200 (CEST)
Received: from [10.252.13.94] (10.252.13.94) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 19 Apr
 2024 14:13:20 +0200
Message-ID: <38549bfd-80f7-4618-a28f-32b8f2f19cb9@foss.st.com>
Date: Fri, 19 Apr 2024 14:13:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>, <u-boot@lists.denx.de>
References: <20240306095048.314546-1-christophe.kerello@foss.st.com>
 <20240306095048.314546-2-christophe.kerello@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240306095048.314546-2-christophe.kerello@foss.st.com>
X-Originating-IP: [10.252.13.94]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_08,2024-04-19_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Prusov <ivprusov@salutedevices.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] memory: stm32-fmc2-ebi: add MP25
	support
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



On 3/6/24 10:50, Christophe Kerello wrote:
> Add the support of the revision 2 of FMC2 IP.
>      - PCSCNTR register has been removed,
>      - CFGR register has been added,
>      - the bit used to enable the IP has moved from BCR1 to CFGR,
>      - the timeout for CEx deassertion has moved from PCSCNTR to BCRx,
>      - the continuous clock enable has moved from BCR1 to CFGR,
>      - the clk divide ratio has moved from BCR1 to CFGR.
> 
> The MP1 SoCs have only one signal to manage all the controllers (NWAIT).
> The MP25 SOC has one RNB signal for the NAND controller and one NWAIT
> signal for the memory controller.
> 
> Let's use a platform data structure for parameters that will differ
> between MP1 and MP25.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> 
> ---
> 
>  drivers/memory/stm32-fmc2-ebi.c | 313 ++++++++++++++++++++++++++++++--
>  1 file changed, 301 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
> index a722a3836f7..c7db16463e8 100644
> --- a/drivers/memory/stm32-fmc2-ebi.c
> +++ b/drivers/memory/stm32-fmc2-ebi.c
> @@ -22,6 +22,7 @@
>  #define FMC2_BCR(x)			((x) * 0x8 + FMC2_BCR1)
>  #define FMC2_BTR(x)			((x) * 0x8 + FMC2_BTR1)
>  #define FMC2_PCSCNTR			0x20
> +#define FMC2_CFGR			0x20
>  #define FMC2_BWTR1			0x104
>  #define FMC2_BWTR(x)			((x) * 0x8 + FMC2_BWTR1)
>  
> @@ -44,6 +45,7 @@
>  #define FMC2_BCR_ASYNCWAIT		BIT(15)
>  #define FMC2_BCR_CPSIZE			GENMASK(18, 16)
>  #define FMC2_BCR_CBURSTRW		BIT(19)
> +#define FMC2_BCR_CSCOUNT		GENMASK(21, 20)
>  #define FMC2_BCR_NBLSET			GENMASK(23, 22)
>  
>  /* Register: FMC2_BTRx/FMC2_BWTRx */
> @@ -60,6 +62,11 @@
>  #define FMC2_PCSCNTR_CSCOUNT		GENMASK(15, 0)
>  #define FMC2_PCSCNTR_CNTBEN(x)		BIT((x) + 16)
>  
> +/* Register: FMC2_CFGR */
> +#define FMC2_CFGR_CLKDIV		GENMASK(19, 16)
> +#define FMC2_CFGR_CCLKEN		BIT(20)
> +#define FMC2_CFGR_FMC2EN		BIT(31)
> +
>  #define FMC2_MAX_EBI_CE			4
>  #define FMC2_MAX_BANKS			5
>  
> @@ -76,6 +83,11 @@
>  #define FMC2_BCR_MTYP_PSRAM		0x1
>  #define FMC2_BCR_MTYP_NOR		0x2
>  
> +#define FMC2_BCR_CSCOUNT_0		0x0
> +#define FMC2_BCR_CSCOUNT_1		0x1
> +#define FMC2_BCR_CSCOUNT_64		0x2
> +#define FMC2_BCR_CSCOUNT_256		0x3
> +
>  #define FMC2_BXTR_EXTMOD_A		0x0
>  #define FMC2_BXTR_EXTMOD_B		0x1
>  #define FMC2_BXTR_EXTMOD_C		0x2
> @@ -90,6 +102,7 @@
>  #define FMC2_BTR_CLKDIV_MAX		0xf
>  #define FMC2_BTR_DATLAT_MAX		0xf
>  #define FMC2_PCSCNTR_CSCOUNT_MAX	0xff
> +#define FMC2_CFGR_CLKDIV_MAX		0xf
>  
>  enum stm32_fmc2_ebi_bank {
>  	FMC2_EBI1 = 0,
> @@ -103,7 +116,8 @@ enum stm32_fmc2_ebi_register_type {
>  	FMC2_REG_BCR = 1,
>  	FMC2_REG_BTR,
>  	FMC2_REG_BWTR,
> -	FMC2_REG_PCSCNTR
> +	FMC2_REG_PCSCNTR,
> +	FMC2_REG_CFGR
>  };
>  
>  enum stm32_fmc2_ebi_transaction_type {
> @@ -134,9 +148,27 @@ enum stm32_fmc2_ebi_cpsize {
>  	FMC2_CPSIZE_1024 = 1024
>  };
>  
> +enum stm32_fmc2_ebi_cscount {
> +	FMC2_CSCOUNT_0 = 0,
> +	FMC2_CSCOUNT_1 = 1,
> +	FMC2_CSCOUNT_64 = 64,
> +	FMC2_CSCOUNT_256 = 256
> +};
> +
> +struct stm32_fmc2_ebi;
> +
> +struct stm32_fmc2_ebi_data {
> +	const struct stm32_fmc2_prop *child_props;
> +	unsigned int nb_child_props;
> +	u32 fmc2_enable_reg;
> +	u32 fmc2_enable_bit;
> +	int (*nwait_used_by_ctrls)(struct stm32_fmc2_ebi *ebi);
> +};
> +
>  struct stm32_fmc2_ebi {
>  	struct clk clk;
>  	fdt_addr_t io_base;
> +	const struct stm32_fmc2_ebi_data *data;
>  	u8 bank_assigned;
>  };
>  
> @@ -296,6 +328,24 @@ static u32 stm32_fmc2_ebi_ns_to_clk_period(struct stm32_fmc2_ebi *ebi,
>  	return DIV_ROUND_UP(nb_clk_cycles, clk_period);
>  }
>  
> +static u32 stm32_fmc2_ebi_mp25_ns_to_clk_period(struct stm32_fmc2_ebi *ebi,
> +						int cs, u32 setup)
> +{
> +	u32 nb_clk_cycles = stm32_fmc2_ebi_ns_to_clock_cycles(ebi, cs, setup);
> +	u32 cfgr = readl(ebi->io_base + FMC2_CFGR);
> +	u32 clk_period;
> +
> +	if (cfgr & FMC2_CFGR_CCLKEN) {
> +		clk_period = FIELD_GET(FMC2_CFGR_CLKDIV, cfgr) + 1;
> +	} else {
> +		u32 btr = readl(ebi->io_base + FMC2_BTR(cs));
> +
> +		clk_period = FIELD_GET(FMC2_BTR_CLKDIV, btr) + 1;
> +	}
> +
> +	return DIV_ROUND_UP(nb_clk_cycles, clk_period);
> +}
> +
>  static int stm32_fmc2_ebi_get_reg(int reg_type, int cs, u32 *reg)
>  {
>  	switch (reg_type) {
> @@ -311,6 +361,9 @@ static int stm32_fmc2_ebi_get_reg(int reg_type, int cs, u32 *reg)
>  	case FMC2_REG_PCSCNTR:
>  		*reg = FMC2_PCSCNTR;
>  		break;
> +	case FMC2_REG_CFGR:
> +		*reg = FMC2_CFGR;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -649,6 +702,26 @@ static int stm32_fmc2_ebi_set_clk_period(struct stm32_fmc2_ebi *ebi,
>  	return 0;
>  }
>  
> +static int stm32_fmc2_ebi_mp25_set_clk_period(struct stm32_fmc2_ebi *ebi,
> +					      const struct stm32_fmc2_prop *prop,
> +					      int cs, u32 setup)
> +{
> +	u32 cfgr = readl(ebi->io_base + FMC2_CFGR);
> +	u32 val;
> +
> +	if (cfgr & FMC2_CFGR_CCLKEN) {
> +		val = setup ? clamp_val(setup - 1, 1, FMC2_CFGR_CLKDIV_MAX) : 1;
> +		val = FIELD_PREP(FMC2_CFGR_CLKDIV, val);
> +		clrsetbits_le32(ebi->io_base + FMC2_CFGR, FMC2_CFGR_CLKDIV, val);
> +	} else {
> +		val = setup ? clamp_val(setup - 1, 1, FMC2_BTR_CLKDIV_MAX) : 1;
> +		val = FIELD_PREP(FMC2_BTR_CLKDIV, val);
> +		clrsetbits_le32(ebi->io_base + FMC2_BTR(cs), FMC2_BTR_CLKDIV, val);
> +	}
> +
> +	return 0;
> +}
> +
>  static int stm32_fmc2_ebi_set_data_latency(struct stm32_fmc2_ebi *ebi,
>  					   const struct stm32_fmc2_prop *prop,
>  					   int cs, u32 setup)
> @@ -689,6 +762,27 @@ static int stm32_fmc2_ebi_set_max_low_pulse(struct stm32_fmc2_ebi *ebi,
>  	return 0;
>  }
>  
> +static int stm32_fmc2_ebi_mp25_set_max_low_pulse(struct stm32_fmc2_ebi *ebi,
> +						 const struct stm32_fmc2_prop *prop,
> +						 int cs, u32 setup)
> +{
> +	u32 val;
> +
> +	if (setup == FMC2_CSCOUNT_0)
> +		val = FIELD_PREP(FMC2_BCR_CSCOUNT, FMC2_BCR_CSCOUNT_0);
> +	else if (setup == FMC2_CSCOUNT_1)
> +		val = FIELD_PREP(FMC2_BCR_CSCOUNT, FMC2_BCR_CSCOUNT_1);
> +	else if (setup <= FMC2_CSCOUNT_64)
> +		val = FIELD_PREP(FMC2_BCR_CSCOUNT, FMC2_BCR_CSCOUNT_64);
> +	else
> +		val = FIELD_PREP(FMC2_BCR_CSCOUNT, FMC2_BCR_CSCOUNT_256);
> +
> +	clrsetbits_le32(ebi->io_base + FMC2_BCR(cs),
> +			FMC2_BCR_CSCOUNT, val);
> +
> +	return 0;
> +}
> +
>  static const struct stm32_fmc2_prop stm32_fmc2_child_props[] = {
>  	/* st,fmc2-ebi-cs-trans-type must be the first property */
>  	{
> @@ -854,6 +948,171 @@ static const struct stm32_fmc2_prop stm32_fmc2_child_props[] = {
>  	},
>  };
>  
> +static const struct stm32_fmc2_prop stm32_fmc2_mp25_child_props[] = {
> +	/* st,fmc2-ebi-cs-trans-type must be the first property */
> +	{
> +		.name = "st,fmc2-ebi-cs-transaction-type",
> +		.mprop = true,
> +		.set = stm32_fmc2_ebi_set_trans_type,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-cclk-enable",
> +		.bprop = true,
> +		.reg_type = FMC2_REG_CFGR,
> +		.reg_mask = FMC2_CFGR_CCLKEN,
> +		.check = stm32_fmc2_ebi_check_sync_trans,
> +		.set = stm32_fmc2_ebi_set_bit_field,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-mux-enable",
> +		.bprop = true,
> +		.reg_type = FMC2_REG_BCR,
> +		.reg_mask = FMC2_BCR_MUXEN,
> +		.check = stm32_fmc2_ebi_check_mux,
> +		.set = stm32_fmc2_ebi_set_bit_field,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-buswidth",
> +		.reset_val = FMC2_BUSWIDTH_16,
> +		.set = stm32_fmc2_ebi_set_buswidth,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-waitpol-high",
> +		.bprop = true,
> +		.reg_type = FMC2_REG_BCR,
> +		.reg_mask = FMC2_BCR_WAITPOL,
> +		.set = stm32_fmc2_ebi_set_bit_field,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-waitcfg-enable",
> +		.bprop = true,
> +		.reg_type = FMC2_REG_BCR,
> +		.reg_mask = FMC2_BCR_WAITCFG,
> +		.check = stm32_fmc2_ebi_check_waitcfg,
> +		.set = stm32_fmc2_ebi_set_bit_field,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-wait-enable",
> +		.bprop = true,
> +		.reg_type = FMC2_REG_BCR,
> +		.reg_mask = FMC2_BCR_WAITEN,
> +		.check = stm32_fmc2_ebi_check_sync_trans,
> +		.set = stm32_fmc2_ebi_set_bit_field,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-asyncwait-enable",
> +		.bprop = true,
> +		.reg_type = FMC2_REG_BCR,
> +		.reg_mask = FMC2_BCR_ASYNCWAIT,
> +		.check = stm32_fmc2_ebi_check_async_trans,
> +		.set = stm32_fmc2_ebi_set_bit_field,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-cpsize",
> +		.check = stm32_fmc2_ebi_check_cpsize,
> +		.set = stm32_fmc2_ebi_set_cpsize,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-byte-lane-setup-ns",
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_bl_setup,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-address-setup-ns",
> +		.reg_type = FMC2_REG_BTR,
> +		.reset_val = FMC2_BXTR_ADDSET_MAX,
> +		.check = stm32_fmc2_ebi_check_async_trans,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_address_setup,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-address-hold-ns",
> +		.reg_type = FMC2_REG_BTR,
> +		.reset_val = FMC2_BXTR_ADDHLD_MAX,
> +		.check = stm32_fmc2_ebi_check_address_hold,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_address_hold,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-data-setup-ns",
> +		.reg_type = FMC2_REG_BTR,
> +		.reset_val = FMC2_BXTR_DATAST_MAX,
> +		.check = stm32_fmc2_ebi_check_async_trans,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_data_setup,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-bus-turnaround-ns",
> +		.reg_type = FMC2_REG_BTR,
> +		.reset_val = FMC2_BXTR_BUSTURN_MAX + 1,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_bus_turnaround,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-data-hold-ns",
> +		.reg_type = FMC2_REG_BTR,
> +		.check = stm32_fmc2_ebi_check_async_trans,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_data_hold,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-clk-period-ns",
> +		.reset_val = FMC2_CFGR_CLKDIV_MAX + 1,
> +		.check = stm32_fmc2_ebi_check_sync_trans,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_mp25_set_clk_period,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-data-latency-ns",
> +		.check = stm32_fmc2_ebi_check_sync_trans,
> +		.calculate = stm32_fmc2_ebi_mp25_ns_to_clk_period,
> +		.set = stm32_fmc2_ebi_set_data_latency,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-write-address-setup-ns",
> +		.reg_type = FMC2_REG_BWTR,
> +		.reset_val = FMC2_BXTR_ADDSET_MAX,
> +		.check = stm32_fmc2_ebi_check_async_trans,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_address_setup,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-write-address-hold-ns",
> +		.reg_type = FMC2_REG_BWTR,
> +		.reset_val = FMC2_BXTR_ADDHLD_MAX,
> +		.check = stm32_fmc2_ebi_check_address_hold,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_address_hold,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-write-data-setup-ns",
> +		.reg_type = FMC2_REG_BWTR,
> +		.reset_val = FMC2_BXTR_DATAST_MAX,
> +		.check = stm32_fmc2_ebi_check_async_trans,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_data_setup,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-write-bus-turnaround-ns",
> +		.reg_type = FMC2_REG_BWTR,
> +		.reset_val = FMC2_BXTR_BUSTURN_MAX + 1,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_bus_turnaround,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-write-data-hold-ns",
> +		.reg_type = FMC2_REG_BWTR,
> +		.check = stm32_fmc2_ebi_check_async_trans,
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_set_data_hold,
> +	},
> +	{
> +		.name = "st,fmc2-ebi-cs-max-low-pulse-ns",
> +		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
> +		.set = stm32_fmc2_ebi_mp25_set_max_low_pulse,
> +	},
> +};
> +
>  static int stm32_fmc2_ebi_parse_prop(struct stm32_fmc2_ebi *ebi,
>  				     ofnode node,
>  				     const struct stm32_fmc2_prop *prop,
> @@ -915,7 +1174,7 @@ static void stm32_fmc2_ebi_disable_bank(struct stm32_fmc2_ebi *ebi, int cs)
>  }
>  
>  /* NWAIT signal can not be connected to EBI controller and NAND controller */
> -static bool stm32_fmc2_ebi_nwait_used_by_ctrls(struct stm32_fmc2_ebi *ebi)
> +static int stm32_fmc2_ebi_nwait_used_by_ctrls(struct stm32_fmc2_ebi *ebi)
>  {
>  	unsigned int cs;
>  	u32 bcr;
> @@ -926,16 +1185,19 @@ static bool stm32_fmc2_ebi_nwait_used_by_ctrls(struct stm32_fmc2_ebi *ebi)
>  
>  		bcr = readl(ebi->io_base + FMC2_BCR(cs));
>  		if ((bcr & FMC2_BCR_WAITEN || bcr & FMC2_BCR_ASYNCWAIT) &&
> -		    ebi->bank_assigned & BIT(FMC2_NAND))
> -			return true;
> +		    ebi->bank_assigned & BIT(FMC2_NAND)) {
> +			log_err("NWAIT signal connected to EBI and NAND controllers\n");
> +			return -EINVAL;
> +		}
>  	}
>  
> -	return false;
> +	return 0;
>  }
>  
>  static void stm32_fmc2_ebi_enable(struct stm32_fmc2_ebi *ebi)
>  {
> -	setbits_le32(ebi->io_base + FMC2_BCR1, FMC2_BCR1_FMC2EN);
> +	setbits_le32(ebi->io_base + ebi->data->fmc2_enable_reg,
> +		     ebi->data->fmc2_enable_bit);
>  }
>  
>  static int stm32_fmc2_ebi_setup_cs(struct stm32_fmc2_ebi *ebi,
> @@ -946,8 +1208,8 @@ static int stm32_fmc2_ebi_setup_cs(struct stm32_fmc2_ebi *ebi,
>  
>  	stm32_fmc2_ebi_disable_bank(ebi, cs);
>  
> -	for (i = 0; i < ARRAY_SIZE(stm32_fmc2_child_props); i++) {
> -		const struct stm32_fmc2_prop *p = &stm32_fmc2_child_props[i];
> +	for (i = 0; i < ebi->data->nb_child_props; i++) {
> +		const struct stm32_fmc2_prop *p = &ebi->data->child_props[i];
>  
>  		ret = stm32_fmc2_ebi_parse_prop(ebi, node, p, cs);
>  		if (ret) {
> @@ -1004,9 +1266,10 @@ static int stm32_fmc2_ebi_parse_dt(struct udevice *dev,
>  		return -ENODEV;
>  	}
>  
> -	if (stm32_fmc2_ebi_nwait_used_by_ctrls(ebi)) {
> -		dev_err(dev, "NWAIT signal connected to EBI and NAND controllers\n");
> -		return -EINVAL;
> +	if (ebi->data->nwait_used_by_ctrls) {
> +		ret = ebi->data->nwait_used_by_ctrls(ebi);
> +		if (ret)
> +			return ret;
>  	}
>  
>  	stm32_fmc2_ebi_enable(ebi);
> @@ -1020,6 +1283,10 @@ static int stm32_fmc2_ebi_probe(struct udevice *dev)
>  	struct reset_ctl reset;
>  	int ret;
>  
> +	ebi->data = (void *)dev_get_driver_data(dev);
> +	if (!ebi->data)
> +		return -EINVAL;
> +
>  	ebi->io_base = dev_read_addr(dev);
>  	if (ebi->io_base == FDT_ADDR_T_NONE)
>  		return -EINVAL;
> @@ -1042,8 +1309,30 @@ static int stm32_fmc2_ebi_probe(struct udevice *dev)
>  	return stm32_fmc2_ebi_parse_dt(dev, ebi);
>  }
>  
> +static const struct stm32_fmc2_ebi_data stm32_fmc2_ebi_mp1_data = {
> +	.child_props = stm32_fmc2_child_props,
> +	.nb_child_props = ARRAY_SIZE(stm32_fmc2_child_props),
> +	.fmc2_enable_reg = FMC2_BCR1,
> +	.fmc2_enable_bit = FMC2_BCR1_FMC2EN,
> +	.nwait_used_by_ctrls = stm32_fmc2_ebi_nwait_used_by_ctrls,
> +};
> +
> +static const struct stm32_fmc2_ebi_data stm32_fmc2_ebi_mp25_data = {
> +	.child_props = stm32_fmc2_mp25_child_props,
> +	.nb_child_props = ARRAY_SIZE(stm32_fmc2_mp25_child_props),
> +	.fmc2_enable_reg = FMC2_CFGR,
> +	.fmc2_enable_bit = FMC2_CFGR_FMC2EN,
> +};
> +
>  static const struct udevice_id stm32_fmc2_ebi_match[] = {
> -	{.compatible = "st,stm32mp1-fmc2-ebi"},
> +	{
> +		.compatible = "st,stm32mp1-fmc2-ebi",
> +		.data = (ulong)&stm32_fmc2_ebi_mp1_data,
> +	},
> +	{
> +		.compatible = "st,stm32mp25-fmc2-ebi",
> +		.data = (ulong)&stm32_fmc2_ebi_mp25_data,
> +	},
>  	{ /* Sentinel */ }
>  };
>  
Applied on u-boot-stm32/master 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
