Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLX5BaHKnmm0XQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 11:10:41 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCD819587C
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Feb 2026 11:10:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44672C8F281;
	Wed, 25 Feb 2026 10:10:40 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013013.outbound.protection.outlook.com
 [40.107.162.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64021CFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Feb 2026 10:10:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gZhh5LKajqHjFiOZ2zOpzfrTAfuMoVx1qF2qmoJqpALfg3F4hL5HGOww22CHk0zS16PFTDJ0KB/5CoFuV9XFVGaL54lVnkVjZRBhsGLRLJiqdBSCyUDVFOHOCT29UkXLJhyEA16prYQQiHzK78koaM8e0gkhQDNZbohqbnzUsuuviv3wJPVLnZaQ8qr+RJgTbHF0nw5ZqvkR/N1Ufg8aLIqH1scBan6L+XLMDH1YXFBM2RxpTXkgBIX1yB5kKiD++N9EBYhQ79UTmqiJqCUZkuqOXWr9qJ2CF/6uUl7ZJoTMrsC4Qa3dBMCGFYe1HhDdb4cXmbgFQikezDZy/P6Low==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph5xlmnAV04AhiNMSkTvnnpVbdzTXNqPkjTHEsienWg=;
 b=J5/Yu/42KiVTnhwmpDlt1PfAcsUQ9gvx8n8+/JfLWjx0xQvnSgeTyD1JJJIRVqqG6bApHQBOGGQzpgVjLxDEzihhLtoxE/qquqG2cOzi5EzfZDdToKlpDICMHKeg6J7s54cCbwB7IOAEkwTWXFMqqM4cDkB3lrN7etiN/BrM5Lfd2EEvSizcNvGtv72Zbs9ktzKgXu1CS67MQ9VQV/+HqEI4XHDoSCI9RNwVxojDGUWtdq6Y6hu/0bWVBKpd+wBBs+3HuULoqMWm9+yMvarbXljEhroXOK+byRLTyTfC2mmqF5MfYqP9CR2JP2KN90fjLI/ds0T8fz3dUtwwMJIrqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ph5xlmnAV04AhiNMSkTvnnpVbdzTXNqPkjTHEsienWg=;
 b=hkduh5pMA6uxwaW/lIVZalamX9peBDYeUjswxNJYZ72/NhJiHiGTkH+rZqyevBp50fxarOt9zbtM01YgrjROLEfovuHBJWcnkUQWTGV0Z6Zymlgj57/6HwIY7OqmV82oIJIn1Eu9SWDEAIOt8HMj/MzkFNxG+cVrjbE4X49YgLQy0uqDe7qfw8RFM7oU4c9sjHWDhvBYbN1y9yQSDzP156MDrTgieATxq6hG9+65JbGySo6J2zOMIVOFDd53L4dwgi6dL9vOuNh30BtjECUUfjy4uZZ9i85iWCZBc8A0F4NqQ8ts8qsLouRVi6Z8mWcZyhk2MRfku4YDogCI1vZFwA==
Received: from DUZPR01CA0057.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::6) by BESPR10MB9383.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:b10:e7::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 10:10:33 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::f0) by DUZPR01CA0057.outlook.office365.com
 (2603:10a6:10:469::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Wed,
 25 Feb 2026 10:10:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 10:10:32 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Feb
 2026 11:12:39 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Feb
 2026 11:09:52 +0100
Message-ID: <278654f3-b24e-4c2b-8144-220c4a92355e@foss.st.com>
Date: Wed, 25 Feb 2026 11:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <u-boot@lists.denx.de>
References: <20260221094252.3103034-1-dario.binacchi@amarulasolutions.com>
 <20260221094252.3103034-7-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20260221094252.3103034-7-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9B:EE_|BESPR10MB9383:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d2e55b-accc-4570-66a5-08de74561cab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: OJD+KS1jH5jXnD6pMb+NSQJT08/cETkIOml2RV5kLdc7n9pjhNr8i+kYx4mfj41SkOrQicqGK+Acu9WC6w38Gx2eXdrCD89pTYQiHMz7sDfi3hOGUU5bN2uyRDM9BjNiCF9Gr3jg7zlR4ijloNN44dOtrwu0FWNEVXvZeCbydtCdX7/OL/G+g/J7weLwXfs//sONWMoWqRomet0RiUXlKX7j4nFFJoo1YUCOvygLMSRGGf9KeT7dWhsVd2T/aSbBbKBR85VHawsWJfZXrlNxjP6brMZu6aDEZKd4syKVKmHZ5vO3mfMbF26Xmut9/qlSIK2GIzW9piKDzH3Fuel9f6/dm0bbcWFQ/uLleEZlSKuaytSdnPYDHVQQVx+VN63LKx25vwp6Abn8KsTpOY0qc9oLuMYUG07O0WARyj6C3uGKVCeJM+zIqOupn2pZZwkbOTBMhA7ftWDi49T9H4Ei56k6rkdvZuA/GU6lAxCSPBMs51Ksl7zM9FBsYy0k2i44HetoNNBJ06ddaf1p9katnH5MnyTT/Zu5BzvJ1LIJwrN5MAokftoAjePH6Voj/aqlyyNyXTHAgKcN2N3zK0z6vRoLNNafKwwTRhcSF21LT5SaeWaR+Z2IPJSmRnI/LZy8GCAY6M/zQLKkZaqYNDasc4X856VFO6BqJYyIj3qqnOITHLcpHXEfOUlbB4O+MoFqjgE4dQ4agPJpVLKezmXlhbd65wCkKTJZ7mTIzNW0dvC9g2M9fcfqRKff9eyaQ//6l749qMCIw8Wsty7HgFQ+tjZ+/zXBKr474UYIYT59VlskqxeT0rC5v61ZMS5DXHmXlh0qgktFqFryC4TycuoNHQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 2UwWapZ7uYAn7cIX8bn2Z1T/yeOol3NMD4rMsTXa+1TGjGzQ+rPZFpH84kl4ElAL1K+s5wnGcES8EgDKuYu1U+KYX+JWWX6lzo8kp5AKEBIc9MxDkYwOqv4jZV8AD3HsXkL07u/p9VJF3XQ73J8HZoUWtf7xxmzbW4CKWgINdNwDJDTldGsyPOiS6qMoNtYrocV49ejRLkqy9mhqcCI32qQsGHzRJVKUcXxmBzHKyC324yxOJO0XFelBHDbYvUQurRgDECwVXjp+bNvq/SIUgUBNXAmMTdsETF03Od7Pf3GpzGtXukvURKQ/JXVRfStmN/Xh9cL1RsKxAyqcEgpvYXcb3ZzwnxUxyqEqTwm9rZkinDgvS4PXwcP7KuaAdRduosAITnKIe+15EvSikBLbR8VRTeEMjr0EDm6PmrJq6389hFNVclfoLHcl0HWQ9EL+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:10:32.9030 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d2e55b-accc-4570-66a5-08de74561cab
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR10MB9383
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [Uboot-stm32] [PATCH v2 6/8] spi: stm32: add support for
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid];
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
	NEURAL_HAM(-0.00)[-0.804];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8FCD819587C
X-Rspamd-Action: no action



On 2/21/26 10:42, Dario Binacchi wrote:
> Implement the set_wordlen operation to allow dynamic bus width
> configuration. This is required for peripherals with non-standard
> requirements, such as display panels that need 9-bit word transfers
> during the initialization and setup phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
> (no changes since v1)
> 
>  drivers/spi/stm32_spi.c | 62 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 57 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
> index adba97915cd3..39ea69c68174 100644
> --- a/drivers/spi/stm32_spi.c
> +++ b/drivers/spi/stm32_spi.c
> @@ -192,6 +192,11 @@ static void stm32_spi_read_rxfifo(struct udevice *bus)
>  	log_debug("%d bytes left\n", priv->rx_len);
>  }
>  
> +static bool stm32_spi_is_enabled(void __iomem *base)
> +{
> +	return !!(readl(base + STM32_SPI_CR1) & SPI_CR1_SPE);
> +}
> +


In stm32_spi_stopxfer(), we first check if SPI is enabled, stm32_spi_is_enabled() can be used
to replace the existing code:

static void stm32_spi_stopxfer(struct udevice *dev)
{
	struct stm32_spi_plat *plat = dev_get_plat(dev);
	void __iomem *base = plat->base;
	u32 cr1, sr;
	int ret;

	dev_dbg(dev, "\n");

	cr1 = readl(base + STM32_SPI_CR1);

	if (!(cr1 & SPI_CR1_SPE))
		return;

>  static int stm32_spi_enable(void __iomem *base)
>  {
>  	log_debug("\n");
> @@ -381,6 +386,44 @@ static int stm32_spi_set_speed(struct udevice *bus, uint hz)
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
> @@ -394,11 +437,19 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
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
> @@ -406,6 +457,8 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
>  	priv->rx_buf = din;
>  	priv->tx_len = priv->tx_buf ? xferlen : 0;
>  	priv->rx_len = priv->rx_buf ? xferlen : 0;
> +	dev_dbg(bus, "bitlen: %d, xferlen: %d, nb_words: %d\n",
> +		bitlen, xferlen, nb_words);
>  
>  	mode = SPI_FULL_DUPLEX;
>  	if (!priv->tx_buf)
> @@ -567,9 +620,7 @@ static int stm32_spi_probe(struct udevice *dev)
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
> @@ -630,6 +681,7 @@ static const struct dm_spi_ops stm32_spi_ops = {
>  	.release_bus	= stm32_spi_release_bus,
>  	.set_mode	= stm32_spi_set_mode,
>  	.set_speed	= stm32_spi_set_speed,
> +	.set_wordlen    = stm32_spi_set_wordlen,
>  	.xfer		= stm32_spi_xfer,
>  };
>  

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
