Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0447E8A5D
	for <lists+uboot-stm32@lfdr.de>; Sat, 11 Nov 2023 11:44:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7CD90C6B47F;
	Sat, 11 Nov 2023 10:44:46 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6A978C62EFE
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Nov 2023 10:44:45 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-544455a4b56so4560725a12.1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Nov 2023 02:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699699485; x=1700304285;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=e+1GC+qj9BVs+Mg44mGic1I3vxKheAhj9j2BSr5gqbM=;
 b=e2X/36Q553Q4Non2v8/EMEH0oB6lHtyhKUS/I8A4pb7z0JevwmsO2e7EX8GujuYEfK
 UXHSyQd6mJ4Gni88VR4wJTbo0bA+snglsM983EtiRjh5gPDCQz/s6lNOXs/dRE14d2Uq
 V5Zh4A4TZYoZ40nmbSCrxcQwBRp4o7AmZHv2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699699485; x=1700304285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=e+1GC+qj9BVs+Mg44mGic1I3vxKheAhj9j2BSr5gqbM=;
 b=B9EiALH3I6z7T92E4lCcOY+ILx/kLzloV2DWNocc+4wFDrN5wSADXf3APdw02tSpXW
 jCYw5Gd6laurKwYZPUbMSSOdTyBuCi8ytPHDe0cNtGUxx4xsyWkWLNcYsRHw8UJeEe3j
 2ZNxUuwyBxp/l78Q4egwT2/FIgH0EkLtNJxRsHEc0ycKTiBC6RsLrrCFTWnqXcLTgT9Z
 lBvpsU2AqQsDmLWtZmf+xiBPKidKnk4yL5Vue0bz9lDlB7XLOTBlW3yuM+Ldn8i7mXT/
 m6mwlwfElgGYB9cihNgkVD542PDqCmloWUMWt3j9cgFnrJ9vF0jp9yIPAiVmfP9+XLnt
 /FXQ==
X-Gm-Message-State: AOJu0YyOw8IDuR5IUQYV27fyOfviPtnZozi+ky/cKMs12X8zcahqcd+y
 +nXO+OXAqWCkiw5mj3Cwa2Pe0w==
X-Google-Smtp-Source: AGHT+IHHxeEu1fxpKm5KBi2rQ3y1fR8UP9CbTRM32nTDyaumpwLipkS6dpcPO0BI91k4l36B2M87Mw==
X-Received: by 2002:a50:fc09:0:b0:544:98ad:8e99 with SMTP id
 i9-20020a50fc09000000b0054498ad8e99mr1044060edr.40.1699699484795; 
 Sat, 11 Nov 2023 02:44:44 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-20-97-182.retail.telecomitalia.it. [79.20.97.182])
 by smtp.gmail.com with ESMTPSA id
 s1-20020a50d481000000b0053e5f67d637sm834078edi.9.2023.11.11.02.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Nov 2023 02:44:44 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sat, 11 Nov 2023 11:44:36 +0100
Message-ID: <20231111104440.137117-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH] ARM: dts: stm32f769-disco: rework ltdc node
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

With commit f479f5dbb7ac ("ARM: dts: stm32: add ltdc support on
stm32f746 MCU"), which adds the 'ltdc' node in stm32f746.dtsi, we can
simplify stm32f769-disco-uboot.dtsi and align stm32f769-disco.dtsi with
the kernel version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/dts/stm32f769-disco-u-boot.dtsi | 23 +++++++++--------------
 arch/arm/dts/stm32f769-disco.dts         |  4 ++++
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/arm/dts/stm32f769-disco-u-boot.dtsi b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
index 2c823cce98b4..add55c96e21f 100644
--- a/arch/arm/dts/stm32f769-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f769-disco-u-boot.dtsi
@@ -70,22 +70,17 @@
 				};
 			};
 		};
+	};
+};
 
-		ltdc: display-controller@40016800 {
-			compatible = "st,stm32-ltdc";
-			reg = <0x40016800 0x200>;
-			resets = <&rcc STM32F7_APB2_RESET(LTDC)>;
-			clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
-
-			status = "okay";
-			bootph-all;
+&ltdc {
+	clocks = <&rcc 0 STM32F7_APB2_CLOCK(LTDC)>;
+	bootph-all;
 
-			ports {
-				port@0 {
-					dp_out: endpoint {
-						remote-endpoint = <&dsi_in>;
-					};
-				};
+	ports {
+		port@0 {
+			dp_out: endpoint {
+				remote-endpoint = <&dsi_in>;
 			};
 		};
 	};
diff --git a/arch/arm/dts/stm32f769-disco.dts b/arch/arm/dts/stm32f769-disco.dts
index 6f93fc7bcfcd..d63cd2ba7eb4 100644
--- a/arch/arm/dts/stm32f769-disco.dts
+++ b/arch/arm/dts/stm32f769-disco.dts
@@ -86,6 +86,10 @@
 	status = "okay";
 };
 
+&ltdc {
+	status = "okay";
+};
+
 &rtc {
 	status = "okay";
 };
-- 
2.42.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
