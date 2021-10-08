Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B894271A6
	for <lists+uboot-stm32@lfdr.de>; Fri,  8 Oct 2021 21:57:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 260F6C5C828;
	Fri,  8 Oct 2021 19:57:13 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B11EDC5719E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 19:57:10 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so13054923otj.2
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 12:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGEJu4EkxMZapoclpGORUy4+ClEcEKT2o0miuvPph5U=;
 b=niSgxxsfLHGY9DOzqlhfRoCIAeX2pSps6IWe438a37jVfqanaR0vY8DvDesbeh2S7W
 oHcwVGkbQRZETOPtxYSqnmHJ8OE+mMOJ/+qLdZYCzD69+novsKYsQcvbMjoh9/PN6TnW
 JNjJt6mfze9rV3opun8GtQ8W29xgHQpiu76R2dWLHsbQX71TH2oXiTFC5sFSLXgeWFyH
 HnNt/BVEpWleFJYGWlHMWBCn6ED7KuPKSBjDSoKl6VOXZOFQFF+vtOsRYP7RLi0SDAUO
 1BKES4ImeA/lOF1Rj3ug13cf7bL5h1MoCQzPi5yNLJIKMqKY9y0AsGVBUhXXy4XU3p+Z
 uXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGEJu4EkxMZapoclpGORUy4+ClEcEKT2o0miuvPph5U=;
 b=qAEULKVWFJeVPGhXQ0c0y+UXIZBZlpGM7vKOV1Vl+SbHjLJ2J+JA444IAAfxXYzWLB
 CderInF1gBe8HuE9ZeMruvlTwJkmMCOvT5wNnYVMKgZm8xea41i6caT0OgVPCC1c1OA1
 ryPaP9cPiczXR5M/GsbyIvIxUa14U2ujVFqPWaDz6vn8KeJvVkQZKYdsV1oQZvC0MXIY
 MYAU45WKHk9GdUuRTGnxxAqU7WG8iX3bculJxlfl/oZ8B68x/1sGU5Blwg0whcXpNyfb
 GT5TJWQRvL0sVeBolD52/nQyKagD0Fe94/oVcmYXM4cDIfQ5yVQ3F7yP6tyfEekexouB
 WyCw==
X-Gm-Message-State: AOAM531N3Ly9FmVu/bB6m9RdDpO60/cvYtnEFVYYBY3IMkREcHjD+oV/
 ISE/WHiCVlx44y13pygjg40=
X-Google-Smtp-Source: ABdhPJwOyJaGMS+rYFjDvnzM7HXlEHyKzKscunHwSAdnnvY+nxpr7FJjk/akt6X/vwVBzdOy521LmA==
X-Received: by 2002:a05:6830:101:: with SMTP id
 i1mr10282758otp.107.1633723028852; 
 Fri, 08 Oct 2021 12:57:08 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id x8sm67409otg.31.2021.10.08.12.57.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 12:57:08 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Fri,  8 Oct 2021 14:56:51 -0500
Message-Id: <20211008195655.46046-10-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008195655.46046-1-mr.nuke.me@gmail.com>
References: <20211008195655.46046-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v3 09/13] stm32mp1: spl: Configure MAC address
	when booting OP-TEE
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

When OP-TEE is booted as the SPL payload, the stage after OP-TEE is
not guaranteed to be u-boot. Thus the FDT patching in u-boot is not
guaranteed to occur. Add this step to SPL.

The patching by stm32_fdt_setup_mac_addr() is done in SPL, and patches
the target FDT directly. This differs is different from
setup_mac_address(), which sets the "ethaddr" env variable, and does
not work in SPL.

An alternative way of setting the MAC is to patch the kernel's
devicetree to use the "nvmem-cells" property. This would backend on
the linux BSEC driver, which relies on an SMCC call. That call is
implemented only by TF-A, not by SPL. Thus linux will not be able to
read the MAC from OTP, and this alternative method will fail.

Changing the linux driver is not feasible is our goal is to support
the current linux LTS release (v5.14). Implementing the SMCC call
would require SPL finagling, and possibly carry security side-effects.

Thus, adding "mac-address" nodes to the kernel devicetree is the most
economical method in terms of lines of code and complexity.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm/mach-stm32mp/cpu.c                   | 22 +++++++++++++++++++
 .../arm/mach-stm32mp/include/mach/sys_proto.h |  3 +++
 arch/arm/mach-stm32mp/spl.c                   |  1 +
 3 files changed, 26 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index 8727de513c..2b8b67bb40 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -10,6 +10,7 @@
 #include <cpu_func.h>
 #include <debug_uart.h>
 #include <env.h>
+#include <fdt_support.h>
 #include <init.h>
 #include <log.h>
 #include <lmb.h>
@@ -646,6 +647,27 @@ __weak int setup_mac_address(void)
 	return 0;
 }
 
+int stm32_fdt_setup_mac_addr(void *fdt)
+{
+	int ret;
+	uchar enetaddr[ARP_HLEN];
+
+	ret = stm32_read_otp_mac(enetaddr);
+	if (ret < 0)
+		return ret;
+
+	if (!is_valid_ethaddr(enetaddr)) {
+		printf("invalid MAC address in OTP\n");
+		return -EINVAL;
+	}
+
+	ret = fdt_ethernet_set_macaddr(fdt, 0, enetaddr);
+	if (ret)
+		debug("Failed to set mac address from OTP: %d\n", ret);
+
+	return ret;
+}
+
 static int setup_serial_number(void)
 {
 	char serial_string[25];
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 4149d3a133..2d24cfee3f 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -47,7 +47,10 @@ void get_soc_name(char name[SOC_NAME_SIZE]);
 /* return boot mode */
 u32 get_bootmode(void);
 
+/* Set 'ethaddr' env variable with MAC from OTP (useful for u-boot proper) */
 int setup_mac_address(void);
+/* Patch the first 'ethernet' node of FDT with MAC from OTP (useful for SPL) */
+int stm32_fdt_setup_mac_addr(void *fdt);
 
 /* board power management : configure vddcore according OPP */
 void board_vddcore_init(u32 voltage_mv);
diff --git a/arch/arm/mach-stm32mp/spl.c b/arch/arm/mach-stm32mp/spl.c
index 405eff68a3..d9fdc5926c 100644
--- a/arch/arm/mach-stm32mp/spl.c
+++ b/arch/arm/mach-stm32mp/spl.c
@@ -181,6 +181,7 @@ void stm32_init_tzc_for_optee(void)
 
 void spl_board_prepare_for_optee(void *fdt)
 {
+	stm32_fdt_setup_mac_addr(fdt);
 	stm32_init_tzc_for_optee();
 }
 
-- 
2.31.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
