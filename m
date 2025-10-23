Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9626C039C0
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Oct 2025 23:49:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7FB90C5EC7C;
	Thu, 23 Oct 2025 21:49:15 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6E5A9C5EC7D
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 21:49:13 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4ct06d0nnLz9v4P;
 Thu, 23 Oct 2025 23:49:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761256153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=li5U7VeG22caadE9S9YNPgp4M1x5MlFKrYxqbEdqmTY=;
 b=yDV+dTNsnVcPH675NF6qY3lnsm1jW8ZXQG1R6W42X4MYqV1Z6A+NrE4xN6ilEJz8sPapjB
 Zy/zkTbGfkKe6Y3aSLqtHvNScf0l+YnUCaeZ3oBHgFZ8+vbynpLs/JihmtRiZI+HzBMu9P
 dGKochqg+VRhEi/jy1SNFDs2wbEUyf/SMQSr13D9z/8v4Mu9ioIopwSlCa+HamTOK2vfUq
 di+BUNdPsVSfi9mCTAG94ezQ1Y+qYO2Dfy893jXjcZtDihHtmVmIykVT/f1Moe5UmpPGvs
 Ren4CqsLVR9pIo1fbSB71MNjcoV3oOKiZs7xiLOZQHVM3JSWAAcP76PFLp1Zng==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=XMjFJFAT;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761256150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=li5U7VeG22caadE9S9YNPgp4M1x5MlFKrYxqbEdqmTY=;
 b=XMjFJFATTjVKMHTbzICvuQPu/8TqEO0gj0yhwssZTBi9fUjR6iey273949+8npitdF/iwn
 GljoiXYA2czJ6YefM0xVVLhcJBuCMFyBkkOD6q7h0BG8W1rBCoZ0xF4s4KXpwZu+/N/ENg
 V4RDXgtCQQR82ACgckkBJSS/WTKiKw4ch88m48QxA4bgUVBh3PYSMtAbD9qgEDXWAhxT3S
 /DgwK5nlsCorFK0yxF+GNs6gcaI8wVXXoHNAZxSX4ojbAuJpjgOYbnAlncWKsNFBpL6pZg
 yuA+CA1voJaIG1CyagZ2LftOumBS0hui6M7Hs7lha4S/vzUbtxTbcQkNVeUNFA==
To: u-boot@lists.denx.de
Date: Thu, 23 Oct 2025 23:48:26 +0200
Message-ID: <20251023214855.181410-3-marek.vasut@mailbox.org>
In-Reply-To: <20251023214855.181410-1-marek.vasut@mailbox.org>
References: <20251023214855.181410-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-ID: dcdd40aaf9eefe5b2e7
X-MBO-RS-META: fu5y7tsq4zt1n7867yikgzxgzbicjzq9
X-Rspamd-Queue-Id: 4ct06d0nnLz9v4P
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 3/3] ARM: stm32: Add MAC address readout from
	fuses on DH STM32MP1 DHSOM
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

Add support for reading out the MAC address from SoC fuses on DH STM32MP1 DHSOM.
The DH STM32MP1 DHSOM may contain external ethernet MACs, which benefit from the
MAC address stored in SoC fuses as well, handle those consistently. This however
means the architecture setup_mac_address() cannot be used and instead a simpler
local fuse read out is implemented in the board file.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 board/dhelectronics/dh_stm32mp1/board.c | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/board/dhelectronics/dh_stm32mp1/board.c b/board/dhelectronics/dh_stm32mp1/board.c
index 065d2f338c2..c18f1911fe4 100644
--- a/board/dhelectronics/dh_stm32mp1/board.c
+++ b/board/dhelectronics/dh_stm32mp1/board.c
@@ -119,6 +119,29 @@ static bool dh_stm32_mac_is_in_ks8851(void)
 	return false;
 }
 
+static int dh_stm32_get_mac_from_fuse(unsigned char *enetaddr, int index)
+{
+	struct udevice *dev;
+	u8 otp[12];
+	int ret;
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_DRIVER_GET(stm32mp_bsec),
+					  &dev);
+	if (ret)
+		return ret;
+
+	ret = misc_read(dev, STM32_BSEC_SHADOW(BSEC_OTP_MAC), otp, sizeof(otp));
+	if (ret < 0)
+		return ret;
+
+	memcpy(enetaddr, otp + ARP_HLEN * index, ARP_HLEN);
+	if (!is_valid_ethaddr(enetaddr))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int dh_stm32_setup_ethaddr(struct eeprom_id_page *eip)
 {
 	unsigned char enetaddr[6];
@@ -129,6 +152,9 @@ static int dh_stm32_setup_ethaddr(struct eeprom_id_page *eip)
 	if (dh_get_mac_is_enabled("ethernet0"))
 		return 0;
 
+	if (!dh_stm32_get_mac_from_fuse(enetaddr, 0))
+		goto out;
+
 	if (!dh_get_value_from_eeprom_buffer(DH_MAC0, enetaddr, sizeof(enetaddr), eip))
 		goto out;
 
@@ -154,6 +180,9 @@ static int dh_stm32_setup_eth1addr(struct eeprom_id_page *eip)
 	if (dh_stm32_mac_is_in_ks8851())
 		return 0;
 
+	if (!dh_stm32_get_mac_from_fuse(enetaddr, 1))
+		goto out;
+
 	if (!dh_get_value_from_eeprom_buffer(DH_MAC1, enetaddr, sizeof(enetaddr), eip))
 		goto out;
 
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
