Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 575FF463599
	for <lists+uboot-stm32@lfdr.de>; Tue, 30 Nov 2021 14:37:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13957C597BA;
	Tue, 30 Nov 2021 13:37:23 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A98AEC57B6F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 Nov 2021 13:37:21 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AU8nJov024679;
 Tue, 30 Nov 2021 14:37:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : from : to
 : cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Pc/H8HbGb4ZGDYmCOvb9Jff14ASb296pdaDjlf9lI4g=;
 b=xoAQR/uiURHPcjnsCb25jVg/YhOLqUgXwiHpftR3MHVTyrEnhaemRMm3yAOFt+XIUmym
 MGxHo2WYHETPBV6nwftx8MNayiQXhj1sTmAkhiKR6b1KZK8GspkfJhE8gH6mEcKrehMt
 dlo+tPWWn07uXEM/QRCZcA0eg+obCsL8355gehlo+mBMXLYrnuqq+AnpteD1KbWUhxEs
 cHJc3IIhY5jXOGcuS6LXCMaahEeL/2Jvdo9kf80bKbPq7PP1zgrtpDLzB40qafIaOOkq
 h6BhFH3aH/SkWyVyAHdy9bc1Lljgwpoe53XZZQw6LzJwzrzDALIk3qcQvANvtTTPkjfx OA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3cna1yue6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 14:37:20 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1502210002A;
 Tue, 30 Nov 2021 14:37:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F32F12C4201;
 Tue, 30 Nov 2021 14:37:19 +0100 (CET)
Received: from lmecxl0573.lme.st.com (10.75.127.47) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 30 Nov
 2021 14:37:19 +0100
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20211124105216.1.I2f1cd5fa86d23797b452eecde73e8b52ac0f878f@changeid>
 <4956597c-1168-559e-9370-c0595f1cb9e6@foss.st.com>
Message-ID: <ad154b19-4a49-9c1b-41c5-c1246e68ecc6@foss.st.com>
Date: Tue, 30 Nov 2021 14:37:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4956597c-1168-559e-9370-c0595f1cb9e6@foss.st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_08,2021-11-28_01,2020-04-07_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 1/2] ram: stm32mp1: compute DDR size from
 DDRCTL registers
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

Patrick

For information, i fixed directly the minor issue when applying this patch
Thanks
Patrice

On 11/30/21 11:02 AM, Patrice CHOTARD wrote:
> Hi Patrick
> 
> just a minor remark
> 
> On 11/24/21 10:52 AM, Patrick Delaunay wrote:
>> Compute the DDR size from DDR controller register (mstr and addrmap)
>> in U-Boot proper as the DDR information are useful only for SPL
>> but not for U-Boot proper, for example with TFABOOT.
>>
>> This patch simplify U-Boot DT when several DDR size are supported
>> and support of next SOC in STM32MP family.
>>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
>> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
>> ---
>>
>>  drivers/ram/stm32mp1/stm32mp1_ddr_regs.h |   1 +
>>  drivers/ram/stm32mp1/stm32mp1_ram.c      | 192 ++++++++++++++++++++++-
>>  2 files changed, 190 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h b/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
>> index 3c8885a965..d6b9a76a76 100644
>> --- a/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
>> +++ b/drivers/ram/stm32mp1/stm32mp1_ddr_regs.h
>> @@ -238,6 +238,7 @@ struct stm32mp1_ddrphy {
>>  #define DDRCTRL_MSTR_LPDDR2			BIT(2)
>>  #define DDRCTRL_MSTR_LPDDR3			BIT(3)
>>  #define DDRCTRL_MSTR_DATA_BUS_WIDTH_MASK	GENMASK(13, 12)
>> +#define DDRCTRL_MSTR_DATA_BUS_WIDTH_SHIFT	12
>>  #define DDRCTRL_MSTR_DATA_BUS_WIDTH_FULL	(0 << 12)
>>  #define DDRCTRL_MSTR_DATA_BUS_WIDTH_HALF	(1 << 12)
>>  #define DDRCTRL_MSTR_DATA_BUS_WIDTH_QUARTER	(2 << 12)
>> diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
>> index 98fa1f4f11..c9335e59df 100644
>> --- a/drivers/ram/stm32mp1/stm32mp1_ram.c
>> +++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
>> @@ -16,6 +16,12 @@
>>  #include <asm/io.h>
>>  #include <dm/device_compat.h>
>>  #include "stm32mp1_ddr.h"
>> +#include "stm32mp1_ddr_regs.h"
>> +
>> +/* DDR subsystem configuration */
>> +struct stm32mp1_ddr_cfg {
>> +	u8 nb_bytes;	/* MEMC_DRAM_DATA_WIDTH */
>> +};
>>  
>>  static const char *const clkname[] = {
>>  	"ddrc1",
>> @@ -183,6 +189,182 @@ static __maybe_unused int stm32mp1_ddr_setup(struct udevice *dev)
>>  	return 0;
>>  }
>>  
>> +static u8 get_data_bus_width(struct stm32mp1_ddrctl *ctl)
>> +{
>> +	u32 reg = readl(&ctl->mstr) & DDRCTRL_MSTR_DATA_BUS_WIDTH_MASK;
>> +	u8 data_bus_width = reg >> DDRCTRL_MSTR_DATA_BUS_WIDTH_SHIFT;
>> +
>> +	return data_bus_width;
>> +}
>> +
>> +static u8 get_nb_bank(struct stm32mp1_ddrctl *ctl)
>> +{
>> +	/* Count bank address bits */
>> +	u8 bits = 0;
>> +	u32 reg, val;
>> +
>> +	reg = readl(&ctl->addrmap1);
>> +	/* addrmap1.addrmap_bank_b1 */
>> +	val = (reg & GENMASK(5, 0)) >> 0;
>> +	if (val <= 31)
>> +		bits++;
>> +	/* addrmap1.addrmap_bank_b2 */
>> +	val = (reg & GENMASK(13, 8)) >> 8;
>> +	if (val <= 31)
>> +		bits++;
>> +	/* addrmap1.addrmap_bank_b3 */
>> +	val = (reg & GENMASK(21, 16)) >> 16;
>> +	if (val <= 31)
>> +		bits++;
>> +
>> +	return bits;
>> +}
>> +
>> +static u8 get_nb_col(struct stm32mp1_ddrctl *ctl, u8 data_bus_width)
>> +{
>> +	u8 bits;
>> +	u32 reg, val;
>> +
>> +	/* Count column address bits, start at 2 for b0 and b1 (fixed) */
>> +	bits = 2;
>> +
>> +	reg = readl(&ctl->addrmap2);
>> +	/* addrmap2.addrmap_col_b2 */
>> +	val = (reg & GENMASK(3, 0)) >> 0;
>> +	if (val <= 7)
>> +		bits++;
>> +	/* addrmap2.addrmap_col_b3 */
>> +	val = (reg & GENMASK(11, 8)) >> 8;
>> +	if (val <= 7)
>> +		bits++;
>> +	/* addrmap2.addrmap_col_b4 */
>> +	val = (reg & GENMASK(19, 16)) >> 16;
>> +	if (val <= 7)
>> +		bits++;
>> +	/* addrmap2.addrmap_col_b5 */
>> +	val = (reg & GENMASK(27, 24)) >> 24;
>> +	if (val <= 7)
>> +		bits++;
>> +
>> +	reg = readl(&ctl->addrmap3);
>> +	/* addrmap3.addrmap_col_b6 */
>> +	val = (reg & GENMASK(3, 0)) >> 0;
>> +	if (val <= 7)
>> +		bits++;
>> +	/* addrmap3.addrmap_col_b7 */
>> +	val = (reg & GENMASK(11, 8)) >> 8;
>> +	if (val <= 7)
>> +		bits++;
>> +	/* addrmap3.addrmap_col_b8 */
>> +	val = (reg & GENMASK(19, 16)) >> 16;
>> +	if (val <= 7)
>> +		bits++;
>> +	/* addrmap3.addrmap_col_b9 */
>> +	val = (reg & GENMASK(27, 24)) >> 24;
>> +	if (val <= 7)
>> +		bits++;
>> +
>> +	reg = readl(&ctl->addrmap4);
>> +	/* addrmap4.addrmap_col_b10 */
>> +	val = (reg & GENMASK(3, 0)) >> 0;
>> +	if (val <= 7)
>> +		bits++;
>> +	/* addrmap4.addrmap_col_b11 */
>> +	val = (reg & GENMASK(11, 8)) >> 8;
>> +	if (val <= 7)
>> +		bits++;
>> +
>> +	/* column bits shift up:
> 
> /*
>  * column bits shift up:
> 
> With that fix, you can add my reviewed-by
> 
> Thanks
> Patrice
> 
>> +	 * 1 when half the data bus is used (data_bus_width = 1)
>> +	 * 2 when a quarter the data bus is used (data_bus_width = 2)
>> +	 * nothing to do for full data bus (data_bus_width = 0)
>> +	 */
>> +	bits += data_bus_width;
>> +
>> +	return bits;
>> +}
>> +
>> +static u8 get_nb_row(struct stm32mp1_ddrctl *ctl)
>> +{
>> +	/* Count row address bits */
>> +	u8 bits = 0;
>> +	u32 reg, val;
>> +
>> +	reg = readl(&ctl->addrmap5);
>> +	/* addrmap5.addrmap_row_b0 */
>> +	val = (reg & GENMASK(3, 0)) >> 0;
>> +	if (val <= 11)
>> +		bits++;
>> +	/* addrmap5.addrmap_row_b1 */
>> +	val = (reg & GENMASK(11, 8)) >> 8;
>> +	if (val <= 11)
>> +		bits++;
>> +	/* addrmap5.addrmap_row_b2_10 */
>> +	val = (reg & GENMASK(19, 16)) >> 16;
>> +	if (val <= 11)
>> +		bits += 9;
>> +	else
>> +		printf("warning: addrmap5.addrmap_row_b2_10 not supported\n");
>> +	/* addrmap5.addrmap_row_b11 */
>> +	val = (reg & GENMASK(27, 24)) >> 24;
>> +	if (val <= 11)
>> +		bits++;
>> +
>> +	reg = readl(&ctl->addrmap6);
>> +	/* addrmap6.addrmap_row_b12 */
>> +	val = (reg & GENMASK(3, 0)) >> 0;
>> +	if (val <= 7)
>> +		bits++;
>> +	/* addrmap6.addrmap_row_b13 */
>> +	val = (reg & GENMASK(11, 8)) >> 8;
>> +	if (val <= 7)
>> +		bits++;
>> +	/* addrmap6.addrmap_row_b14 */
>> +	val = (reg & GENMASK(19, 16)) >> 16;
>> +	if (val <= 7)
>> +		bits++;
>> +	/* addrmap6.addrmap_row_b15 */
>> +	val = (reg & GENMASK(27, 24)) >> 24;
>> +	if (val <= 7)
>> +		bits++;
>> +
>> +	return bits;
>> +}
>> +
>> +/*
>> + * stm32mp1_ddr_size
>> + *
>> + * Get the current DRAM size from the DDR CTL registers
>> + *
>> + * @return: DRAM size
>> + */
>> +u32 stm32mp1_ddr_size(struct udevice *dev)
>> +{
>> +	u8 nb_bit;
>> +	u32 ddr_size;
>> +	u8 data_bus_width;
>> +	struct ddr_info *priv = dev_get_priv(dev);
>> +	struct stm32mp1_ddrctl *ctl = priv->ctl;
>> +	struct stm32mp1_ddr_cfg *cfg = (struct stm32mp1_ddr_cfg *)dev_get_driver_data(dev);
>> +	const u8 nb_bytes = cfg->nb_bytes;
>> +
>> +	data_bus_width = get_data_bus_width(ctl);
>> +	nb_bit = get_nb_bank(ctl) + get_nb_col(ctl, data_bus_width) +
>> +		 get_nb_row(ctl);
>> +	if (nb_bit > 32) {
>> +		nb_bit = 32;
>> +		debug("invalid DDR configuration: %d bits\n", nb_bit);
>> +	}
>> +
>> +	ddr_size = (nb_bytes >> data_bus_width) << nb_bit;
>> +	if (ddr_size > STM32_DDR_SIZE) {
>> +		ddr_size = STM32_DDR_SIZE;
>> +		debug("invalid DDR configuration: size = %x\n", ddr_size);
>> +	}
>> +
>> +	return ddr_size;
>> +}
>> +
>>  static int stm32mp1_ddr_probe(struct udevice *dev)
>>  {
>>  	struct ddr_info *priv = dev_get_priv(dev);
>> @@ -209,8 +391,8 @@ static int stm32mp1_ddr_probe(struct udevice *dev)
>>  		return log_ret(ret);
>>  	}
>>  
>> -	ofnode node = stm32mp1_ddr_get_ofnode(dev);
>> -	priv->info.size = ofnode_read_u32_default(node, "st,mem-size", 0);
>> +	priv->info.size = stm32mp1_ddr_size(dev);
>> +
>>  	return 0;
>>  }
>>  
>> @@ -227,8 +409,12 @@ static struct ram_ops stm32mp1_ddr_ops = {
>>  	.get_info = stm32mp1_ddr_get_info,
>>  };
>>  
>> +static const struct stm32mp1_ddr_cfg stm32mp15x_ddr_cfg = {
>> +	.nb_bytes = 4,
>> +};
>> +
>>  static const struct udevice_id stm32mp1_ddr_ids[] = {
>> -	{ .compatible = "st,stm32mp1-ddr" },
>> +	{ .compatible = "st,stm32mp1-ddr", .data = (ulong)&stm32mp15x_ddr_cfg},
>>  	{ }
>>  };
>>  
>>
> 
> _______________________________________________
> Uboot-stm32 mailing list
> Uboot-stm32@st-md-mailman.stormreply.com
> https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
> 
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
