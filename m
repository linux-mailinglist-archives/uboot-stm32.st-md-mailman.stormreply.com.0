Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED328762EB
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Mar 2024 12:17:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0A10C6C83D;
	Fri,  8 Mar 2024 11:17:05 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 94B9BC6B46B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Mar 2024 11:17:04 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 4288iqw2022305; Fri, 8 Mar 2024 12:16:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=96pzc841pXHgV94U7tT7BpL1VVy1IVd3tHFizQVRbLQ=; b=6P
 VE1LeWZ40B+6dYMKhHTOUYHFp85QKea9Zk8Y0aPSnrV1zRUUw9HCWiP2ArW6e43w
 0N3dISpIo9qmZpxyJFzLsszxtDlNOQ6nepI0SAQIwjHB6ikNzwA8SnlR5JyJ9WF8
 Lm8Q71oyAuojz1qxuRgG4NVcnnuUXypBZ3070G7TbkcbpWO4l5YvdVcKEmv8fHyM
 ZY3rT4qhL/6fDgSoTSZGc4QJRZ3eCZvwd614YYsXrRkudM84vcJfHUe1p1Jxn3yT
 ZiVbCSXI2R76mEvaLV1Hv7NSlnDKtOAu9CkcJmEu4HhYqSt0D/bIfzlMf4ylFPQl
 Vi4Q5tlyvMcyqbpPNztA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3wn87txmgs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Mar 2024 12:16:47 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CB82A4002D;
 Fri,  8 Mar 2024 12:16:43 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 082EF26528D;
 Fri,  8 Mar 2024 12:16:14 +0100 (CET)
Received: from [10.252.7.115] (10.252.7.115) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 8 Mar
 2024 12:16:13 +0100
Message-ID: <2add2cd6-c262-4f21-80a4-7f49f805c6a5@foss.st.com>
Date: Fri, 8 Mar 2024 12:16:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>, <u-boot@lists.denx.de>
References: <20240306095048.314546-1-christophe.kerello@foss.st.com>
 <20240306095048.314546-3-christophe.kerello@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240306095048.314546-3-christophe.kerello@foss.st.com>
X-Originating-IP: [10.252.7.115]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_08,2024-03-06_01,2023-05-22_02
Cc: Tom Rini <trini@konsulko.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Stefan Bosch <stefan_b@posteo.net>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Igor Prusov <ivprusov@salutedevices.com>
Subject: Re: [Uboot-stm32] [PATCH v1 2/2] memory: stm32-fmc2-ebi: add MP25
	RIF support
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
> The FMC2 revision 2 supports security and isolation compliant with
> the Resource Isolation Framework (RIF). From RIF point of view,
> the FMC2 is composed of several independent resources, listed below,
> which can be assigned to different security and compartment domains:
>  - 0: Common FMC_CFGR register.
>  - 1: EBI controller for Chip Select 1.
>  - 2: EBI controller for Chip Select 2.
>  - 3: EBI controller for Chip Select 3.
>  - 4: EBI controller for Chip Select 4.
>  - 5: NAND controller.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
> 
>  drivers/memory/stm32-fmc2-ebi.c | 140 +++++++++++++++++++++++++++++++-
>  1 file changed, 138 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
> index c7db16463e8..1ce96077858 100644
> --- a/drivers/memory/stm32-fmc2-ebi.c
> +++ b/drivers/memory/stm32-fmc2-ebi.c
> @@ -23,8 +23,14 @@
>  #define FMC2_BTR(x)			((x) * 0x8 + FMC2_BTR1)
>  #define FMC2_PCSCNTR			0x20
>  #define FMC2_CFGR			0x20
> +#define FMC2_SR				0x84
>  #define FMC2_BWTR1			0x104
>  #define FMC2_BWTR(x)			((x) * 0x8 + FMC2_BWTR1)
> +#define FMC2_SECCFGR			0x300
> +#define FMC2_CIDCFGR0			0x30c
> +#define FMC2_CIDCFGR(x)			((x) * 0x8 + FMC2_CIDCFGR0)
> +#define FMC2_SEMCR0			0x310
> +#define FMC2_SEMCR(x)			((x) * 0x8 + FMC2_SEMCR0)
>  
>  /* Register: FMC2_BCR1 */
>  #define FMC2_BCR1_CCLKEN		BIT(20)
> @@ -67,8 +73,23 @@
>  #define FMC2_CFGR_CCLKEN		BIT(20)
>  #define FMC2_CFGR_FMC2EN		BIT(31)
>  
> +/* Register: FMC2_SR */
> +#define FMC2_SR_ISOST			GENMASK(1, 0)
> +
> +/* Register: FMC2_CIDCFGR */
> +#define FMC2_CIDCFGR_CFEN		BIT(0)
> +#define FMC2_CIDCFGR_SEMEN		BIT(1)
> +#define FMC2_CIDCFGR_SCID		GENMASK(6, 4)
> +#define FMC2_CIDCFGR_SEMWLC1		BIT(17)
> +
> +/* Register: FMC2_SEMCR */
> +#define FMC2_SEMCR_SEM_MUTEX		BIT(0)
> +#define FMC2_SEMCR_SEMCID		GENMASK(6, 4)
> +
>  #define FMC2_MAX_EBI_CE			4
>  #define FMC2_MAX_BANKS			5
> +#define FMC2_MAX_RESOURCES		6
> +#define FMC2_CID1			1
>  
>  #define FMC2_BCR_CPSIZE_0		0x0
>  #define FMC2_BCR_CPSIZE_128		0x1
> @@ -163,6 +184,7 @@ struct stm32_fmc2_ebi_data {
>  	u32 fmc2_enable_reg;
>  	u32 fmc2_enable_bit;
>  	int (*nwait_used_by_ctrls)(struct stm32_fmc2_ebi *ebi);
> +	int (*check_rif)(struct stm32_fmc2_ebi *ebi, u32 resource);
>  };
>  
>  struct stm32_fmc2_ebi {
> @@ -170,6 +192,7 @@ struct stm32_fmc2_ebi {
>  	fdt_addr_t io_base;
>  	const struct stm32_fmc2_ebi_data *data;
>  	u8 bank_assigned;
> +	bool access_granted;
>  };
>  
>  /*
> @@ -241,6 +264,28 @@ static int stm32_fmc2_ebi_check_sync_trans(struct stm32_fmc2_ebi *ebi,
>  	return -EINVAL;
>  }
>  
> +static int stm32_fmc2_ebi_mp25_check_cclk(struct stm32_fmc2_ebi *ebi,
> +					  const struct stm32_fmc2_prop *prop,
> +					  int cs)
> +{
> +	if (!ebi->access_granted)
> +		return -EACCES;
> +
> +	return stm32_fmc2_ebi_check_sync_trans(ebi, prop, cs);
> +}
> +
> +static int stm32_fmc2_ebi_mp25_check_clk_period(struct stm32_fmc2_ebi *ebi,
> +						const struct stm32_fmc2_prop *prop,
> +						int cs)
> +{
> +	u32 cfgr = readl(ebi->io_base + FMC2_CFGR);
> +
> +	if (cfgr & FMC2_CFGR_CCLKEN && !ebi->access_granted)
> +		return -EACCES;
> +
> +	return stm32_fmc2_ebi_check_sync_trans(ebi, prop, cs);
> +}
> +
>  static int stm32_fmc2_ebi_check_async_trans(struct stm32_fmc2_ebi *ebi,
>  					    const struct stm32_fmc2_prop *prop,
>  					    int cs)
> @@ -960,7 +1005,7 @@ static const struct stm32_fmc2_prop stm32_fmc2_mp25_child_props[] = {
>  		.bprop = true,
>  		.reg_type = FMC2_REG_CFGR,
>  		.reg_mask = FMC2_CFGR_CCLKEN,
> -		.check = stm32_fmc2_ebi_check_sync_trans,
> +		.check = stm32_fmc2_ebi_mp25_check_cclk,
>  		.set = stm32_fmc2_ebi_set_bit_field,
>  	},
>  	{
> @@ -1058,7 +1103,7 @@ static const struct stm32_fmc2_prop stm32_fmc2_mp25_child_props[] = {
>  	{
>  		.name = "st,fmc2-ebi-cs-clk-period-ns",
>  		.reset_val = FMC2_CFGR_CLKDIV_MAX + 1,
> -		.check = stm32_fmc2_ebi_check_sync_trans,
> +		.check = stm32_fmc2_ebi_mp25_check_clk_period,
>  		.calculate = stm32_fmc2_ebi_ns_to_clock_cycles,
>  		.set = stm32_fmc2_ebi_mp25_set_clk_period,
>  	},
> @@ -1113,6 +1158,70 @@ static const struct stm32_fmc2_prop stm32_fmc2_mp25_child_props[] = {
>  	},
>  };
>  
> +static int stm32_fmc2_ebi_mp25_check_rif(struct stm32_fmc2_ebi *ebi, u32 resource)
> +{
> +	u32 seccfgr, cidcfgr, semcr;
> +	int cid;
> +
> +	if (resource >= FMC2_MAX_RESOURCES)
> +		return -EINVAL;
> +
> +	seccfgr = readl(ebi->io_base + FMC2_SECCFGR);
> +	if (seccfgr & BIT(resource)) {
> +		if (resource)
> +			log_err("resource %d is configured as secure\n",
> +				resource);
> +
> +		return -EACCES;
> +	}
> +
> +	cidcfgr = readl(ebi->io_base + FMC2_CIDCFGR(resource));
> +	if (!(cidcfgr & FMC2_CIDCFGR_CFEN))
> +		/* CID filtering is turned off: access granted */
> +		return 0;
> +
> +	if (!(cidcfgr & FMC2_CIDCFGR_SEMEN)) {
> +		/* Static CID mode */
> +		cid = FIELD_GET(FMC2_CIDCFGR_SCID, cidcfgr);
> +		if (cid != FMC2_CID1) {
> +			if (resource)
> +				log_err("static CID%d set for resource %d\n",
> +					cid, resource);
> +
> +			return -EACCES;
> +		}
> +
> +		return 0;
> +	}
> +
> +	/* Pass-list with semaphore mode */
> +	if (!(cidcfgr & FMC2_CIDCFGR_SEMWLC1)) {
> +		if (resource)
> +			log_err("CID1 is block-listed for resource %d\n",
> +				resource);
> +
> +		return -EACCES;
> +	}
> +
> +	semcr = readl(ebi->io_base + FMC2_SEMCR(resource));
> +	if (!(semcr & FMC2_SEMCR_SEM_MUTEX)) {
> +		setbits_le32(ebi->io_base + FMC2_SEMCR(resource),
> +			     FMC2_SEMCR_SEM_MUTEX);
> +		semcr = readl(ebi->io_base + FMC2_SEMCR(resource));
> +	}
> +
> +	cid = FIELD_GET(FMC2_SEMCR_SEMCID, semcr);
> +	if (cid != FMC2_CID1) {
> +		if (resource)
> +			log_err("resource %d is already used by CID%d\n",
> +				resource, cid);
> +
> +		return -EACCES;
> +	}
> +
> +	return 0;
> +}
> +
>  static int stm32_fmc2_ebi_parse_prop(struct stm32_fmc2_ebi *ebi,
>  				     ofnode node,
>  				     const struct stm32_fmc2_prop *prop,
> @@ -1196,6 +1305,9 @@ static int stm32_fmc2_ebi_nwait_used_by_ctrls(struct stm32_fmc2_ebi *ebi)
>  
>  static void stm32_fmc2_ebi_enable(struct stm32_fmc2_ebi *ebi)
>  {
> +	if (!ebi->access_granted)
> +		return;
> +
>  	setbits_le32(ebi->io_base + ebi->data->fmc2_enable_reg,
>  		     ebi->data->fmc2_enable_bit);
>  }
> @@ -1249,6 +1361,14 @@ static int stm32_fmc2_ebi_parse_dt(struct udevice *dev,
>  			return -EINVAL;
>  		}
>  
> +		if (ebi->data->check_rif) {
> +			ret = ebi->data->check_rif(ebi, bank + 1);
> +			if (ret) {
> +				dev_err(dev, "bank access failed: %d\n", bank);
> +				return ret;
> +			}
> +		}
> +
>  		if (bank < FMC2_MAX_EBI_CE) {
>  			ret = stm32_fmc2_ebi_setup_cs(ebi, child, bank);
>  			if (ret) {
> @@ -1306,6 +1426,21 @@ static int stm32_fmc2_ebi_probe(struct udevice *dev)
>  		reset_deassert(&reset);
>  	}
>  
> +	/* Check if CFGR register can be modified */
> +	ebi->access_granted = true;
> +	if (ebi->data->check_rif) {
> +		ret = ebi->data->check_rif(ebi, 0);
> +		if (ret) {
> +			ebi->access_granted = false;
> +
> +			/* In case of CFGR is secure, just check that the FMC2 is enabled */
> +			if (readl(ebi->io_base + FMC2_SR) & FMC2_SR_ISOST) {
> +				dev_err(dev, "FMC2 is not ready to be used.\n");
> +				return -EACCES;
> +			}
> +		}
> +	}
> +
>  	return stm32_fmc2_ebi_parse_dt(dev, ebi);
>  }
>  
> @@ -1322,6 +1457,7 @@ static const struct stm32_fmc2_ebi_data stm32_fmc2_ebi_mp25_data = {
>  	.nb_child_props = ARRAY_SIZE(stm32_fmc2_mp25_child_props),
>  	.fmc2_enable_reg = FMC2_CFGR,
>  	.fmc2_enable_bit = FMC2_CFGR_FMC2EN,
> +	.check_rif = stm32_fmc2_ebi_mp25_check_rif,
>  };
>  
>  static const struct udevice_id stm32_fmc2_ebi_match[] = {
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
