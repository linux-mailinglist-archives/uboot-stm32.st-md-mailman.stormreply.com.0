Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D33243506
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:33:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AC05C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 07:33:50 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2296FC36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 07:33:49 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D2MrJi022523; Thu, 13 Aug 2020 09:33:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=BM5wMLKjPyUQvFP/viBGtFCDKbQ99t9bK8E6ORaI5DY=;
 b=x1+4W6uKNCyEJuxKORrkS9FTWB43OQBAeSnbPtmQllt6qrxkODpTrt4RtL4obc1iMzLD
 vy22wGrCbkZR0IHTRPzVRd26ru6uK+3URDwZXIIgWnui2dUkCs5FGfMEqBDwE3GKLxVp
 5ICnI+YkJnUn8E5ltN5nxIc8E3Z+yfUMy0sXZ9B+PjDKdRzdFig//xXHrGssHl8si9ZV
 FEKJsb6uCKm1wmeeuaurvddZ205JdaoPIxf2lk3Dn+yfERRXHQst+Ikr9y+WWnK+dAZu
 Ba0XNDKMU66REkZnfb4q4siHr9wxkZUA1rSOFHDeX1otl/Je/qCOmAD40msd3btliC+C IQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32uj532yb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 09:33:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 226B410002A;
 Thu, 13 Aug 2020 09:33:47 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 17E1B21FE8D;
 Thu, 13 Aug 2020 09:33:47 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE2.st.com
 (10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 09:33:46 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 09:33:46 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe KERELLO <christophe.kerello@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 08/11] mtd: rawnand: stm32_fmc2: get resources from
 parent node
Thread-Index: AQHWZw/nvp5rmU7BqUOATTNo+Lk9Uqk1mIAA
Date: Thu, 13 Aug 2020 07:33:46 +0000
Message-ID: <176b40b0-0287-f5bc-98f5-6b7ee6e45648@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
 <1596182024-18181-9-git-send-email-christophe.kerello@st.com>
In-Reply-To: <1596182024-18181-9-git-send-email-christophe.kerello@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <B5008F018ECF1A428FBB78163412D54C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_02:2020-08-11,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 08/11] mtd: rawnand: stm32_fmc2: get
 resources from parent node
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

Hi Christophe

On 7/31/20 9:53 AM, Christophe Kerello wrote:
> FMC2 EBI support has been added. Common resources (registers base
> address and clock) can now be shared between the 2 drivers using
> "st,stm32mp1-fmc2-nfc" compatible string. It means that the
> common resources should now be found in the parent device when EBI
> node is available.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 87 +++++++++++++++++++++++-----------
>  1 file changed, 59 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 1e4d757..47fe610 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -158,10 +158,10 @@ struct stm32_fmc2_nfc {
>  	struct nand_hw_control base;
>  	struct stm32_fmc2_nand nand;
>  	struct nand_ecclayout ecclayout;
> -	void __iomem *io_base;
> -	void __iomem *data_base[FMC2_MAX_CE];
> -	void __iomem *cmd_base[FMC2_MAX_CE];
> -	void __iomem *addr_base[FMC2_MAX_CE];
> +	fdt_addr_t io_base;
> +	fdt_addr_t data_base[FMC2_MAX_CE];
> +	fdt_addr_t cmd_base[FMC2_MAX_CE];
> +	fdt_addr_t addr_base[FMC2_MAX_CE];
>  	struct clk clk;
>  
>  	u8 cs_assigned;
> @@ -241,8 +241,8 @@ static void stm32_fmc2_nfc_select_chip(struct mtd_info *mtd, int chipnr)
>  		return;
>  
>  	nfc->cs_sel = nand->cs_used[chipnr];
> -	chip->IO_ADDR_R = nfc->data_base[nfc->cs_sel];
> -	chip->IO_ADDR_W = nfc->data_base[nfc->cs_sel];
> +	chip->IO_ADDR_R = (void __iomem *)nfc->data_base[nfc->cs_sel];
> +	chip->IO_ADDR_W = (void __iomem *)nfc->data_base[nfc->cs_sel];
>  
>  	stm32_fmc2_nfc_setup(chip);
>  	stm32_fmc2_nfc_timings_init(chip);
> @@ -548,7 +548,7 @@ static int stm32_fmc2_nfc_read_page(struct mtd_info *mtd,
>  	return max_bitflips;
>  }
>  
> -static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
> +static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc, bool has_parent)
>  {
>  	u32 pcr = readl(nfc->io_base + FMC2_PCR);
>  
> @@ -581,7 +581,8 @@ static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
>  	pcr |= FIELD_PREP(FMC2_PCR_TAR, FMC2_PCR_TAR_DEFAULT);
>  
>  	/* Enable FMC2 controller */
> -	setbits_le32(nfc->io_base + FMC2_BCR1, FMC2_BCR1_FMC2EN);
> +	if (!has_parent)
> +		setbits_le32(nfc->io_base + FMC2_BCR1, FMC2_BCR1_FMC2EN);
>  
>  	writel(pcr, nfc->io_base + FMC2_PCR);
>  	writel(FMC2_PMEM_DEFAULT, nfc->io_base + FMC2_PMEM);
> @@ -854,6 +855,30 @@ static int stm32_fmc2_nfc_parse_dt(struct udevice *dev,
>  	return 0;
>  }
>  
> +static struct udevice *stm32_fmc2_nfc_get_cdev(struct udevice *dev)
> +{
> +	struct udevice *pdev = dev_get_parent(dev);
> +	struct udevice *cdev = NULL;
> +	bool ebi_found = false;
> +
> +	if (pdev && ofnode_device_is_compatible(dev_ofnode(pdev),
> +						"st,stm32mp1-fmc2-ebi"))
> +		ebi_found = true;
> +
> +	if (ofnode_device_is_compatible(dev_ofnode(dev),
> +					"st,stm32mp1-fmc2-nfc")) {
> +		if (ebi_found)
> +			cdev = pdev;
> +
> +		return cdev;
> +	}
> +
> +	if (!ebi_found)
> +		cdev = dev;
> +
> +	return cdev;
> +}
> +
>  static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  {
>  	struct stm32_fmc2_nfc *nfc = dev_get_priv(dev);
> @@ -861,58 +886,63 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  	struct nand_chip *chip = &nand->chip;
>  	struct mtd_info *mtd = &chip->mtd;
>  	struct nand_ecclayout *ecclayout;
> -	struct resource resource;
> +	struct udevice *cdev;
>  	struct reset_ctl reset;
>  	int oob_index, chip_cs, mem_region, ret;
>  	unsigned int i;
> +	int start_region = 0;
> +	fdt_addr_t addr;
>  
>  	spin_lock_init(&nfc->controller.lock);
>  	init_waitqueue_head(&nfc->controller.wq);
>  
> +	cdev = stm32_fmc2_nfc_get_cdev(dev);
> +	if (!cdev)
> +		return -EINVAL;
> +
>  	ret = stm32_fmc2_nfc_parse_dt(dev, nfc);
>  	if (ret)
>  		return ret;
>  
> -	/* Get resources */
> -	ret = dev_read_resource(dev, 0, &resource);
> -	if (ret) {
> -		pr_err("Resource io_base not found");
> -		return ret;
> -	}
> -	nfc->io_base = (void __iomem *)resource.start;
> +	nfc->io_base = dev_read_addr(cdev);
> +	if (nfc->io_base == FDT_ADDR_T_NONE)
> +		return -EINVAL;
> +
> +	if (dev == cdev)
> +		start_region = 1;
>  
> -	for (chip_cs = 0, mem_region = 1; chip_cs < FMC2_MAX_CE;
> +	for (chip_cs = 0, mem_region = start_region; chip_cs < FMC2_MAX_CE;
>  	     chip_cs++, mem_region += 3) {
>  		if (!(nfc->cs_assigned & BIT(chip_cs)))
>  			continue;
>  
> -		ret = dev_read_resource(dev, mem_region, &resource);
> -		if (ret) {
> +		addr = dev_read_addr_index(dev, mem_region);
> +		if (addr == FDT_ADDR_T_NONE) {
>  			pr_err("Resource data_base not found for cs%d",
>  			       chip_cs);
>  			return ret;
>  		}
> -		nfc->data_base[chip_cs] = (void __iomem *)resource.start;
> +		nfc->data_base[chip_cs] = addr;
>  
> -		ret = dev_read_resource(dev, mem_region + 1, &resource);
> -		if (ret) {
> +		addr = dev_read_addr_index(dev, mem_region + 1);
> +		if (addr == FDT_ADDR_T_NONE) {
>  			pr_err("Resource cmd_base not found for cs%d",
>  			       chip_cs);
>  			return ret;
>  		}
> -		nfc->cmd_base[chip_cs] = (void __iomem *)resource.start;
> +		nfc->cmd_base[chip_cs] = addr;
>  
> -		ret = dev_read_resource(dev, mem_region + 2, &resource);
> -		if (ret) {
> +		addr = dev_read_addr_index(dev, mem_region + 2);
> +		if (addr == FDT_ADDR_T_NONE) {
>  			pr_err("Resource addr_base not found for cs%d",
>  			       chip_cs);
>  			return ret;
>  		}
> -		nfc->addr_base[chip_cs] = (void __iomem *)resource.start;
> +		nfc->addr_base[chip_cs] = addr;
>  	}
>  
>  	/* Enable the clock */
> -	ret = clk_get_by_index(dev, 0, &nfc->clk);
> +	ret = clk_get_by_index(cdev, 0, &nfc->clk);
>  	if (ret)
>  		return ret;
>  
> @@ -928,7 +958,7 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  		reset_deassert(&reset);
>  	}
>  
> -	stm32_fmc2_nfc_init(nfc);
> +	stm32_fmc2_nfc_init(nfc, dev != cdev);
>  
>  	chip->controller = &nfc->base;
>  	chip->select_chip = stm32_fmc2_nfc_select_chip;
> @@ -994,6 +1024,7 @@ static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  
>  static const struct udevice_id stm32_fmc2_nfc_match[] = {
>  	{ .compatible = "st,stm32mp15-fmc2" },
> +	{ .compatible = "st,stm32mp1-fmc2-nfc" },
>  	{ /* Sentinel */ }
>  };
>  

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks

Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
