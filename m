Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 56869CAC641
	for <lists+uboot-stm32@lfdr.de>; Mon, 08 Dec 2025 08:44:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CBB24C58D77;
	Mon,  8 Dec 2025 07:44:13 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C522EC2909A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Dec 2025 13:37:07 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DB02EC19646;
 Fri,  5 Dec 2025 13:36:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4BB7A606AC;
 Fri,  5 Dec 2025 13:37:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B75810B60851; Fri,  5 Dec 2025 14:37:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1764941826; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=q8VM02h7VzdMJQi3gzfFiXY5Belti4llsP//Xb39LRo=;
 b=FibaC1ZH7Bxi6J3Qqmno8LSiVTGH1bEJ+MC62kK4CJDdr7t+dmJ4dXcN9taBquV1Dcv8Uh
 crHFm6YZBaMcAePLktjhTNaZzGmE19Ljwd9fRWKMs2lpluxDYrfbhWOuXjFd/F227S5OOj
 76OQrtIHTR1ttvQobIV6ylBv44DdE5bTTCXjiAOTv7A2v1xmggdjbq42pkBAwwZJ0r1HKT
 wTMUu4IFvTNz0XTlF8cZnlA8OF/0uc3j1RCx58fwvWHkWCl9aii99og0MMfyIPdBgAlieG
 bGgNovK0n0mLqZhCqYgTYVZ2l61BYBmMecNpdiwdsJCqSrcUSPH6i6gUh+futg==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Heiko Schocher <hs@nabladev.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Fri,  5 Dec 2025 14:36:41 +0100
Message-ID: <20251205133641.2052099-1-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Mon, 08 Dec 2025 07:44:12 +0000
Cc: uboot-stm32@st-md-mailman.stormreply.com, Tom Rini <trini@konsulko.com>,
 Richard Genoud <richard.genoud@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, u-boot@lists.denx.de
Subject: [Uboot-stm32] [PATCH] i2c: stm32f7_i2c: save some ms in
	stm32_i2c_choose_solution
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

In stm32_i2c_choose_solution, the double loop continues even after a
solution is found.

Breaking out of this double loop once a solution is found permits to
gain some precious ms.

This saves about 13ms in U-Boot.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/i2c/stm32f7_i2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/stm32f7_i2c.c b/drivers/i2c/stm32f7_i2c.c
index 3f51b1dd1db4..cb5e2c0e31e5 100644
--- a/drivers/i2c/stm32f7_i2c.c
+++ b/drivers/i2c/stm32f7_i2c.c
@@ -651,11 +651,13 @@ static int stm32_i2c_choose_solution(u32 i2cclk,
 						v->sclh = h;
 						sol_found = true;
 						memcpy(s, v, sizeof(*s));
+						goto end_loop;
 					}
 				}
 			}
 		}
 	}
+end_loop:
 
 	if (!sol_found) {
 		log_err("no solution at all\n");

base-commit: c5e6d2ab7eba68cbfb600cdc131c0c375ced2ec9
-- 
2.47.3

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
