Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5FE28F022
	for <lists+uboot-stm32@lfdr.de>; Thu, 15 Oct 2020 12:25:14 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7170C32EA7;
	Thu, 15 Oct 2020 10:25:13 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6FA7FC32E91
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 10:25:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azO6kVbXnXlJIxQ7W3Dxunpzm8Jl3bm+a7FhDKUXHhs+Uj9UqCnjbyiSlCv3xhiYG+fJmfukKryizq/tAO/RnGmQESApS2yTj65qn9XVYTskgW57NiSBLOV0CbqjeM3E//A3nn1rUd6dET+/V/1YekZMye+rbDb0vKjQizmnbW4KUehujpuWiuD/y2JvdLI645xTOp6CAKzZWsjMBFF8PdYJz2ChHXEEPTvNr3uF/WEfTOgTqV37r8nuthcq7WPd43Ub2Qtu9LKHJikkY5HMsQoouxsCeRebc6fQDgGudia9nG3oMshrndch/AY578Aa2OdkiMU/OPs8kCNYW1pomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z4ZSMWAjP5EuSOay3dXdbRth7M/K7WCm1iCbTRTQac=;
 b=YHd8XJHpnh8cUh7fr8tagZEIrCe9LhS4icaNMD99FvJKreCajh6M1QmRpvo4c2Dd6mGR1/dI7+eM121d4M+FhKVbyJCpIOXhogf2ZWvLLa7i3dzZrz9tpGeyKV6IzmUHk7MN3W0uXAo19tGlCqN7Div7pZxKjLN8MNA6OvFiKDG2F4O2UqD0wBQO/lptF9+Eb+MyY2uQSUISq1eiEp72G2OV383+d+ffkVixNC1lgh+6IE1DaYuLOE/iWiXht2uwCXgSNY5UabhahlBoj08LST2ukfmihzDVOiXNT9mXe6CFMlUJUodWhHs5rSf9JEbCnO1EYSqt/LWoCiH1fChRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Z4ZSMWAjP5EuSOay3dXdbRth7M/K7WCm1iCbTRTQac=;
 b=NYqnSXhcpccQ4NzRRU2lFiAb2kjfEMGd4FKfKmtI/f7YV67pLVaAtxhw6UjjfgYUQYlHKGgn/n4BM3k/+I++kR4AdldgiaU2km0S8Oj4W/DQ09/Je85iNYHvQpj6oxpMDfJPQj95NGFDQ+Z3ooi62Vf2RaS5dpftbUywsbdtEf4=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB5084.eurprd04.prod.outlook.com (2603:10a6:10:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Thu, 15 Oct
 2020 10:25:09 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::35c5:8c71:91f3:6bc6%12]) with mapi id 15.20.3455.031; Thu, 15 Oct
 2020 10:25:09 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Patrick Delaunay <patrick.delaunay@st.com>, "u-boot@lists.denx.de"
 <u-boot@lists.denx.de>
Thread-Topic: [PATCH 09/33] mmc: stm32_sdmmc2: migrate trace to dev and log
 macro
Thread-Index: AQHWogrHQIr5ZN8IZkyJmYJe72E+A6mYdrYQ
Date: Thu, 15 Oct 2020 10:25:09 +0000
Message-ID: <DB6PR0402MB276087DE5A58DB62A782441288020@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20201014091646.4233-1-patrick.delaunay@st.com>
 <20201014091646.4233-10-patrick.delaunay@st.com>
In-Reply-To: <20201014091646.4233-10-patrick.delaunay@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: st.com; dkim=none (message not signed)
 header.d=none;st.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: efa926a5-d337-4cc7-8492-08d870f497bf
x-ms-traffictypediagnostic: DB7PR04MB5084:
x-microsoft-antispam-prvs: <DB7PR04MB5084E14B72C25A5DFA40035488020@DB7PR04MB5084.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:289;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wcEEkvW/q7JmaxGdVg1TAFRozbN/m+HVssLcG5q2xXtU0oLXmPsSiHgK4Qrz2NkUMH859AmmyX7CVBOCMRhZsO8c/xs+Bcqu6/485bF2dymPDaAlsK1wwq16jDaqfJIqzTKFeaRA9u91Oipxzf2J46qemk3um+UWNE5qUfVXJUGP+aEyxjYCaFIr+Lq0viJAn4ZUXJ9Dl12h2EVXC8BR/V2Df7oGZMQcui9ep3jLnuwCNXw7576L+/GsoM1Od8WGTUURR+Rr+QJN5zxD2TkwGThRtotiQa2RuZllIY3dqJJpFuN02L9wlSWrqd/wz6R3b3IF0DJpI1o2uHjZJa/wAQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(6506007)(26005)(186003)(7696005)(64756008)(66446008)(9686003)(4326008)(66476007)(76116006)(54906003)(66946007)(5660300002)(66556008)(52536014)(316002)(110136005)(33656002)(2906002)(8936002)(83380400001)(8676002)(44832011)(478600001)(86362001)(55016002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: SW2w3WW7hvvGXnUmmwHdgyi8rAUULGrr4c0103mP4jsjZunIhTgfIXWxE7ZCvuFwRQsKsPjcbrFaXUzWglDZmmxMo/csPzHSwPjDtFP+sXYdrrt9Z5c1/udkOyEF1YnrA6r4muo/crjBBTEPwKsxwJeIp2wXOr7gr2XGyenP15Hxm+0zTJyxGd8MiAK6LlE58CpTa2yApKjT9fa563Ls9b9OvP0+XZFe40Eu2aQmieDDXYMKSirHynjKC8baETj1Ee6nMzuQuLJSiTJD5rn7uOYTcCF+cZaCF6avdhwFJedAfXe3LSUwLd0gdmlv4ry1kDzuUcazcFV5N+2HsA+9Bk94xcpZ6BDRohCEKqYNVMm8n+5lulKPzDfH6znqqs0YGfWFNv0AE4XWIkRiziosOgcJvkBru2ixWLdDqz1hixazP/7u+CthQ39GtbTNknEvJqQ99SP+CUWWWqleHD/Vl8MvcCtqJp9LoxaZepMIY5H+MFy1hcZcqyUG7qihM+S9Z+ojBuR8HKJM7auODlBvECX3xFRmy7t/Tu/nkPto0DUU7Lp+/Q4ZF8DfisaOuHl6hGAHnINgHK2FbOp4CisTG03ecr/ph5s5mnJVNxo4daEGG/lLNOQt+IE96bN+MUTYGZlaIBEyt6UBAJ1GW0nKnQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efa926a5-d337-4cc7-8492-08d870f497bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2020 10:25:09.1827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdjd2zMShBkn4ECyMrOMasloMeT77un/UeTaOg6iaaUXyeD2XjUHdGZkW0KjBFLgjHOHK3VZQbw/5YW4gSqtrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5084
Cc: "uboot-stm32@st-md-mailman.stormreply.com"
 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>
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

> Subject: [PATCH 09/33] mmc: stm32_sdmmc2: migrate trace to dev and log
> macro
> 
> Define LOG_CATEGORY, use dev_ macro when it is possible.
> Remove the "%s:" __func__  header as it is managed by dev macro
> (dev->name is displayed) or log macro (CONFIG_LOGF_FUNC).
> 
> Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
> ---
> 
>  drivers/mmc/stm32_sdmmc2.c | 85
> ++++++++++++++++++++------------------
>  1 file changed, 44 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/mmc/stm32_sdmmc2.c b/drivers/mmc/stm32_sdmmc2.c
> index 6d50356217..483660c9d3 100644
> --- a/drivers/mmc/stm32_sdmmc2.c
> +++ b/drivers/mmc/stm32_sdmmc2.c
> @@ -4,6 +4,8 @@
>   * Author(s): Patrice Chotard, <patrice.chotard@st.com> for
> STMicroelectronics.
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
>  	/* Configure the SDMMC DPSM (Data Path State Machine) */ @@
> -241,10 +244,11 @@ static void stm32_sdmmc2_start_data(struct
> stm32_sdmmc2_priv *priv,
>  	writel(SDMMC_IDMACTRL_IDMAEN, priv->base +
> SDMMC_IDMACTRL);  }
> 
> -static void stm32_sdmmc2_start_cmd(struct stm32_sdmmc2_priv *priv,
> +static void stm32_sdmmc2_start_cmd(struct udevice *dev,
>  				   struct mmc_cmd *cmd, u32 cmd_param,
>  				   struct stm32_sdmmc2_ctx *ctx)
>  {
> +	struct stm32_sdmmc2_priv *priv = dev_get_priv(dev);
>  	u32 timeout = 0;
> 
>  	if (readl(priv->base + SDMMC_CMD) & SDMMC_CMD_CPSMEN) @@
> -290,10 +294,11 @@ static void stm32_sdmmc2_start_cmd(struct
> stm32_sdmmc2_priv *priv,
>  	writel(cmd_param, priv->base + SDMMC_CMD);  }
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
> @@ -311,22 +316,22 @@ static int stm32_sdmmc2_end_cmd(struct
> stm32_sdmmc2_priv *priv,
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
> +		dev_dbg(dev, "error SDMMC_STA_CTIMEOUT (0x%x) for
> cmd %d\n",
> +			status, cmd->cmdidx);
>  		ctx->dpsm_abort = true;
>  		return -ETIMEDOUT;
>  	}
> 
>  	if (status & SDMMC_STA_CCRCFAIL && cmd->resp_type &
> MMC_RSP_CRC) {
> -		debug("%s: error SDMMC_STA_CCRCFAIL (0x%x) for cmd %d\n",
> -		      __func__, status, cmd->cmdidx);
> +		dev_dbg(dev, "error SDMMC_STA_CCRCFAIL (0x%x) for cmd %d\n",
> +			status, cmd->cmdidx);
>  		ctx->dpsm_abort = true;
>  		return -EILSEQ;
>  	}
> @@ -350,15 +355,15 @@ static int stm32_sdmmc2_end_cmd(struct
> stm32_sdmmc2_priv *priv,
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
> @@ -368,11 +373,12 @@ static int stm32_sdmmc2_end_cmd(struct
> stm32_sdmmc2_priv *priv,
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
> @@ -394,37 +400,37 @@ static int stm32_sdmmc2_end_data(struct
> stm32_sdmmc2_priv *priv,
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
> +		dev_dbg(dev, "error SDMMC_STA_DTIMEOUT (0x%x) for
> cmd %d\n",
> +			status, cmd->cmdidx);
>  		ctx->dpsm_abort = true;
>  		return -ETIMEDOUT;
>  	}
> 
>  	if (status & SDMMC_STA_TXUNDERR) {
> -		debug("%s: error SDMMC_STA_TXUNDERR (0x%x) for cmd %d\n",
> -		      __func__, status, cmd->cmdidx);
> +		dev_dbg(dev, "error SDMMC_STA_TXUNDERR (0x%x) for
> cmd %d\n",
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
>  	writel(SDMMC_ICR_STATIC_FLAGS, priv->base + SDMMC_ICR); @@
> -478,26 +483,24 @@ retry_cmd:
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
> @@ -579,8 +582,8 @@ static int stm32_sdmmc2_set_ios(struct udevice
> *dev)
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
> {
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
> --

Reviewed-by: Peng Fan <peng.fan@nxp.com>
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
