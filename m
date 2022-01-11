Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F448B187
	for <lists+uboot-stm32@lfdr.de>; Tue, 11 Jan 2022 17:03:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60B60C5F1F4;
	Tue, 11 Jan 2022 16:03:41 +0000 (UTC)
Received: from smtp-relay-canonical-0.canonical.com
 (smtp-relay-canonical-0.canonical.com [185.125.188.120])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D261BC5A4FD
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jan 2022 14:58:12 +0000 (UTC)
Received: from workstation5.fritz.box
 (ip-88-152-144-157.hsi03.unitymediagroup.de [88.152.144.157])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C4C1940037; 
 Tue, 11 Jan 2022 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1641913091;
 bh=6fP33fp0z6RosZ5pfVSZuVqVX9pLK7uhpFRZRlALJMA=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=etNV/EzsLsXBvId7F1KaRFR7+CBAZ7mFQov7JdR5Uolms9qHWNoszUrUfjTtxoA3U
 It4JXKWpYby1F2SpsyBTyU9hHti6cohL8AomYetOvh/LAM+CvFSU3jWmnIFvstn8HM
 RHixaoPsxBp0pYW042nlg37oUphqCqftQaS+kpMON8/aWnf2+rQUb3IGRYcORutL2t
 eRxgRRHpDEvbPprPiwHGJ4Pp0sHz6N+SCGSKTPwLb/XMKil68/+e4ai2k8t/8DaDtR
 aSe496wWy1Qul9bv5wr+Bl5pQnJ+J8XK51Q0Q/QmGyZeZJoTq/+jDqxKE8soRk3vbD
 nvJyeKQ4TVhrg==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 11 Jan 2022 15:58:08 +0100
Message-Id: <20220111145808.487868-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Jan 2022 16:03:40 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [Uboot-stm32] [PATCH 1/1] stm32mp: fix board_get_alt_info_mmc()
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

MAX_SEARCH_PARTITIONS is the highest possible partition number.
Do not skip the last partition in board_get_alt_info_mmc().

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 board/st/common/stm32mp_dfu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/st/common/stm32mp_dfu.c b/board/st/common/stm32mp_dfu.c
index a3f0da5b5b..fa48b2a35e 100644
--- a/board/st/common/stm32mp_dfu.c
+++ b/board/st/common/stm32mp_dfu.c
@@ -57,7 +57,7 @@ static void board_get_alt_info_mmc(struct udevice *dev, char *buf)
 		first = false;
 	}
 
-	for (p = 1; p < MAX_SEARCH_PARTITIONS; p++) {
+	for (p = 1; p <= MAX_SEARCH_PARTITIONS; p++) {
 		if (part_get_info(desc, p, &info))
 			continue;
 		if (!first)
-- 
2.33.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
