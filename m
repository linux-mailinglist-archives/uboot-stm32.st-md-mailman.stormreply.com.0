Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDDPESH9n2n3fAQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Feb 2026 08:58:25 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CAB1A2269
	for <lists+uboot-stm32@lfdr.de>; Thu, 26 Feb 2026 08:58:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6CA80C87EC5;
	Thu, 26 Feb 2026 07:58:24 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E04BCC030CD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 07:58:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFJ964SQ9IuBaRMqFbhvtWk4P4zZKlJuxKTEV1vDuiAXw6P8sp+mtHpZBGA2+Abo5OlY/MfHTV28h+Xkr9B/X1A1YdC/qqL6IxiMPP1ATk3jL6rlJwcscRxyINUv04Jp7YXRAn3ATASs2CYw9NW0hjpIhUWSkF2cY4VMsTwNhrsvT4Us8XtXfxUkhdeKmW6EofAfI0ZjaiMveSAN6C7uCfrOQiJeXGzpkgrSR4v0OL168OHrj8VxgsLdY3qADXofnUCGGfP+6hXpWUvLcNP03Uezl1AUiaR0k0Y6Ah4YKFYJCmb3DT/GCFD4GMtyKeCmPBAFmhfoOxCLNXg8y+WrdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2Yg0crwpyIjWeQe90t7wzfeVdeml3u+kBcjLZVofgs=;
 b=IHL8LHFmEYRbeQCxPEfaSiBkZgTf6wpiO/giUmC5t3MjENrcXgINAWTAWO44YyGfjW8JZJUWyOCVWAAwMG1eVXFPf/vC1Z9GpqqRAM3H33uCwXKPedpD5egQHBdrmX5WJZ3heduLu+/J4zpJEQjREeLiuieaIDztTXa8GszomuDQjjGOWeQGqo0AS3co19nPQ4ha+hhfInMXL6IvKwXmYIiLJFSPDnaff1VgpRwWWqdOvv6ZKvxoj6lUiEPAk2MAKBWgIQGF7Em0wEeBzwMf6gYkDCuZ6TrqGWy1oWnwLzLMCtC/1cdgY+opnbaT+Ps9TpiF+4Ajl88jIZTxnjfcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C2Yg0crwpyIjWeQe90t7wzfeVdeml3u+kBcjLZVofgs=;
 b=TL6mudnyEYrTgjNW7UFsaGJu6Oz4PxWa1yqG6EFZrZ2erZTRiHn8kGhIuCR8KEuuc2ftzCerDEASENIPbcbh9KSQYIDZD+iQyepmb438apMIk4B3iZPWR7/aaVbklSYaChO1TlLTolDX7wDGTYj9i8J1gMHncZf6hhU8iL0TR3+xVuhVu8CekDzBRtQMeYjhy6kaNH11+G0PaeqYQUHlPMmvB0L+/Rl985MkV5Kq3c7tfHoSrknUW1bFNcYlkYWTClJgSNMB7q6KZM3FR9kBhhG1GDb5WuubuUs3Er2qVYlMQSHtNC9OT3HkS8s83Z0DnZYseZ/ccA4oFjDIfQEFyQ==
Received: from AS4PR10CA0030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::11)
 by GV2PR10MB9675.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:357::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 07:58:18 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::ea) by AS4PR10CA0030.outlook.office365.com
 (2603:10a6:20b:5d8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 07:58:20 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 07:58:18 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 09:00:13 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 08:58:04 +0100
Message-ID: <02acfba8-cd60-4cef-9d7c-1024ab68d7fa@foss.st.com>
Date: Thu, 26 Feb 2026 08:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260225161851.2475274-1-dario.binacchi@amarulasolutions.com>
 <20260225161851.2475274-8-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260225161851.2475274-8-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A62:EE_|GV2PR10MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7b2c8c-eafa-4eaa-08bc-08de750ccd9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: X9iLAVxxsgxDgvi0D8bxs+gvnLkvWk/MLJb+3GE1To5POCWU3rrsmdSORaUPzDZXJLjmZBsdTNz/qfeN7xlLgBhe9MovvPvNGXov4XjXlRCJo82iE5rE4tCkdAz6MCmrMkZIKGVJpZ0pa4xn55WJUevyc6POt0i/71TFhc0koWNsh6GN9QUhe+wEKkadH8/YtVHKs6c+6BGHCaIOnrWplaeHoOYD37/ax0bcoZGCfu/vpIBbqF47C0mdl9bqQp3nOZqLks8WbKG8oUDpqR8G+O6FJ90Mh4Kt+3qebybu73Sp43pgs5xXm/0TKNxGelcJMtXlngi+Dtsi1Jv+baJmXdY3M2/c4KTFOkLbMCPy1Fn4sP9MxXaLmyRSDmkDJq502EIkHe/BMnleWTIfTvgAu+ENnQ0022oMrJOATGkMq7zyd6BOkPTsM+U6jzTBCN/ODXimD82IoXpofUGv2Dp0CG84QAV6myIaa3n8pLIh9egib3axPkO+hHNSxJI1b89IUMsK+bVCe/Eo47nA8RmqsNGAjc2YOD+QMJ7hY3ipnYPaWw/h1m8xmxE8p404b9UU8p35oThK/iAwCo3dXvCbjmwbzaPuEhbBo7s8ErfqHnG0lEfQyjT7Ud+2kjm9VZDGBgiU9uDeHExJBqS2CA8/0P/iXpjVxnZx/rX8oqacVcE+UQ/npPVmDCJGKSU2oNTSPZSPjyeQy21TLFoVZjQJDCq83vAl+3O1t7mRx97FNA+nJxvvu3yD9r6xbUOfriCVICJ05QBEnLCaSHtacyr5BHyYwRnkd9GzEKw62gyibEFtcBLCJfp1gWYpeS9YbgfcNVlAqOwXKvwYhBn4kQlA7Q==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4k5pTsl90wy99gKdLpNe6ZKPqFt7YBLBfGcIro3lbx+uV2IvMu1dmsdN0vgOF+lO5l+LKqzzLjgizXXcByFEVHsJaD8/fGxTE5Vg33IiD69WOL641BkKo+p5lDFY4M8y+fJEfXKFGV3A6GKCL8QNwvXFkdFPT6kICf/BRkyu5eY+PalmTGh2MW3bo0CfIuji4N5dMnLWntZuG3tU/41J7L/YQhWrSFu9mMpd9zMI4NdudHEWyonZUlAyZzy9bt6olhsy42sVL2N1uTxvWHr0OimMHzYPJXACuNTFPkmCOfxdVhMCTit5RLCcHPfJaV457tArdqWSmFQpB+SPJGVwldVlxESt8MUJAJeWP+ESb6fQ4VyGyrcdAiNy9UxDcnBQQCHFlu7cRXjYEkV1rN2cP4EBbL+MVbKwwHQWpQOjkzbtbMqGX4XWye0pI64/XbYt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:58:18.1854 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7b2c8c-eafa-4eaa-08bc-08de750ccd9a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB9675
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>, Tom
 Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v3 7/9] spi: stm32: add support for
	bits-per-word setting
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,amarulasolutions.com:email];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dario.binacchi@amarulasolutions.com,m:u-boot@lists.denx.de,m:patrick.delaunay@foss.st.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:linux-amarula@amarulasolutions.com,m:jagan@amarulasolutions.com,s:lists@lfdr.de];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	NEURAL_HAM(-0.00)[-0.805];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E2CAB1A2269
X-Rspamd-Action: no action



On 2/25/26 17:16, Dario Binacchi wrote:
> Implement the set_wordlen operation to allow dynamic bus width
> configuration. This is required for peripherals with non-standard
> requirements, such as display panels that need 9-bit word transfers
> during the initialization and setup phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> Changes in v3:
> - Move the stm32_spi_is_enabled() implementation in the previous patch
> 
>  drivers/spi/stm32_spi.c | 57 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 52 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
> index 70eb8735e03d..9d095b280a70 100644
> --- a/drivers/spi/stm32_spi.c
> +++ b/drivers/spi/stm32_spi.c
> @@ -384,6 +384,44 @@ static int stm32_spi_set_speed(struct udevice *bus, uint hz)
>  	return 0;
>  }
>  
> +static int _stm32_spi_set_wordlen(struct udevice *bus, unsigned int wordlen)
> +{
> +	struct stm32_spi_priv *priv = dev_get_priv(bus);
> +	struct stm32_spi_plat *plat = dev_get_plat(bus);
> +	void __iomem *base = plat->base;
> +	bool spi_enabled;
> +
> +	if ((wordlen - 1) < SPI_CFG1_DSIZE_MIN ||
> +	    (wordlen - 1) > SPI_CFG1_DSIZE) {
> +		dev_err(bus, "Cannot set wordlen to %u [%d - %d]\n",
> +			wordlen, SPI_CFG1_DSIZE_MIN + 1,
> +			SPI_CFG1_DSIZE + 1);
> +		return -EINVAL;
> +	}
> +
> +	spi_enabled = stm32_spi_is_enabled(plat->base);
> +	if (spi_enabled)
> +		stm32_spi_disable(plat->base);
> +
> +	dev_dbg(bus, "bits_per_word=%d\n", wordlen);
> +
> +	priv->cur_bpw = wordlen;
> +	clrsetbits_le32(base + STM32_SPI_CFG1, SPI_CFG1_DSIZE,
> +			priv->cur_bpw - 1);
> +
> +	if (spi_enabled)
> +		stm32_spi_enable(plat->base);
> +
> +	return 0;
> +}
> +
> +static int stm32_spi_set_wordlen(struct udevice *slave, unsigned int wordlen)
> +{
> +	struct udevice *bus = dev_get_parent(slave);
> +
> +	return _stm32_spi_set_wordlen(bus, wordlen);
> +}
> +
>  static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
>  			  const void *dout, void *din, unsigned long flags)
>  {
> @@ -397,11 +435,19 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
>  	u32 xferlen;
>  	u32 mode;
>  	int xfer_status = 0;
> +	int nb_words;
>  
>  	xferlen = bitlen / 8;
>  
> -	if (xferlen <= SPI_CR2_TSIZE)
> -		writel(xferlen, base + STM32_SPI_CR2);
> +	if (priv->cur_bpw <= 8)
> +		nb_words = xferlen;
> +	else if (priv->cur_bpw <= 16)
> +		nb_words = DIV_ROUND_UP(xferlen * 8, 16);
> +	else
> +		nb_words = DIV_ROUND_UP(xferlen * 8, 32);
> +
> +	if (nb_words <= SPI_CR2_TSIZE)
> +		writel(nb_words, base + STM32_SPI_CR2);
>  	else
>  		return -EMSGSIZE;
>  
> @@ -409,6 +455,8 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
>  	priv->rx_buf = din;
>  	priv->tx_len = priv->tx_buf ? xferlen : 0;
>  	priv->rx_len = priv->rx_buf ? xferlen : 0;
> +	dev_dbg(bus, "bitlen: %d, xferlen: %d, nb_words: %d\n",
> +		bitlen, xferlen, nb_words);
>  
>  	mode = SPI_FULL_DUPLEX;
>  	if (!priv->tx_buf)
> @@ -570,9 +618,7 @@ static int stm32_spi_probe(struct udevice *dev)
>  	priv->fifo_size = stm32_spi_get_fifo_size(dev);
>  	priv->cur_mode = SPI_FULL_DUPLEX;
>  	priv->cur_xferlen = 0;
> -	priv->cur_bpw = SPI_DEFAULT_WORDLEN;
> -	clrsetbits_le32(base + STM32_SPI_CFG1, SPI_CFG1_DSIZE,
> -			priv->cur_bpw - 1);
> +	_stm32_spi_set_wordlen(dev, SPI_DEFAULT_WORDLEN);
>  
>  	for (i = 0; i < ARRAY_SIZE(plat->cs_gpios); i++) {
>  		if (!dm_gpio_is_valid(&plat->cs_gpios[i]))
> @@ -633,6 +679,7 @@ static const struct dm_spi_ops stm32_spi_ops = {
>  	.release_bus	= stm32_spi_release_bus,
>  	.set_mode	= stm32_spi_set_mode,
>  	.set_speed	= stm32_spi_set_speed,
> +	.set_wordlen    = stm32_spi_set_wordlen,
>  	.xfer		= stm32_spi_xfer,
>  };
>  
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
