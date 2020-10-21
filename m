Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A605C294CAF
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:34:32 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F70FC3FAE0;
	Wed, 21 Oct 2020 12:34:32 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0EA8C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:34:29 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LCS7wE019797; Wed, 21 Oct 2020 14:34:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=DQBbnYOgxRdo01HmBuU4/zmRZVxJpx2csUX6TtYXibM=;
 b=c162wGuIRVhbVWwspW3Nkgnt5ElQmZZMjngbEssTOUyVH+uzDCyv02lABxN8WasUZtiF
 inQhxxg1385mvkEafOhBligEFuJPtpCyL8WuHPrOw6i1ahqTO7dJfitdwDGN278tcALk
 ZwskzCBkKIaNCCd2D791XHQ5sOcDImARhjdTxNrrZeFJNHgTl/fvd3FqXAIct0zMhPeV
 YZlNy2npArhBI3c1kJgay3qkFNAKtL1H+ZbGXj46CxgtxpEjN6BXLKzG2qOUB5zLkp01
 g94rHUIEdHDi4gNLFR3HHAEjGrdPXbvnoPq69N9nMgbEanpAPrdrgEmHNO16haxcbjUj Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx20xy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:34:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A233D100034;
 Wed, 21 Oct 2020 14:34:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99D3A2E9C8A;
 Wed, 21 Oct 2020 14:34:28 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:34:28 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:34:28 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 26/33] mtd: stm32_fmc2: migrate trace to dev and log macro
Thread-Index: AQHWogrOitgL7LOV40qxjQYMluvKu6mh52iA
Date: Wed, 21 Oct 2020 12:34:28 +0000
Message-ID: <b25a8c6e-f9b4-a01a-0992-540eb328c4a9@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-27-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-27-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <81E48810233EDF43A5BA49735DD042A6@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Uboot-stm32] [PATCH 26/33] mtd: stm32_fmc2: migrate trace to
	dev and log macro
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

On 10/14/20 11:16 AM, Patrick Delaunay wrote:
> Change pr_* to dev_ or log_ macro and define LOG_CATEGORY.
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 40 ++++++++++++--------------
>  1 file changed, 19 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 47fe61090d..9624583b8c 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -4,12 +4,15 @@
>   * Author: Christophe Kerello <christophe.kerello@st.com>
>   */
>  
> +#define LOG_CATEGORY UCLASS_MTD
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <dm.h>
>  #include <log.h>
>  #include <nand.h>
>  #include <reset.h>
> +#include <dm/device_compat.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
> @@ -324,7 +327,7 @@ static int stm32_fmc2_nfc_ham_calculate(struct mtd_info *mtd, const u8 *data,
>  	ret = readl_poll_timeout(nfc->io_base + FMC2_SR, sr,
>  				 sr & FMC2_SR_NWRF, FMC2_TIMEOUT_5S);
>  	if (ret < 0) {
> -		pr_err("Ham timeout\n");
> +		log_err("Ham timeout\n");
>  		return ret;
>  	}
>  
> @@ -409,7 +412,7 @@ static int stm32_fmc2_nfc_bch_calculate(struct mtd_info *mtd, const u8 *data,
>  	ret = readl_poll_timeout(nfc->io_base + FMC2_BCHISR, bchisr,
>  				 bchisr & FMC2_BCHISR_EPBRF, FMC2_TIMEOUT_5S);
>  	if (ret < 0) {
> -		pr_err("Bch timeout\n");
> +		log_err("Bch timeout\n");
>  		return ret;
>  	}
>  
> @@ -457,7 +460,7 @@ static int stm32_fmc2_nfc_bch_correct(struct mtd_info *mtd, u8 *dat,
>  	ret = readl_poll_timeout(nfc->io_base + FMC2_BCHISR, bchisr,
>  				 bchisr & FMC2_BCHISR_DERF, FMC2_TIMEOUT_5S);
>  	if (ret < 0) {
> -		pr_err("Bch timeout\n");
> +		log_err("Bch timeout\n");
>  		return ret;
>  	}
>  
> @@ -795,26 +798,24 @@ static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc, ofnode node)
>  
>  	nand->ncs /= sizeof(u32);
>  	if (!nand->ncs) {
> -		pr_err("Invalid reg property size\n");
> +		log_err("Invalid reg property size\n");
>  		return -EINVAL;
>  	}
>  
>  	ret = ofnode_read_u32_array(node, "reg", cs, nand->ncs);
>  	if (ret < 0) {
> -		pr_err("Could not retrieve reg property\n");
> +		log_err("Could not retrieve reg property\n");
>  		return -EINVAL;
>  	}
>  
>  	for (i = 0; i < nand->ncs; i++) {
>  		if (cs[i] >= FMC2_MAX_CE) {
> -			pr_err("Invalid reg value: %d\n",
> -			       nand->cs_used[i]);
> +			log_err("Invalid reg value: %d\n", nand->cs_used[i]);
>  			return -EINVAL;
>  		}
>  
>  		if (nfc->cs_assigned & BIT(cs[i])) {
> -			pr_err("Cs already assigned: %d\n",
> -			       nand->cs_used[i]);
> +			log_err("Cs already assigned: %d\n", nand->cs_used[i]);
>  			return -EINVAL;
>  		}
>  
> @@ -837,12 +838,12 @@ static int stm32_fmc2_nfc_parse_dt(struct udevice *dev,
>  		nchips++;
>  
>  	if (!nchips) {
> -		pr_err("NAND chip not defined\n");
> +		log_err("NAND chip not defined\n");
>  		return -EINVAL;
>  	}
>  
>  	if (nchips > 1) {
> -		pr_err("Too many NAND chips defined\n");
> +		log_err("Too many NAND chips defined\n");
>  		return -EINVAL;
>  	}
>  
> @@ -918,24 +919,21 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  
>  		addr = dev_read_addr_index(dev, mem_region);
>  		if (addr == FDT_ADDR_T_NONE) {
> -			pr_err("Resource data_base not found for cs%d",
> -			       chip_cs);
> +			dev_err(dev, "Resource data_base not found for cs%d", chip_cs);
>  			return ret;
>  		}
>  		nfc->data_base[chip_cs] = addr;
>  
>  		addr = dev_read_addr_index(dev, mem_region + 1);
>  		if (addr == FDT_ADDR_T_NONE) {
> -			pr_err("Resource cmd_base not found for cs%d",
> -			       chip_cs);
> +			dev_err(dev, "Resource cmd_base not found for cs%d", chip_cs);
>  			return ret;
>  		}
>  		nfc->cmd_base[chip_cs] = addr;
>  
>  		addr = dev_read_addr_index(dev, mem_region + 2);
>  		if (addr == FDT_ADDR_T_NONE) {
> -			pr_err("Resource addr_base not found for cs%d",
> -			       chip_cs);
> +			dev_err(dev, "Resource addr_base not found for cs%d", chip_cs);
>  			return ret;
>  		}
>  		nfc->addr_base[chip_cs] = addr;
> @@ -985,14 +983,14 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  	 * ECC sector size = 512
>  	 */
>  	if (chip->ecc.mode != NAND_ECC_HW) {
> -		pr_err("Nand_ecc_mode is not well defined in the DT\n");
> +		dev_err(dev, "Nand_ecc_mode is not well defined in the DT\n");
>  		return -EINVAL;
>  	}
>  
>  	ret = nand_check_ecc_caps(chip, &stm32_fmc2_nfc_ecc_caps,
>  				  mtd->oobsize - FMC2_BBM_LEN);
>  	if (ret) {
> -		pr_err("No valid ECC settings set\n");
> +		dev_err(dev, "No valid ECC settings set\n");
>  		return ret;
>  	}
>  
> @@ -1045,6 +1043,6 @@ void board_nand_init(void)
>  					  DM_GET_DRIVER(stm32_fmc2_nfc),
>  					  &dev);
>  	if (ret && ret != -ENODEV)
> -		pr_err("Failed to initialize STM32 FMC2 NFC controller. (error %d)\n",
> -		       ret);
> +		log_err("Failed to initialize STM32 FMC2 NFC controller. (error %d)\n",
> +			ret);
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
