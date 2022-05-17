Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CD9529C4A
	for <lists+uboot-stm32@lfdr.de>; Tue, 17 May 2022 10:24:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4842FC03FC8;
	Tue, 17 May 2022 08:24:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 49FF3C5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 May 2022 08:23:58 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24H6ehLA014061;
 Tue, 17 May 2022 10:23:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=37X68DJYBFqC0pCbC3jr486LsuprNvEkS+DNAvb9R8U=;
 b=DCIZdoR14IIyeJ9AoV8NG5wYhqGjVKIP8K1GKmF4Qrfq/mrKM+XptwhWGYZDe+KUYhaR
 JJbbHeyBHHu17d2Ka5NnikV6YdfE0woTvwj/GJn85tMt5odPkCvH8bOGBuimwMA5ASZX
 Wl5l1tCiGS5a4c9pTsBAxyR8Gkl3DyYT01JpRjZzEK6SMO2+L0FzAHOv0MJPApBZ2v6k
 UzuVUko3CJ+fRSF9gmhBgFjJslziSxXLt5cBVkyz6LXzrAk96qOKKmfcLqk7e1oVuqHn
 ehhPukQdcOR3Kx9k6oGM0wgASk7icBzhVU0FoNip2u+L3V5O8jRcNBqmXLpz3ipflrR/ 8g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g23ahgdyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 May 2022 10:23:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8C35610002A;
 Tue, 17 May 2022 10:23:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6F432214D18;
 Tue, 17 May 2022 10:23:56 +0200 (CEST)
Received: from [10.48.0.213] (10.75.127.51) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 17 May
 2022 10:23:55 +0200
Message-ID: <134edda6-ac32-4ee2-d5a7-97aa906fb53e@foss.st.com>
Date: Tue, 17 May 2022 10:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Patrice Chotard <patrice.chotard@foss.st.com>, <u-boot@lists.denx.de>
References: <20220512071738.741406-1-patrice.chotard@foss.st.com>
 <20220512071738.741406-2-patrice.chotard@foss.st.com>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20220512071738.741406-2-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-17_01,2022-05-16_02,2022-02-23_01
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v1 1/2] spi: stm32_qspi: Always check
 SR_TCF flags in stm32_qspi_wait_cmd()
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

Hi Patrice,

On 5/12/22 09:17, Patrice Chotard wrote:
> Currently, SR_TCF flag is checked in case there is data, this criteria
> is not correct.
>
> SR_TCF flags is set when programmed number of bytes have been transferred
> to the memory device ("bytes" comprised command and data send to the
> SPI device).
> So even if there is no data, we must check SR_TCF flag.
>
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> ---
>
>   drivers/spi/stm32_qspi.c | 23 +++++++++++------------
>   1 file changed, 11 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
> index 8f4aabc3d1..3c8faecb54 100644
> --- a/drivers/spi/stm32_qspi.c
> +++ b/drivers/spi/stm32_qspi.c
> @@ -150,20 +150,19 @@ static int _stm32_qspi_wait_cmd(struct stm32_qspi_priv *priv,
>   	u32 sr;
>   	int ret = 0;
>   
> -	if (op->data.nbytes) {
> -		ret = readl_poll_timeout(&priv->regs->sr, sr,
> -					 sr & STM32_QSPI_SR_TCF,
> -					 STM32_QSPI_CMD_TIMEOUT_US);
> -		if (ret) {
> -			log_err("cmd timeout (stat:%#x)\n", sr);
> -		} else if (readl(&priv->regs->sr) & STM32_QSPI_SR_TEF) {
> -			log_err("transfer error (stat:%#x)\n", sr);
> -			ret = -EIO;
> -		}
> -		/* clear flags */
> -		writel(STM32_QSPI_FCR_CTCF | STM32_QSPI_FCR_CTEF, &priv->regs->fcr);
> +	ret = readl_poll_timeout(&priv->regs->sr, sr,
> +				 sr & STM32_QSPI_SR_TCF,
> +				 STM32_QSPI_CMD_TIMEOUT_US);
> +	if (ret) {
> +		log_err("cmd timeout (stat:%#x)\n", sr);
> +	} else if (readl(&priv->regs->sr) & STM32_QSPI_SR_TEF) {
> +		log_err("transfer error (stat:%#x)\n", sr);
> +		ret = -EIO;
>   	}
>   
> +	/* clear flags */
> +	writel(STM32_QSPI_FCR_CTCF | STM32_QSPI_FCR_CTEF, &priv->regs->fcr);
> +
>   	if (!ret)
>   		ret = _stm32_qspi_wait_for_not_busy(priv);
>   


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
