Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C889280DDD8
	for <lists+uboot-stm32@lfdr.de>; Mon, 11 Dec 2023 23:06:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 84D87C6B45D;
	Mon, 11 Dec 2023 22:06:52 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24EBBC6B45B
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 22:06:52 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-54cd2281ccbso6672387a12.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Dec 2023 14:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702332411; x=1702937211;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGkLEQRM3D1qTvh/uatY6K0aHk45yREvABtw7lFzQsg=;
 b=QriWmW7dgDlrZ2YJbDsv5Nhb66nWdO7VAfCfsbYQMGwslrjpJij7+9TVoE7NgfwaK9
 QSAT6ZDlHDR80wpavcSy9br2Ys6/mI7HbPUWBsGEE4hDM2p7mBE0fKclfY9aoSfw3FOW
 aZf0mhiMGemzTTkMiE5zIFuoFZfby6mH9tFqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702332411; x=1702937211;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wGkLEQRM3D1qTvh/uatY6K0aHk45yREvABtw7lFzQsg=;
 b=Mb+KfOww19hwZlXEKi4X4TidrScXeVNftGP6qv32Pks6RdhiwjWMRBR9DyyniaVukP
 VvY6Qq7SxU0T7Jdv+4EmJjieyLu9XYRIrBCfvEn0IcFyTZzJnGm6kYycsoJrPaSGJ38I
 ChLFYPIse0KSpvzNbKOBllaQpsv2L0HTAhhMV2BxqUPaz6fSbj87Jo4WBMCE/T2EGZ4y
 jluuMYY0j8KRR1LUrkwnZQmBhD2AESdq4UaKfLmIWD7NoctottWLsPJ6Wx2Ujrv6uC9t
 ETuSO7k/HyI4WJIiB1m8YiuCbHldBds9QIudBAA55VS5KgD3xOFWAcmQqjBjUUIyI9Ko
 Sl2Q==
X-Gm-Message-State: AOJu0Yyfgw4NJBFxzRWU0zC3pvzmA2ZEv3GeU4ctAk6vE7f97QCID44l
 mMFUUeeTlDWRY4x5teK9cXH05w==
X-Google-Smtp-Source: AGHT+IHpw0bWQjQui1liVzd6FPJY2h+BeIS2Ygo9Nmuw6zmL8u4oOHIjfwz09Z0dyN4j9q1OmgOBgg==
X-Received: by 2002:a17:906:c258:b0:a19:a19b:c701 with SMTP id
 bl24-20020a170906c25800b00a19a19bc701mr2521435ejb.81.1702332411646; 
 Mon, 11 Dec 2023 14:06:51 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-54-95-129.retail.telecomitalia.it. [82.54.95.129])
 by smtp.gmail.com with ESMTPSA id
 se13-20020a170907a38d00b00a1f78048f08sm4568276ejc.146.2023.12.11.14.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 14:06:51 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Mon, 11 Dec 2023 23:05:51 +0100
Message-ID: <20231211220643.1073606-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
References: <20231211220643.1073606-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [PATCH v3 1/6] ARM: dts: stm32f469-disco: sync with
	Linux 6.5
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

Sync the devicetree with linux 6.5 for stm32f746-disco board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

(no changes since v2)

Changes in v2:
- Add Patrice Chotard's Reviewed-by tag.

 arch/arm/dts/stm32f469-disco.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/dts/stm32f469-disco.dts b/arch/arm/dts/stm32f469-disco.dts
index 6e0ffc1903be..c9acabf0f530 100644
--- a/arch/arm/dts/stm32f469-disco.dts
+++ b/arch/arm/dts/stm32f469-disco.dts
@@ -119,7 +119,7 @@
 		};
 	};
 
-	panel-dsi@0 {
+	panel@0 {
 		compatible = "orisetech,otm8009a";
 		reg = <0>; /* dsi virtual channel (0..3) */
 		reset-gpios = <&gpioh 7 GPIO_ACTIVE_LOW>;
@@ -138,7 +138,7 @@
 	status = "okay";
 
 	port {
-		ltdc_out_dsi: endpoint@0 {
+		ltdc_out_dsi: endpoint {
 			remote-endpoint = <&dsi_in>;
 		};
 	};
-- 
2.43.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
