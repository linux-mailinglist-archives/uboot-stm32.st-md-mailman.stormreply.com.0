Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C2243811
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 11:57:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71726C36B24
	for <lists+uboot-stm32@lfdr.de>; Thu, 13 Aug 2020 09:57:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8EF3C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Aug 2020 09:57:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D9puiw005571; Thu, 13 Aug 2020 11:57:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Hkzi54sR38tP8/6VlHukSS41G3cab00eveJAf+VHjj8=;
 b=IEb2atvaU+UxAx1QvSMMNaZifzj/zjBIS58anzk0yEGIyfpt6H9oghZ0ldRbd9MHl9PH
 cOTKpmDWXOfPk/pbWezfiGWHg9PTfjSEeGSqk00wbt6VlEKEimPj2HCRHcwY+uUyDPlA
 Uk2HdftFv9Tau4sfPKGRrnaWqb0QRHuBFkqpozli4ZMgD4FbpiFlaBFv1C2t2bvwo8op
 XCI9RyFmB1itLUOoBG/Q3JNX+lzwcrOYkVHZlpdGoxiTo1JHn8H/n0USgjG/Bxd5tT7V
 ztwrRgy6Y3JnmwEwk6L0xw6YnYYGF5rljD4Zy58V1VA720v4z5sDCYScusOhEb25VKvE 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32sm9rnyr9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 11:57:16 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7B94410002A;
 Thu, 13 Aug 2020 11:57:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 71BCA205CF5;
 Thu, 13 Aug 2020 11:57:15 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE1.st.com
 (10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 13 Aug
 2020 11:57:14 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Thu, 13 Aug 2020 11:57:14 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Christophe KERELLO <christophe.kerello@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 04/11] mtd: rawnand: stm32_fmc2: cosmetic change to use
 nfc instead of fmc2 where relevant
Thread-Index: AQHWZw/gQsrVBHhiRE6F/ETuihAORqk1wJYA
Date: Thu, 13 Aug 2020 09:57:14 +0000
Message-ID: <028d6f90-0360-76df-7b24-8b822904d3eb@st.com>
References: <1596182024-18181-1-git-send-email-christophe.kerello@st.com>
 <1596182024-18181-5-git-send-email-christophe.kerello@st.com>
In-Reply-To: <1596182024-18181-5-git-send-email-christophe.kerello@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <8B51A67021FBE14BBD3939CB7BD6FC91@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH 04/11] mtd: rawnand: stm32_fmc2: cosmetic
 change to use nfc instead of fmc2 where relevant
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


On 7/31/20 9:53 AM, Christophe Kerello wrote:
> This patch renames functions and local variables.
> This cleanup is done to get all functions starting by stm32_fmc2_nfc
> in the FMC2 raw NAND driver when all functions will start by
> stm32_fmc2_ebi in the FMC2 EBI driver.
>
> Signed-off-by: Christophe Kerello <christophe.kerello@st.com>
> ---
>
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 263 ++++++++++++++++-----------------
>  1 file changed, 131 insertions(+), 132 deletions(-)

Applied on u-boot-stm/master

Thanks

>
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 2e947a3..9718bae 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -181,12 +181,12 @@ static inline struct stm32_fmc2_nfc *to_stm32_nfc(struct nand_hw_control *base)
>  	return container_of(base, struct stm32_fmc2_nfc, base);
>  }
>  
> -static void stm32_fmc2_timings_init(struct nand_chip *chip)
> +static void stm32_fmc2_nfc_timings_init(struct nand_chip *chip)
>  {
> -	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
> +	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
>  	struct stm32_fmc2_nand *nand = to_fmc2_nand(chip);
>  	struct stm32_fmc2_timings *timings = &nand->timings;
> -	u32 pcr = readl(fmc2->io_base + FMC2_PCR);
> +	u32 pcr = readl(nfc->io_base + FMC2_PCR);
>  	u32 pmem, patt;
>  
>  	/* Set tclr/tar timings */
> @@ -207,15 +207,15 @@ static void stm32_fmc2_timings_init(struct nand_chip *chip)
>  	patt |= FMC2_PATT_ATTHOLD(timings->thold_att);
>  	patt |= FMC2_PATT_ATTHIZ(timings->thiz);
>  
> -	writel(pcr, fmc2->io_base + FMC2_PCR);
> -	writel(pmem, fmc2->io_base + FMC2_PMEM);
> -	writel(patt, fmc2->io_base + FMC2_PATT);
> +	writel(pcr, nfc->io_base + FMC2_PCR);
> +	writel(pmem, nfc->io_base + FMC2_PMEM);
> +	writel(patt, nfc->io_base + FMC2_PATT);
>  }
>  
> -static void stm32_fmc2_setup(struct nand_chip *chip)
> +static void stm32_fmc2_nfc_setup(struct nand_chip *chip)
>  {
> -	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
> -	u32 pcr = readl(fmc2->io_base + FMC2_PCR);
> +	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
> +	u32 pcr = readl(nfc->io_base + FMC2_PCR);
>  
>  	/* Configure ECC algorithm (default configuration is Hamming) */
>  	pcr &= ~FMC2_PCR_ECCALG;
> @@ -236,95 +236,96 @@ static void stm32_fmc2_setup(struct nand_chip *chip)
>  	pcr &= ~FMC2_PCR_ECCSS_MASK;
>  	pcr |= FMC2_PCR_ECCSS(FMC2_PCR_ECCSS_512);
>  
> -	writel(pcr, fmc2->io_base + FMC2_PCR);
> +	writel(pcr, nfc->io_base + FMC2_PCR);
>  }
>  
> -static void stm32_fmc2_select_chip(struct mtd_info *mtd, int chipnr)
> +static void stm32_fmc2_nfc_select_chip(struct mtd_info *mtd, int chipnr)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
> +	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
>  	struct stm32_fmc2_nand *nand = to_fmc2_nand(chip);
>  
>  	if (chipnr < 0 || chipnr >= nand->ncs)
>  		return;
>  
> -	if (nand->cs_used[chipnr] == fmc2->cs_sel)
> +	if (nand->cs_used[chipnr] == nfc->cs_sel)
>  		return;
>  
> -	fmc2->cs_sel = nand->cs_used[chipnr];
> -	chip->IO_ADDR_R = fmc2->data_base[fmc2->cs_sel];
> -	chip->IO_ADDR_W = fmc2->data_base[fmc2->cs_sel];
> +	nfc->cs_sel = nand->cs_used[chipnr];
> +	chip->IO_ADDR_R = nfc->data_base[nfc->cs_sel];
> +	chip->IO_ADDR_W = nfc->data_base[nfc->cs_sel];
>  
> -	stm32_fmc2_setup(chip);
> -	stm32_fmc2_timings_init(chip);
> +	stm32_fmc2_nfc_setup(chip);
> +	stm32_fmc2_nfc_timings_init(chip);
>  }
>  
> -static void stm32_fmc2_set_buswidth_16(struct stm32_fmc2_nfc *fmc2, bool set)
> +static void stm32_fmc2_nfc_set_buswidth_16(struct stm32_fmc2_nfc *nfc,
> +					   bool set)
>  {
> -	u32 pcr = readl(fmc2->io_base + FMC2_PCR);
> +	u32 pcr = readl(nfc->io_base + FMC2_PCR);
>  
>  	pcr &= ~FMC2_PCR_PWID_MASK;
>  	if (set)
>  		pcr |= FMC2_PCR_PWID(FMC2_PCR_PWID_BUSWIDTH_16);
> -	writel(pcr, fmc2->io_base + FMC2_PCR);
> +	writel(pcr, nfc->io_base + FMC2_PCR);
>  }
>  
> -static void stm32_fmc2_set_ecc(struct stm32_fmc2_nfc *fmc2, bool enable)
> +static void stm32_fmc2_nfc_set_ecc(struct stm32_fmc2_nfc *nfc, bool enable)
>  {
> -	u32 pcr = readl(fmc2->io_base + FMC2_PCR);
> +	u32 pcr = readl(nfc->io_base + FMC2_PCR);
>  
>  	pcr &= ~FMC2_PCR_ECCEN;
>  	if (enable)
>  		pcr |= FMC2_PCR_ECCEN;
> -	writel(pcr, fmc2->io_base + FMC2_PCR);
> +	writel(pcr, nfc->io_base + FMC2_PCR);
>  }
>  
> -static inline void stm32_fmc2_clear_bch_irq(struct stm32_fmc2_nfc *fmc2)
> +static void stm32_fmc2_nfc_clear_bch_irq(struct stm32_fmc2_nfc *nfc)
>  {
> -	writel(FMC2_BCHICR_CLEAR_IRQ, fmc2->io_base + FMC2_BCHICR);
> +	writel(FMC2_BCHICR_CLEAR_IRQ, nfc->io_base + FMC2_BCHICR);
>  }
>  
> -static void stm32_fmc2_cmd_ctrl(struct mtd_info *mtd, int cmd,
> -				unsigned int ctrl)
> +static void stm32_fmc2_nfc_cmd_ctrl(struct mtd_info *mtd, int cmd,
> +				    unsigned int ctrl)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
> +	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
>  
>  	if (cmd == NAND_CMD_NONE)
>  		return;
>  
>  	if (ctrl & NAND_CLE) {
> -		writeb(cmd, fmc2->cmd_base[fmc2->cs_sel]);
> +		writeb(cmd, nfc->cmd_base[nfc->cs_sel]);
>  		return;
>  	}
>  
> -	writeb(cmd, fmc2->addr_base[fmc2->cs_sel]);
> +	writeb(cmd, nfc->addr_base[nfc->cs_sel]);
>  }
>  
>  /*
>   * Enable ECC logic and reset syndrome/parity bits previously calculated
>   * Syndrome/parity bits is cleared by setting the ECCEN bit to 0
>   */
> -static void stm32_fmc2_hwctl(struct mtd_info *mtd, int mode)
> +static void stm32_fmc2_nfc_hwctl(struct mtd_info *mtd, int mode)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
> +	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
>  
> -	stm32_fmc2_set_ecc(fmc2, false);
> +	stm32_fmc2_nfc_set_ecc(nfc, false);
>  
>  	if (chip->ecc.strength != FMC2_ECC_HAM) {
> -		u32 pcr = readl(fmc2->io_base + FMC2_PCR);
> +		u32 pcr = readl(nfc->io_base + FMC2_PCR);
>  
>  		if (mode == NAND_ECC_WRITE)
>  			pcr |= FMC2_PCR_WEN;
>  		else
>  			pcr &= ~FMC2_PCR_WEN;
> -		writel(pcr, fmc2->io_base + FMC2_PCR);
> +		writel(pcr, nfc->io_base + FMC2_PCR);
>  
> -		stm32_fmc2_clear_bch_irq(fmc2);
> +		stm32_fmc2_nfc_clear_bch_irq(nfc);
>  	}
>  
> -	stm32_fmc2_set_ecc(fmc2, true);
> +	stm32_fmc2_nfc_set_ecc(nfc, true);
>  }
>  
>  /*
> @@ -332,34 +333,34 @@ static void stm32_fmc2_hwctl(struct mtd_info *mtd, int mode)
>   * ECC is 3 bytes for 512 bytes of data (supports error correction up to
>   * max of 1-bit)
>   */
> -static int stm32_fmc2_ham_calculate(struct mtd_info *mtd, const u8 *data,
> -				    u8 *ecc)
> +static int stm32_fmc2_nfc_ham_calculate(struct mtd_info *mtd, const u8 *data,
> +					u8 *ecc)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
> +	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
>  	u32 heccr, sr;
>  	int ret;
>  
> -	ret = readl_poll_timeout(fmc2->io_base + FMC2_SR, sr,
> +	ret = readl_poll_timeout(nfc->io_base + FMC2_SR, sr,
>  				 sr & FMC2_SR_NWRF, FMC2_TIMEOUT_5S);
>  	if (ret < 0) {
>  		pr_err("Ham timeout\n");
>  		return ret;
>  	}
>  
> -	heccr = readl(fmc2->io_base + FMC2_HECCR);
> +	heccr = readl(nfc->io_base + FMC2_HECCR);
>  
>  	ecc[0] = heccr;
>  	ecc[1] = heccr >> 8;
>  	ecc[2] = heccr >> 16;
>  
> -	stm32_fmc2_set_ecc(fmc2, false);
> +	stm32_fmc2_nfc_set_ecc(nfc, false);
>  
>  	return 0;
>  }
>  
> -static int stm32_fmc2_ham_correct(struct mtd_info *mtd, u8 *dat,
> -				  u8 *read_ecc, u8 *calc_ecc)
> +static int stm32_fmc2_nfc_ham_correct(struct mtd_info *mtd, u8 *dat,
> +				      u8 *read_ecc, u8 *calc_ecc)
>  {
>  	u8 bit_position = 0, b0, b1, b2;
>  	u32 byte_addr = 0, b;
> @@ -416,16 +417,16 @@ static int stm32_fmc2_ham_correct(struct mtd_info *mtd, u8 *dat,
>   * max of 4-bit/8-bit)
>   */
>  
> -static int stm32_fmc2_bch_calculate(struct mtd_info *mtd, const u8 *data,
> -				    u8 *ecc)
> +static int stm32_fmc2_nfc_bch_calculate(struct mtd_info *mtd, const u8 *data,
> +					u8 *ecc)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
> +	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
>  	u32 bchpbr, bchisr;
>  	int ret;
>  
>  	/* Wait until the BCH code is ready */
> -	ret = readl_poll_timeout(fmc2->io_base + FMC2_BCHISR, bchisr,
> +	ret = readl_poll_timeout(nfc->io_base + FMC2_BCHISR, bchisr,
>  				 bchisr & FMC2_BCHISR_EPBRF, FMC2_TIMEOUT_5S);
>  	if (ret < 0) {
>  		pr_err("Bch timeout\n");
> @@ -433,13 +434,13 @@ static int stm32_fmc2_bch_calculate(struct mtd_info *mtd, const u8 *data,
>  	}
>  
>  	/* Read parity bits */
> -	bchpbr = readl(fmc2->io_base + FMC2_BCHPBR1);
> +	bchpbr = readl(nfc->io_base + FMC2_BCHPBR1);
>  	ecc[0] = bchpbr;
>  	ecc[1] = bchpbr >> 8;
>  	ecc[2] = bchpbr >> 16;
>  	ecc[3] = bchpbr >> 24;
>  
> -	bchpbr = readl(fmc2->io_base + FMC2_BCHPBR2);
> +	bchpbr = readl(nfc->io_base + FMC2_BCHPBR2);
>  	ecc[4] = bchpbr;
>  	ecc[5] = bchpbr >> 8;
>  	ecc[6] = bchpbr >> 16;
> @@ -447,46 +448,46 @@ static int stm32_fmc2_bch_calculate(struct mtd_info *mtd, const u8 *data,
>  	if (chip->ecc.strength == FMC2_ECC_BCH8) {
>  		ecc[7] = bchpbr >> 24;
>  
> -		bchpbr = readl(fmc2->io_base + FMC2_BCHPBR3);
> +		bchpbr = readl(nfc->io_base + FMC2_BCHPBR3);
>  		ecc[8] = bchpbr;
>  		ecc[9] = bchpbr >> 8;
>  		ecc[10] = bchpbr >> 16;
>  		ecc[11] = bchpbr >> 24;
>  
> -		bchpbr = readl(fmc2->io_base + FMC2_BCHPBR4);
> +		bchpbr = readl(nfc->io_base + FMC2_BCHPBR4);
>  		ecc[12] = bchpbr;
>  	}
>  
> -	stm32_fmc2_set_ecc(fmc2, false);
> +	stm32_fmc2_nfc_set_ecc(nfc, false);
>  
>  	return 0;
>  }
>  
> -static int stm32_fmc2_bch_correct(struct mtd_info *mtd, u8 *dat,
> -				  u8 *read_ecc, u8 *calc_ecc)
> +static int stm32_fmc2_nfc_bch_correct(struct mtd_info *mtd, u8 *dat,
> +				      u8 *read_ecc, u8 *calc_ecc)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
> +	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
>  	u32 bchdsr0, bchdsr1, bchdsr2, bchdsr3, bchdsr4, bchisr;
>  	u16 pos[8];
>  	int i, ret, den, eccsize = chip->ecc.size;
>  	unsigned int nb_errs = 0;
>  
>  	/* Wait until the decoding error is ready */
> -	ret = readl_poll_timeout(fmc2->io_base + FMC2_BCHISR, bchisr,
> +	ret = readl_poll_timeout(nfc->io_base + FMC2_BCHISR, bchisr,
>  				 bchisr & FMC2_BCHISR_DERF, FMC2_TIMEOUT_5S);
>  	if (ret < 0) {
>  		pr_err("Bch timeout\n");
>  		return ret;
>  	}
>  
> -	bchdsr0 = readl(fmc2->io_base + FMC2_BCHDSR0);
> -	bchdsr1 = readl(fmc2->io_base + FMC2_BCHDSR1);
> -	bchdsr2 = readl(fmc2->io_base + FMC2_BCHDSR2);
> -	bchdsr3 = readl(fmc2->io_base + FMC2_BCHDSR3);
> -	bchdsr4 = readl(fmc2->io_base + FMC2_BCHDSR4);
> +	bchdsr0 = readl(nfc->io_base + FMC2_BCHDSR0);
> +	bchdsr1 = readl(nfc->io_base + FMC2_BCHDSR1);
> +	bchdsr2 = readl(nfc->io_base + FMC2_BCHDSR2);
> +	bchdsr3 = readl(nfc->io_base + FMC2_BCHDSR3);
> +	bchdsr4 = readl(nfc->io_base + FMC2_BCHDSR4);
>  
> -	stm32_fmc2_set_ecc(fmc2, false);
> +	stm32_fmc2_nfc_set_ecc(nfc, false);
>  
>  	/* No errors found */
>  	if (likely(!(bchdsr0 & FMC2_BCHDSR0_DEF)))
> @@ -516,9 +517,9 @@ static int stm32_fmc2_bch_correct(struct mtd_info *mtd, u8 *dat,
>  	return nb_errs;
>  }
>  
> -static int stm32_fmc2_read_page(struct mtd_info *mtd,
> -				struct nand_chip *chip, u8 *buf,
> -				int oob_required, int page)
> +static int stm32_fmc2_nfc_read_page(struct mtd_info *mtd,
> +				    struct nand_chip *chip, u8 *buf,
> +				    int oob_required, int page)
>  {
>  	int i, s, stat, eccsize = chip->ecc.size;
>  	int eccbytes = chip->ecc.bytes;
> @@ -567,13 +568,13 @@ static int stm32_fmc2_read_page(struct mtd_info *mtd,
>  	return max_bitflips;
>  }
>  
> -static void stm32_fmc2_init(struct stm32_fmc2_nfc *fmc2)
> +static void stm32_fmc2_nfc_init(struct stm32_fmc2_nfc *nfc)
>  {
> -	u32 pcr = readl(fmc2->io_base + FMC2_PCR);
> -	u32 bcr1 = readl(fmc2->io_base + FMC2_BCR1);
> +	u32 pcr = readl(nfc->io_base + FMC2_PCR);
> +	u32 bcr1 = readl(nfc->io_base + FMC2_BCR1);
>  
>  	/* Set CS used to undefined */
> -	fmc2->cs_sel = -1;
> +	nfc->cs_sel = -1;
>  
>  	/* Enable wait feature and nand flash memory bank */
>  	pcr |= FMC2_PCR_PWAITEN;
> @@ -603,19 +604,19 @@ static void stm32_fmc2_init(struct stm32_fmc2_nfc *fmc2)
>  	/* Enable FMC2 controller */
>  	bcr1 |= FMC2_BCR1_FMC2EN;
>  
> -	writel(bcr1, fmc2->io_base + FMC2_BCR1);
> -	writel(pcr, fmc2->io_base + FMC2_PCR);
> -	writel(FMC2_PMEM_DEFAULT, fmc2->io_base + FMC2_PMEM);
> -	writel(FMC2_PATT_DEFAULT, fmc2->io_base + FMC2_PATT);
> +	writel(bcr1, nfc->io_base + FMC2_BCR1);
> +	writel(pcr, nfc->io_base + FMC2_PCR);
> +	writel(FMC2_PMEM_DEFAULT, nfc->io_base + FMC2_PMEM);
> +	writel(FMC2_PATT_DEFAULT, nfc->io_base + FMC2_PATT);
>  }
>  
> -static void stm32_fmc2_calc_timings(struct nand_chip *chip,
> -				    const struct nand_sdr_timings *sdrt)
> +static void stm32_fmc2_nfc_calc_timings(struct nand_chip *chip,
> +					const struct nand_sdr_timings *sdrt)
>  {
> -	struct stm32_fmc2_nfc *fmc2 = to_stm32_nfc(chip->controller);
> +	struct stm32_fmc2_nfc *nfc = to_stm32_nfc(chip->controller);
>  	struct stm32_fmc2_nand *nand = to_fmc2_nand(chip);
>  	struct stm32_fmc2_timings *tims = &nand->timings;
> -	unsigned long hclk = clk_get_rate(&fmc2->clk);
> +	unsigned long hclk = clk_get_rate(&nfc->clk);
>  	unsigned long hclkp = FMC2_NSEC_PER_SEC / (hclk / 1000);
>  	unsigned long timing, tar, tclr, thiz, twait;
>  	unsigned long tset_mem, tset_att, thold_mem, thold_att;
> @@ -739,29 +740,28 @@ static void stm32_fmc2_calc_timings(struct nand_chip *chip,
>  	tims->thold_att = clamp_val(timing, 1, FMC2_PMEM_PATT_TIMING_MASK);
>  }
>  
> -static int stm32_fmc2_setup_interface(struct mtd_info *mtd, int chipnr,
> -				      const struct nand_data_interface *conf)
> +static int stm32_fmc2_nfc_setup_interface(struct mtd_info *mtd, int chipnr,
> +					  const struct nand_data_interface *cf)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	const struct nand_sdr_timings *sdrt;
>  
> -	sdrt = nand_get_sdr_timings(conf);
> +	sdrt = nand_get_sdr_timings(cf);
>  	if (IS_ERR(sdrt))
>  		return PTR_ERR(sdrt);
>  
>  	if (chipnr == NAND_DATA_IFACE_CHECK_ONLY)
>  		return 0;
>  
> -	stm32_fmc2_calc_timings(chip, sdrt);
> -
> -	stm32_fmc2_timings_init(chip);
> +	stm32_fmc2_nfc_calc_timings(chip, sdrt);
> +	stm32_fmc2_nfc_timings_init(chip);
>  
>  	return 0;
>  }
>  
> -static void stm32_fmc2_nand_callbacks_setup(struct nand_chip *chip)
> +static void stm32_fmc2_nfc_nand_callbacks_setup(struct nand_chip *chip)
>  {
> -	chip->ecc.hwctl = stm32_fmc2_hwctl;
> +	chip->ecc.hwctl = stm32_fmc2_nfc_hwctl;
>  
>  	/*
>  	 * Specific callbacks to read/write a page depending on
> @@ -769,17 +769,17 @@ static void stm32_fmc2_nand_callbacks_setup(struct nand_chip *chip)
>  	 */
>  	if (chip->ecc.strength == FMC2_ECC_HAM) {
>  		/* Hamming is used */
> -		chip->ecc.calculate = stm32_fmc2_ham_calculate;
> -		chip->ecc.correct = stm32_fmc2_ham_correct;
> +		chip->ecc.calculate = stm32_fmc2_nfc_ham_calculate;
> +		chip->ecc.correct = stm32_fmc2_nfc_ham_correct;
>  		chip->ecc.bytes = chip->options & NAND_BUSWIDTH_16 ? 4 : 3;
>  		chip->ecc.options |= NAND_ECC_GENERIC_ERASED_CHECK;
>  		return;
>  	}
>  
>  	/* BCH is used */
> -	chip->ecc.read_page = stm32_fmc2_read_page;
> -	chip->ecc.calculate = stm32_fmc2_bch_calculate;
> -	chip->ecc.correct = stm32_fmc2_bch_correct;
> +	chip->ecc.read_page = stm32_fmc2_nfc_read_page;
> +	chip->ecc.calculate = stm32_fmc2_nfc_bch_calculate;
> +	chip->ecc.correct = stm32_fmc2_nfc_bch_correct;
>  
>  	if (chip->ecc.strength == FMC2_ECC_BCH8)
>  		chip->ecc.bytes = chip->options & NAND_BUSWIDTH_16 ? 14 : 13;
> @@ -787,7 +787,7 @@ static void stm32_fmc2_nand_callbacks_setup(struct nand_chip *chip)
>  		chip->ecc.bytes = chip->options & NAND_BUSWIDTH_16 ? 8 : 7;
>  }
>  
> -static int stm32_fmc2_calc_ecc_bytes(int step_size, int strength)
> +static int stm32_fmc2_nfc_calc_ecc_bytes(int step_size, int strength)
>  {
>  	/* Hamming */
>  	if (strength == FMC2_ECC_HAM)
> @@ -801,14 +801,13 @@ static int stm32_fmc2_calc_ecc_bytes(int step_size, int strength)
>  	return 8;
>  }
>  
> -NAND_ECC_CAPS_SINGLE(stm32_fmc2_ecc_caps, stm32_fmc2_calc_ecc_bytes,
> +NAND_ECC_CAPS_SINGLE(stm32_fmc2_nfc_ecc_caps, stm32_fmc2_nfc_calc_ecc_bytes,
>  		     FMC2_ECC_STEP_SIZE,
>  		     FMC2_ECC_HAM, FMC2_ECC_BCH4, FMC2_ECC_BCH8);
>  
> -static int stm32_fmc2_parse_child(struct stm32_fmc2_nfc *fmc2,
> -				  ofnode node)
> +static int stm32_fmc2_nfc_parse_child(struct stm32_fmc2_nfc *nfc, ofnode node)
>  {
> -	struct stm32_fmc2_nand *nand = &fmc2->nand;
> +	struct stm32_fmc2_nand *nand = &nfc->nand;
>  	u32 cs[FMC2_MAX_CE];
>  	int ret, i;
>  
> @@ -834,13 +833,13 @@ static int stm32_fmc2_parse_child(struct stm32_fmc2_nfc *fmc2,
>  			return -EINVAL;
>  		}
>  
> -		if (fmc2->cs_assigned & BIT(cs[i])) {
> +		if (nfc->cs_assigned & BIT(cs[i])) {
>  			pr_err("Cs already assigned: %d\n",
>  			       nand->cs_used[i]);
>  			return -EINVAL;
>  		}
>  
> -		fmc2->cs_assigned |= BIT(cs[i]);
> +		nfc->cs_assigned |= BIT(cs[i]);
>  		nand->cs_used[i] = cs[i];
>  	}
>  
> @@ -849,8 +848,8 @@ static int stm32_fmc2_parse_child(struct stm32_fmc2_nfc *fmc2,
>  	return 0;
>  }
>  
> -static int stm32_fmc2_parse_dt(struct udevice *dev,
> -			       struct stm32_fmc2_nfc *fmc2)
> +static int stm32_fmc2_nfc_parse_dt(struct udevice *dev,
> +				   struct stm32_fmc2_nfc *nfc)
>  {
>  	ofnode child;
>  	int ret, nchips = 0;
> @@ -869,7 +868,7 @@ static int stm32_fmc2_parse_dt(struct udevice *dev,
>  	}
>  
>  	dev_for_each_subnode(child, dev) {
> -		ret = stm32_fmc2_parse_child(fmc2, child);
> +		ret = stm32_fmc2_nfc_parse_child(nfc, child);
>  		if (ret)
>  			return ret;
>  	}
> @@ -877,10 +876,10 @@ static int stm32_fmc2_parse_dt(struct udevice *dev,
>  	return 0;
>  }
>  
> -static int stm32_fmc2_probe(struct udevice *dev)
> +static int stm32_fmc2_nfc_probe(struct udevice *dev)
>  {
> -	struct stm32_fmc2_nfc *fmc2 = dev_get_priv(dev);
> -	struct stm32_fmc2_nand *nand = &fmc2->nand;
> +	struct stm32_fmc2_nfc *nfc = dev_get_priv(dev);
> +	struct stm32_fmc2_nand *nand = &nfc->nand;
>  	struct nand_chip *chip = &nand->chip;
>  	struct mtd_info *mtd = &chip->mtd;
>  	struct nand_ecclayout *ecclayout;
> @@ -889,10 +888,10 @@ static int stm32_fmc2_probe(struct udevice *dev)
>  	int oob_index, chip_cs, mem_region, ret;
>  	unsigned int i;
>  
> -	spin_lock_init(&fmc2->controller.lock);
> -	init_waitqueue_head(&fmc2->controller.wq);
> +	spin_lock_init(&nfc->controller.lock);
> +	init_waitqueue_head(&nfc->controller.wq);
>  
> -	ret = stm32_fmc2_parse_dt(dev, fmc2);
> +	ret = stm32_fmc2_nfc_parse_dt(dev, nfc);
>  	if (ret)
>  		return ret;
>  
> @@ -902,11 +901,11 @@ static int stm32_fmc2_probe(struct udevice *dev)
>  		pr_err("Resource io_base not found");
>  		return ret;
>  	}
> -	fmc2->io_base = (void __iomem *)resource.start;
> +	nfc->io_base = (void __iomem *)resource.start;
>  
>  	for (chip_cs = 0, mem_region = 1; chip_cs < FMC2_MAX_CE;
>  	     chip_cs++, mem_region += 3) {
> -		if (!(fmc2->cs_assigned & BIT(chip_cs)))
> +		if (!(nfc->cs_assigned & BIT(chip_cs)))
>  			continue;
>  
>  		ret = dev_read_resource(dev, mem_region, &resource);
> @@ -915,7 +914,7 @@ static int stm32_fmc2_probe(struct udevice *dev)
>  			       chip_cs);
>  			return ret;
>  		}
> -		fmc2->data_base[chip_cs] = (void __iomem *)resource.start;
> +		nfc->data_base[chip_cs] = (void __iomem *)resource.start;
>  
>  		ret = dev_read_resource(dev, mem_region + 1, &resource);
>  		if (ret) {
> @@ -923,7 +922,7 @@ static int stm32_fmc2_probe(struct udevice *dev)
>  			       chip_cs);
>  			return ret;
>  		}
> -		fmc2->cmd_base[chip_cs] = (void __iomem *)resource.start;
> +		nfc->cmd_base[chip_cs] = (void __iomem *)resource.start;
>  
>  		ret = dev_read_resource(dev, mem_region + 2, &resource);
>  		if (ret) {
> @@ -931,15 +930,15 @@ static int stm32_fmc2_probe(struct udevice *dev)
>  			       chip_cs);
>  			return ret;
>  		}
> -		fmc2->addr_base[chip_cs] = (void __iomem *)resource.start;
> +		nfc->addr_base[chip_cs] = (void __iomem *)resource.start;
>  	}
>  
>  	/* Enable the clock */
> -	ret = clk_get_by_index(dev, 0, &fmc2->clk);
> +	ret = clk_get_by_index(dev, 0, &nfc->clk);
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_enable(&fmc2->clk);
> +	ret = clk_enable(&nfc->clk);
>  	if (ret)
>  		return ret;
>  
> @@ -951,12 +950,12 @@ static int stm32_fmc2_probe(struct udevice *dev)
>  		reset_deassert(&reset);
>  	}
>  
> -	stm32_fmc2_init(fmc2);
> +	stm32_fmc2_nfc_init(nfc);
>  
> -	chip->controller = &fmc2->base;
> -	chip->select_chip = stm32_fmc2_select_chip;
> -	chip->setup_data_interface = stm32_fmc2_setup_interface;
> -	chip->cmd_ctrl = stm32_fmc2_cmd_ctrl;
> +	chip->controller = &nfc->base;
> +	chip->select_chip = stm32_fmc2_nfc_select_chip;
> +	chip->setup_data_interface = stm32_fmc2_nfc_setup_interface;
> +	chip->cmd_ctrl = stm32_fmc2_nfc_cmd_ctrl;
>  	chip->chip_delay = FMC2_RB_DELAY_US;
>  	chip->options |= NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE |
>  			 NAND_USE_BOUNCE_BUFFER;
> @@ -982,7 +981,7 @@ static int stm32_fmc2_probe(struct udevice *dev)
>  		return -EINVAL;
>  	}
>  
> -	ret = nand_check_ecc_caps(chip, &stm32_fmc2_ecc_caps,
> +	ret = nand_check_ecc_caps(chip, &stm32_fmc2_nfc_ecc_caps,
>  				  mtd->oobsize - FMC2_BBM_LEN);
>  	if (ret) {
>  		pr_err("No valid ECC settings set\n");
> @@ -992,10 +991,10 @@ static int stm32_fmc2_probe(struct udevice *dev)
>  	if (chip->bbt_options & NAND_BBT_USE_FLASH)
>  		chip->bbt_options |= NAND_BBT_NO_OOB;
>  
> -	stm32_fmc2_nand_callbacks_setup(chip);
> +	stm32_fmc2_nfc_nand_callbacks_setup(chip);
>  
>  	/* Define ECC layout */
> -	ecclayout = &fmc2->ecclayout;
> +	ecclayout = &nfc->ecclayout;
>  	ecclayout->eccbytes = chip->ecc.bytes *
>  			      (mtd->writesize / chip->ecc.size);
>  	oob_index = FMC2_BBM_LEN;
> @@ -1006,7 +1005,7 @@ static int stm32_fmc2_probe(struct udevice *dev)
>  	chip->ecc.layout = ecclayout;
>  
>  	if (chip->options & NAND_BUSWIDTH_16)
> -		stm32_fmc2_set_buswidth_16(fmc2, true);
> +		stm32_fmc2_nfc_set_buswidth_16(nfc, true);
>  
>  	ret = nand_scan_tail(mtd);
>  	if (ret)
> @@ -1015,16 +1014,16 @@ static int stm32_fmc2_probe(struct udevice *dev)
>  	return nand_register(0, mtd);
>  }
>  
> -static const struct udevice_id stm32_fmc2_match[] = {
> +static const struct udevice_id stm32_fmc2_nfc_match[] = {
>  	{ .compatible = "st,stm32mp15-fmc2" },
>  	{ /* Sentinel */ }
>  };
>  
> -U_BOOT_DRIVER(stm32_fmc2_nand) = {
> -	.name = "stm32_fmc2_nand",
> +U_BOOT_DRIVER(stm32_fmc2_nfc) = {
> +	.name = "stm32_fmc2_nfc",
>  	.id = UCLASS_MTD,
> -	.of_match = stm32_fmc2_match,
> -	.probe = stm32_fmc2_probe,
> +	.of_match = stm32_fmc2_nfc_match,
> +	.probe = stm32_fmc2_nfc_probe,
>  	.priv_auto_alloc_size = sizeof(struct stm32_fmc2_nfc),
>  };
>  
> @@ -1034,9 +1033,9 @@ void board_nand_init(void)
>  	int ret;
>  
>  	ret = uclass_get_device_by_driver(UCLASS_MTD,
> -					  DM_GET_DRIVER(stm32_fmc2_nand),
> +					  DM_GET_DRIVER(stm32_fmc2_nfc),
>  					  &dev);
>  	if (ret && ret != -ENODEV)
> -		pr_err("Failed to initialize STM32 FMC2 NAND controller. (error %d)\n",
> +		pr_err("Failed to initialize STM32 FMC2 NFC controller. (error %d)\n",
>  		       ret);
>  }
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
