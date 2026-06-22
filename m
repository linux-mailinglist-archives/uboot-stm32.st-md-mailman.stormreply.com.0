Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3arZG+d9OGpKcwcAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jun 2026 02:12:23 +0200
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 019326ABD87
	for <lists+uboot-stm32@lfdr.de>; Mon, 22 Jun 2026 02:12:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=nabladev.com header.s=dkim header.b=djZevJXy;
	spf=pass (mail.lfdr.de: domain of uboot-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=uboot-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nabladev.com (policy=reject)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BA9FC8F28C;
	Mon, 22 Jun 2026 00:05:41 +0000 (UTC)
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AD37AC5A4DF
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2026 00:05:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7F781116C96; Mon, 22 Jun 2026 02:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
 s=dkim; t=1782086738; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=zHCjd4f1wTw6D73Cjj8T7Z5FkN1UrWRWKSH6X7t31RA=;
 b=djZevJXyp/ES+zFsKkxWpvP8AU5G9za/QKZM347JEIvlydiyZRB6+sO5bkEBs/tYRrYf0w
 BGHi2oZX4uLH95/ks8K735yVNEZ3zHTla4xlAAlH6MXzEPlmJ+dDdIjjYG27WuEk9od4cj
 jo7hEY/cqNQW/GVucC0QEJfbH8d1rsElYe3BHStrSUgM9Z+d/vboLSyGXFwgQMDeycYQrv
 V6xnUhHoRddqX5japKI4GeW9V3WxNllgLzgwNFB5FVFgtK+f58ZQfvWh1frm8fqqAzrn0X
 nQZuCbSpGmqoOLQHWRJes2LOin8VCdH3LuRR5p/W1HREbsT4/eciVKddfnQThw==
From: Marek Vasut <marex@nabladev.com>
To: u-boot@lists.denx.de
Date: Mon, 22 Jun 2026 02:05:10 +0200
Message-ID: <20260622000535.226234-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Cc: Marek Vasut <marex@nabladev.com>, u-boot@dh-electronics.com,
 Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH] treewide: Fix STMicroelectronics spelling
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_REJECT(2.00)[nabladev.com : SPF not aligned (relaxed),reject];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[nabladev.com:s=dkim];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:marex@nabladev.com,m:u-boot@dh-electronics.com,m:trini@konsulko.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:patrick.delaunay@foss.st.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[marex@nabladev.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[nabladev.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[marex@nabladev.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,st.com:email,nabladev.com:email,nabladev.com:mid,nabladev.com:from_mime,dh-electronics.com:email,denx.de:email,konsulko.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 019326ABD87

Fix STMicroelectronics spelling in comments.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 include/configs/stm32mp21_st_common.h | 2 +-
 include/configs/stm32mp23_st_common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/configs/stm32mp21_st_common.h b/include/configs/stm32mp21_st_common.h
index c601f2d7fb6..bca4c4b5337 100644
--- a/include/configs/stm32mp21_st_common.h
+++ b/include/configs/stm32mp21_st_common.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2026, STMicroelectronics - All Rights Reserved
  *
- * Configuration settings for the STMicroelectonics STM32MP21x boards
+ * Configuration settings for the STMicroelectronics STM32MP21x boards
  */
 
 #ifndef __CONFIG_STM32MP21_ST_COMMON_H__
diff --git a/include/configs/stm32mp23_st_common.h b/include/configs/stm32mp23_st_common.h
index 0c5c2fbef87..547c230ae90 100644
--- a/include/configs/stm32mp23_st_common.h
+++ b/include/configs/stm32mp23_st_common.h
@@ -2,7 +2,7 @@
 /*
  * Copyright (C) 2025, STMicroelectronics - All Rights Reserved
  *
- * Configuration settings for the STMicroelectonics STM32MP23x boards
+ * Configuration settings for the STMicroelectronics STM32MP23x boards
  */
 
 #ifndef __CONFIG_STM32MP23_ST_COMMON_H__
-- 
2.53.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
