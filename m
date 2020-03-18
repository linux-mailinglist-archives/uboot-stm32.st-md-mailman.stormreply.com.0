Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D58189847
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 10:45:11 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4683CC36B0A
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:45:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7561C36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 09:45:10 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9euU8008817; Wed, 18 Mar 2020 10:45:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=sW4rK/BW4+U2p9vPqKI1Ee3y91lmZHgOZ/oRW/WJ5V4=;
 b=zs/1w0B7Uk2OVmCwAruUlwM/YZ+hyeDNd/d0x+VIad+gxTZxTOvjYfWcW8vLsSJv4uMw
 7QCQAV8f83Ebd3j60Aik8nHpDG5IrKuoxcjkyEpUttW9FA0olJ2qDvfHbEoUGqrzs1mP
 RzxZ9hiq+YBp0YjV/MlMwczcQtbgxEBXssdNGwUwGfyY+tGSLsBTC1EGZDIgjJ79wn8n
 BBJuKuTSrPurZpaF3RAqibkrBpZk14CIegAhWn194HF6SzAw9C333K+oLybx7mv59rYR
 cPTSihula0YLPVBTBJ44saVzS0qI9JU4fp5iZg/w+coSISOQ62K2UUQAOwVX0oze2FyD Hg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu6xdb405-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 10:45:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3723100034;
 Wed, 18 Mar 2020 10:45:08 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E3FE121FEAB;
 Wed, 18 Mar 2020 10:45:08 +0100 (CET)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Mar
 2020 10:45:08 +0100
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Wed, 18 Mar 2020 10:45:08 +0100
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 6/9] ram: stm32mp1: update BIST config for tuning
Thread-Index: AQHV86AJKaJCBDSrzUGOBlTp/S1YJqhOG8yA
Date: Wed, 18 Mar 2020 09:45:08 +0000
Message-ID: <ea3dd947-f38d-9e5d-6f22-1ccf4a34a668@st.com>
References: <20200306101412.15376-1-patrick.delaunay@st.com>
 <20200306111355.6.Id09f75f6aa43a345f0eccb009481c6423933358b@changeid>
In-Reply-To: <20200306111355.6.Id09f75f6aa43a345f0eccb009481c6423933358b@changeid>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <DDBA5A43D4E39E4E952FFFAA6F389175@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_04:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 6/9] ram: stm32mp1: update BIST config for
	tuning
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


On 3/6/20 11:14 AM, Patrick Delaunay wrote:
> Update the BIST config to compute the real use mask for the real
> bank, row and col of the used DDR. The values are get from addrmap
> register value.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/ram/stm32mp1/stm32mp1_tuning.c | 151 +++++++++++++++++++++++--
>  1 file changed, 142 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/ram/stm32mp1/stm32mp1_tuning.c b/drivers/ram/stm32mp1/stm32mp1_tuning.c
> index 37d3ec8fef..07d57d496c 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_tuning.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_tuning.c
> @@ -8,6 +8,7 @@
>  #include <ram.h>
>  #include <reset.h>
>  #include <asm/io.h>
> +#include <linux/bitops.h>
>  #include <linux/iopoll.h>
>  
>  #include "stm32mp1_ddr_regs.h"
> @@ -76,6 +77,133 @@ static u8 get_nb_bytes(struct stm32mp1_ddrctl *ctl)
>  	return nb_bytes;
>  }
>  
> +static u8 get_nb_bank(struct stm32mp1_ddrctl *ctl)
> +{
> +	/* Count bank address bits */
> +	u8 bits = 0;
> +	u32 reg, val;
> +
> +	reg = readl(&ctl->addrmap1);
> +	/* addrmap1.addrmap_bank_b1 */
> +	val = (reg & GENMASK(5, 0)) >> 0;
> +	if (val <= 31)
> +		bits++;
> +	/* addrmap1.addrmap_bank_b2 */
> +	val = (reg & GENMASK(13, 8)) >> 8;
> +	if (val <= 31)
> +		bits++;
> +	/* addrmap1.addrmap_bank_b3 */
> +	val = (reg & GENMASK(21, 16)) >> 16;
> +	if (val <= 31)
> +		bits++;
> +
> +	return bits;
> +}
> +
> +static u8 get_nb_col(struct stm32mp1_ddrctl *ctl)
> +{
> +	u8 bits;
> +	u32 reg, val;
> +
> +	/* Count column address bits, start at 2 for b0 and b1 (fixed) */
> +	bits = 2;
> +
> +	reg = readl(&ctl->addrmap2);
> +	/* addrmap2.addrmap_col_b2 */
> +	val = (reg & GENMASK(3, 0)) >> 0;
> +	if (val <= 7)
> +		bits++;
> +	/* addrmap2.addrmap_col_b3 */
> +	val = (reg & GENMASK(11, 8)) >> 8;
> +	if (val <= 7)
> +		bits++;
> +	/* addrmap2.addrmap_col_b4 */
> +	val = (reg & GENMASK(19, 16)) >> 16;
> +	if (val <= 7)
> +		bits++;
> +	/* addrmap2.addrmap_col_b5 */
> +	val = (reg & GENMASK(27, 24)) >> 24;
> +	if (val <= 7)
> +		bits++;
> +
> +	reg = readl(&ctl->addrmap3);
> +	/* addrmap3.addrmap_col_b6 */
> +	val = (reg & GENMASK(3, 0)) >> 0;
> +	if (val <= 7)
> +		bits++;
> +	/* addrmap3.addrmap_col_b7 */
> +	val = (reg & GENMASK(11, 8)) >> 8;
> +	if (val <= 7)
> +		bits++;
> +	/* addrmap3.addrmap_col_b8 */
> +	val = (reg & GENMASK(19, 16)) >> 16;
> +	if (val <= 7)
> +		bits++;
> +	/* addrmap3.addrmap_col_b9 */
> +	val = (reg & GENMASK(27, 24)) >> 24;
> +	if (val <= 7)
> +		bits++;
> +
> +	reg = readl(&ctl->addrmap4);
> +	/* addrmap4.addrmap_col_b10 */
> +	val = (reg & GENMASK(3, 0)) >> 0;
> +	if (val <= 7)
> +		bits++;
> +	/* addrmap4.addrmap_col_b11 */
> +	val = (reg & GENMASK(11, 8)) >> 8;
> +	if (val <= 7)
> +		bits++;
> +
> +	return bits;
> +}
> +
> +static u8 get_nb_row(struct stm32mp1_ddrctl *ctl)
> +{
> +	/* Count row address bits */
> +	u8 bits = 0;
> +	u32 reg, val;
> +
> +	reg = readl(&ctl->addrmap5);
> +	/* addrmap5.addrmap_row_b0 */
> +	val = (reg & GENMASK(3, 0)) >> 0;
> +	if (val <= 11)
> +		bits++;
> +	/* addrmap5.addrmap_row_b1 */
> +	val = (reg & GENMASK(11, 8)) >> 8;
> +	if (val <= 11)
> +		bits++;
> +	/* addrmap5.addrmap_row_b2_10 */
> +	val = (reg & GENMASK(19, 16)) >> 16;
> +	if (val <= 11)
> +		bits += 9;
> +	else
> +		printf("warning: addrmap5.addrmap_row_b2_10 not supported\n");
> +	/* addrmap5.addrmap_row_b11 */
> +	val = (reg & GENMASK(27, 24)) >> 24;
> +	if (val <= 11)
> +		bits++;
> +
> +	reg = readl(&ctl->addrmap6);
> +	/* addrmap6.addrmap_row_b12 */
> +	val = (reg & GENMASK(3, 0)) >> 0;
> +	if (val <= 7)
> +		bits++;
> +	/* addrmap6.addrmap_row_b13 */
> +	val = (reg & GENMASK(11, 8)) >> 8;
> +	if (val <= 7)
> +		bits++;
> +	/* addrmap6.addrmap_row_b14 */
> +	val = (reg & GENMASK(19, 16)) >> 16;
> +	if (val <= 7)
> +		bits++;
> +	/* addrmap6.addrmap_row_b15 */
> +	val = (reg & GENMASK(27, 24)) >> 24;
> +	if (val <= 7)
> +		bits++;
> +
> +	return bits;
> +}
> +
>  static void itm_soft_reset(struct stm32mp1_ddrphy *phy)
>  {
>  	stm32mp1_ddrphy_init(phy, DDRPHYC_PIR_ITMSRST);
> @@ -170,8 +298,13 @@ static void set_r0dgps_delay(struct stm32mp1_ddrphy *phy,
>  }
>  
>  /* Basic BIST configuration for data lane tests. */
> -static void config_BIST(struct stm32mp1_ddrphy *phy)
> +static void config_BIST(struct stm32mp1_ddrctl *ctl,
> +			struct stm32mp1_ddrphy *phy)
>  {
> +	u8 nb_bank = get_nb_bank(ctl);
> +	u8 nb_row = get_nb_row(ctl);
> +	u8 nb_col = get_nb_col(ctl);
> +
>  	/* Selects the SDRAM bank address to be used during BIST. */
>  	u32 bbank = 0;
>  	/* Selects the SDRAM row address to be used during BIST. */
> @@ -191,18 +324,20 @@ static void config_BIST(struct stm32mp1_ddrphy *phy)
>  	 * must be 0 with single rank
>  	 */
>  	u32 brank = 0;
> +
>  	/* Specifies the maximum SDRAM bank address to be used during
>  	 * BIST before the address & increments to the next rank.
>  	 */
> -	u32 bmbank = 1;
> +	u32 bmbank = (1 << nb_bank) - 1;
>  	/* Specifies the maximum SDRAM row address to be used during
>  	 * BIST before the address & increments to the next bank.
>  	 */
> -	u32 bmrow = 0x7FFF; /* To check */
> +	u32 bmrow = (1 << nb_row) - 1;
>  	/* Specifies the maximum SDRAM column address to be used during
>  	 * BIST before the address & increments to the next row.
>  	 */
> -	u32 bmcol = 0x3FF;  /* To check */
> +	u32 bmcol = (1 << nb_col) - 1;
> +
>  	u32 bmode_conf = 0x00000001;  /* DRam mode */
>  	u32 bdxen_conf = 0x00000001;  /* BIST on Data byte */
>  	u32 bdpat_conf = 0x00000002;  /* Select LFSR pattern */
> @@ -224,8 +359,6 @@ static void config_BIST(struct stm32mp1_ddrphy *phy)
>  
>  	writel(bcol | (brow << 12) | (bbank << 28), &phy->bistar0);
>  	writel(brank | (bmrank << 2) | (bainc << 4), &phy->bistar1);
> -
> -	/* To check this line : */
>  	writel(bmcol | (bmrow << 12) | (bmbank << 28), &phy->bistar2);
>  }
>  
> @@ -399,7 +532,7 @@ static enum test_result bit_deskew(struct stm32mp1_ddrctl *ctl,
>  	clrbits_le32(&phy->dx3gcr, DDRPHYC_DXNGCR_DXEN);
>  
>  	/* Config the BIST block */
> -	config_BIST(phy);
> +	config_BIST(ctl, phy);
>  	pr_debug("BIST Config done.\n");
>  
>  	/* Train each byte */
> @@ -812,7 +945,7 @@ static enum test_result eye_training(struct stm32mp1_ddrctl *ctl,
>  	clrbits_le32(&phy->dx3gcr, DDRPHYC_DXNGCR_DXEN);
>  
>  	/* Config the BIST block */
> -	config_BIST(phy);
> +	config_BIST(ctl, phy);
>  
>  	for (byte = 0; byte < nb_bytes; byte++) {
>  		if (ctrlc()) {
> @@ -1234,7 +1367,7 @@ static enum test_result read_dqs_gating(struct stm32mp1_ddrctl *ctl,
>  	clrbits_le32(&phy->dx3gcr, DDRPHYC_DXNGCR_DXEN);
>  
>  	/* config the bist block */
> -	config_BIST(phy);
> +	config_BIST(ctl, phy);
>  
>  	for (byte = 0; byte < nb_bytes; byte++) {
>  		if (ctrlc()) {


Acked-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
