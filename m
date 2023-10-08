Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6B37BCF23
	for <lists+uboot-stm32@lfdr.de>; Sun,  8 Oct 2023 17:46:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1855C6B463;
	Sun,  8 Oct 2023 15:46:01 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58760C6B444
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Oct 2023 15:46:00 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-9936b3d0286so672021866b.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Sun, 08 Oct 2023 08:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696779960; x=1697384760;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bIGSMWG9wB8nSXXdhajx7VgE3zyfpt07huxXjyhDX0I=;
 b=PkSP2q1w5WCHBanvqZILmLPg2IODEJQ5s5XaLzpmdiIWl0sGopoGjt6TTDqBvhujVh
 i6+NAczUGPjK8MCMJMORGnGR/wCDjjtc6h4k/K9tZNz6E/pT5/jRPd913td1XMPQgBuH
 lGT806ejOWGgpi4QyJOcWWJ2Bl73FWqNEgm8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696779960; x=1697384760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bIGSMWG9wB8nSXXdhajx7VgE3zyfpt07huxXjyhDX0I=;
 b=A1xrS6d8GhcjyABAkdDQpJRAOci8stmivvvzVkDbnsK+uOvmSeZ4mDIF4FHEdYXAme
 vG7qaUxcbvN5AD564pT9Ki1asItjtYYhU7w8UwLAInSSLv+t1kJx8+eBg07SxucfXfCr
 3WXzQB/gH5u9O57OoSrXCrFSE/dB7PjIe710aJCa17T7J8lJnBxWGisZWa5+a3pom5XT
 Y9lxz5WiiPKm7lxjuK+l3msfSADyN7xe/aU3d7Mykp6zWEe54fA+Sy/yKppmIdgKoDax
 Wr5gwhsPv0Xg+ZEI5PUxw/F4llPIRKEVqxuHLjRsWApCaKYCKMcUmCMg3nzmM/R47A/n
 mv5w==
X-Gm-Message-State: AOJu0YxScQY74BeykAe88E+bk1/pq4yJhqAhE1jmQC85Whtp5B3Jx6Fv
 xZK87WkoOl4VDB/DIhc/U9dtdg==
X-Google-Smtp-Source: AGHT+IHUr6AHuKTWWjdKW+oU12w5z0UGUUjHSuXBq9J71VYBMuS59ZQ0TlQD/kgv8xg3ZLTeAyxNmw==
X-Received: by 2002:a17:907:774e:b0:9a5:d972:af43 with SMTP id
 kx14-20020a170907774e00b009a5d972af43mr11896479ejc.65.1696779959775; 
 Sun, 08 Oct 2023 08:45:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-50-102-159.retail.telecomitalia.it. [79.50.102.159])
 by smtp.gmail.com with ESMTPSA id
 lc11-20020a170906f90b00b009b9aa8fffdasm5623981ejb.131.2023.10.08.08.45.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 08:45:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: u-boot@lists.denx.de
Date: Sun,  8 Oct 2023 17:44:54 +0200
Message-ID: <20231008154538.1622772-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231008154538.1622772-1-dario.binacchi@amarulasolutions.com>
References: <20231008154538.1622772-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>, Simon Glass <sjg@chromium.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Subject: [Uboot-stm32] [RFC PATCH v2 2/5] ARM: dts: stm32: make the LTDC
	clock usable by the clock driver
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

As described in [1], the "clocks" property contains "a phandle to the
clock device node, an index selecting between gated clocks (0) and other
clocks (1), and an index specifying the clock to use." The current version
of the clock driver, unlike the kernel, is currently able to properly
handle nodes with "clocks" properties with an index set to 0.

This patch is preparatory for future developments that require the use
of the LTDC clock.

[1] Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

---

Changes in v2:
- Add Patrice Chotard's Reviewed-by tag.

 arch/arm/dts/stm32f469-disco-u-boot.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/dts/stm32f469-disco-u-boot.dtsi b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
index c07e2022e4a8..dcc70369cd0d 100644
--- a/arch/arm/dts/stm32f469-disco-u-boot.dtsi
+++ b/arch/arm/dts/stm32f469-disco-u-boot.dtsi
@@ -134,6 +134,10 @@
 	bootph-all;
 };
 
+&ltdc {
+	clocks = <&rcc 0 STM32F4_APB2_CLOCK(LTDC)>;
+};
+
 &pinctrl {
 	bootph-all;
 
-- 
2.42.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
