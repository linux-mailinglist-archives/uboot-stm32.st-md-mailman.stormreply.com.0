Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKugOdAwxGkAxQQAu9opvQ
	(envelope-from <uboot-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Mar 2026 20:00:32 +0100
X-Original-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D3E32AED6
	for <lists+uboot-stm32@lfdr.de>; Wed, 25 Mar 2026 20:00:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF62BC8F264;
	Wed, 25 Mar 2026 19:00:31 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B40B2C8F261
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 19:00:30 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id
 46e09a7af769-7d75371d873so141050a34.3
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Mar 2026 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=konsulko.com; s=google; t=1774465229; x=1775070029;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0OIPNbfNxnMicZyifpKc9retvzGF6QXsTnXJHM708zs=;
 b=ANjXZl7oOF9Cai2zZsixhOoNdWF4fCks23n9Rt1cqcFtHJrgQfAnI2VOvikw/M1lyL
 9iVyDtzwIYd2GeE46cg6aYQdw1/s0C4ZGFAlCtnw654QY141nQ+/4N786gDNJVZsRemL
 yyRuo9Rd4BamlxfhfWK/NAnKb7/9duIUaBYo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774465229; x=1775070029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0OIPNbfNxnMicZyifpKc9retvzGF6QXsTnXJHM708zs=;
 b=Vaa9VwsxYPJBD2eVmVj30Db6JWNfS9XLSK4Em5KD7ra7kz6yZXRqjoAGDJFbmVxVUt
 GWZIz+2677JN/vFbROTWgX1xPldyS/jX11jmGwP7heRBwoSus8/SkZG+kTqbpbWi1oxY
 8oM+1BrfVjjeoxDv/+MESwlhUB1Y7H+OhAUj4Yh+or28gNldoQ/M/Pz9vxzOYxGkphvS
 1iHIfIwmzVDHVrFVoofuOcrFcfM373pUjIsZ0H2GNzK9yKa9XPANcgF7Dxa9J7aC3a8I
 iJBVdPhmk84K2/zVVf2c179UHBONZSrN7pnMjKaHTNqJ+p+YTiy2dAM9ejw9IGI8zHqp
 Didg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPG4nT/PoduxsKZcONcJTaJ9euZRIZL4/AkQr3BZpE6xEvETALrNNSDyjeujmxtsiAy7AIw5i6sVNS3w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx1rS/sS57aCVxTULwftuJ9CjJSpFH0BZFKDcM8KfxX/wqcTXoY
 pEVp3JqsuDy3F9zOJBpOALf7jYD66pN0Ad2A8b885KtEulLyQWekDXOYLqssc71NYWQ=
X-Gm-Gg: ATEYQzzZ/pa2PgYZlsmtaHSxkJtFaT8H9ukY4Ajcbdiz2jNTpf70QMAnynZT0bcv1Hj
 MSxTT6DO3zoFzYVYa0n5jSKT+JS3/pk0vmt7H7TYd9vaFxuXgjmvb4yTBfb0hrtuT2g/BBliG/c
 D3qAIFhST0PtJJy1FTKgG/dYpyPbs5OL9xraaf5OpU/GKqdZii3szhozJgNJ1zJPbkKAcvtvAFj
 W7RJEomOhtiAJ54LgIQeE05yha3pbvNlCGG1fA0435cEU9yFl/E0MGM1zTpeJn+jGxXZwtu3lTk
 4e5E+qMy+N7x/vxdg4dcaDoDHncgxMII6mKJGKKJLEjzdeu51k2P0jWa8BqHa+27s+Nh2MuRzmu
 Dq0W0JcjwjVkF8tNO0kUYHXC2KgzHdYg3lhNnbivG8vPmXl7BmlugFOMoer4n89OooZ8+hY809z
 IqKyi1oOvj3+yQvuqPEQeFGsm5DF1tiNB4/yX1bhSFYQ+BhJ3dEDEtmPuzn26RACb9coRP4wNDm
 FHcFqWSE+mETEbh27ZJL8Bf6ddKi4uZ1qN98zkI/+QAlDp4GYE=
X-Received: by 2002:a05:6830:3487:b0:7d7:f5c6:9fa3 with SMTP id
 46e09a7af769-7d9d67995afmr2447512a34.8.1774465229339; 
 Wed, 25 Mar 2026 12:00:29 -0700 (PDT)
Received: from bill-the-cat.. (fixed-189-203-97-235.totalplay.net.
 [189.203.97.235]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d9e701545bsm409005a34.11.2026.03.25.12.00.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 12:00:29 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: u-boot@lists.denx.de
Date: Wed, 25 Mar 2026 13:00:27 -0600
Message-ID: <20260325190027.3428596-1-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Jagan Teki <jagan@amarulasolutions.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dillon Min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH] arm: stm32mp: Drop unnecessary
	BOARD_EARLY_INIT_F usage
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[konsulko.com:s=google];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[konsulko.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:u-boot@lists.denx.de,m:matteo.lisi@engicam.com,m:uboot-stm32@st-md-mailman.stormreply.com,m:jagan@amarulasolutions.com,m:patrick.delaunay@foss.st.com,m:dillon.minfei@gmail.com,m:dillonminfei@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[engicam.com,st-md-mailman.stormreply.com,amarulasolutions.com,foss.st.com,gmail.com];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[konsulko.com:-];
	PREVIOUSLY_DELIVERED(0.00)[uboot-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[trini@konsulko.com,uboot-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[uboot-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.013];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 68D3E32AED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

All of these platforms enable CONFIG_BOARD_EARLY_INIT_F and then have a
do-nothing board_early_init_f function. Change to not enabling the
option and so not needing an empty function.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Matteo Lisi <matteo.lisi@engicam.com>
Cc: Dillon Min <dillon.minfei@gmail.com>
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 arch/arm/mach-stm32mp/stm32mp1/spl.c         | 15 ++++++---------
 board/engicam/stm32mp1/spl.c                 |  6 ------
 board/st/stm32h750-art-pi/stm32h750-art-pi.c |  5 -----
 configs/stm32h750-art-pi_defconfig           |  1 -
 4 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/arch/arm/mach-stm32mp/stm32mp1/spl.c b/arch/arm/mach-stm32mp/stm32mp1/spl.c
index e63bdaaf42fd..d2e41b8e65ff 100644
--- a/arch/arm/mach-stm32mp/stm32mp1/spl.c
+++ b/arch/arm/mach-stm32mp/stm32mp1/spl.c
@@ -90,11 +90,6 @@ void spl_display_print(void)
 }
 #endif
 
-__weak int board_early_init_f(void)
-{
-	return 0;
-}
-
 uint32_t stm32mp_get_dram_size(void)
 {
 	struct ram_info ram;
@@ -204,10 +199,12 @@ void board_init_f(ulong dummy)
 	/* enable console uart printing */
 	preloader_console_init();
 
-	ret = board_early_init_f();
-	if (ret) {
-		log_debug("board_early_init_f() failed: %d\n", ret);
-		hang();
+	if (IS_ENABLED(CONFIG_BOARD_EARLY_INIT_F)) {
+		ret = board_early_init_f();
+		if (ret) {
+			log_debug("board_early_init_f() failed: %d\n", ret);
+			hang();
+		}
 	}
 
 	ret = uclass_get_device(UCLASS_RAM, 0, &dev);
diff --git a/board/engicam/stm32mp1/spl.c b/board/engicam/stm32mp1/spl.c
index bb2bd446aa8c..19e5ab0180f9 100644
--- a/board/engicam/stm32mp1/spl.c
+++ b/board/engicam/stm32mp1/spl.c
@@ -15,9 +15,3 @@ void board_vddcore_init(u32 voltage_mv)
 	if (IS_ENABLED(CONFIG_PMIC_STPMIC1) && CONFIG_IS_ENABLED(POWER))
 		opp_voltage_mv = voltage_mv;
 }
-
-int board_early_init_f(void)
-{
-	return 0;
-}
-
diff --git a/board/st/stm32h750-art-pi/stm32h750-art-pi.c b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
index 244bb5eefb3a..8b1b23337790 100644
--- a/board/st/stm32h750-art-pi/stm32h750-art-pi.c
+++ b/board/st/stm32h750-art-pi/stm32h750-art-pi.c
@@ -32,11 +32,6 @@ int dram_init_banksize(void)
 	return 0;
 }
 
-int board_early_init_f(void)
-{
-	return 0;
-}
-
 int board_late_init(void)
 {
 	return 0;
diff --git a/configs/stm32h750-art-pi_defconfig b/configs/stm32h750-art-pi_defconfig
index 971d5c00d88f..0d0dca2511b7 100644
--- a/configs/stm32h750-art-pi_defconfig
+++ b/configs/stm32h750-art-pi_defconfig
@@ -24,7 +24,6 @@ CONFIG_DEFAULT_FDT_FILE="stm32h750i-art-pi"
 CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=282
 # CONFIG_DISPLAY_CPUINFO is not set
-CONFIG_BOARD_EARLY_INIT_F=y
 # CONFIG_BOARD_INIT is not set
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_SYS_PROMPT="U-Boot > "
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
