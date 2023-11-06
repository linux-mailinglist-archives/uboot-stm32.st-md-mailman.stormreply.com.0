Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BECB07E210E
	for <lists+uboot-stm32@lfdr.de>; Mon,  6 Nov 2023 13:14:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58DC8C6B460;
	Mon,  6 Nov 2023 12:14:13 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F868C6A61A
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Nov 2023 10:42:22 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-53de8fc1ad8so7210400a12.0
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Nov 2023 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foundries.io; s=google; t=1699267342; x=1699872142;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=thMslcgBqaUAT1bAZ9aqrb+AnShN38KGLArHdPBpeXU=;
 b=B2QUvg52TeJqmUnhg1CZHT5zq1t2KFGTUO4TugdEGzxLMwcfbK4yb5ypRtQjgPeU9E
 hEEFO5ZFjOgt5mLl0MJpHR2PRFkPqwTQrOMaTGZVUABoLvlj0xmlEL2kdfRzgUjPdVYi
 ialvWMXeOzAAJgKdmqYoRgyGtIrxCwUQKsPTK/QKbsLVxkvcYqpfedIPHd7q165rUjn5
 f9wR0Hkd1uxgeq2A56+zpx1aIS/TT0s4rTIaO6+C8J+W9ITJcwNkVvIYcwH2i21IaUYy
 goeDMzuxnfYrDgj33YCvom7PjGgLkzz5a0PV5mc96zKHSXAyUpdzeY48Jjdbx0rT1aeO
 6Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699267342; x=1699872142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=thMslcgBqaUAT1bAZ9aqrb+AnShN38KGLArHdPBpeXU=;
 b=viYk4RhGH2UzVZ3yyRKt+3DsMKvDy2N6mAywRX4BmO5bl2CtGaBy89NaTxDpHJK2T9
 tTnehefuSGH2DVwlopzixkdi4Z+v9OFbRZNPp1QxFsn8NTOl0KADzp3yx6pophPWw7/j
 29UtMm3hats+8SZHHssQPKfwslj0cFzeb7qZBrCSVozr7+EGgSmxaT50bmYP9URpxQmH
 zCvUNwBUW3XE9T0k7djhO8EGI12/+CubpsKTKb8pjKsVdAkh7RTlLeD8+nOspLLCjKfP
 d8CdtJ5Xyxvqevl3sBP+kgVOusohLZaHrLXIuGPVk+Hk9GbQ4NAnL588sYeUQs1hUIqj
 fh/Q==
X-Gm-Message-State: AOJu0YxhzgcqM4wFyjZfkCZkk6A4zy3bTRvoZ71wVAdGAlg7MjCmH9uz
 kBpCbJPel1ed0BVRejhiLd7QLQ==
X-Google-Smtp-Source: AGHT+IHhrDa3IrfZxFrd2TjhcCKtPyum48rZp9aWtFQ64mCZ43TACBGg6dTABHXFyfdB5s1vOe5z6Q==
X-Received: by 2002:a17:907:7208:b0:9e1:21d:fdaa with SMTP id
 dr8-20020a170907720800b009e1021dfdaamr733875ejc.57.1699267341781; 
 Mon, 06 Nov 2023 02:42:21 -0800 (PST)
Received: from igor-thinkpad.local ([109.108.76.111])
 by smtp.gmail.com with ESMTPSA id
 qw23-20020a1709066a1700b009dd949b75c7sm3304181ejc.151.2023.11.06.02.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 02:42:20 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@foundries.io>
To: u-boot@lists.denx.de,
	uboot-stm32@st-md-mailman.stormreply.com
Date: Mon,  6 Nov 2023 11:41:52 +0100
Message-Id: <20231106104152.140495-1-igor.opaniuk@foundries.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Nov 2023 12:14:12 +0000
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Oleksandr Suvorov <oleksandr.suvorov@foundries.io>,
 Marek Vasut <marex@denx.de>, Igor Opaniuk <igor.opaniuk@foundries.io>
Subject: [Uboot-stm32] [PATCH v1] stm32mp1: read auth stats and
	boot_partition from tamp
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

Obtain from TAMP backup register information about image authorization
status and partition id used for booting. Store this info in
environmental variables ("boot_auth" and "boot_part" correspondingly).

Image authorization supported values:
0x0 - No authentication done
0x1 - Authentication done and failed
0x2 - Authentication done and succeeded

These values are stored to TAMP backup register by Trusted Firmware-A [1].

Testing:
STM32MP> print boot_part
boot_part=1
STM32MP> print boot_auth
boot_auth=2

[1] https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?h=refs/heads/integration&id=ab2b325c1ab895e626d4e11a9f26b9e7c968f8d8

Signed-off-by: Igor Opaniuk <igor.opaniuk@foundries.io>
Co-developed-by: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>
Signed-off-by: Oleksandr Suvorov <oleksandr.suvorov@foundries.io>

---

 arch/arm/mach-stm32mp/cpu.c                   | 23 +++++++++++++++++++
 arch/arm/mach-stm32mp/include/mach/stm32.h    |  4 ++++
 .../arm/mach-stm32mp/include/mach/sys_proto.h |  3 +++
 3 files changed, 30 insertions(+)

diff --git a/arch/arm/mach-stm32mp/cpu.c b/arch/arm/mach-stm32mp/cpu.c
index e07abbe21c1..ba5942848bd 100644
--- a/arch/arm/mach-stm32mp/cpu.c
+++ b/arch/arm/mach-stm32mp/cpu.c
@@ -40,6 +40,13 @@ u32 get_bootmode(void)
 		    TAMP_BOOT_MODE_SHIFT;
 }
 
+u32 get_bootauth(void)
+{
+	/* read boot auth status and partition from TAMP backup register */
+	return (readl(TAMP_BOOT_CONTEXT) & TAMP_BOOT_AUTH_MASK) >>
+		    TAMP_BOOT_AUTH_SHIFT;
+}
+
 /*
  * weak function overidde: set the DDR/SYSRAM executable before to enable the
  * MMU and configure DACR, for early early_enable_caches (SPL or pre-reloc)
@@ -371,8 +378,24 @@ __weak void stm32mp_misc_init(void)
 {
 }
 
+static int setup_boot_auth_info(void)
+{
+	char buf[10];
+	u32 bootauth = get_bootauth();
+
+	snprintf(buf, sizeof(buf), "%d", bootauth >> 4);
+	env_set("boot_auth", buf);
+
+	snprintf(buf, sizeof(buf), "%d", bootauth &
+		 (u32)TAMP_BOOT_PARTITION_MASK);
+	env_set("boot_part", buf);
+
+	return 0;
+}
+
 int arch_misc_init(void)
 {
+	setup_boot_auth_info();
 	setup_boot_mode();
 	setup_mac_address();
 	setup_serial_number();
diff --git a/arch/arm/mach-stm32mp/include/mach/stm32.h b/arch/arm/mach-stm32mp/include/mach/stm32.h
index 1cdc5e3b186..ac0deced67e 100644
--- a/arch/arm/mach-stm32mp/include/mach/stm32.h
+++ b/arch/arm/mach-stm32mp/include/mach/stm32.h
@@ -139,8 +139,12 @@ enum boot_device {
 
 #define TAMP_BOOT_MODE_MASK		GENMASK(15, 8)
 #define TAMP_BOOT_MODE_SHIFT		8
+#define TAMP_BOOT_AUTH_MASK		GENMASK(23, 16)
+#define TAMP_BOOT_AUTH_SHIFT		16
 #define TAMP_BOOT_DEVICE_MASK		GENMASK(7, 4)
 #define TAMP_BOOT_INSTANCE_MASK		GENMASK(3, 0)
+#define TAMP_BOOT_AUTH_ST_MASK		GENMASK(7, 4)
+#define TAMP_BOOT_PARTITION_MASK	GENMASK(3, 0)
 #define TAMP_BOOT_FORCED_MASK		GENMASK(7, 0)
 
 enum forced_boot_mode {
diff --git a/arch/arm/mach-stm32mp/include/mach/sys_proto.h b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
index 83fb32a45fc..52aca1e23e1 100644
--- a/arch/arm/mach-stm32mp/include/mach/sys_proto.h
+++ b/arch/arm/mach-stm32mp/include/mach/sys_proto.h
@@ -66,6 +66,9 @@ void get_soc_name(char name[SOC_NAME_SIZE]);
 /* return boot mode */
 u32 get_bootmode(void);
 
+/* return auth status and partition */
+u32 get_bootauth(void);
+
 int get_eth_nb(void);
 int setup_mac_address(void);
 
-- 
2.34.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
