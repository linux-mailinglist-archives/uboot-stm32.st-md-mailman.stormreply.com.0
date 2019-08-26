Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 011AB9D107
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Aug 2019 15:48:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE698C36B3F
	for <lists+uboot-stm32@lfdr.de>; Mon, 26 Aug 2019 13:48:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 26F4DC36B3E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Aug 2019 13:48:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7QDlEvj018145; Mon, 26 Aug 2019 15:48:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=XNYMXn+8R4DJupILLt/9iAyG1LkYPu6T0tnBEpYlQRE=;
 b=dz1krGcJn3YTqwM7sEYqXo4jCRdXn4yFteTmZ+uzWJ8XvkdDcjofxh+tTLYapgtrfTe1
 IBS26lZXuW4+cHbbXv0uuTdJ1ASW/LAh4yBH0FjqKolfoxPS9KhGd7vzYPZuke06U+gC
 Z2149H1z/MgF7WgzHrGxoiedLzeBLu6AsvjzI3YGeEpOBHEh2uwuNZyv3sX/6pYoFk2H
 +78KDUp4m6bK1XIdm653gXMDIzxSlRghulVn43cIVTn8/g4ac/BbRfP4QRXeErAVOqDH
 ThKcpzrZT3yInAI9FG+wdoKsVPgFxqc7/9isr6YrsvA/YEnh1vXpyeO/rRIM+PiqLM++ 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2ujtcbc8rf-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 26 Aug 2019 15:48:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 900E13D;
 Mon, 26 Aug 2019 13:48:50 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 861162220D0;
 Mon, 26 Aug 2019 15:48:50 +0200 (CEST)
Received: from SFHDAG6NODE3.st.com (10.75.127.18) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 26 Aug
 2019 15:48:50 +0200
Received: from SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6]) by
 SFHDAG6NODE3.st.com ([fe80::d04:5337:ab17:b6f6%20]) with mapi id
 15.00.1473.003; Mon, 26 Aug 2019 15:48:50 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: "u-boot@lists.denx.de" <u-boot@lists.denx.de>
Thread-Topic: [PATCH v2] mmc: sti_sdhci: Fix sdhci_setup_cfg() call.
Thread-Index: AQHVQfSNpEbBbX6G1ECocJKZVQ9S3KcNhImA
Date: Mon, 26 Aug 2019 13:48:50 +0000
Message-ID: <09ab2a9f-20cd-ba4e-3c7e-0e8a8ea73096@st.com>
References: <20190724075102.26679-1-patrice.chotard@st.com>
In-Reply-To: <20190724075102.26679-1-patrice.chotard@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <B3915AC70E69704EB1DF4BC52ED5C3C5@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_07:, , signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Peng Fan <peng.fan@nxp.com>, Patrick DELAUNAY <patrick.delaunay@st.com>
Subject: Re: [Uboot-stm32] [PATCH v2] mmc: sti_sdhci: Fix sdhci_setup_cfg()
	call.
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


On 7/24/19 9:51 AM, Patrice Chotard wrote:
> host->mmc, host->mmc->dev and host->mmc->priv must be set
> before calling sdhci_setup_cfg() to avoid hang during mmc
> initialization.
>
> Thanks to commit 3d296365e4e8
> ("mmc: sdhci: Add support for sdhci-caps-mask") which put
> this issue into evidence.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>
> Changes in v2:
>   - move host->mmc->priv initialization before sdhci_setup_cfg() call
>
>  drivers/mmc/sti_sdhci.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/sti_sdhci.c b/drivers/mmc/sti_sdhci.c
> index 8ed47e113d..d6c75ea601 100644
> --- a/drivers/mmc/sti_sdhci.c
> +++ b/drivers/mmc/sti_sdhci.c
> @@ -97,14 +97,14 @@ static int sti_sdhci_probe(struct udevice *dev)
>  		       SDHCI_QUIRK_NO_HISPD_BIT;
>  
>  	host->host_caps = MMC_MODE_DDR_52MHz;
> +	host->mmc = &plat->mmc;
> +	host->mmc->dev = dev;
> +	host->mmc->priv = host;
>  
>  	ret = sdhci_setup_cfg(&plat->cfg, host, 50000000, 400000);
>  	if (ret)
>  		return ret;
>  
> -	host->mmc = &plat->mmc;
> -	host->mmc->priv = host;
> -	host->mmc->dev = dev;
>  	upriv->mmc = host->mmc;
>  
>  	return sdhci_probe(dev);


Applied on STM32 tree

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
