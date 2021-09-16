Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6004040E7B1
	for <lists+uboot-stm32@lfdr.de>; Thu, 16 Sep 2021 19:44:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A297C597BE;
	Thu, 16 Sep 2021 17:44:29 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A17E9C5A4D4
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Sep 2021 17:44:26 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 57DA880098;
 Thu, 16 Sep 2021 19:44:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1631814266;
 bh=r8tqyYocEscHtZ6MP5HHbaj46PujjIFnMNFAKfUyFg0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=W2WHg7jyp3U8mJdcQ3O5/DNBxLZlAbMGru+gnS2ViMC0u+JSHYNlIm2HhJypN17+U
 5EhRAfGURT+U+V2VjAfBYlxpLy2UoNqMi7wrmiFAZBsck9rlwIzFjmAVYGf2F1ES/6
 z2z15NDMoMnPmDUE/FHPRpEQ8yaKV87zrDygC/r7cqWPbXewlqti/ARLeSZKY3hDlm
 KSkLvw41G9CVlQE8d5pcrrTia195qka0qU4N0WMRBZUx00qcFOvW2Q4vwDhojQNxDS
 FYP4cjrvP9oQAb7ARZLpidrNbTQOIrF4hvc55DWgSyL1l0Tnazrq5zh6gbMcOt/rLR
 xzt5PblC0OWsQ==
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, u-boot@lists.denx.de
References: <20210916140118.874028-1-patrick.delaunay@foss.st.com>
 <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
From: Marek Vasut <marex@denx.de>
Message-ID: <e96155b3-85fe-7402-8b61-f8f60cc75821@denx.de>
Date: Thu, 16 Sep 2021 19:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210916155040.v3.2.Ia461e670c7438478aa8f8939209d45c818ccd284@changeid>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Vignesh R <vigneshr@ti.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Priyanka Jain <priyanka.jain@nxp.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Heiko Schocher <hs@denx.de>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>
Subject: Re: [Uboot-stm32] [PATCH v3 2/2] mtd: spi: nor: force mtd name to
	"nor%d"
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

On 9/16/21 4:01 PM, Patrick Delaunay wrote:

[...]

> @@ -3664,6 +3666,11 @@ int spi_nor_scan(struct spi_nor *nor)
>   	struct mtd_info *mtd = &nor->mtd;
>   	struct spi_slave *spi = nor->spi;
>   	int ret;
> +	int cfi_mtd_nb = 0;
> +
> +#ifdef CONFIG_SYS_MAX_FLASH_BANKS
> +	cfi_mtd_nb = CONFIG_SYS_MAX_FLASH_BANKS;
> +#endif

Are we covering all the NORs (HF and co.) with this ?

>   	/* Reset SPI protocol for all commands. */
>   	nor->reg_proto = SNOR_PROTO_1_1_1;
> @@ -3715,8 +3722,10 @@ int spi_nor_scan(struct spi_nor *nor)
>   	if (ret)
>   		return ret;
>   
> -	if (!mtd->name)
> -		mtd->name = info->name;
> +	if (!mtd->name) {
> +		sprintf(nor->mtd_name, "nor%d",  cfi_mtd_nb + dev_seq(nor->dev));
> +		mtd->name = nor->mtd_name;
> +	}
>   	mtd->dev = nor->dev;
>   	mtd->priv = nor;
>   	mtd->type = MTD_NORFLASH;
> @@ -3821,7 +3830,7 @@ int spi_nor_scan(struct spi_nor *nor)
>   
>   	nor->rdsr_dummy = params.rdsr_dummy;
>   	nor->rdsr_addr_nbytes = params.rdsr_addr_nbytes;
> -	nor->name = mtd->name;
> +	nor->name = info->name;
>   	nor->size = mtd->size;
>   	nor->erase_size = mtd->erasesize;
>   	nor->sector_size = mtd->erasesize;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 7ddc4ba2bf..8c3d5032e3 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -561,6 +561,7 @@ struct spi_nor {
>   	int (*ready)(struct spi_nor *nor);
>   
>   	void *priv;
> +	char mtd_name[10];

should be 14, because nor%d\0 can be up to 14 bytes long.
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
