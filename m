Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 168FB1896F5
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 09:25:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D598BC36B0E
	for <lists+uboot-stm32@lfdr.de>; Wed, 18 Mar 2020 08:25:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4344BC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2020 08:25:22 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I8HV4q019419; Wed, 18 Mar 2020 09:25:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=L8U2vrYny7Vrt3iJ7da9vKE8KrWv7zxXscJ/zsdQoHc=;
 b=xyrZcWcxw3vBh0KZAFtxQJVjpLongoMRnvSKYFZPuXQzyETOFn4Z9PkY7vpuj9+Zyx7v
 QQvtH70aulJ+gG0MjSGfRQiNrnKl8rYBOxb30ZXvlk5tC5C+6ft16EfJszL/KsC3lOFO
 pIfQDL1eWPPQLnRnQvt2Ckek/uyQAtEOXdT3dXl2CQjIOCpVTnGNl27aZJpXPYgeWtYB
 m6+67wBV4ObYsnE/29cTuHJPGbJDrqA1l2xAPzFgPtffs/QLZy9EzP3JDtmbUf0y5j8s
 hmiV4BY9fUKikjgV7oqyMZAL/9SkunGGQhpACmtQ1ECM88w4jJEehcIr4FQrRfGrbXN0 1A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yu8eta8te-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 09:25:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5525E100034;
 Wed, 18 Mar 2020 09:25:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3228C21CA96;
 Wed, 18 Mar 2020 09:25:20 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Wed, 18 Mar 2020 09:25:19 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 18 Mar 2020 09:24:59 +0100
Message-ID: <20200318082503.8025-15-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200318082503.8025-1-patrick.delaunay@st.com>
References: <20200318082503.8025-1-patrick.delaunay@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG5NODE1.st.com (10.75.127.13) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH 14/18] stm32mp: stm32prog: add pmic NVM update
	support
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

Add a virtual partition to update the pmic non volatile memory.
(on ST board, STPMIC1).

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 .../mach-stm32mp/cmd_stm32prog/stm32prog.c    | 95 ++++++++++++++++++-
 .../mach-stm32mp/cmd_stm32prog/stm32prog.h    | 10 ++
 .../cmd_stm32prog/stm32prog_usb.c             | 11 +++
 3 files changed, 115 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
index cd826dbb9c..d127afefaa 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.c
@@ -7,6 +7,7 @@
 #include <console.h>
 #include <dfu.h>
 #include <malloc.h>
+#include <misc.h>
 #include <mmc.h>
 #include <part.h>
 #include <asm/arch/stm32mp1_smc.h>
@@ -1107,7 +1108,7 @@ static int dfu_init_entities(struct stm32prog_data *data)
 	struct dfu_entity *dfu;
 	int alt_nb;
 
-	alt_nb = 2; /* number of virtual = CMD, OTP*/
+	alt_nb = 3; /* number of virtual = CMD, OTP, PMIC*/
 	if (data->part_nb == 0)
 		alt_nb++;  /* +1 for FlashLayout */
 	else
@@ -1158,6 +1159,9 @@ static int dfu_init_entities(struct stm32prog_data *data)
 	if (!ret)
 		ret = stm32prog_alt_add_virt(dfu, "OTP", PHASE_OTP, 512);
 
+	if (!ret && CONFIG_IS_ENABLED(DM_PMIC))
+		ret = stm32prog_alt_add_virt(dfu, "PMIC", PHASE_PMIC, 8);
+
 	if (ret)
 		stm32prog_err("dfu init failed: %d", ret);
 	puts("done\n");
@@ -1285,6 +1289,93 @@ int stm32prog_otp_start(struct stm32prog_data *data)
 #endif
 }
 
+int stm32prog_pmic_write(struct stm32prog_data *data, u32 offset, u8 *buffer,
+			 long *size)
+{
+	pr_debug("%s: %x %lx\n", __func__, offset, *size);
+
+	if (!offset)
+		memset(data->pmic_part, 0, PMIC_SIZE);
+
+	if (offset + *size > PMIC_SIZE)
+		*size = PMIC_SIZE - offset;
+
+	memcpy(&data->pmic_part[offset], buffer, *size);
+
+	return 0;
+}
+
+int stm32prog_pmic_read(struct stm32prog_data *data, u32 offset, u8 *buffer,
+			long *size)
+{
+	int result = 0, ret;
+	struct udevice *dev;
+
+	if (!CONFIG_IS_ENABLED(PMIC_STPMIC1)) {
+		stm32prog_err("PMIC update not supported");
+
+		return -EOPNOTSUPP;
+	}
+
+	pr_debug("%s: %x %lx\n", __func__, offset, *size);
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_GET_DRIVER(stpmic1_nvm),
+					  &dev);
+	if (ret)
+		return ret;
+
+	/* alway request PMIC for first packet */
+	if (!offset) {
+		/* init struct with 0 */
+		memset(data->pmic_part, 0, PMIC_SIZE);
+
+		ret = uclass_get_device_by_driver(UCLASS_MISC,
+						  DM_GET_DRIVER(stpmic1_nvm),
+						  &dev);
+		if (ret)
+			return ret;
+
+		ret = misc_read(dev, 0xF8, data->pmic_part, PMIC_SIZE);
+		if (ret < 0) {
+			result = ret;
+			goto end_pmic_read;
+		}
+		if (ret != PMIC_SIZE) {
+			result = -EACCES;
+			goto end_pmic_read;
+		}
+	}
+
+	if (offset + *size > PMIC_SIZE)
+		*size = PMIC_SIZE - offset;
+
+	memcpy(buffer, &data->pmic_part[offset], *size);
+
+end_pmic_read:
+	pr_debug("%s: result %i\n", __func__, result);
+	return result;
+}
+
+int stm32prog_pmic_start(struct stm32prog_data *data)
+{
+	int ret;
+	struct udevice *dev;
+
+	if (!CONFIG_IS_ENABLED(PMIC_STPMIC1)) {
+		stm32prog_err("PMIC update not supported");
+
+		return -EOPNOTSUPP;
+	}
+
+	ret = uclass_get_device_by_driver(UCLASS_MISC,
+					  DM_GET_DRIVER(stpmic1_nvm),
+					  &dev);
+	if (ret)
+		return ret;
+
+	return misc_write(dev, 0xF8, data->pmic_part, PMIC_SIZE);
+}
+
 /* copy FSBL on NAND to improve reliability on NAND */
 static int stm32prog_copy_fsbl(struct stm32prog_part_t *part)
 {
@@ -1585,6 +1676,8 @@ void dfu_flush_callback(struct dfu_entity *dfu)
 	if (dfu->dev_type == DFU_DEV_VIRT) {
 		if (dfu->data.virt.dev_num == PHASE_OTP)
 			stm32prog_otp_start(stm32prog_data);
+		else if (dfu->data.virt.dev_num == PHASE_PMIC)
+			stm32prog_pmic_start(stm32prog_data);
 		return;
 	}
 
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
index 6024657433..83b27980f5 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog.h
@@ -12,6 +12,7 @@
 #define PHASE_LAST_USER		0xF0
 #define PHASE_CMD		0xF1
 #define PHASE_OTP		0xF2
+#define PHASE_PMIC		0xF4
 #define PHASE_END		0xFE
 #define PHASE_RESET		0xFF
 #define PHASE_DO_RESET		0x1FF
@@ -19,6 +20,7 @@
 #define DEFAULT_ADDRESS		0xFFFFFFFF
 
 #define OTP_SIZE		1024
+#define PMIC_SIZE		8
 
 enum stm32prog_target {
 	STM32PROG_NONE,
@@ -120,6 +122,7 @@ struct stm32prog_data {
 	char			error[255];
 	struct stm32prog_part_t	*cur_part;
 	u32			*otp_part;
+	u8			pmic_part[PMIC_SIZE];
 
 	/* STM32 header information */
 	struct raw_header_s	*header_data;
@@ -135,6 +138,13 @@ int stm32prog_otp_read(struct stm32prog_data *data, u32 offset,
 		       u8 *buffer, long *size);
 int stm32prog_otp_start(struct stm32prog_data *data);
 
+/* PMIC access */
+int stm32prog_pmic_write(struct stm32prog_data *data, u32 offset,
+			 u8 *buffer, long *size);
+int stm32prog_pmic_read(struct stm32prog_data *data, u32 offset,
+			u8 *buffer, long *size);
+int stm32prog_pmic_start(struct stm32prog_data *data);
+
 /* generic part*/
 u8 stm32prog_header_check(struct raw_header_s *raw_header,
 			  struct image_header_s *header);
diff --git a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
index 4a4b4d326b..34f27c074f 100644
--- a/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
+++ b/arch/arm/mach-stm32mp/cmd_stm32prog/stm32prog_usb.c
@@ -134,6 +134,10 @@ int stm32prog_write_medium_virt(struct dfu_entity *dfu, u64 offset,
 	case PHASE_OTP:
 		return stm32prog_otp_write(stm32prog_data, (u32)offset,
 					   buf, len);
+
+	case PHASE_PMIC:
+		return stm32prog_pmic_write(stm32prog_data, (u32)offset,
+					    buf, len);
 	}
 	*len = 0;
 	return 0;
@@ -152,6 +156,10 @@ int stm32prog_read_medium_virt(struct dfu_entity *dfu, u64 offset,
 	case PHASE_OTP:
 		return stm32prog_otp_read(stm32prog_data, (u32)offset,
 					  buf, len);
+
+	case PHASE_PMIC:
+		return stm32prog_pmic_read(stm32prog_data, (u32)offset,
+					   buf, len);
 	}
 	*len = 0;
 	return 0;
@@ -173,6 +181,9 @@ int stm32prog_get_medium_size_virt(struct dfu_entity *dfu, u64 *size)
 	case PHASE_OTP:
 		*size = OTP_SIZE;
 		break;
+	case PHASE_PMIC:
+		*size = PMIC_SIZE;
+		break;
 	}
 
 	return 0;
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
