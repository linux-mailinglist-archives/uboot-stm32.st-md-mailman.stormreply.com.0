Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC4335965F
	for <lists+uboot-stm32@lfdr.de>; Fri,  9 Apr 2021 09:29:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B1B9C56639;
	Fri,  9 Apr 2021 07:29:13 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B83ABC36B25
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  9 Apr 2021 07:29:11 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id d10so3225432pgf.12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 09 Apr 2021 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=e0gmWoZZ8tS0re+uwOYBXni4qOAl589bJB7kiJzLxmg=;
 b=PWpFz/up5OW+jCToj/fdCCI7GfwXjH7C6cxfWwi3UwVeIPzt+pyI8x0av7p3uAbsgz
 k1hkD+ijp1yeyKvBJhNWjOwHKGaD6Ov1tONPfIHBWIkRN5tGe10d8Xy4fb3BpFZDMKFs
 QLOH6WzsAkoEYuph05hOPB0YwC5RaSanrpTyUNkcXPnkIQg4B+LGpI5RTfFkRXp5N4KJ
 FZOzUpgtKWl3J9qqSMngts9EWm6i7RVjCzjO3Yg7K5YDAaw16Uo9+I+tQ1kPBOdG482y
 1MRPzFKBLpG0lmmA0WVQwyiqncNu6w0/lyXzvJl0f1Jv9ma+11g9RccVmOV26ibt73Rz
 Q9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=e0gmWoZZ8tS0re+uwOYBXni4qOAl589bJB7kiJzLxmg=;
 b=VRdQaK5t1So5R9FaAs7y4pWgZgJIo3dJ156enn/RKz9/xxF3P2wRI2hC2HB+IY+Yln
 57U8jlcfYRypLlJfzbToxnvSdtFmCSbOh6Z9MXCQ/RreGtY77TT+GD1sgSJuBLsTZnHN
 1CFczSd/CL4hMeJ9k4tEE6oV6fpQf9RsWG17GigwCGE8smJMNs/dkv6LtcvWKSqF0ib+
 BfgiKyKiSTSt9h32QxIlNqvQEt2pl1yiZo7qqpQW/oubhEx8oqQG+42EBfPu3PhYcJgg
 +Y9nnz/+/Kkfzg6fqBFQPLm7DxFX3ACEgXVQZKoHSFehXHDoZboM4Xg2Rc/xsJfy+4Ny
 BPtg==
X-Gm-Message-State: AOAM531iHjtEWl6lTnqvzStdj5m0DTbryoE5SuzlbdEzg4Co1pCYSBwg
 TbFWQWaex8yTiXsfn3vyqaQ=
X-Google-Smtp-Source: ABdhPJz0m8lrR5z+5UKSe6q8AC/cFll7WQAXdIPh0IAmX6OnBrGV+KgK6b1DX1oUYZgKx8S6HVEM5g==
X-Received: by 2002:a63:fd44:: with SMTP id m4mr12019144pgj.233.1617953350370; 
 Fri, 09 Apr 2021 00:29:10 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id j3sm1344432pfc.49.2021.04.09.00.29.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Apr 2021 00:29:10 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 sjg@chromium.org
Date: Fri,  9 Apr 2021 15:28:43 +0800
Message-Id: <1617953326-3110-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
References: <1617953326-3110-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v5 4/7] ARM: dts: stm32: fix i2c node typo in
	stm32h743, update dmamux1 register
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: uboot-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Uboot-stm32" <uboot-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

Replace upper case by lower case in i2c nodes name.
update dmamux1 register range.

Signed-off-by: dillon min <dillon.minfei@gmail.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
v5: no changes

 arch/arm/dts/stm32h743.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/dts/stm32h743.dtsi b/arch/arm/dts/stm32h743.dtsi
index 77a8aef..ed68575 100644
--- a/arch/arm/dts/stm32h743.dtsi
+++ b/arch/arm/dts/stm32h743.dtsi
@@ -139,7 +139,7 @@
 			status = "disabled";
 		};
 
-		i2c3: i2c@40005C00 {
+		i2c3: i2c@40005c00 {
 			compatible = "st,stm32f7-i2c";
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -254,7 +254,7 @@
 
 		dmamux1: dma-router@40020800 {
 			compatible = "st,stm32h7-dmamux";
-			reg = <0x40020800 0x1c>;
+			reg = <0x40020800 0x40>;
 			#dma-cells = <3>;
 			dma-channels = <16>;
 			dma-requests = <128>;
@@ -386,7 +386,7 @@
 			status = "disabled";
 		};
 
-		i2c4: i2c@58001C00 {
+		i2c4: i2c@58001c00 {
 			compatible = "st,stm32f7-i2c";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
