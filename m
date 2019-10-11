Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFCBD5BBD
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 08:56:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E042C36B10
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 06:56:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A149C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 20:09:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BK91nw130119;
 Fri, 11 Oct 2019 15:09:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570824541;
 bh=A2hT9QKBUauuQCaZ4TSDKA4LWpa2kCTZAOtnK+xcZlk=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=YaL4kSHC89eGoR483nisyJwT3SYdeWiTBkWlf0Lbc+KUYKGk1gp4Mq0SBCURwDfxC
 UC3mDZGKCJyGGGQfvtsaE0P3Xhl1qEwSBK/RDimhLMHKdenQpklf5OtDFhVcJTWlJ5
 1JxPdPCk4ssa04kWWSXEE9Wm6bBK3XRUXLuiHO+I=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BK91G0060033;
 Fri, 11 Oct 2019 15:09:01 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 15:09:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 15:08:56 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BK90Cp077422;
 Fri, 11 Oct 2019 15:09:00 -0500
To: Fabien Dessenne <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Patrick Delaunay <patrick.delaunay@st.com>, Christophe Kerello
 <christophe.kerello@st.com>, Patrice Chotard <patrice.chotard@st.com>,
 "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
 <1570635389-8445-4-git-send-email-fabien.dessenne@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <3e24fcf9-05df-12da-3eee-619dd9e86d69@ti.com>
Date: Fri, 11 Oct 2019 15:09:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1570635389-8445-4-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 14 Oct 2019 06:56:16 +0000
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 3/5] remoteproc: stm32: load
 resource table from firmware
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

Hi Fabien,

On 10/9/19 10:36 AM, Fabien Dessenne wrote:
> Load the optional resource table from the firmware, and write its
> address in the dedicated backup register.

What processor is this? Reason I ask is that you are using 0 as a no
resource table address, and if it is a valid address for that processor?

regards
Suman

> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
> ---
>  drivers/remoteproc/stm32_copro.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
> index 40bba37..eef3416 100644
> --- a/drivers/remoteproc/stm32_copro.c
> +++ b/drivers/remoteproc/stm32_copro.c
> @@ -23,6 +23,7 @@
>   * @hold_boot_offset:	offset of the register controlling the hold boot setting
>   * @hold_boot_mask:	bitmask of the register for the hold boot field
>   * @is_running:		is the remote processor running
> + * @rsc_table_addr:	resource table address
>   */
>  struct stm32_copro_privdata {
>  	struct reset_ctl reset_ctl;
> @@ -30,6 +31,7 @@ struct stm32_copro_privdata {
>  	uint hold_boot_offset;
>  	uint hold_boot_mask;
>  	bool is_running;
> +	ulong rsc_table_addr;
>  };
>  
>  /**
> @@ -141,6 +143,7 @@ static void *stm32_copro_device_to_virt(struct udevice *dev, ulong da,
>  static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
>  {
>  	struct stm32_copro_privdata *priv;
> +	ulong rsc_table_size;
>  	int ret;
>  
>  	priv = dev_get_priv(dev);
> @@ -155,6 +158,12 @@ static int stm32_copro_load(struct udevice *dev, ulong addr, ulong size)
>  		return ret;
>  	}
>  
> +	if (rproc_elf32_load_rsc_table(dev, addr, size, &priv->rsc_table_addr,
> +				       &rsc_table_size)) {
> +		priv->rsc_table_addr = 0;
> +		dev_warn(dev, "No valid resource table for this firmware\n");
> +	}
> +
>  	return rproc_elf32_load_image(dev, addr, size);
>  }
>  
> @@ -180,6 +189,10 @@ static int stm32_copro_start(struct udevice *dev)
>  	 * rebooting autonomously
>  	 */
>  	ret = stm32_copro_set_hold_boot(dev, true);
> +	if (!ret)
> +		/* Store rsc_address in bkp register */
> +		writel(priv->rsc_table_addr, TAMP_COPRO_RSC_TBL_ADDRESS);
> +
>  	priv->is_running = !ret;
>  	return ret;
>  }
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
