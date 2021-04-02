Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CA0352787
	for <lists+uboot-stm32@lfdr.de>; Fri,  2 Apr 2021 10:43:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 988DAC58D60;
	Fri,  2 Apr 2021 08:43:07 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 11521C58D5F
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Apr 2021 08:43:06 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id y32so5869pga.11
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Apr 2021 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=65ALKF4ZV1T5gPw/0LdqLUiBJMt6Jppj9pDCTyv6ZBE=;
 b=qRK7CbWJGV1SgBAWw+fAoQgfeenaubJLHHLLjiJJ4NjjAquPbyFtGxMXuzp3Obsbtt
 q5hUxp692KUfzXniddPJJ1cMIcEqoi/H7ZKa8NvlDjXQnpZadtBDjmbwzhPJaWQqd2Is
 mD+tRHAGdRdBrGXPVyT1mQcHBLFL+pwE8Czg0eW2wGHKylt4poPy994h4/5cBfPnepW2
 7o/MzDU5hXo8Gm/4O09EvoT7riU3Y0x27QqXPpezE4WapYYR0KiGYLt9vdU7nd+tMPws
 K+sSU3ZZCCggr0icVQc86uAdhXWvEPROHAKDwW8lz25iUtNKItOrAEG9uOEj+QCPohBn
 /cMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=65ALKF4ZV1T5gPw/0LdqLUiBJMt6Jppj9pDCTyv6ZBE=;
 b=t0n4MtpC2TXB0mJ5m7OtCsFKScYQi6eQA2CUqDoML7ejm8VGxO7HTtp8LeytwMk4r5
 9q+Yr0D3ZI/lSsqD4Ww6YxcjkOcf6NZuxaaerGpC4p4V8cAwkk8OyZtKvSsmzGY2qQKf
 8rojo2cfVr+WQiskY8sUnPqzdigQGwj8EDnIlfOLxWxzO5FBB5BllWnGV8RTq1GnjUsd
 2rBC/R9zNFq0rdZySEpbisjZKn+/RtnJmf3w/asITL2hLjIwGjrtPXnNwp7jLnYhDFar
 M29JDxcz44Oza5Uuvd9venTSxYpnlC8FPJQk0GhMxkZE1VQxsFpzgjeE33lzkdNP1DlC
 Izdg==
X-Gm-Message-State: AOAM533pMCWrp1YG14YgyTFyheIEmL9Ael+vz7/ycw/ahUl6pic34S8h
 MMUarrNaTXEuBJjo3XRyBYk=
X-Google-Smtp-Source: ABdhPJzEp9sVP8bbx/mu1/hyxhk5CovFPEgl1Oxn+MxqhqYkMl8OhqcqVpYp/YWB9MBwvyVMeZHPyg==
X-Received: by 2002:aa7:9471:0:b029:1f2:3e6c:69e3 with SMTP id
 t17-20020aa794710000b02901f23e6c69e3mr11117520pfq.69.1617352984699; 
 Fri, 02 Apr 2021 01:43:04 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id fs9sm7359708pjb.40.2021.04.02.01.43.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Apr 2021 01:43:04 -0700 (PDT)
From: dillon.minfei@gmail.com
To: kever.yang@rock-chips.com, andre.przywara@arm.com, priyanka.jain@nxp.com,
 jagan@amarulasolutions.com, narmstrong@baylibre.com, marex@denx.de,
 aford173@gmail.com, ioana.ciornei@nxp.com, josip.kelecic@sartura.hr,
 festevam@gmail.com, hs@denx.de, heiko.stuebner@theobroma-systems.com,
 u-boot@lists.denx.de, patrice.chotard@foss.st.com,
 patrick.delaunay@foss.st.com, uboot-stm32@st-md-mailman.stormreply.com,
 sjg@chromium.org
Date: Fri,  2 Apr 2021 16:42:38 +0800
Message-Id: <1617352961-20550-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
References: <1617352961-20550-1-git-send-email-dillon.minfei@gmail.com>
Cc: dillon min <dillon.minfei@gmail.com>
Subject: [Uboot-stm32] [PATCH v4 4/7] ARM: dts: stm32: fix i2c node typo in
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
---
v4: sync with kernel side commit
link:
https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git/commit/?h=stm32-dt-for-v5.13&id=978783f90ab71f830207b7e9b49ab819cfd89dd4

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
