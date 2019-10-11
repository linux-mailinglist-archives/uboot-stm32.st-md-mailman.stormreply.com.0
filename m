Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4714D5BBC
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 08:56:17 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63154C36B0E
	for <lists+uboot-stm32@lfdr.de>; Mon, 14 Oct 2019 06:56:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B06F9C36B0A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Oct 2019 20:00:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BK00o2128012;
 Fri, 11 Oct 2019 15:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1570824000;
 bh=O/gKkOFvTh5SvKezeql7LxhYhLrqncpHH71IDx+0vME=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=fChwCaSmzwkaEN0Gy0lFaTeUTNz+CpTavmrToVuRilvyZ1oZQpKqMf9s/gzxREDh4
 rqONZcPdsJX3t6FdA3q2Hr0vej9RRYrZiwA8YVShgPoy2Jk0Vd2Zwp+Oq5STihHgfn
 pQJwgFEMzPgCAtWcLM1RS3QpfLiVWXUmq9aEMTSs=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BK005m054264
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 11 Oct 2019 15:00:00 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 11
 Oct 2019 15:00:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 11 Oct 2019 15:00:00 -0500
Received: from [128.247.58.153] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BK00AK059900;
 Fri, 11 Oct 2019 15:00:00 -0500
To: Fabien Dessenne <fabien.dessenne@st.com>, Simon Glass <sjg@chromium.org>, 
 Patrick Delaunay <patrick.delaunay@st.com>, Christophe Kerello
 <christophe.kerello@st.com>, Patrice Chotard <patrice.chotard@st.com>,
 "Vutla, Lokesh" <lokeshvutla@ti.com>
References: <1570635389-8445-1-git-send-email-fabien.dessenne@st.com>
 <1570635389-8445-6-git-send-email-fabien.dessenne@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <510f06c7-11e6-0a62-9ed4-f17736c4b9ac@ti.com>
Date: Fri, 11 Oct 2019 15:00:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1570635389-8445-6-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 14 Oct 2019 06:56:16 +0000
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>
Subject: Re: [Uboot-stm32] [U-Boot] [PATCH 5/5] remoteproc: stm32: invert
 the is_running() return value
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

On 10/9/19 10:36 AM, Fabien Dessenne wrote:
> The .is_running() ops expects a return value of 0 if the processor is
> running, 1 if not running : align to this.
> 
> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>

This patch should be earlier than patch4, right?

Reviewed-by: Suman Anna <s-anna@ti.com>

> ---
>  drivers/remoteproc/stm32_copro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/stm32_copro.c b/drivers/remoteproc/stm32_copro.c
> index eef3416..fce9653 100644
> --- a/drivers/remoteproc/stm32_copro.c
> +++ b/drivers/remoteproc/stm32_copro.c
> @@ -237,14 +237,14 @@ static int stm32_copro_stop(struct udevice *dev)
>  /**
>   * stm32_copro_is_running() - Is the STM32 remote processor running
>   * @dev:	corresponding STM32 remote processor device
> - * @return 1 if the remote processor is running, 0 otherwise
> + * @return 0 if the remote processor is running, 1 otherwise
>   */
>  static int stm32_copro_is_running(struct udevice *dev)
>  {
>  	struct stm32_copro_privdata *priv;
>  
>  	priv = dev_get_priv(dev);
> -	return priv->is_running;
> +	return !priv->is_running;
>  }
>  
>  static const struct dm_rproc_ops stm32_copro_ops = {
> 

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
