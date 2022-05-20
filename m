Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9E652E5E5
	for <lists+uboot-stm32@lfdr.de>; Fri, 20 May 2022 09:09:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8697DC03FEB;
	Fri, 20 May 2022 07:09:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DCE7C03FCD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 May 2022 07:09:12 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K1DdbX009064;
 Fri, 20 May 2022 09:09:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Vaq/wJX6dZkRP/3VoF3Jy/paxCTOJszldkH/XBEJiaY=;
 b=Ah796lUtLX9n062vU3eZWa3G43DvCFbGd31ZumyXepI58OlMIKNWW3aF/aLs9PAxqudt
 h80xYyzP/t6rj5Fgkb7g0brhzZGujTCiIdNLbR/nvV86G3RINdu3LjRZEk7QmoGfwnWz
 t0xDCdWmhrs7nJcNeo7l9+s4erW8l8h4ruz26HiQELre6t1fsNDv+PBXonbvQ/S8O4Cb
 f0S6nkHqVze8gxyCLC6auyRV2kvegpiOG7za7MlTrHigc8TKoEJ1hCccy6RLbJb0u6aN
 xHT2loOLqJ6UGvKtL3SY2lwFv0L+eB19DUe502TVQ1/DQb8+cIdCR580qGhL4AWB8nTI NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g21j9eq6n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 09:09:11 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5B18310002A;
 Fri, 20 May 2022 09:09:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5219A20FA3D;
 Fri, 20 May 2022 09:09:11 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Fri, 20 May
 2022 09:09:11 +0200
Message-ID: <706cce39-fea8-5b07-d7ee-a04025a48a5f@foss.st.com>
Date: Fri, 20 May 2022 09:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220506140624.445542-1-patrick.delaunay@foss.st.com>
 <20220506160540.12.I3c50158401b3eb022059c7394e48980af23b9582@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220506160540.12.I3c50158401b3eb022059c7394e48980af23b9582@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_02,2022-05-19_03,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 12/16] ram: stm32mp1: add support of
	STM32MP13x
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

HI Patrick

On 5/6/22 16:06, Patrick Delaunay wrote:
> Add support for new compatible "st,stm32mp13-ddr" to manage the
> DDR sub system (Controller and PHY) in STM32MP13x SOC:
> - only one AXI port
> - support of 16 port output (MEMC_DRAM_DATA_WIDTH = 2)
> 
> The STM32MP15x SOC have 2 AXI ports and 32 bits support.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
>  .../memory-controllers/st,stm32mp1-ddr.txt    | 49 +++++++++++++++----
>  drivers/ram/stm32mp1/stm32mp1_ram.c           | 28 +++++++----
>  2 files changed, 57 insertions(+), 20 deletions(-)
> 
> diff --git a/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt b/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
> index 926e3e83b3..e6ea8d0ef5 100644
> --- a/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
> +++ b/doc/device-tree-bindings/memory-controllers/st,stm32mp1-ddr.txt
> @@ -3,7 +3,8 @@ ST,stm32mp1 DDR3/LPDDR2/LPDDR3 Controller (DDRCTRL and DDRPHYC)
>  --------------------
>  Required properties:
>  --------------------
> -- compatible	: Should be "st,stm32mp1-ddr"
> +- compatible	: Should be "st,stm32mp1-ddr" for STM32MP15x
> +		  Should be "st,stm32mp13-ddr" for STM32MP13x
>  - reg		: controleur (DDRCTRL) and phy (DDRPHYC) base address
>  - clocks	: controller clocks handle
>  - clock-names	: associated controller clock names
> @@ -13,6 +14,8 @@ Required properties:
>  the next attributes are DDR parameters, they are generated by DDR tools
>  included in STM32 Cube tool
>  
> +They are required only in SPL, when TFABOOT is not activated.
> +
>  info attributes:
>  ----------------
>  - st,mem-name	: name for DDR configuration, simple string for information
> @@ -24,7 +27,7 @@ controlleur attributes:
>  -----------------------
>  - st,ctl-reg	: controleur values depending of the DDR type
>  		  (DDR3/LPDDR2/LPDDR3)
> -	for STM32MP15x: 25 values are requested in this order
> +	for STM32MP15x and STM32MP13x: 25 values are requested in this order
>  		MSTR
>  		MRCTRL0
>  		MRCTRL1
> @@ -53,7 +56,7 @@ controlleur attributes:
>  
>  - st,ctl-timing	: controleur values depending of frequency and timing parameter
>  		  of DDR
> -	for STM32MP15x: 12 values are requested in this order
> +	for STM32MP15x and STM32MP13x: 12 values are requested in this order
>  		RFSHTMG
>  		DRAMTMG0
>  		DRAMTMG1
> @@ -68,7 +71,7 @@ controlleur attributes:
>  		ODTCFG
>  
>  - st,ctl-map	: controleur values depending of address mapping
> -	for STM32MP15x: 9 values are requested in this order
> +	for STM32MP15x and STM32MP13x: 9 values are requested in this order
>  		ADDRMAP1
>  		ADDRMAP2
>  		ADDRMAP3
> @@ -99,6 +102,19 @@ controlleur attributes:
>  		PCFGWQOS0_1
>  		PCFGWQOS1_1
>  
> +	for STM32MP13x: 11 values are requested in this order
> +		SCHED
> +		SCHED1
> +		PERFHPR1
> +		PERFLPR1
> +		PERFWR1
> +		PCFGR_0
> +		PCFGW_0
> +		PCFGQOS0_0
> +		PCFGQOS1_0
> +		PCFGWQOS0_0
> +		PCFGWQOS1_0
> +
>  phyc attributes:
>  ----------------
>  - st,phy-reg	: phy values depending of the DDR type (DDR3/LPDDR2/LPDDR3)
> @@ -115,8 +131,19 @@ phyc attributes:
>  		DX2GCR
>  		DX3GCR
>  
> +	for STM32MP13x: 9 values are requested in this order
> +		PGCR
> +		ACIOCR
> +		DXCCR
> +		DSGCR
> +		DCR
> +		ODTCR
> +		ZQ0CR1
> +		DX0GCR
> +		DX1GCR
> +
>  - st,phy-timing	: phy values depending of frequency and timing parameter of DDR
> -	for STM32MP15x: 10 values are requested in this order
> +	for STM32MP15x and STM32MP13x: 10 values are requested in this order
>  		PTR0
>  		PTR1
>  		PTR2
> @@ -128,16 +155,18 @@ phyc attributes:
>  		MR2
>  		MR3
>  
> +	for STM32MP13x: 6 values are requested in this order
> +		DX0DLLCR
> +		DX0DQTR
> +		DX0DQSTR
> +		DX1DLLCR
> +		DX1DQTR
> +		DX1DQSTR
>  Example:
>  
>  / {
>  	soc {
> -		u-boot,dm-spl;
> -
>  		ddr: ddr@0x5A003000{
> -			u-boot,dm-spl;
> -			u-boot,dm-pre-reloc;
> -
>  			compatible = "st,stm32mp1-ddr";
>  
>  			reg = <0x5A003000 0x550
> diff --git a/drivers/ram/stm32mp1/stm32mp1_ram.c b/drivers/ram/stm32mp1/stm32mp1_ram.c
> index 49b1262461..a6c19af972 100644
> --- a/drivers/ram/stm32mp1/stm32mp1_ram.c
> +++ b/drivers/ram/stm32mp1/stm32mp1_ram.c
> @@ -230,29 +230,29 @@ static u8 get_nb_col(struct stm32mp1_ddrctl *ctl, u8 data_bus_width)
>  
>  	reg = readl(&ctl->addrmap3);
>  	/* addrmap3.addrmap_col_b6 */
> -	val = (reg & GENMASK(3, 0)) >> 0;
> +	val = (reg & GENMASK(4, 0)) >> 0;
>  	if (val <= 7)
>  		bits++;
>  	/* addrmap3.addrmap_col_b7 */
> -	val = (reg & GENMASK(11, 8)) >> 8;
> +	val = (reg & GENMASK(12, 8)) >> 8;
>  	if (val <= 7)
>  		bits++;
>  	/* addrmap3.addrmap_col_b8 */
> -	val = (reg & GENMASK(19, 16)) >> 16;
> +	val = (reg & GENMASK(20, 16)) >> 16;
>  	if (val <= 7)
>  		bits++;
>  	/* addrmap3.addrmap_col_b9 */
> -	val = (reg & GENMASK(27, 24)) >> 24;
> +	val = (reg & GENMASK(28, 24)) >> 24;
>  	if (val <= 7)
>  		bits++;
>  
>  	reg = readl(&ctl->addrmap4);
>  	/* addrmap4.addrmap_col_b10 */
> -	val = (reg & GENMASK(3, 0)) >> 0;
> +	val = (reg & GENMASK(4, 0)) >> 0;
>  	if (val <= 7)
>  		bits++;
>  	/* addrmap4.addrmap_col_b11 */
> -	val = (reg & GENMASK(11, 8)) >> 8;
> +	val = (reg & GENMASK(12, 8)) >> 8;
>  	if (val <= 7)
>  		bits++;
>  
> @@ -296,21 +296,24 @@ static u8 get_nb_row(struct stm32mp1_ddrctl *ctl)
>  	reg = readl(&ctl->addrmap6);
>  	/* addrmap6.addrmap_row_b12 */
>  	val = (reg & GENMASK(3, 0)) >> 0;
> -	if (val <= 7)
> +	if (val <= 11)
>  		bits++;
>  	/* addrmap6.addrmap_row_b13 */
>  	val = (reg & GENMASK(11, 8)) >> 8;
> -	if (val <= 7)
> +	if (val <= 11)
>  		bits++;
>  	/* addrmap6.addrmap_row_b14 */
>  	val = (reg & GENMASK(19, 16)) >> 16;
> -	if (val <= 7)
> +	if (val <= 11)
>  		bits++;
>  	/* addrmap6.addrmap_row_b15 */
>  	val = (reg & GENMASK(27, 24)) >> 24;
> -	if (val <= 7)
> +	if (val <= 11)
>  		bits++;
>  
> +	if (reg & BIT(31))
> +		printf("warning: LPDDR3_6GB_12GB is not supported\n");
> +
>  	return bits;
>  }
>  
> @@ -392,12 +395,17 @@ static struct ram_ops stm32mp1_ddr_ops = {
>  	.get_info = stm32mp1_ddr_get_info,
>  };
>  
> +static const struct stm32mp1_ddr_cfg stm32mp13x_ddr_cfg = {
> +	.nb_bytes = 2,
> +};
> +
>  static const struct stm32mp1_ddr_cfg stm32mp15x_ddr_cfg = {
>  	.nb_bytes = 4,
>  };
>  
>  static const struct udevice_id stm32mp1_ddr_ids[] = {
>  	{ .compatible = "st,stm32mp1-ddr", .data = (ulong)&stm32mp15x_ddr_cfg},
> +	{ .compatible = "st,stm32mp13-ddr", .data = (ulong)&stm32mp13x_ddr_cfg},
>  	{ }
>  };
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
