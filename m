Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAEA294C88
	for <lists+uboot-stm32@lfdr.de>; Wed, 21 Oct 2020 14:26:09 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CD20C3FAE0;
	Wed, 21 Oct 2020 12:26:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C09B2C3FAD5
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Oct 2020 12:26:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09LC7ptY002924; Wed, 21 Oct 2020 14:26:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ssfqEACGLDlA8UCNfZsvjlh8xKp/CAC4/nxJIl8oLDA=;
 b=ANJ1hdWC1Yjsavb6QXktZq0HgDcSuHzt/jCe8MNz5STShXW1YMvpT08iO7rT9buvHj2y
 QD87dEy5aGUttk0dKf99WCcEAaTUKqbTu772MDGvCjIENXUweuhxMvugy2xTy/3QiwVp
 lwUFqPQ50805BotptEIqb6IJa6/MKrT/zYOiNI9DWgJFECaP7oTxVOQJye4miAkSZUDk
 OdBaHygWoltAKuZoaCSnJVQyhBL2dpl0dIStYqeucFyre/pMoZx3Ar1sELcJiPc5jgTd
 6YCuRSvv5P8DspAtIfTDNJwhSfpxqGArFYfXrA4rhsPXmOHVGh9nG5jo0r+dKddZZsk3 /g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 347qggahjf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Oct 2020 14:26:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDC58100034;
 Wed, 21 Oct 2020 14:26:02 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C34A02E8451;
 Wed, 21 Oct 2020 14:26:02 +0200 (CEST)
Received: from SFHDAG2NODE3.st.com (10.75.127.6) by SFHDAG2NODE1.st.com
 (10.75.127.4) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 14:26:02 +0200
Received: from SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c]) by
 SFHDAG2NODE3.st.com ([fe80::31b3:13bf:2dbe:f64c%20]) with mapi id
 15.00.1473.003; Wed, 21 Oct 2020 14:26:02 +0200
From: Patrice CHOTARD <patrice.chotard@st.com>
To: Patrick DELAUNAY <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 09/33] mmc: stm32_sdmmc2: migrate trace to dev and log
 macro
Thread-Index: AQHWogrDtuBEr4UssU6a8jY6GAhtZqmh5Q2A
Date: Wed, 21 Oct 2020 12:26:02 +0000
Message-ID: <9f95954d-5cf6-5da6-e0c2-b935f54373f0@st.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-10-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-10-patrick.delaunay@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <3A4168643806544D947B3E3F324BA334@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.737
 definitions=2020-10-21_05:2020-10-20,
 2020-10-21 signatures=0
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [Uboot-stm32] [PATCH 09/33] mmc: stm32_sdmmc2: migrate trace to
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
> Define LOG_CATEGORY, use dev_ macro when it is possible.
> Remove the "%s:" __func__  header as it is managed by dev macro
> (dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).
>
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
>
>  drivers/mmc/stm32_sdmmc2.c | 85 ++++++++++++++++++++------------------
>  1 file changed, 44 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 6d50356217..483660c9d3 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -4,6 +4,8 @@
>   * Author(s): Patrice Chotard, <patrice.chotard@st.com> for STMicroelectronics.
>   */
>  
> +#define LOG_CATEGORY UCLASS_MMC
> +
>  #include <common.h>
>  #include <clk.h>
>  #include <cpu_func.h>
> @@ -200,10 +202,11 @@ struct stm32_sdmmc2_ctx {
>  #define SDMMC_CMD_TIMEOUT		0xFFFFFFFF
>  #define SDMMC_BUSYD0END_TIMEOUT_US	2000000
>  
> -static void stm32_sdmmc2_start_data(struct stm32_sdmmc2_priv *priv,
> +static void stm32_sdmmc2_start_data(struct udevice *dev,
>  				    struct mmc_data *data,
>  				    struct stm32_sdmmc2_ctx *ctx)
>  {
> +	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
>  	u32 data_ctrl, idmabase0;
>  
>  	/* Configure the SDMMC DPSM (Data Path State Machine) */
> @@ -241,10 +244,11 @@ static void stm32_sdmmc2_start_data(struct stm32_sdmmc2_priv *priv,
>  	writel(SDMMC_IDMACTRL_IDMAEN, priv->base + SDMMC_IDMACTRL);
>  }
>  
> -static void stm32_sdmmc2_start_cmd(struct stm32_sdmmc2_priv *priv,
> +static void stm32_sdmmc2_start_cmd(struct udevice *dev,
>  				   struct mmc_cmd *cmd, u32 cmd_param,
>  				   struct stm32_sdmmc2_ctx *ctx)
>  {
> +	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
>  	u32 timeout = 0;
>  
>  	if (readl(priv->base + SDMMC_CMD) & SDMMC_CMD_CPSMEN)
> @@ -290,10 +294,11 @@ static void stm32_sdmmc2_start_cmd(struct stm32_sdmmc2_priv *priv,
>  	writel(cmd_param, priv->base + SDMMC_CMD);
>  }
>  
> -static int stm32_sdmmc2_end_cmd(struct stm32_sdmmc2_priv *priv,
> +static int stm32_sdmmc2_end_cmd(struct udevice *dev,
>  				struct mmc_cmd *cmd,
>  				struct stm32_sdmmc2_ctx *ctx)
>  {
> +	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
>  	u32 mask = SDMMC_STA_CTIMEOUT;
>  	u32 status;
>  	int ret;
> @@ -311,22 +316,22 @@ static int stm32_sdmmc2_end_cmd(struct stm32_sdmmc2_priv *priv,
>  				 10000);
>  
>  	if (ret < 0) {
> -		debug("%s: timeout reading SDMMC_STA register\n", __func__);
> +		dev_dbg(dev, "timeout reading SDMMC_STA register\n");
>  		ctx->dpsm_abort = true;
>  		return ret;
>  	}
>  
>  	/* Check status */
>  	if (status & SDMMC_STA_CTIMEOUT) {
> -		debug("%s: error SDMMC_STA_CTIMEOUT (0x%x) for cmd %d\n",
> -		      __func__, status, cmd->cmdidx);
> +		dev_dbg(dev, "error SDMMC_STA_CTIMEOUT (0x%x) for cmd %d\n",
> +			status, cmd->cmdidx);
>  		ctx->dpsm_abort = true;
>  		return -ETIMEDOUT;
>  	}
>  
>  	if (status & SDMMC_STA_CCRCFAIL && cmd->resp_type & MMC_RSP_CRC) {
> -		debug("%s: error SDMMC_STA_CCRCFAIL (0x%x) for cmd %d\n",
> -		      __func__, status, cmd->cmdidx);
> +		dev_dbg(dev, "error SDMMC_STA_CCRCFAIL (0x%x) for cmd %d\n",
> +			status, cmd->cmdidx);
>  		ctx->dpsm_abort = true;
>  		return -EILSEQ;
>  	}
> @@ -350,15 +355,15 @@ static int stm32_sdmmc2_end_cmd(struct stm32_sdmmc2_priv *priv,
>  						 SDMMC_BUSYD0END_TIMEOUT_US);
>  
>  			if (ret < 0) {
> -				debug("%s: timeout reading SDMMC_STA\n",
> -				      __func__);
> +				dev_dbg(dev, "timeout reading SDMMC_STA\n");
>  				ctx->dpsm_abort = true;
>  				return ret;
>  			}
>  
>  			if (status & SDMMC_STA_DTIMEOUT) {
> -				debug("%s: error SDMMC_STA_DTIMEOUT (0x%x)\n",
> -				      __func__, status);
> +				dev_dbg(dev,
> +					"error SDMMC_STA_DTIMEOUT (0x%x)\n",
> +					status);
>  				ctx->dpsm_abort = true;
>  				return -ETIMEDOUT;
>  			}
> @@ -368,11 +373,12 @@ static int stm32_sdmmc2_end_cmd(struct stm32_sdmmc2_priv *priv,
>  	return 0;
>  }
>  
> -static int stm32_sdmmc2_end_data(struct stm32_sdmmc2_priv *priv,
> +static int stm32_sdmmc2_end_data(struct udevice *dev,
>  				 struct mmc_cmd *cmd,
>  				 struct mmc_data *data,
>  				 struct stm32_sdmmc2_ctx *ctx)
>  {
> +	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
>  	u32 mask = SDMMC_STA_DCRCFAIL | SDMMC_STA_DTIMEOUT |
>  		   SDMMC_STA_IDMATE | SDMMC_STA_DATAEND;
>  	u32 status;
> @@ -394,37 +400,37 @@ static int stm32_sdmmc2_end_data(struct stm32_sdmmc2_priv *priv,
>  		invalidate_dcache_range(ctx->cache_start, ctx->cache_end);
>  
>  	if (status & SDMMC_STA_DCRCFAIL) {
> -		debug("%s: error SDMMC_STA_DCRCFAIL (0x%x) for cmd %d\n",
> -		      __func__, status, cmd->cmdidx);
> +		dev_dbg(dev, "error SDMMC_STA_DCRCFAIL (0x%x) for cmd %d\n",
> +			status, cmd->cmdidx);
>  		if (readl(priv->base + SDMMC_DCOUNT))
>  			ctx->dpsm_abort = true;
>  		return -EILSEQ;
>  	}
>  
>  	if (status & SDMMC_STA_DTIMEOUT) {
> -		debug("%s: error SDMMC_STA_DTIMEOUT (0x%x) for cmd %d\n",
> -		      __func__, status, cmd->cmdidx);
> +		dev_dbg(dev, "error SDMMC_STA_DTIMEOUT (0x%x) for cmd %d\n",
> +			status, cmd->cmdidx);
>  		ctx->dpsm_abort = true;
>  		return -ETIMEDOUT;
>  	}
>  
>  	if (status & SDMMC_STA_TXUNDERR) {
> -		debug("%s: error SDMMC_STA_TXUNDERR (0x%x) for cmd %d\n",
> -		      __func__, status, cmd->cmdidx);
> +		dev_dbg(dev, "error SDMMC_STA_TXUNDERR (0x%x) for cmd %d\n",
> +			status, cmd->cmdidx);
>  		ctx->dpsm_abort = true;
>  		return -EIO;
>  	}
>  
>  	if (status & SDMMC_STA_RXOVERR) {
> -		debug("%s: error SDMMC_STA_RXOVERR (0x%x) for cmd %d\n",
> -		      __func__, status, cmd->cmdidx);
> +		dev_dbg(dev, "error SDMMC_STA_RXOVERR (0x%x) for cmd %d\n",
> +			status, cmd->cmdidx);
>  		ctx->dpsm_abort = true;
>  		return -EIO;
>  	}
>  
>  	if (status & SDMMC_STA_IDMATE) {
> -		debug("%s: error SDMMC_STA_IDMATE (0x%x) for cmd %d\n",
> -		      __func__, status, cmd->cmdidx);
> +		dev_dbg(dev, "error SDMMC_STA_IDMATE (0x%x) for cmd %d\n",
> +			status, cmd->cmdidx);
>  		ctx->dpsm_abort = true;
>  		return -EIO;
>  	}
> @@ -448,19 +454,18 @@ retry_cmd:
>  
>  	if (data) {
>  		ctx.data_length = data->blocks * data->blocksize;
> -		stm32_sdmmc2_start_data(priv, data, &ctx);
> +		stm32_sdmmc2_start_data(dev, data, &ctx);
>  	}
>  
> -	stm32_sdmmc2_start_cmd(priv, cmd, cmdat, &ctx);
> +	stm32_sdmmc2_start_cmd(dev, cmd, cmdat, &ctx);
>  
> -	debug("%s: send cmd %d data: 0x%x @ 0x%x\n",
> -	      __func__, cmd->cmdidx,
> -	      data ? ctx.data_length : 0, (unsigned int)data);
> +	dev_dbg(dev, "send cmd %d data: 0x%x @ 0x%x\n",
> +		cmd->cmdidx, data ? ctx.data_length : 0, (unsigned int)data);
>  
> -	ret = stm32_sdmmc2_end_cmd(priv, cmd, &ctx);
> +	ret = stm32_sdmmc2_end_cmd(dev, cmd, &ctx);
>  
>  	if (data && !ret)
> -		ret = stm32_sdmmc2_end_data(priv, cmd, data, &ctx);
> +		ret = stm32_sdmmc2_end_data(dev, cmd, data, &ctx);
>  
>  	/* Clear flags */
>  	writel(SDMMC_ICR_STATIC_FLAGS, priv->base + SDMMC_ICR);
> @@ -478,26 +483,24 @@ retry_cmd:
>  		stop_cmd.cmdarg = 0;
>  		stop_cmd.resp_type = MMC_RSP_R1b;
>  
> -		debug("%s: send STOP command to abort dpsm treatments\n",
> -		      __func__);
> +		dev_dbg(dev, "send STOP command to abort dpsm treatments\n");
>  
>  		ctx.data_length = 0;
>  
> -		stm32_sdmmc2_start_cmd(priv, &stop_cmd,
> +		stm32_sdmmc2_start_cmd(dev, &stop_cmd,
>  				       SDMMC_CMD_CMDSTOP, &ctx);
> -		stm32_sdmmc2_end_cmd(priv, &stop_cmd, &ctx);
> +		stm32_sdmmc2_end_cmd(dev, &stop_cmd, &ctx);
>  
>  		writel(SDMMC_ICR_STATIC_FLAGS, priv->base + SDMMC_ICR);
>  	}
>  
>  	if ((ret != -ETIMEDOUT) && (ret != 0) && retry) {
> -		printf("%s: cmd %d failed, retrying ...\n",
> -		       __func__, cmd->cmdidx);
> +		dev_err(dev, "cmd %d failed, retrying ...\n", cmd->cmdidx);
>  		retry--;
>  		goto retry_cmd;
>  	}
>  
> -	debug("%s: end for CMD %d, ret = %d\n", __func__, cmd->cmdidx, ret);
> +	dev_dbg(dev, "end for CMD %d, ret = %d\n", cmd->cmdidx, ret);
>  
>  	return ret;
>  }
> @@ -579,8 +582,8 @@ static int stm32_sdmmc2_set_ios(struct udevice *dev)
>  	u32 sys_clock = clk_get_rate(&priv->clk);
>  	u32 clk = 0;
>  
> -	debug("%s: bus_with = %d, clock = %d\n", __func__,
> -	      mmc->bus_width, mmc->clock);
> +	dev_dbg(dev, "bus_with = %d, clock = %d\n",
> +		mmc->bus_width, mmc->clock);
>  
>  	if (mmc->clk_disable)
>  		stm32_sdmmc2_pwrcycle(priv);
> @@ -616,7 +619,7 @@ static int stm32_sdmmc2_getcd(struct udevice *dev)
>  {
>  	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
>  
> -	debug("stm32_sdmmc2_getcd called\n");
> +	dev_dbg(dev, "%s called\n", __func__);
>  
>  	if (dm_gpio_is_valid(&priv->cd_gpio))
>  		return dm_gpio_get_value(&priv->cd_gpio);
> @@ -695,7 +698,7 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  	case 1:
>  		break;
>  	default:
> -		pr_err("invalid \"bus-width\" property, force to 1\n");
> +		dev_err(dev, "invalid \"bus-width\" property, force to 1\n");
>  	}
>  
>  	upriv->mmc = &plat->mmc;

Reviewed-by: Patrice Chotard <patrice.chotard@st.com>

Thanks
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
