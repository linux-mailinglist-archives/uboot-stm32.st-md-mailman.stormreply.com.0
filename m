Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G8iWIT/NOGo7iQcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jun 2026 07:50:55 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 288606ACD4E
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jun 2026 07:50:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=geanix.com (policy=quarantine)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA0B1C8F28C;
	Mon, 22 Jun 2026 05:50:54 +0000 (UTC)
Received: from mail-43172.protonmail.ch (mail-43172.protonmail.ch
 [185.70.43.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1E9A0C424DE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Jun 2026 09:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
 s=protonmail3; t=1781774951; x=1782034151;
 bh=6NANZRQunwNRp6/lgPXqgqmJ4xb07SUooP54XuRJ5H4=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=nWTwq7a2VHZihh7ageIIJiVoBscwssymErlYdGCYPdAqsmU1CQyk4boJQ1gTV4yDv
 La+UG6+VYi0IyiwYtkR0IIgL/xo7j4P5OvesNwWkfoTZ3cSaOtUFL2NZn05fsA758E
 ento5da652EICdjvW/0CDi55bzJ3ZFI9hpTcqC18vXO7nVfJfBYrmPhPIsC6shml0u
 lRWav4ARD7gAlqKuRWDTHPfhCS5hykhjltO139jnnzP9dLHSoOCOCtnYpVqlR+4cO2
 vozKfk7OR/cxx4wRu+5YvtHqAQAo5KfjMLsG5QIOkdzIH4WF0/Rgj0lDfEaLf2hYQH
 jbYjNcr7/OpBA==
X-Pm-Submission-Id: 4ggwQt1YNTz1DFT1
From: Sean Nyekjaer <sean@geanix.com>
To: Tom Rini <trini@konsulko.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 18 Jun 2026 11:28:48 +0200
Message-ID: <20260618092855.3702905-1-sean@geanix.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2026 05:50:53 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Sean Nyekjaer <sean@geanix.com>
Subject: [Uboot-stm32] [PATCH] stm32mp1: spl: support loading U-Boot proper
	from eMMC hardware partitions
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.29 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[geanix.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[92];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sean@geanix.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:trini@konsulko.com,m:patrick.delaunay@foss.st.com,m:patrice.chotard@foss.st.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:u-boot@lists.denx.de,m:sean@geanix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[sean@geanix.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[uboot-stm32];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 288606ACD4E

When CONFIG_SUPPORT_EMMC_BOOT is enabled, make spl_mmc_boot_mode()
return MMCSD_MODE_EMMCBOOT instead of MMCSD_MODE_RAW.

This allows the SPL MMC loader to honor the standard configuration
options CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_PARTITION and
CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR when locating U-Boot proper,
whether it is stored in a GPT partition or in an eMMC hardware boot
partition.

As a result, both U-Boot SPL and U-Boot proper can be placed in the
eMMC hardware boot partitions.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 arch/arm/mach-stm32mp/stm32mp1/spl.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/spl.c b/arch/arm/mach-stm32mp/stm32mp1/spl.c
index d2e41b8e65f..d2af705a5d1 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/spl.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/spl.c
@@ -56,11 +56,6 @@ u32 spl_boot_device(void)
 	return BOOT_DEVICE_MMC1;
 }
 
-u32 spl_mmc_boot_mode(struct mmc *mmc, const u32 boot_device)
-{
-	return MMCSD_MODE_RAW;
-}
-
 #ifdef CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION
 int spl_mmc_boot_partition(const u32 boot_device)
 {
-- 
2.52.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
