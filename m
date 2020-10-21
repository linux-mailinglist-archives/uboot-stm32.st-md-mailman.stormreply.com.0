Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C4D294CAD
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:34:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4912C3FAE0;
	Wed, 21 Oct 2020 12:34:21 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FD6EC3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:34:20 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LCS5ZJ019779; Wed, 21 Oct 2020 14:34:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zDAoKrNxMQsASqon/MX4hoVKZZ27aOaMkMubdCoURZA=;
 b=VYryjgfYRcTvp9kPomeHZZBEQe2OqGEKXy5LgR1mwL8cd93nZqBLp0EccAngI/LCebcm
 fUkDVAvI15i0KA8xFVqMdI39NQtfAoI522aL1r1LYRt3Ow4qcxMfKGnP6nphaa/cb4CU
 EG9QjBQkahyKWniSH6bSe5R+ij2eIH0ZXUiDSgrV1tHG1qSxKfyPJ4FlO/7fuhVFZCC3
 geu2aJn7LOZXcXuNWYMuzTYPI5Z2YK+G2h4lWofCd9THH/5lSwWgwUVz7K9/csaiqvcx
 /ur3mGH1lRtp4+0fEcupUSpqLn+dbESmI7qJ0oQ7yb6EaIruDO0j759Puxl51rgc9Fgc Pw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347pcx20wx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:34:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E4B76100034;
 Wed, 21 Oct 2020 14:34:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id DB4A92E9C8A;
 Wed, 21 Oct 2020 14:34:18 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:34:18 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:34:18 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 25/33] spi: stm32_qspi: migrate trace to dev and log macro
Thread-Index: AQHWogrOqrgf40WmMkeTwMXcD+jedKmh51yA
Date: Wed, 21 Oct 2020 12:34:18 +0000
Message-ID: <1713ba72-283a-b6ae-4e93-c078090aa565@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-26-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-26-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <3B40641CF9603A49BFD5C97AC7617812@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH 25/33] spi: stm32_qspi: migrate trace to
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
> Change debug/pr_* to log_* or dev_* macro and define LOG_CATEGORY.
>
> Remove the "%s:" __func__  header as it is managed by dev macro
> (dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/spi/stm32_qspi.c | 46 ++++++++++++++++++++++------------------
>  1 file changed, 25 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/spi/stm32_qspi.c b/drivers/spi/stm32_qspi.c
> index a53b941410..d46adcb19a 100644
> --- a/drivers/spi/stm32_qspi.c
> +++ b/drivers/spi/stm32_qspi.c
> @@ -7,6 +7,8 @@
>   * STM32 QSPI driver
>   */
>  
> +#define LOG_CATEGORY UCLASS_SPI
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <dm.h>
> @@ -136,7 +138,7 @@ static int _stm32_qspi_wait_for_not_busy(struct stm32_qspi_priv *priv)
>  				 !(sr & STM32_QSPI_SR_BUSY),
>  				 STM32_BUSY_TIMEOUT_US);
>  	if (ret)
> -		pr_err("busy timeout (stat:%#x)\n", sr);
> +		log_err("busy timeout (stat:%#x)\n", sr);
>  
>  	return ret;
>  }
> @@ -154,9 +156,9 @@ static int _stm32_qspi_wait_cmd(struct stm32_qspi_priv *priv,
>  				 sr & STM32_QSPI_SR_TCF,
>  				 STM32_QSPI_CMD_TIMEOUT_US);
>  	if (ret) {
> -		pr_err("cmd timeout (stat:%#x)\n", sr);
> +		log_err("cmd timeout (stat:%#x)\n", sr);
>  	} else if (readl(&priv->regs->sr) & STM32_QSPI_SR_TEF) {
> -		pr_err("transfer error (stat:%#x)\n", sr);
> +		log_err("transfer error (stat:%#x)\n", sr);
>  		ret = -EIO;
>  	}
>  
> @@ -198,7 +200,7 @@ static int _stm32_qspi_poll(struct stm32_qspi_priv *priv,
>  					 sr & STM32_QSPI_SR_FTF,
>  					 STM32_QSPI_FIFO_TIMEOUT_US);
>  		if (ret) {
> -			pr_err("fifo timeout (len:%d stat:%#x)\n", len, sr);
> +			log_err("fifo timeout (len:%d stat:%#x)\n", len, sr);
>  			return ret;
>  		}
>  
> @@ -246,10 +248,10 @@ static int stm32_qspi_exec_op(struct spi_slave *slave,
>  	u8 mode = STM32_QSPI_CCR_IND_WRITE;
>  	int timeout, ret;
>  
> -	debug("%s: cmd:%#x mode:%d.%d.%d.%d addr:%#llx len:%#x\n",
> -	      __func__, op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> -	      op->dummy.buswidth, op->data.buswidth,
> -	      op->addr.val, op->data.nbytes);
> +	dev_dbg(slave->dev, "cmd:%#x mode:%d.%d.%d.%d addr:%#llx len:%#x\n",
> +		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
> +		op->dummy.buswidth, op->data.buswidth,
> +		op->addr.val, op->data.nbytes);
>  
>  	ret = _stm32_qspi_wait_for_not_busy(priv);
>  	if (ret)
> @@ -320,7 +322,7 @@ abort:
>  	writel(STM32_QSPI_FCR_CTCF, &priv->regs->fcr);
>  
>  	if (ret || timeout)
> -		pr_err("%s ret:%d abort timeout:%d\n", __func__, ret, timeout);
> +		dev_err(slave->dev, "ret:%d abort timeout:%d\n", ret, timeout);
>  
>  	return ret;
>  }
> @@ -353,8 +355,8 @@ static int stm32_qspi_probe(struct udevice *bus)
>  	if (priv->mm_size > STM32_QSPI_MAX_MMAP_SZ)
>  		return -EINVAL;
>  
> -	debug("%s: regs=<0x%p> mapped=<0x%p> mapped_size=<0x%lx>\n",
> -	      __func__, priv->regs, priv->mm_base, priv->mm_size);
> +	dev_dbg(bus, "regs=<0x%p> mapped=<0x%p> mapped_size=<0x%lx>\n",
> +		priv->regs, priv->mm_base, priv->mm_size);
>  
>  	ret = clk_get_by_index(bus, 0, &clk);
>  	if (ret < 0)
> @@ -475,8 +477,8 @@ static int stm32_qspi_set_speed(struct udevice *bus, uint speed)
>  			STM32_QSPI_DCR_CSHT_MASK << STM32_QSPI_DCR_CSHT_SHIFT,
>  			csht << STM32_QSPI_DCR_CSHT_SHIFT);
>  
> -	debug("%s: regs=%p, speed=%d\n", __func__, priv->regs,
> -	      (qspi_clk / (prescaler + 1)));
> +	dev_dbg(bus, "regs=%p, speed=%d\n", priv->regs,
> +		(qspi_clk / (prescaler + 1)));
>  
>  	return 0;
>  }
> @@ -485,6 +487,7 @@ static int stm32_qspi_set_mode(struct udevice *bus, uint mode)
>  {
>  	struct stm32_qspi_priv *priv = dev_get_priv(bus);
>  	int ret;
> +	const char *str_rx, *str_tx;
>  
>  	ret = _stm32_qspi_wait_for_not_busy(priv);
>  	if (ret)
> @@ -500,21 +503,22 @@ static int stm32_qspi_set_mode(struct udevice *bus, uint mode)
>  	if (mode & SPI_CS_HIGH)
>  		return -ENODEV;
>  
> -	debug("%s: regs=%p, mode=%d rx: ", __func__, priv->regs, mode);
> -
>  	if (mode & SPI_RX_QUAD)
> -		debug("quad, tx: ");
> +		str_rx = "quad";
>  	else if (mode & SPI_RX_DUAL)
> -		debug("dual, tx: ");
> +		str_rx = "dual";
>  	else
> -		debug("single, tx: ");
> +		str_rx = "single";
>  
>  	if (mode & SPI_TX_QUAD)
> -		debug("quad\n");
> +		str_tx = "quad";
>  	else if (mode & SPI_TX_DUAL)
> -		debug("dual\n");
> +		str_tx = "dual";
>  	else
> -		debug("single\n");
> +		str_tx = "single";
> +
> +	dev_dbg(bus, "regs=%p, mode=%d rx: %s, tx: %s\n",
> +		priv->regs, mode, str_rx, str_tx);
>  
>  	return 0;
>  }

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
