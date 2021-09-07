Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 942ED4031B1
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Sep 2021 01:59:47 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DEEDC5A4F7;
	Tue,  7 Sep 2021 23:59:47 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8087BC5A4D8
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Sep 2021 23:59:46 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id y144so694333qkb.6
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Sep 2021 16:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sGEJu4EkxMZapoclpGORUy4+ClEcEKT2o0miuvPph5U=;
 b=ZGQG3NOBDnLj2VF0/G+Gpyu91VT7SOXzZNbU59hT8yhf+vkUjyAXZqViyD10n8AYee
 ibHvwnTdl5omvc+uguEjm1UTiNO+yqLiJ52GW93GqUOqJ3yuHMHvFm6y5R/4S1QAeafl
 vCOCQOWJmS33RREsnuUWQrzDX6oRYxHz55vSVEu2n+yeKlIjhgtRCWcxVOTySEwi7p/m
 qyJwRKEanjGQKapPNy5TpNbFKZhaHlnV8x/LTTOQiFEpUfP60QgfjkWIqjQpYSXhliE2
 A5W+PwqgJwGNzFhZ+xqDYdKKjGDkSV1l4YcmI/hv+Qc1P5OlDtBR7zSCgOW136tEkJSH
 Hlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sGEJu4EkxMZapoclpGORUy4+ClEcEKT2o0miuvPph5U=;
 b=TCw10oiVrpdz4wo0ZNb+nTPqM5aNaRNsQz/rHzQLHEo4B6jqPUk7l9EmWvtFgV9WkM
 uaWhpAGFY48UMXBfQoZ3ZPEDPYUYkQchJ+9zCuXvbMigdsQ2AGzj+cEkfdTtyolg3zh1
 36VP4xj3KFz7oa2+6T49P48+Q+MECwDH+QKkFhS2cReMiqzXW7Yo6qy78+EQDvlTLCms
 NtXW/LsSHav9Gnu/5dbsNYxuWQEH+uNBxbj3BY2WT9t/pz+l4ZyO3Q6cEdrd33g5c3V9
 5CtVTx3jbhSTBPYCRjrhs006T8Qd5y65aIP4hG7R8rVm+rSJ1i/5HeJIviZb+9MNW3ki
 /BHA==
X-Gm-Message-State: AOAM531/ySNACtjpvP1KT/VMpNakelAUsuC0bzg2BfFd2Y2swPFprin3
 5PpZ0JGFxahld2C0JAWQI44HCncPlFA=
X-Google-Smtp-Source: ABdhPJz4SgD9utpuhj/O2rCryETUcC3CW/lN9c/f39RAWRyPeFd7hLLCHRdO6EfXK6LtP5JCKYUSSg==
X-Received: by 2002:a37:6d7:: with SMTP id 206mr856071qkg.251.1631059185611;
 Tue, 07 Sep 2021 16:59:45 -0700 (PDT)
Received: from nuclearis3.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id d78sm460351qkg.92.2021.09.07.16.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 16:59:45 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: u-boot@lists.denx.de, uboot-stm32@st-md-mailman.stormreply.com,
 patrick.delaunay@foss.st.com
Date: Tue,  7 Sep 2021 18:59:30 -0500
Message-Id: <20210907235933.2798330-9-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
References: <20210907235933.2798330-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Cc: etienne.carriere@linaro.org, Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [Uboot-stm32] [PATCH v2 08/11] stm32mp1: spl: Configure MAC address
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
