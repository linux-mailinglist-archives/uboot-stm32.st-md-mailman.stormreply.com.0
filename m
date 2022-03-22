Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2454E402A
	for <lists+uboot-stm32@lfdr.de>; Tue, 22 Mar 2022 15:07:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B4EDC5EC6C;
	Tue, 22 Mar 2022 14:07:09 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DBF5C5EC47
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Mar 2022 14:07:07 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22MAfMNh016931;
 Tue, 22 Mar 2022 15:07:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=SR0UMDqJxzim8prnq54aZVJHvtW2/p8J7e9r72Oc6Hw=;
 b=un+F2OO4eWoW4enxa6JktRfCXNXhEKh6LYXWg9IA6irzCrVv5cHl8bs6Rhjx/nzAsQCZ
 /veEfogOpV0ZgT3lOq1grNfjT0XP4aSVeNuf8IhWSPndaLvwkVxZ4X1CTffAO3viT94M
 u2W6YELEZs4WFYrt8KWt78w+AEHzkBFMQlSuv5aC3LMz/kLjkTwP9Cahc+KdaYMhsJg/
 Xs8eoc7KFNVlTOBL0x1c+SwUd7l79iFLTDZkYdNJf5FUXQQL4kZc6RtdP88W+GIydTW4
 XwSsFYW7K5GOwknSZK4OrfjjvkqY9TaPtar+LUbvkoqUWChhy60hwKZ+EWBby+OfRkLr eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ew7d49954-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Mar 2022 15:07:04 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8CD26100034;
 Tue, 22 Mar 2022 15:07:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A5D822A6C3;
 Tue, 22 Mar 2022 15:07:03 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 22 Mar 2022 15:07:03
 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 22 Mar 2022 15:06:51 +0100
Message-ID: <20220322150558.1.I2d5fc62b65a61d4e11ce442f3b5572ec03f39cf6@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-22_06,2022-03-22_01,2022-02-23_01
Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Sughosh Ganu <sughosh.ganu@linaro.org>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 Etienne Carriere <etienne.carriere@linaro.org>
Subject: [Uboot-stm32] [PATCH 1/3] rng: add OP-TEE based Random Number
	Generator
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

Add driver for OP-TEE based Random Number Generator on ARM SoCs
where hardware entropy sources are not accessible to normal world
and the RNG service is provided by a HWRNG Trusted Application (TA).

This driver is based on the linux driver: char/hw_random/optee-rng.c

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 MAINTAINERS             |   1 +
 drivers/rng/Kconfig     |   8 +++
 drivers/rng/Makefile    |   1 +
 drivers/rng/optee_rng.c | 156 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 166 insertions(+)
 create mode 100644 drivers/rng/optee_rng.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f25ca7cd00..3356c65dd0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -481,6 +481,7 @@ F:	drivers/power/regulator/stpmic1.c
 F:	drivers/ram/stm32mp1/
 F:	drivers/remoteproc/stm32_copro.c
 F:	drivers/reset/stm32-reset.c
+F:	drivers/rng/optee_rng.c
 F:	drivers/rng/stm32mp1_rng.c
 F:	drivers/rtc/stm32_rtc.c
 F:	drivers/serial/serial_stm32.*
diff --git a/drivers/rng/Kconfig b/drivers/rng/Kconfig
index b1c5ab93d1..a02c585f61 100644
--- a/drivers/rng/Kconfig
+++ b/drivers/rng/Kconfig
@@ -31,6 +31,14 @@ config RNG_MSM
 	  This driver provides support for the Random Number
 	  Generator hardware found on Qualcomm SoCs.
 
+config RNG_OPTEE
+	bool "OP-TEE based Random Number Generator support"
+	depends on DM_RNG && OPTEE
+	help
+	  This driver provides support for OP-TEE based Random Number
+	  Generator on ARM SoCs where hardware entropy sources are not
+	  accessible to normal world.
+
 config RNG_STM32MP1
 	bool "Enable random number generator for STM32MP1"
 	depends on ARCH_STM32MP
diff --git a/drivers/rng/Makefile b/drivers/rng/Makefile
index 39f7ee3f03..435b3b965a 100644
--- a/drivers/rng/Makefile
+++ b/drivers/rng/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_DM_RNG) += rng-uclass.o
 obj-$(CONFIG_RNG_MESON) += meson-rng.o
 obj-$(CONFIG_RNG_SANDBOX) += sandbox_rng.o
 obj-$(CONFIG_RNG_MSM) += msm_rng.o
+obj-$(CONFIG_RNG_OPTEE) += optee_rng.o
 obj-$(CONFIG_RNG_STM32MP1) += stm32mp1_rng.o
 obj-$(CONFIG_RNG_ROCKCHIP) += rockchip_rng.o
 obj-$(CONFIG_RNG_IPROC200) += iproc_rng200.o
diff --git a/drivers/rng/optee_rng.c b/drivers/rng/optee_rng.c
new file mode 100644
index 0000000000..a0833d0862
--- /dev/null
+++ b/drivers/rng/optee_rng.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0+ OR BSD-3-Clause
+/*
+ * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
+ */
+#define LOG_CATEGORY UCLASS_RNG
+
+#include <common.h>
+
+#include <rng.h>
+#include <tee.h>
+#include <dm/device.h>
+#include <dm/device_compat.h>
+#include <linux/sizes.h>
+
+#define TEE_ERROR_HEALTH_TEST_FAIL	0x00000001
+
+/*
+ * TA_CMD_GET_ENTROPY - Get Entropy from RNG
+ *
+ * param[0] (inout memref) - Entropy buffer memory reference
+ * param[1] unused
+ * param[2] unused
+ * param[3] unused
+ *
+ * Result:
+ * TEE_SUCCESS - Invoke command success
+ * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
+ * TEE_ERROR_NOT_SUPPORTED - Requested entropy size greater than size of pool
+ * TEE_ERROR_HEALTH_TEST_FAIL - Continuous health testing failed
+ */
+#define TA_CMD_GET_ENTROPY		0x0
+
+#define MAX_ENTROPY_REQ_SZ		SZ_4K
+
+#define TA_HWRNG_UUID { 0xab7a617c, 0xb8e7, 0x4d8f, \
+			{ 0x83, 0x01, 0xd0, 0x9b, 0x61, 0x03, 0x6b, 0x64 } }
+
+/**
+ * struct optee_rng_priv - OP-TEE Random Number Generator private data
+ * @session_id:		RNG TA session identifier.
+ */
+struct optee_rng_priv {
+	u32 session_id;
+};
+
+static int get_optee_rng_data(struct udevice *dev,
+			      struct tee_shm *entropy_shm_pool,
+			      void *buf, size_t *size)
+{
+	struct optee_rng_priv *priv = dev_get_priv(dev);
+	int ret = 0;
+	struct tee_invoke_arg arg;
+	struct tee_param param;
+
+	memset(&arg, 0, sizeof(arg));
+	memset(&param, 0, sizeof(param));
+
+	/* Invoke TA_CMD_GET_ENTROPY function of Trusted App */
+	arg.func = TA_CMD_GET_ENTROPY;
+	arg.session = priv->session_id;
+
+	/* Fill invoke cmd params */
+	param.attr = TEE_PARAM_ATTR_TYPE_MEMREF_INOUT;
+	param.u.memref.shm = entropy_shm_pool;
+	param.u.memref.size = *size;
+
+	ret = tee_invoke_func(dev->parent, &arg, 1, &param);
+	if (ret || arg.ret) {
+		if (!ret)
+			ret = -EPROTO;
+		dev_err(dev, "TA_CMD_GET_ENTROPY invoke err: %d 0x%x\n", ret, arg.ret);
+		*size = 0;
+
+		return ret;
+	}
+
+	memcpy(buf, param.u.memref.shm->addr, param.u.memref.size);
+	*size = param.u.memref.size;
+
+	return 0;
+}
+
+static int optee_rng_read(struct udevice *dev, void *buf, size_t len)
+{
+	size_t read = 0, rng_size = 0;
+	struct tee_shm *entropy_shm_pool;
+	u8 *data = buf;
+	int ret;
+
+	ret = tee_shm_alloc(dev->parent, MAX_ENTROPY_REQ_SZ, 0, &entropy_shm_pool);
+	if (ret) {
+		dev_err(dev, "tee_shm_alloc failed: %d\n", ret);
+		return ret;
+	}
+
+	while (read < len) {
+		rng_size = min(len - read, (size_t)MAX_ENTROPY_REQ_SZ);
+		ret = get_optee_rng_data(dev, entropy_shm_pool, data, &rng_size);
+		if (ret)
+			goto shm_free;
+		data += rng_size;
+		read += rng_size;
+	}
+
+shm_free:
+	tee_shm_free(entropy_shm_pool);
+
+	return ret;
+}
+
+static int optee_rng_probe(struct udevice *dev)
+{
+	const struct tee_optee_ta_uuid uuid = TA_HWRNG_UUID;
+	struct optee_rng_priv *priv = dev_get_priv(dev);
+	struct tee_open_session_arg sess_arg;
+	int ret;
+
+	memset(&sess_arg, 0, sizeof(sess_arg));
+
+	/* Open session with hwrng Trusted App */
+	tee_optee_ta_uuid_to_octets(sess_arg.uuid, &uuid);
+	sess_arg.clnt_login = TEE_LOGIN_PUBLIC;
+
+	ret = tee_open_session(dev->parent, &sess_arg, 0, NULL);
+	if (ret || sess_arg.ret) {
+		if (!ret)
+			ret = -EIO;
+		dev_err(dev, "can't open session: %d 0x%x\n", ret, sess_arg.ret);
+		return ret;
+	}
+	priv->session_id = sess_arg.session;
+
+	return 0;
+}
+
+static int optee_rng_remove(struct udevice *dev)
+{
+	struct optee_rng_priv *priv = dev_get_priv(dev);
+
+	tee_close_session(dev->parent, priv->session_id);
+
+	return 0;
+}
+
+static const struct dm_rng_ops optee_rng_ops = {
+	.read = optee_rng_read,
+};
+
+U_BOOT_DRIVER(optee_rng) = {
+	.name = "optee-rng",
+	.id = UCLASS_RNG,
+	.ops = &optee_rng_ops,
+	.probe = optee_rng_probe,
+	.remove = optee_rng_remove,
+	.priv_auto = sizeof(struct optee_rng_priv),
+};
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
