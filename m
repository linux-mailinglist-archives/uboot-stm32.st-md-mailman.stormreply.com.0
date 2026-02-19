Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPw7OV5Pl2mBwwIAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Feb 2026 18:58:54 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D8A161711
	for <lists+uboot-stm32@lfdr.de>; Thu, 19 Feb 2026 18:58:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12142C8F275;
	Thu, 19 Feb 2026 17:52:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47AF9CFAC40
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 17:52:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48069a48629so12507375e9.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 09:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1771523534; x=1772128334;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=533B30VEdaP+E4Na1aeGiCFVM50K9If5sXJTZgVBYao=;
 b=AgofYrRT9sjvZubbDIKZSydDXtTxPsX6FrBRlsyusJVSNO0DZO8i+5sM3bFyUc9471
 Nsg6XCkjV72GBXEhVUmsgCp9C9s9H2FgWUE6zjy/wLEflhqmv6CZgSlq4vJrZRluaQJW
 u8gXbpl/x1waXRAWPPY3KiHNkGZ7Q1RVVe4Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771523534; x=1772128334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=533B30VEdaP+E4Na1aeGiCFVM50K9If5sXJTZgVBYao=;
 b=vpzPmy502CF0gb2g03ff/VfbsUIpnvoWeOmddiZsexidd7ei5Zv9JVPv6L6QZYeKbL
 dqCSUU33OPfUmb7csy9/ajUot5Dr76K34G/E134DwHX3bhrQQRxHKdh/hhVanoeE/pXs
 DC7feUurYLE8r64gtb4FOxRh/pwoDfRo3SfDr5Iq1slpCMY7ACA/5VLCTriDdFupKhTf
 A8dhO4lVbmuTgy5W4m7F8EPJp6Y9lsxNHNHeS4XS4R5xKtjhz1YvlAd38VzC9FmtATiV
 qnNSGvB0ABFVF3vvB2aZ8VG/hITHSFzeIi8ir6WFPZw4osOi87SULmnXF0fpmdH9umew
 L/xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU14Jhm5C8gltsORntIj65xzp8LexERCfpH0CWgxJtLteU279T8XbOWoxEs7ATOU2KC9OXN81yzzIpF8g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxUn8XOx9Femjgnk18YEs8mMJnjqmzh9QA1XT8DIpx8Q5WDZSD6
 dXka4PFkoHhJJc4UFl4/RXBoxUgD53SHDoypq+y7u6nFojAyAdwfxv2OlP6Eluyldbc=
X-Gm-Gg: AZuq6aLe8J5CYAaspqosAcit02HeR1pwAIqNKonApUd9liYlEZt88vODVGdiPEuZ4kY
 e/ZQqZ9EIKO9VWlYjJVTHI68Hbmf4NTW2fnMiQXnsc3FoHLg81I3o40raobPdlVzc+cpjqskBp5
 I0eYHiJDPPOQy23xJC+sZeXWX5mjH8Oe3ZY8vpFLhWX3FRyYkHkddBfkaoGqn6SFZz9QLbVL1nB
 0PpGN5U/A9CdmGW2XBPCNPosaNLjWX/y3eRSPrs0hIAvGdpdicVspR1zP6Q8FMl6vvQG5vqaQ+q
 Hp60gwJAAc+rl1yyeNtXz29SYPxmh07r1ciQGDkr77rDqNPwvaQzv5dnXdDcIj9LFxqtsevgMtI
 +Yi6uvxG89PHRvcEOXM3gKJqjDJ6poCYIg2L9rvzSnLYv/6K4WLR5Vk2aqTvE1ra5KaRp4GghvB
 o2S66fcmEO2owqMcWsgAId3CAzyX1GuI85oRvfqqE7nt4dwswCZrKsNonxd/53nHhhNeFonvyND
 KY8RFaPftHokHH6tSjH0P19x5pi+WNtEts6fi/R85yxRn7TLFVTDsZhyqbI8levu91+2OjzTxdU
 P8/s0Dc+heEUMgsAyDxUyK/w
X-Received: by 2002:a05:600c:6990:b0:483:8f38:a928 with SMTP id
 5b1f17b1804b1-4838f38a961mr158805545e9.34.1771523533689; 
 Thu, 19 Feb 2026 09:52:13 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31b0e63sm35485005e9.2.2026.02.19.09.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:52:13 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Thu, 19 Feb 2026 18:51:17 +0100
Message-ID: <20260219175130.2839234-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219175130.2839234-1-dario.binacchi@amarulasolutions.com>
References: <20260219175130.2839234-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH 6/8] spi: stm32: add support for bits-per-word
	setting
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
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[amarulasolutions.com:s=google];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[amarulasolutions.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:jagan@amarulasolutions.com,m:patrick.delaunay@foss.st.com,m:dario.binacchi@amarulasolutions.com,m:linux-amarula@amarulasolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.970];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[amarulasolutions.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,amarulasolutions.com:mid,amarulasolutions.com:email]
X-Rspamd-Queue-Id: 65D8A161711
X-Rspamd-Action: no action

Implement the set_wordlen operation to allow dynamic bus width
configuration. This is required for peripherals with non-standard
requirements, such as display panels that need 9-bit word transfers
during the initialization and setup phase.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/spi/stm32_spi.c | 62 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/stm32_spi.c b/drivers/spi/stm32_spi.c
index adba97915cd3..39ea69c68174 100644
--- a/drivers/spi/stm32_spi.c
+++ b/drivers/spi/stm32_spi.c
@@ -192,6 +192,11 @@ static void stm32_spi_read_rxfifo(struct udevice *bus)
 	log_debug("%d bytes left\n", priv->rx_len);
 }
 
+static bool stm32_spi_is_enabled(void __iomem *base)
+{
+	return !!(readl(base + STM32_SPI_CR1) & SPI_CR1_SPE);
+}
+
 static int stm32_spi_enable(void __iomem *base)
 {
 	log_debug("\n");
@@ -381,6 +386,44 @@ static int stm32_spi_set_speed(struct udevice *bus, uint hz)
 	return 0;
 }
 
+static int _stm32_spi_set_wordlen(struct udevice *bus, unsigned int wordlen)
+{
+	struct stm32_spi_priv *priv = dev_get_priv(bus);
+	struct stm32_spi_plat *plat = dev_get_plat(bus);
+	void __iomem *base = plat->base;
+	bool spi_enabled;
+
+	if ((wordlen - 1) < SPI_CFG1_DSIZE_MIN ||
+	    (wordlen - 1) > SPI_CFG1_DSIZE) {
+		dev_err(bus, "Cannot set wordlen to %u [%d - %d]\n",
+			wordlen, SPI_CFG1_DSIZE_MIN + 1,
+			SPI_CFG1_DSIZE + 1);
+		return -EINVAL;
+	}
+
+	spi_enabled = stm32_spi_is_enabled(plat->base);
+	if (spi_enabled)
+		stm32_spi_disable(plat->base);
+
+	dev_dbg(bus, "bits_per_word=%d\n", wordlen);
+
+	priv->cur_bpw = wordlen;
+	clrsetbits_le32(base + STM32_SPI_CFG1, SPI_CFG1_DSIZE,
+			priv->cur_bpw - 1);
+
+	if (spi_enabled)
+		stm32_spi_enable(plat->base);
+
+	return 0;
+}
+
+static int stm32_spi_set_wordlen(struct udevice *slave, unsigned int wordlen)
+{
+	struct udevice *bus = dev_get_parent(slave);
+
+	return _stm32_spi_set_wordlen(bus, wordlen);
+}
+
 static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 			  const void *dout, void *din, unsigned long flags)
 {
@@ -394,11 +437,19 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 	u32 xferlen;
 	u32 mode;
 	int xfer_status = 0;
+	int nb_words;
 
 	xferlen = bitlen / 8;
 
-	if (xferlen <= SPI_CR2_TSIZE)
-		writel(xferlen, base + STM32_SPI_CR2);
+	if (priv->cur_bpw <= 8)
+		nb_words = xferlen;
+	else if (priv->cur_bpw <= 16)
+		nb_words = DIV_ROUND_UP(xferlen * 8, 16);
+	else
+		nb_words = DIV_ROUND_UP(xferlen * 8, 32);
+
+	if (nb_words <= SPI_CR2_TSIZE)
+		writel(nb_words, base + STM32_SPI_CR2);
 	else
 		return -EMSGSIZE;
 
@@ -406,6 +457,8 @@ static int stm32_spi_xfer(struct udevice *slave, unsigned int bitlen,
 	priv->rx_buf = din;
 	priv->tx_len = priv->tx_buf ? xferlen : 0;
 	priv->rx_len = priv->rx_buf ? xferlen : 0;
+	dev_dbg(bus, "bitlen: %d, xferlen: %d, nb_words: %d\n",
+		bitlen, xferlen, nb_words);
 
 	mode = SPI_FULL_DUPLEX;
 	if (!priv->tx_buf)
@@ -567,9 +620,7 @@ static int stm32_spi_probe(struct udevice *dev)
 	priv->fifo_size = stm32_spi_get_fifo_size(dev);
 	priv->cur_mode = SPI_FULL_DUPLEX;
 	priv->cur_xferlen = 0;
-	priv->cur_bpw = SPI_DEFAULT_WORDLEN;
-	clrsetbits_le32(base + STM32_SPI_CFG1, SPI_CFG1_DSIZE,
-			priv->cur_bpw - 1);
+	_stm32_spi_set_wordlen(dev, SPI_DEFAULT_WORDLEN);
 
 	for (i = 0; i < ARRAY_SIZE(plat->cs_gpios); i++) {
 		if (!dm_gpio_is_valid(&plat->cs_gpios[i]))
@@ -630,6 +681,7 @@ static const struct dm_spi_ops stm32_spi_ops = {
 	.release_bus	= stm32_spi_release_bus,
 	.set_mode	= stm32_spi_set_mode,
 	.set_speed	= stm32_spi_set_speed,
+	.set_wordlen    = stm32_spi_set_wordlen,
 	.xfer		= stm32_spi_xfer,
 };
 
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
