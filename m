Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD284E9D6D
	for <lists+uboot-stm32@lfdr.de>; Mon, 28 Mar 2022 19:25:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABF67C5EC76;
	Mon, 28 Mar 2022 17:25:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88253C5E2CC
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Mar 2022 17:25:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22SDRBjK021207;
 Mon, 28 Mar 2022 19:25:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=g7j9FzVeiJwuBpgl0jSWjqcbDhVCdhTJ50SspGEb+90=;
 b=v9TZ8OWM4CespNm9uIggdJJxVEHrEqvDs9QQHSeFdxKmbD4X4DwwdMXIC99aXHkejMjL
 5YbDI4SprNBkzcaiIEsmojX5FYKDnDhcloZRwNPsbX3rXs52sMgYPK1bfkgkuukR2+3y
 TtRjNsFNi7ibvdIEKtJVKjuGUxjNLHtU5NcIX6sjTgT83uFP/TZcHYJlu9JT+TxgOvP4
 yl9sxzwKmqq57zF9eYlPG1J6lMwE7iZX5FYhDIU/U5+KJk/pas3rWEuIxQR843TqVDSP
 wg4kZQxC8euZMwXJ3j55mDBeh2x1eWorGtANHG/hefFE/ESXWoJJIdoyOGABcJ83PR+a /A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3f1u242qpq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 19:25:39 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 62570100034;
 Mon, 28 Mar 2022 19:25:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5AC9224B890;
 Mon, 28 Mar 2022 19:25:39 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 28 Mar 2022 19:25:38
 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 28 Mar 2022 19:25:28 +0200
Message-ID: <20220328192520.3.Ic62ab0b22b898fc5dfae530e3560849cd33d5902@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
References: <20220328172534.1196119-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_08,2022-03-28_01,2022-02-23_01
Cc: Simon Glass <sjg@chromium.org>, Jaehoon Chung <jh80.chung@samsung.com>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>,
 William Grant <wgrant@ubuntu.com>
Subject: [Uboot-stm32] [PATCH 3/8] stm32mp: stm32prog: add TEE support in
	stm32prog command
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

When OP-TEE is used, the SMC for BSEC management are not
available and the PTA provisioning for OTP must be used.

U-Boot opens the session to this PTA and use it for OTP
access.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig   |   2 +-
 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 145 ++++++++++++++++--
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    |   7 +-
 .../cmd_stm32prog/stm32prog_usb.c             |   2 +-
 4 files changed, 142 insertions(+), 14 deletions(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
index 81d2b87035..8f91db4b46 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/Kconfig
@@ -35,6 +35,6 @@ config CMD_STM32PROG_SERIAL
 config CMD_STM32PROG_OTP
 	bool "support stm32prog for OTP update"
 	depends on CMD_STM32PROG
-	default y if ARM_SMCCC
+	default y if ARM_SMCCC || OPTEE
 	help
 		Support the OTP update with the command "stm32prog" for STM32MP
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index 3e9354b51d..5d53e6146f 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -10,8 +10,10 @@
 #include <misc.h>
 #include <mmc.h>
 #include <part.h>
+#include <tee.h>
 #include <asm/arch/stm32mp1_smc.h>
 #include <asm/global_data.h>
+#include <dm/device_compat.h>
 #include <dm/uclass.h>
 #include <jffs2/load_kernel.h>
 #include <linux/list.h>
@@ -79,8 +81,110 @@ struct fip_toc_header {
 	u64	flags;
 };
 
+#define TA_NVMEM_UUID { 0x1a8342cc, 0x81a5, 0x4512, \
+		{ 0x99, 0xfe, 0x9e, 0x2b, 0x3e, 0x37, 0xd6, 0x26 } }
+
+/*
+ * Read NVMEM memory for STM32CubeProgrammer
+ *
+ * [in]		value[0].a:		Type (0 for OTP access)
+ * [out]	memref[1].buffer	Output buffer to return all read values
+ * [out]	memref[1].size		Size of buffer to be read
+ *
+ * Return codes:
+ * TEE_SUCCESS - Invoke command success
+ * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
+ */
+#define TA_NVMEM_READ		0x0
+
+/*
+ * Write NVMEM memory for STM32CubeProgrammer
+ *
+ * [in]	     value[0].a		Type (0 for OTP access)
+ * [in]      memref[1].buffer	Input buffer with the values to write
+ * [in]      memref[1].size	Size of buffer to be written
+ *
+ * Return codes:
+ * TEE_SUCCESS - Invoke command success
+ * TEE_ERROR_BAD_PARAMETERS - Incorrect input param
+ */
+#define TA_NVMEM_WRITE		0x1
+
+/* value of TA_NVMEM type = value[in] a */
+#define NVMEM_OTP		0
+
 DECLARE_GLOBAL_DATA_PTR;
 
+/* OPTEE TA NVMEM open helper */
+static int optee_ta_open(struct stm32prog_data *data)
+{
+	const struct tee_optee_ta_uuid uuid = TA_NVMEM_UUID;
+	struct tee_open_session_arg arg;
+	struct udevice *tee = NULL;
+	int rc;
+
+	if (data->tee)
+		return 0;
+
+	tee = tee_find_device(NULL, NULL, NULL, NULL);
+	if (!tee)
+		return -ENODEV;
+
+	memset(&arg, 0, sizeof(arg));
+	tee_optee_ta_uuid_to_octets(arg.uuid, &uuid);
+	rc = tee_open_session(tee, &arg, 0, NULL);
+	if (rc < 0)
+		return -ENODEV;
+
+	data->tee = tee;
+	data->tee_session = arg.session;
+
+	return 0;
+}
+
+/* OPTEE TA NVMEM invoke helper */
+static int optee_ta_invoke(struct stm32prog_data *data, int cmd, int type,
+			   void *buff, ulong size)
+{
+	struct tee_invoke_arg arg;
+	struct tee_param param[2];
+	struct tee_shm *buff_shm;
+	int rc;
+
+	rc = tee_shm_register(data->tee, buff, size, 0, &buff_shm);
+	if (rc)
+		return rc;
+
+	memset(&arg, 0, sizeof(arg));
+	arg.func = cmd;
+	arg.session = data->tee_session;
+
+	memset(param, 0, sizeof(param));
+	param[0].attr = TEE_PARAM_ATTR_TYPE_VALUE_INPUT;
+	param[0].u.value.a = type;
+
+	if (cmd == TA_NVMEM_WRITE)
+		param[1].attr = TEE_PARAM_ATTR_TYPE_MEMREF_INPUT;
+	else
+		param[1].attr = TEE_PARAM_ATTR_TYPE_MEMREF_OUTPUT;
+
+	param[1].u.memref.shm = buff_shm;
+	param[1].u.memref.size = size;
+
+	rc = tee_invoke_func(data->tee, &arg, 2, param);
+	if (rc < 0 || arg.ret != 0) {
+		dev_err(data->tee,
+			"TA_NVMEM invoke failed TEE err: %x, err:%x\n",
+			arg.ret, rc);
+		if (!rc)
+			rc = -EIO;
+	}
+
+	tee_shm_free(buff_shm);
+
+	return rc;
+}
+
 /* partition handling routines : CONFIG_CMD_MTDPARTS */
 int mtdparts_init(void);
 int find_dev_and_part(const char *id, struct mtd_device **dev,
@@ -1208,7 +1312,11 @@ static int dfu_init_entities(struct stm32prog_data *data)
 		ret = stm32prog_alt_add_virt(dfu, "virtual", PHASE_CMD, CMD_SIZE);
 
 	if (!ret && IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
-		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP, OTP_SIZE);
+		ret = optee_ta_open(data);
+		log_debug("optee_ta result %d\n", ret);
+		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP,
+					     data->tee ? OTP_SIZE_TA : OTP_SIZE_SMC);
+	}
 
 	if (!ret && CONFIG_IS_ENABLED(DM_PMIC))
 		ret = stm32prog_alt_add_virt(dfu, "PMIC", PHASE_PMIC, PMIC_SIZE);
@@ -1226,6 +1334,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
 int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
 			long *size)
 {
+	u32 otp_size = data->tee ? OTP_SIZE_TA : OTP_SIZE_SMC;
 	log_debug("%s: %x %lx\n", __func__, offset, *size);
 
 	if (!IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
@@ -1233,17 +1342,18 @@ int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
 
 		return -EOPNOTSUPP;
 	}
+
 	if (!data->otp_part) {
-		data->otp_part = memalign(CONFIG_SYS_CACHELINE_SIZE, OTP_SIZE);
+		data->otp_part = memalign(CONFIG_SYS_CACHELINE_SIZE, otp_size);
 		if (!data->otp_part)
 			return -ENOMEM;
 	}
 
 	if (!offset)
-		memset(data->otp_part, 0, OTP_SIZE);
+		memset(data->otp_part, 0, otp_size);
 
-	if (offset + *size > OTP_SIZE)
-		*size = OTP_SIZE - offset;
+	if (offset + *size > otp_size)
+		*size = otp_size - offset;
 
 	memcpy((void *)((u32)data->otp_part + offset), buffer, *size);
 
@@ -1253,6 +1363,7 @@ int stm32prog_otp_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
 int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 		       long *size)
 {
+	u32 otp_size = data->tee ? OTP_SIZE_TA : OTP_SIZE_SMC;
 	int result = 0;
 
 	if (!IS_ENABLED(CONFIG_CMD_STM32PROG_OTP)) {
@@ -1266,7 +1377,7 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 	if (!offset) {
 		if (!data->otp_part)
 			data->otp_part =
-				memalign(CONFIG_SYS_CACHELINE_SIZE, OTP_SIZE);
+				memalign(CONFIG_SYS_CACHELINE_SIZE, otp_size);
 
 		if (!data->otp_part) {
 			result = -ENOMEM;
@@ -1274,11 +1385,14 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 		}
 
 		/* init struct with 0 */
-		memset(data->otp_part, 0, OTP_SIZE);
+		memset(data->otp_part, 0, otp_size);
 
 		/* call the service */
 		result = -EOPNOTSUPP;
-		if (IS_ENABLED(CONFIG_ARM_SMCCC))
+		if (data->tee && CONFIG_IS_ENABLED(OPTEE))
+			result = optee_ta_invoke(data, TA_NVMEM_READ, NVMEM_OTP,
+						 data->otp_part, OTP_SIZE_TA);
+		else if (IS_ENABLED(CONFIG_ARM_SMCCC))
 			result = stm32_smc_exec(STM32_SMC_BSEC, STM32_SMC_READ_ALL,
 						(u32)data->otp_part, 0);
 		if (result)
@@ -1290,8 +1404,8 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
 		goto end_otp_read;
 	}
 
-	if (offset + *size > OTP_SIZE)
-		*size = OTP_SIZE - offset;
+	if (offset + *size > otp_size)
+		*size = otp_size - offset;
 	memcpy(buffer, (void *)((u32)data->otp_part + offset), *size);
 
 end_otp_read:
@@ -1317,7 +1431,10 @@ int stm32prog_otp_start(struct stm32prog_data *data)
 	}
 
 	result = -EOPNOTSUPP;
-	if (IS_ENABLED(CONFIG_ARM_SMCCC)) {
+	if (data->tee && CONFIG_IS_ENABLED(OPTEE)) {
+		result = optee_ta_invoke(data, TA_NVMEM_WRITE, NVMEM_OTP,
+					 data->otp_part, OTP_SIZE_TA);
+	} else if (IS_ENABLED(CONFIG_ARM_SMCCC)) {
 		arm_smccc_smc(STM32_SMC_BSEC, STM32_SMC_WRITE_ALL,
 			      (u32)data->otp_part, 0, 0, 0, 0, 0, &res);
 
@@ -1751,6 +1868,12 @@ void stm32prog_clean(struct stm32prog_data *data)
 	free(data->part_array);
 	free(data->otp_part);
 	free(data->buffer);
+
+	if (CONFIG_IS_ENABLED(OPTEE) && data->tee) {
+		tee_close_session(data->tee, data->tee_session);
+		data->tee = NULL;
+		data->tee_session = 0x0;
+	}
 }
 
 /* DFU callback: used after serial and direct DFU USB access */
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 240c5c44bc..928b7b3a0e 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -20,7 +20,8 @@
 #define DEFAULT_ADDRESS		0xFFFFFFFF
 
 #define CMD_SIZE		512
-#define OTP_SIZE		1024
+#define OTP_SIZE_SMC		1024
+#define OTP_SIZE_TA		776
 #define PMIC_SIZE		8
 
 enum stm32prog_target {
@@ -147,6 +148,10 @@ struct stm32prog_data {
 	u32	dtb;
 	u32	initrd;
 	u32	initrd_size;
+
+	/* OPTEE PTA NVMEM */
+	struct udevice *tee;
+	u32 tee_session;
 };
 
 extern struct stm32prog_data *stm32prog_data;
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
index e8acc302f9..82b702f93b 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
@@ -181,7 +181,7 @@ int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
 		*size = CMD_SIZE;
 		break;
 	case PHASE_OTP:
-		*size = OTP_SIZE;
+		*size = stm32prog_data->tee ? OTP_SIZE_TA : OTP_SIZE_SMC;
 		break;
 	case PHASE_PMIC:
 		*size = PMIC_SIZE;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
