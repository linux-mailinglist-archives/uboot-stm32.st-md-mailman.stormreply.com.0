Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9D8C039BA
	for <lists+uboot-stm32@lfdr.de>; Thu, 23 Oct 2025 23:49:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5E5AAC349C4;
	Thu, 23 Oct 2025 21:49:12 +0000 (UTC)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C698AC5A4CA
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Oct 2025 21:49:10 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4ct06Z2YYhz9thc;
 Thu, 23 Oct 2025 23:49:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761256150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=w3KTPYyYKcRJm6YwNZcC82u0HEITFxzKDLPL12WUOmk=;
 b=dHKzrN+XOc3CbTB9+pTWPe/84kAB6O3mINewYvaCDN5ZKfG2zm81qHX9AiJEzxvYsBz1kj
 I2SS44kvyyAXLcJiAP+yw9JyBQ/wJ0joqN3KbgqnsJzoqOY4mgN+RonDTuuaYJWX73RCms
 N3jEJhpcrL1XIsaOB+iQc0gGDaN3wCObnk5Po5iAiNxQimJCe6VuveGGCt0M/I+rOI1bHR
 Vz7OCGW9MWu9cJvknKPY2yrd/LxTZ5VEHMg8JbTPw9IjnxA+rjpG0wrIPFn8oINjDNiMKp
 t6at2USJ60kCAOkEIAkmFYM02Kx7a8XJlErUizhDoQTJU81a+p6IrX7aMGm6xA==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=L18wB3mO;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1761256148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=w3KTPYyYKcRJm6YwNZcC82u0HEITFxzKDLPL12WUOmk=;
 b=L18wB3mOjw9JoDBWygcxURNo7/OadnepM56LhlJKMvEYmoA1HOhTBVagxurki0y18o61p4
 790XK0Gh8o5ctjsUB00GxdwgcBRAX8XJRrie1ohtm9/+/x3Dh9v9xi2RjgtZDDp5UWVn9Y
 qaMdx1Ry3QCkj0+/e/+AKmf05UEs3uHbN2Sm30fsFLPNvZrq4+qEDP1qXSeBdgYiXV3Kyt
 TqN+a1C+i+MGerEmMRo3VY9FeO5NG3TF65HhdLxUwNO9hl+BUkHLi4ElGGW/oR1mCwfBbY
 kiQ+dkxqILntunUxv/h7rZ2RpVs+aAHEF2prQT/i83yrKK3BRSVukIFCic7KrQ==
To: u-boot@lists.denx.de
Date: Thu, 23 Oct 2025 23:48:24 +0200
Message-ID: <20251023214855.181410-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
X-MBO-RS-META: dygbab7pxr9xch5gkghknfeg76uqawfx
X-MBO-RS-ID: 49610a680fbb4128ec2
X-Rspamd-Queue-Id: 4ct06Z2YYhz9thc
Cc: Tom Rini <trini@konsulko.com>, u-boot@dh-electronics.com,
 Marek Vasut <marek.vasut@mailbox.org>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/3] board: dhelectronics: Move
	dh_add_item_number_and_serial_to_env() to common code
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

Move dh_add_item_number_and_serial_to_env() to common code, so it
can be used by both STM32MP13xx and iMX8MP DHSOM. No functional
change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: u-boot@dh-electronics.com
Cc: u-boot@lists.denx.de
Cc: uboot-stm32@st-md-mailman.stormreply.com
---
 board/dhelectronics/common/dh_common.c        | 37 +++++++++++++++++++
 board/dhelectronics/common/dh_common.h        |  9 +++++
 .../dh_imx8mp/imx8mp_dhcom_pdk2.c             | 37 -------------------
 3 files changed, 46 insertions(+), 37 deletions(-)

diff --git a/board/dhelectronics/common/dh_common.c b/board/dhelectronics/common/dh_common.c
index 6101ecc7ebc..e7ee23aa8ce 100644
--- a/board/dhelectronics/common/dh_common.c
+++ b/board/dhelectronics/common/dh_common.c
@@ -246,3 +246,40 @@ __weak int dh_setup_mac_address(struct eeprom_id_page *eip)
 	printf("%s: Unable to set mac address!\n", __func__);
 	return -ENXIO;
 }
+
+void dh_add_item_number_and_serial_to_env(struct eeprom_id_page *eip)
+{
+	char *item_number_env;
+	char item_number[8];	/* String with 7 characters + string termination */
+	char *serial_env;
+	char serial[10];	/* String with 9 characters + string termination */
+	int ret;
+
+	ret = dh_get_value_from_eeprom_buffer(DH_ITEM_NUMBER, item_number, sizeof(item_number),
+					      eip);
+	if (ret) {
+		printf("%s: Unable to get DHSOM item number from EEPROM ID page! ret = %d\n",
+		       __func__, ret);
+	} else {
+		item_number_env = env_get("dh_som_item_number");
+		if (!item_number_env)
+			env_set("dh_som_item_number", item_number);
+		else if (strcmp(item_number_env, item_number))
+			printf("Warning: Environment dh_som_item_number differs from EEPROM ID page value (%s != %s)\n",
+			       item_number_env, item_number);
+	}
+
+	ret = dh_get_value_from_eeprom_buffer(DH_SERIAL_NUMBER, serial, sizeof(serial),
+					      eip);
+	if (ret) {
+		printf("%s: Unable to get DHSOM serial number from EEPROM ID page! ret = %d\n",
+		       __func__, ret);
+	} else {
+		serial_env = env_get("dh_som_serial_number");
+		if (!serial_env)
+			env_set("dh_som_serial_number", serial);
+		else if (strcmp(serial_env, serial))
+			printf("Warning: Environment dh_som_serial_number differs from EEPROM ID page value (%s != %s)\n",
+			       serial_env, serial);
+	}
+}
diff --git a/board/dhelectronics/common/dh_common.h b/board/dhelectronics/common/dh_common.h
index c4693c60618..b4f31bdb88e 100644
--- a/board/dhelectronics/common/dh_common.h
+++ b/board/dhelectronics/common/dh_common.h
@@ -107,7 +107,16 @@ int dh_get_value_from_eeprom_buffer(enum eip_request_values request, u8 *data, i
 
 /*
  * dh_setup_mac_address - Try to get MAC address from various locations and write it to env
+ * @eip: ID EEPROM buffer
  *
  * Return: 0 if OK, other value on error
  */
 int dh_setup_mac_address(struct eeprom_id_page *eip);
+
+/*
+ * dh_add_item_number_and_serial_to_env - Try to get DH IDs from WLP write them to env
+ * @eip: ID EEPROM buffer
+ *
+ * Return: 0 if OK, other value on error
+ */
+void dh_add_item_number_and_serial_to_env(struct eeprom_id_page *eip);
diff --git a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
index 3a890c5920c..5c35a5bf447 100644
--- a/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
+++ b/board/dhelectronics/dh_imx8mp/imx8mp_dhcom_pdk2.c
@@ -116,43 +116,6 @@ int dh_setup_mac_address(struct eeprom_id_page *eip)
 	return ret;
 }
 
-void dh_add_item_number_and_serial_to_env(struct eeprom_id_page *eip)
-{
-	char *item_number_env;
-	char item_number[8];	/* String with 7 characters + string termination */
-	char *serial_env;
-	char serial[10];	/* String with 9 characters + string termination */
-	int ret;
-
-	ret = dh_get_value_from_eeprom_buffer(DH_ITEM_NUMBER, item_number, sizeof(item_number),
-					      eip);
-	if (ret) {
-		printf("%s: Unable to get DHSOM item number from EEPROM ID page! ret = %d\n",
-		       __func__, ret);
-	} else {
-		item_number_env = env_get("dh_som_item_number");
-		if (!item_number_env)
-			env_set("dh_som_item_number", item_number);
-		else if (strcmp(item_number_env, item_number))
-			printf("Warning: Environment dh_som_item_number differs from EEPROM ID page value (%s != %s)\n",
-			       item_number_env, item_number);
-	}
-
-	ret = dh_get_value_from_eeprom_buffer(DH_SERIAL_NUMBER, serial, sizeof(serial),
-					      eip);
-	if (ret) {
-		printf("%s: Unable to get DHSOM serial number from EEPROM ID page! ret = %d\n",
-		       __func__, ret);
-	} else {
-		serial_env = env_get("dh_som_serial_number");
-		if (!serial_env)
-			env_set("dh_som_serial_number", serial);
-		else if (strcmp(serial_env, serial))
-			printf("Warning: Environment dh_som_serial_number differs from EEPROM ID page value (%s != %s)\n",
-			       serial_env, serial);
-	}
-}
-
 int board_late_init(void)
 {
 	u8 eeprom_buffer[DH_EEPROM_ID_PAGE_MAX_SIZE] = { 0 };
-- 
2.51.0

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
