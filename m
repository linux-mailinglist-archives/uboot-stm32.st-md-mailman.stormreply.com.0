Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F78569B63
	for <lists+uboot-stm32@lfdr.de>; Thu,  7 Jul 2022 09:19:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A572C0D2BF;
	Thu,  7 Jul 2022 07:19:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC211C03FC3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 Jul 2022 07:19:10 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2675m1P8004621;
 Thu, 7 Jul 2022 09:19:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KucGG6+d1D89jaAcc9ZQcrmE9wb6zELfvzCwcPxy5Jg=;
 b=yFfwwGmv17MxYmIBS6a3GSzxmtGZDMz9umNswvIx8KnYGYdfnPwLhUyzJvJbls6eWwNt
 +T6dG1n+hqo0olByl/pcrQz2XXkks7rk1U3y65CAJFTDlPphrD1JOnLgbntkK1SlUVTm
 Tfg6RtcTaqK5UTZxXHO2PrLQugAcXLcZE5Jmho+7mCA89nZ9wNtWImd0iq+JOaz4mclD
 2T1DFcj2oozWi/O9DyEVC91WF5zO/iHWiIYzCbymS/oDgtjodwTYfSNlYHzXf9+xqPiS
 dHcU5WKrxRKjC/BjooW70cdMsH1USQ48K+YxEAD28bk3NJjpN/DqdG+CY2i0Digtig5z 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h4ub43p5c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 07 Jul 2022 09:19:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 573AA10002A;
 Thu,  7 Jul 2022 09:19:02 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 52A5D20FA5B;
 Thu,  7 Jul 2022 09:19:02 +0200 (CEST)
Received: from [10.201.20.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 7 Jul
 2022 09:19:01 +0200
Message-ID: <1139872a-1b21-30eb-c4c6-62966d734b77@foss.st.com>
Date: Thu, 7 Jul 2022 09:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Patrick Delaunay <patrick.delaunay@foss.st.com>, <u-boot@lists.denx.de>
References: <20220630100144.v2.1.Idba00f2816d362a1675c8c74eac80400cb2e4de7@changeid>
 <20220630100144.v2.2.Id78f6e3f0b5deebedc6e5f54dd99b855a163fd2c@changeid>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220630100144.v2.2.Id78f6e3f0b5deebedc6e5f54dd99b855a163fd2c@changeid>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_05,2022-06-28_01,2022-06-22_01
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Christophe KERELLO <christophe.kerello@foss.st.com>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 uboot-stm32@st-md-mailman.stormreply.com
Subject: Re: [Uboot-stm32] [PATCH v2 2/3] mmc: stm32_sdmmc2: remove privdata
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

On 6/30/22 10:01, Patrick Delaunay wrote:
> All the elements of privdata are static and build from device tree,
> they are moved in platdata to prepare the support of ops
> of_to_plat.
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/mmc/stm32_sdmmc2.c | 145 ++++++++++++++++++-------------------
>  1 file changed, 70 insertions(+), 75 deletions(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index e3853b7fbfb..41f375b9d32 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -30,9 +30,6 @@
>  struct stm32_sdmmc2_plat {
>  	struct mmc_config cfg;
>  	struct mmc mmc;
> -};
> -
> -struct stm32_sdmmc2_priv {
>  	fdt_addr_t base;
>  	struct clk clk;
>  	struct reset_ctl reset_ctl;
> @@ -208,7 +205,7 @@ static void stm32_sdmmc2_start_data(struct udevice *dev,
>  				    struct mmc_data *data,
>  				    struct stm32_sdmmc2_ctx *ctx)
>  {
> -	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
> +	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
>  	u32 data_ctrl, idmabase0;
>  
>  	/* Configure the SDMMC DPSM (Data Path State Machine) */
> @@ -224,10 +221,10 @@ static void stm32_sdmmc2_start_data(struct udevice *dev,
>  	}
>  
>  	/* Set the SDMMC DataLength value */
> -	writel(ctx->data_length, priv->base + SDMMC_DLEN);
> +	writel(ctx->data_length, plat->base + SDMMC_DLEN);
>  
>  	/* Write to SDMMC DCTRL */
> -	writel(data_ctrl, priv->base + SDMMC_DCTRL);
> +	writel(data_ctrl, plat->base + SDMMC_DCTRL);
>  
>  	/* Cache align */
>  	ctx->cache_start = rounddown(idmabase0, ARCH_DMA_MINALIGN);
> @@ -242,19 +239,19 @@ static void stm32_sdmmc2_start_data(struct udevice *dev,
>  	flush_dcache_range(ctx->cache_start, ctx->cache_end);
>  
>  	/* Enable internal DMA */
> -	writel(idmabase0, priv->base + SDMMC_IDMABASE0);
> -	writel(SDMMC_IDMACTRL_IDMAEN, priv->base + SDMMC_IDMACTRL);
> +	writel(idmabase0, plat->base + SDMMC_IDMABASE0);
> +	writel(SDMMC_IDMACTRL_IDMAEN, plat->base + SDMMC_IDMACTRL);
>  }
>  
>  static void stm32_sdmmc2_start_cmd(struct udevice *dev,
>  				   struct mmc_cmd *cmd, u32 cmd_param,
>  				   struct stm32_sdmmc2_ctx *ctx)
>  {
> -	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
> +	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
>  	u32 timeout = 0;
>  
> -	if (readl(priv->base + SDMMC_CMD) & SDMMC_CMD_CPSMEN)
> -		writel(0, priv->base + SDMMC_CMD);
> +	if (readl(plat->base + SDMMC_CMD) & SDMMC_CMD_CPSMEN)
> +		writel(0, plat->base + SDMMC_CMD);
>  
>  	cmd_param |= cmd->cmdidx | SDMMC_CMD_CPSMEN;
>  	if (cmd->resp_type & MMC_RSP_PRESENT) {
> @@ -277,30 +274,30 @@ static void stm32_sdmmc2_start_cmd(struct udevice *dev,
>  	if (ctx->data_length) {
>  		timeout = SDMMC_CMD_TIMEOUT;
>  	} else {
> -		writel(0, priv->base + SDMMC_DCTRL);
> +		writel(0, plat->base + SDMMC_DCTRL);
>  
>  		if (cmd->resp_type & MMC_RSP_BUSY)
>  			timeout = SDMMC_CMD_TIMEOUT;
>  	}
>  
>  	/* Set the SDMMC Data TimeOut value */
> -	writel(timeout, priv->base + SDMMC_DTIMER);
> +	writel(timeout, plat->base + SDMMC_DTIMER);
>  
>  	/* Clear flags */
> -	writel(SDMMC_ICR_STATIC_FLAGS, priv->base + SDMMC_ICR);
> +	writel(SDMMC_ICR_STATIC_FLAGS, plat->base + SDMMC_ICR);
>  
>  	/* Set SDMMC argument value */
> -	writel(cmd->cmdarg, priv->base + SDMMC_ARG);
> +	writel(cmd->cmdarg, plat->base + SDMMC_ARG);
>  
>  	/* Set SDMMC command parameters */
> -	writel(cmd_param, priv->base + SDMMC_CMD);
> +	writel(cmd_param, plat->base + SDMMC_CMD);
>  }
>  
>  static int stm32_sdmmc2_end_cmd(struct udevice *dev,
>  				struct mmc_cmd *cmd,
>  				struct stm32_sdmmc2_ctx *ctx)
>  {
> -	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
> +	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
>  	u32 mask = SDMMC_STA_CTIMEOUT;
>  	u32 status;
>  	int ret;
> @@ -314,7 +311,7 @@ static int stm32_sdmmc2_end_cmd(struct udevice *dev,
>  	}
>  
>  	/* Polling status register */
> -	ret = readl_poll_timeout(priv->base + SDMMC_STA, status, status & mask,
> +	ret = readl_poll_timeout(plat->base + SDMMC_STA, status, status & mask,
>  				 10000);
>  
>  	if (ret < 0) {
> @@ -339,11 +336,11 @@ static int stm32_sdmmc2_end_cmd(struct udevice *dev,
>  	}
>  
>  	if (status & SDMMC_STA_CMDREND && cmd->resp_type & MMC_RSP_PRESENT) {
> -		cmd->response[0] = readl(priv->base + SDMMC_RESP1);
> +		cmd->response[0] = readl(plat->base + SDMMC_RESP1);
>  		if (cmd->resp_type & MMC_RSP_136) {
> -			cmd->response[1] = readl(priv->base + SDMMC_RESP2);
> -			cmd->response[2] = readl(priv->base + SDMMC_RESP3);
> -			cmd->response[3] = readl(priv->base + SDMMC_RESP4);
> +			cmd->response[1] = readl(plat->base + SDMMC_RESP2);
> +			cmd->response[2] = readl(plat->base + SDMMC_RESP3);
> +			cmd->response[3] = readl(plat->base + SDMMC_RESP4);
>  		}
>  
>  		/* Wait for BUSYD0END flag if busy status is detected */
> @@ -352,7 +349,7 @@ static int stm32_sdmmc2_end_cmd(struct udevice *dev,
>  			mask = SDMMC_STA_DTIMEOUT | SDMMC_STA_BUSYD0END;
>  
>  			/* Polling status register */
> -			ret = readl_poll_timeout(priv->base + SDMMC_STA,
> +			ret = readl_poll_timeout(plat->base + SDMMC_STA,
>  						 status, status & mask,
>  						 SDMMC_BUSYD0END_TIMEOUT_US);
>  
> @@ -380,7 +377,7 @@ static int stm32_sdmmc2_end_data(struct udevice *dev,
>  				 struct mmc_data *data,
>  				 struct stm32_sdmmc2_ctx *ctx)
>  {
> -	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
> +	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
>  	u32 mask = SDMMC_STA_DCRCFAIL | SDMMC_STA_DTIMEOUT |
>  		   SDMMC_STA_IDMATE | SDMMC_STA_DATAEND;
>  	u32 status;
> @@ -390,9 +387,9 @@ static int stm32_sdmmc2_end_data(struct udevice *dev,
>  	else
>  		mask |= SDMMC_STA_TXUNDERR;
>  
> -	status = readl(priv->base + SDMMC_STA);
> +	status = readl(plat->base + SDMMC_STA);
>  	while (!(status & mask))
> -		status = readl(priv->base + SDMMC_STA);
> +		status = readl(plat->base + SDMMC_STA);
>  
>  	/*
>  	 * Need invalidate the dcache again to avoid any
> @@ -404,7 +401,7 @@ static int stm32_sdmmc2_end_data(struct udevice *dev,
>  	if (status & SDMMC_STA_DCRCFAIL) {
>  		dev_dbg(dev, "error SDMMC_STA_DCRCFAIL (0x%x) for cmd %d\n",
>  			status, cmd->cmdidx);
> -		if (readl(priv->base + SDMMC_DCOUNT))
> +		if (readl(plat->base + SDMMC_DCOUNT))
>  			ctx->dpsm_abort = true;
>  		return -EILSEQ;
>  	}
> @@ -443,7 +440,7 @@ static int stm32_sdmmc2_end_data(struct udevice *dev,
>  static int stm32_sdmmc2_send_cmd(struct udevice *dev, struct mmc_cmd *cmd,
>  				 struct mmc_data *data)
>  {
> -	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
> +	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
>  	struct stm32_sdmmc2_ctx ctx;
>  	u32 cmdat = data ? SDMMC_CMD_CMDTRANS : 0;
>  	int ret, retry = 3;
> @@ -470,9 +467,9 @@ retry_cmd:
>  		ret = stm32_sdmmc2_end_data(dev, cmd, data, &ctx);
>  
>  	/* Clear flags */
> -	writel(SDMMC_ICR_STATIC_FLAGS, priv->base + SDMMC_ICR);
> +	writel(SDMMC_ICR_STATIC_FLAGS, plat->base + SDMMC_ICR);
>  	if (data)
> -		writel(0x0, priv->base + SDMMC_IDMACTRL);
> +		writel(0x0, plat->base + SDMMC_IDMACTRL);
>  
>  	/*
>  	 * To stop Data Path State Machine, a stop_transmission command
> @@ -493,7 +490,7 @@ retry_cmd:
>  				       SDMMC_CMD_CMDSTOP, &ctx);
>  		stm32_sdmmc2_end_cmd(dev, &stop_cmd, &ctx);
>  
> -		writel(SDMMC_ICR_STATIC_FLAGS, priv->base + SDMMC_ICR);
> +		writel(SDMMC_ICR_STATIC_FLAGS, plat->base + SDMMC_ICR);
>  	}
>  
>  	if ((ret != -ETIMEDOUT) && (ret != 0) && retry) {
> @@ -512,17 +509,17 @@ retry_cmd:
>   * This will reset the SDMMC to the reset state and the CPSM and DPSM
>   * to the Idle state. SDMMC is disabled, Signals Hiz.
>   */
> -static void stm32_sdmmc2_reset(struct stm32_sdmmc2_priv *priv)
> +static void stm32_sdmmc2_reset(struct stm32_sdmmc2_plat *plat)
>  {
> -	if (reset_valid(&priv->reset_ctl)) {
> +	if (reset_valid(&plat->reset_ctl)) {
>  		/* Reset */
> -		reset_assert(&priv->reset_ctl);
> +		reset_assert(&plat->reset_ctl);
>  		udelay(2);
> -		reset_deassert(&priv->reset_ctl);
> +		reset_deassert(&plat->reset_ctl);
>  	}
>  
>  	/* init the needed SDMMC register after reset */
> -	writel(priv->pwr_reg_msk, priv->base + SDMMC_POWER);
> +	writel(plat->pwr_reg_msk, plat->base + SDMMC_POWER);
>  }
>  
>  /*
> @@ -531,13 +528,13 @@ static void stm32_sdmmc2_reset(struct stm32_sdmmc2_priv *priv)
>   * SDMMC_CMD and SDMMC_CK are driven low, to prevent the card from being
>   * supplied through the signal lines.
>   */
> -static void stm32_sdmmc2_pwrcycle(struct stm32_sdmmc2_priv *priv)
> +static void stm32_sdmmc2_pwrcycle(struct stm32_sdmmc2_plat *plat)
>  {
> -	if ((readl(priv->base + SDMMC_POWER) & SDMMC_POWER_PWRCTRL_MASK) ==
> +	if ((readl(plat->base + SDMMC_POWER) & SDMMC_POWER_PWRCTRL_MASK) ==
>  	    SDMMC_POWER_PWRCTRL_CYCLE)
>  		return;
>  
> -	stm32_sdmmc2_reset(priv);
> +	stm32_sdmmc2_reset(plat);
>  }
>  
>  /*
> @@ -546,10 +543,10 @@ static void stm32_sdmmc2_pwrcycle(struct stm32_sdmmc2_priv *priv)
>   * Reset => Power-Cycle => Power-Off => Power
>   *    PWRCTRL=10     PWCTRL=00    PWCTRL=11
>   */
> -static void stm32_sdmmc2_pwron(struct stm32_sdmmc2_priv *priv)
> +static void stm32_sdmmc2_pwron(struct stm32_sdmmc2_plat *plat)
>  {
>  	u32 pwrctrl =
> -		readl(priv->base + SDMMC_POWER) &  SDMMC_POWER_PWRCTRL_MASK;
> +		readl(plat->base + SDMMC_POWER) &  SDMMC_POWER_PWRCTRL_MASK;
>  
>  	if (pwrctrl == SDMMC_POWER_PWRCTRL_ON)
>  		return;
> @@ -558,21 +555,21 @@ static void stm32_sdmmc2_pwron(struct stm32_sdmmc2_priv *priv)
>  	 * it is the reset state here = the only managed by the driver
>  	 */
>  	if (pwrctrl == SDMMC_POWER_PWRCTRL_OFF) {
> -		writel(SDMMC_POWER_PWRCTRL_CYCLE | priv->pwr_reg_msk,
> -		       priv->base + SDMMC_POWER);
> +		writel(SDMMC_POWER_PWRCTRL_CYCLE | plat->pwr_reg_msk,
> +		       plat->base + SDMMC_POWER);
>  	}
>  
>  	/*
>  	 * the remaining case is SDMMC_POWER_PWRCTRL_CYCLE
>  	 * switch to Power-Off state: SDMCC disable, signals drive 1
>  	 */
> -	writel(SDMMC_POWER_PWRCTRL_OFF | priv->pwr_reg_msk,
> -	       priv->base + SDMMC_POWER);
> +	writel(SDMMC_POWER_PWRCTRL_OFF | plat->pwr_reg_msk,
> +	       plat->base + SDMMC_POWER);
>  
>  	/* After the 1ms delay set the SDMMC to power-on */
>  	mdelay(1);
> -	writel(SDMMC_POWER_PWRCTRL_ON | priv->pwr_reg_msk,
> -	       priv->base + SDMMC_POWER);
> +	writel(SDMMC_POWER_PWRCTRL_ON | plat->pwr_reg_msk,
> +	       plat->base + SDMMC_POWER);
>  
>  	/* during the first 74 SDMMC_CK cycles the SDMMC is still disabled. */
>  }
> @@ -581,18 +578,18 @@ static void stm32_sdmmc2_pwron(struct stm32_sdmmc2_priv *priv)
>  static int stm32_sdmmc2_set_ios(struct udevice *dev)
>  {
>  	struct mmc *mmc = mmc_get_mmc_dev(dev);
> -	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
> +	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
>  	u32 desired = mmc->clock;
> -	u32 sys_clock = clk_get_rate(&priv->clk);
> +	u32 sys_clock = clk_get_rate(&plat->clk);
>  	u32 clk = 0;
>  
>  	dev_dbg(dev, "bus_with = %d, clock = %d\n",
>  		mmc->bus_width, mmc->clock);
>  
>  	if (mmc->clk_disable)
> -		stm32_sdmmc2_pwrcycle(priv);
> +		stm32_sdmmc2_pwrcycle(plat);
>  	else
> -		stm32_sdmmc2_pwron(priv);
> +		stm32_sdmmc2_pwron(plat);
>  
>  	/*
>  	 * clk_div = 0 => command and data generated on SDMMCCLK falling edge
> @@ -602,7 +599,7 @@ static int stm32_sdmmc2_set_ios(struct udevice *dev)
>  	 * SDMMCCLK falling edge
>  	 */
>  	if (desired && ((sys_clock > desired) ||
> -			IS_RISING_EDGE(priv->clk_reg_msk))) {
> +			IS_RISING_EDGE(plat->clk_reg_msk))) {
>  		clk = DIV_ROUND_UP(sys_clock, 2 * desired);
>  		if (clk > SDMMC_CLKCR_CLKDIV_MAX)
>  			clk = SDMMC_CLKCR_CLKDIV_MAX;
> @@ -613,30 +610,30 @@ static int stm32_sdmmc2_set_ios(struct udevice *dev)
>  	if (mmc->bus_width == 8)
>  		clk |= SDMMC_CLKCR_WIDBUS_8;
>  
> -	writel(clk | priv->clk_reg_msk | SDMMC_CLKCR_HWFC_EN,
> -	       priv->base + SDMMC_CLKCR);
> +	writel(clk | plat->clk_reg_msk | SDMMC_CLKCR_HWFC_EN,
> +	       plat->base + SDMMC_CLKCR);
>  
>  	return 0;
>  }
>  
>  static int stm32_sdmmc2_getcd(struct udevice *dev)
>  {
> -	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
> +	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
>  
>  	dev_dbg(dev, "%s called\n", __func__);
>  
> -	if (dm_gpio_is_valid(&priv->cd_gpio))
> -		return dm_gpio_get_value(&priv->cd_gpio);
> +	if (dm_gpio_is_valid(&plat->cd_gpio))
> +		return dm_gpio_get_value(&plat->cd_gpio);
>  
>  	return 1;
>  }
>  
>  static int stm32_sdmmc2_host_power_cycle(struct udevice *dev)
>  {
> -	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
> +	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
>  
> -	writel(SDMMC_POWER_PWRCTRL_CYCLE | priv->pwr_reg_msk,
> -	       priv->base + SDMMC_POWER);
> +	writel(SDMMC_POWER_PWRCTRL_CYCLE | plat->pwr_reg_msk,
> +	       plat->base + SDMMC_POWER);
>  
>  	return 0;
>  }
> @@ -650,7 +647,7 @@ static const struct dm_mmc_ops stm32_sdmmc2_ops = {
>  
>  static int stm32_sdmmc2_probe_level_translator(struct udevice *dev)
>  {
> -	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
> +	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
>  	struct gpio_desc cmd_gpio;
>  	struct gpio_desc ck_gpio;
>  	struct gpio_desc ckin_gpio;
> @@ -660,7 +657,7 @@ static int stm32_sdmmc2_probe_level_translator(struct udevice *dev)
>  	 * Assume the level translator is present if st,use-ckin is set.
>  	 * This is to cater for DTs which do not implement this test.
>  	 */
> -	priv->clk_reg_msk |= SDMMC_CLKCR_SELCLKRX_CKIN;
> +	plat->clk_reg_msk |= SDMMC_CLKCR_SELCLKRX_CKIN;
>  
>  	ret = gpio_request_by_name(dev, "st,cmd-gpios", 0, &cmd_gpio,
>  				   GPIOD_IS_OUT | GPIOD_IS_OUT_ACTIVE);
> @@ -694,7 +691,7 @@ static int stm32_sdmmc2_probe_level_translator(struct udevice *dev)
>  
>  	/* Level translator is present if CK signal is propagated to CKIN */
>  	if (!clk_hi || clk_lo)
> -		priv->clk_reg_msk &= ~SDMMC_CLKCR_SELCLKRX_CKIN;
> +		plat->clk_reg_msk &= ~SDMMC_CLKCR_SELCLKRX_CKIN;
>  
>  	dm_gpio_free(dev, &ckin_gpio);
>  
> @@ -712,34 +709,33 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  {
>  	struct mmc_uclass_priv *upriv = dev_get_uclass_priv(dev);
>  	struct stm32_sdmmc2_plat *plat = dev_get_plat(dev);
> -	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
>  	struct mmc_config *cfg = &plat->cfg;
>  	int ret;
>  
> -	priv->base = dev_read_addr(dev);
> -	if (priv->base == FDT_ADDR_T_NONE)
> +	plat->base = dev_read_addr(dev);
> +	if (plat->base == FDT_ADDR_T_NONE)
>  		return -EINVAL;
>  
>  	if (dev_read_bool(dev, "st,neg-edge"))
> -		priv->clk_reg_msk |= SDMMC_CLKCR_NEGEDGE;
> +		plat->clk_reg_msk |= SDMMC_CLKCR_NEGEDGE;
>  	if (dev_read_bool(dev, "st,sig-dir"))
> -		priv->pwr_reg_msk |= SDMMC_POWER_DIRPOL;
> +		plat->pwr_reg_msk |= SDMMC_POWER_DIRPOL;
>  	if (dev_read_bool(dev, "st,use-ckin"))
>  		stm32_sdmmc2_probe_level_translator(dev);
>  
> -	ret = clk_get_by_index(dev, 0, &priv->clk);
> +	ret = clk_get_by_index(dev, 0, &plat->clk);
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_enable(&priv->clk);
> +	ret = clk_enable(&plat->clk);
>  	if (ret)
>  		goto clk_free;
>  
> -	ret = reset_get_by_index(dev, 0, &priv->reset_ctl);
> +	ret = reset_get_by_index(dev, 0, &plat->reset_ctl);
>  	if (ret)
>  		dev_dbg(dev, "No reset provided\n");
>  
> -	gpio_request_by_name(dev, "cd-gpios", 0, &priv->cd_gpio,
> +	gpio_request_by_name(dev, "cd-gpios", 0, &plat->cd_gpio,
>  			     GPIOD_IS_IN);
>  
>  	cfg->f_min = 400000;
> @@ -754,11 +750,11 @@ static int stm32_sdmmc2_probe(struct udevice *dev)
>  	upriv->mmc = &plat->mmc;
>  
>  	/* SDMMC init */
> -	stm32_sdmmc2_reset(priv);
> +	stm32_sdmmc2_reset(plat);
>  	return 0;
>  
>  clk_free:
> -	clk_free(&priv->clk);
> +	clk_free(&plat->clk);
>  
>  	return ret;
>  }
> @@ -782,6 +778,5 @@ U_BOOT_DRIVER(stm32_sdmmc2) = {
>  	.ops = &stm32_sdmmc2_ops,
>  	.probe = stm32_sdmmc2_probe,
>  	.bind = stm32_sdmmc2_bind,
> -	.priv_auto	= sizeof(struct stm32_sdmmc2_priv),
>  	.plat_auto	= sizeof(struct stm32_sdmmc2_plat),
>  };
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
