Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FABDABB82E
	for <lists+uboot-stm32@lfdr.de>; Mon, 19 May 2025 11:06:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E741EC78F9B;
	Mon, 19 May 2025 09:06:19 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 725BDC78F8E
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 May 2025 09:06:18 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8V5C0010792;
 Mon, 19 May 2025 11:06:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 UqWbGleQujKPzxq5KOe+QrJPVGgRINTaC/QgGhugTLg=; b=jGfDnFbS1Ajb2f72
 kpJHBpqGDCQHYUVvEI4tk3APa5+EBSKdtB6fmgR8b14o2f5Uq9LOgSaC7vONuv5X
 X0wafuo1aFusT/DpmGBn4AZ80cbpMA6MB92Zzy9zbkWYCgk6v1oglxTrB/w6LLlT
 2NCdlu6qmoA03oA3xDF2nMmnFIQN+lEvMWe4njVKHPzhOcGu5g7JYzcU0uKb/jS6
 B7foKKe3Jl2Bqi4wrF4HTlUVc5afIwGSCb+LmmMr2GrrNqyiTM09x5v3wZm/R6GV
 AqrGRTo1RTPIvAwqua9WV//QiZL+JRPilsRnwSWvaWA5ZTppXriNpdeUb3Kq2QWB
 K1LF7g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46q5dmuu38-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 May 2025 11:06:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 98E024004A;
 Mon, 19 May 2025 11:05:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A4FEFA36ED8;
 Mon, 19 May 2025 11:04:24 +0200 (CEST)
Received: from localhost (10.48.86.182) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 May
 2025 11:04:24 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 19 May 2025 11:04:19 +0200
Message-ID: <20250519110417.1.Ie741b1ca358414a1d718dca0667ac44eefc9227b@changeid>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250519090421.470942-1-patrick.delaunay@foss.st.com>
References: <20250519090421.470942-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, caleb.connolly@linaro.org,
 jerome.forissier@linaro.org, Casey Connolly <casey.connolly@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Simon Glass <sjg@chromium.org>,
 ilias.apalodimas@linaro.org,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH 1/3] lib/uuid.c: restore support of system
	partition type for ESP
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

Add support of shortname for type parameter and restore "system"
as short name for EFI System Partition (ESP) for filed "type" of the
"gpt write" command.

Fixes: d54e1004b8b1 ("lib/uuid.c: use unique name for PARTITION_SYSTEM_GUID")
Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---

 lib/uuid.c | 148 +++++++++++++++++++++++++++--------------------------
 1 file changed, 76 insertions(+), 72 deletions(-)

diff --git a/lib/uuid.c b/lib/uuid.c
index 6abbcf27b1f3..ee02fa4d600d 100644
--- a/lib/uuid.c
+++ b/lib/uuid.c
@@ -62,184 +62,185 @@ int uuid_str_valid(const char *uuid)
 	return 1;
 }
 
+/* List of known GUID for GPT partition type */
 static const struct {
-	const char *string;
+	const char *string;     /* name for type parameter of gpt command */
+	const char *description;/* description used for %pUs */
 	efi_guid_t guid;
 } list_guid[] = {
 #ifndef USE_HOSTCC
-#if defined(CONFIG_PARTITION_TYPE_GUID) || defined(CONFIG_CMD_EFIDEBUG) || \
-	defined(CONFIG_EFI)
-	{"EFI System Partition", PARTITION_SYSTEM_GUID},
-#endif
-#ifdef CONFIG_PARTITION_TYPE_GUID
-	{"mbr",		LEGACY_MBR_PARTITION_GUID},
-	{"msft",	PARTITION_MSFT_RESERVED_GUID},
-	{"data",	PARTITION_BASIC_DATA_GUID},
-	{"linux",	PARTITION_LINUX_FILE_SYSTEM_DATA_GUID},
-	{"raid",	PARTITION_LINUX_RAID_GUID},
-	{"swap",	PARTITION_LINUX_SWAP_GUID},
-	{"lvm",		PARTITION_LINUX_LVM_GUID},
-	{"u-boot-env",	PARTITION_U_BOOT_ENVIRONMENT},
-	{"cros-kern",	PARTITION_CROS_KERNEL},
-	{"cros-root",	PARTITION_CROS_ROOT},
-	{"cros-fw",	PARTITION_CROS_FIRMWARE},
-	{"cros-rsrv",	PARTITION_CROS_RESERVED},
-#endif
+#if CONFIG_IS_ENABLED(EFI_PARTITION)
+	{"mbr",		NULL,	LEGACY_MBR_PARTITION_GUID},
+	{"msft",	NULL,	PARTITION_MSFT_RESERVED_GUID},
+	{"data",	NULL,	PARTITION_BASIC_DATA_GUID},
+	{"linux",	NULL,	PARTITION_LINUX_FILE_SYSTEM_DATA_GUID},
+	{"raid",	NULL,	PARTITION_LINUX_RAID_GUID},
+	{"swap",	NULL,	PARTITION_LINUX_SWAP_GUID},
+	{"lvm",		NULL,	PARTITION_LINUX_LVM_GUID},
+	{"u-boot-env",	NULL,	PARTITION_U_BOOT_ENVIRONMENT},
+	{"cros-kern",	NULL,	PARTITION_CROS_KERNEL},
+	{"cros-root",	NULL,	PARTITION_CROS_ROOT},
+	{"cros-fw",	NULL,	PARTITION_CROS_FIRMWARE},
+	{"cros-rsrv",	NULL,	PARTITION_CROS_RESERVED},
 #if defined(CONFIG_CMD_EFIDEBUG) || defined(CONFIG_EFI)
 	{
-		"Device Path",
+		"system", "EFI System Partition",
+		PARTITION_SYSTEM_GUID,
+	},
+	{
+		NULL, "Device Path",
 		EFI_DEVICE_PATH_PROTOCOL_GUID,
 	},
 	{
-		"Device Path To Text",
+		NULL, "Device Path To Text",
 		EFI_DEVICE_PATH_TO_TEXT_PROTOCOL_GUID,
 	},
 	{
-		"Device Path Utilities",
+		NULL, "Device Path Utilities",
 		EFI_DEVICE_PATH_UTILITIES_PROTOCOL_GUID,
 	},
 	{
-		"Unicode Collation 2",
+		NULL, "Unicode Collation 2",
 		EFI_UNICODE_COLLATION_PROTOCOL2_GUID,
 	},
 	{
-		"Driver Binding",
+		NULL, "Driver Binding",
 		EFI_DRIVER_BINDING_PROTOCOL_GUID,
 	},
 	{
-		"Simple Text Input",
+		NULL, "Simple Text Input",
 		EFI_SIMPLE_TEXT_INPUT_PROTOCOL_GUID,
 	},
 	{
-		"Simple Text Input Ex",
+		NULL, "Simple Text Input Ex",
 		EFI_SIMPLE_TEXT_INPUT_EX_PROTOCOL_GUID,
 	},
 	{
-		"Simple Text Output",
+		NULL, "Simple Text Output",
 		EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL_GUID,
 	},
 	{
-		"Block IO",
+		NULL, "Block IO",
 		EFI_BLOCK_IO_PROTOCOL_GUID,
 	},
 	{
-		"Disk IO",
+		NULL, "Disk IO",
 		EFI_DISK_IO_PROTOCOL_GUID,
 	},
 	{
-		"Simple File System",
+		NULL, "Simple File System",
 		EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID,
 	},
 	{
-		"Loaded Image",
+		NULL, "Loaded Image",
 		EFI_LOADED_IMAGE_PROTOCOL_GUID,
 	},
 	{
-		"Loaded Image Device Path",
+		NULL, "Loaded Image Device Path",
 		EFI_LOADED_IMAGE_DEVICE_PATH_PROTOCOL_GUID,
 	},
 	{
-		"Graphics Output",
+		NULL, "Graphics Output",
 		EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID,
 	},
 	{
-		"HII String",
+		NULL, "HII String",
 		EFI_HII_STRING_PROTOCOL_GUID,
 	},
 	{
-		"HII Database",
+		NULL, "HII Database",
 		EFI_HII_DATABASE_PROTOCOL_GUID,
 	},
 	{
-		"HII Config Access",
+		NULL, "HII Config Access",
 		EFI_HII_CONFIG_ACCESS_PROTOCOL_GUID,
 	},
 	{
-		"HII Config Routing",
+		NULL, "HII Config Routing",
 		EFI_HII_CONFIG_ROUTING_PROTOCOL_GUID,
 	},
 	{
-		"Load File",
+		NULL, "Load File",
 		EFI_LOAD_FILE_PROTOCOL_GUID,
 	},
 	{
-		"Load File2",
+		NULL, "Load File2",
 		EFI_LOAD_FILE2_PROTOCOL_GUID,
 	},
 	{
-		"Random Number Generator",
+		NULL, "Random Number Generator",
 		EFI_RNG_PROTOCOL_GUID,
 	},
 	{
-		"Simple Network",
+		NULL, "Simple Network",
 		EFI_SIMPLE_NETWORK_PROTOCOL_GUID,
 	},
 	{
-		"PXE Base Code",
+		NULL, "PXE Base Code",
 		EFI_PXE_BASE_CODE_PROTOCOL_GUID,
 	},
 	{
-		"Device-Tree Fixup",
+		NULL, "Device-Tree Fixup",
 		EFI_DT_FIXUP_PROTOCOL_GUID,
 	},
 	{
-		"TCG2",
+		NULL, "TCG2",
 		EFI_TCG2_PROTOCOL_GUID,
 	},
 	{
-		"Firmware Management",
+		NULL, "Firmware Management",
 		EFI_FIRMWARE_MANAGEMENT_PROTOCOL_GUID
 	},
 #if IS_ENABLED(CONFIG_EFI_HTTP_PROTOCOL)
 	{
-		"HTTP",
+		NULL, "HTTP",
 		EFI_HTTP_PROTOCOL_GUID,
 	},
 	{
-		"HTTP Service Binding",
+		NULL, "HTTP Service Binding",
 		EFI_HTTP_SERVICE_BINDING_PROTOCOL_GUID,
 	},
 	{
-		"IPv4 Config2",
+		NULL, "IPv4 Config2",
 		EFI_IP4_CONFIG2_PROTOCOL_GUID,
 	},
 #endif
 	/* Configuration table GUIDs */
 	{
-		"ACPI table",
+		NULL, "ACPI table",
 		EFI_ACPI_TABLE_GUID,
 	},
 	{
-		"EFI System Resource Table",
+		NULL, "EFI System Resource Table",
 		EFI_SYSTEM_RESOURCE_TABLE_GUID,
 	},
 	{
-		"device tree",
+		NULL, "device tree",
 		EFI_FDT_GUID,
 	},
 	{
-		"SMBIOS table",
+		NULL, "SMBIOS table",
 		SMBIOS_TABLE_GUID,
 	},
 	{
-		"SMBIOS3 table",
+		NULL, "SMBIOS3 table",
 		SMBIOS3_TABLE_GUID,
 	},
 	{
-		"Runtime properties",
+		NULL, "Runtime properties",
 		EFI_RT_PROPERTIES_TABLE_GUID,
 	},
 	{
-		"TCG2 Final Events Table",
+		NULL, "TCG2 Final Events Table",
 		EFI_TCG2_FINAL_EVENTS_TABLE_GUID,
 	},
 	{
-		"EFI Conformance Profiles Table",
+		NULL, "EFI Conformance Profiles Table",
 		EFI_CONFORMANCE_PROFILES_TABLE_GUID,
 	},
 #ifdef CONFIG_EFI_RISCV_BOOT_PROTOCOL
 	{
-		"RISC-V Boot",
+		NULL, "RISC-V Boot",
 		RISCV_EFI_BOOT_PROTOCOL_GUID,
 	},
 #endif
@@ -247,35 +248,36 @@ static const struct {
 #ifdef CONFIG_CMD_NVEDIT_EFI
 	/* signature database */
 	{
-		"EFI_GLOBAL_VARIABLE_GUID",
+		NULL, "EFI_GLOBAL_VARIABLE_GUID",
 		EFI_GLOBAL_VARIABLE_GUID,
 	},
 	{
-		"EFI_IMAGE_SECURITY_DATABASE_GUID",
+		NULL, "EFI_IMAGE_SECURITY_DATABASE_GUID",
 		EFI_IMAGE_SECURITY_DATABASE_GUID,
 	},
 	/* certificate types */
 	{
-		"EFI_CERT_SHA256_GUID",
+		NULL, "EFI_CERT_SHA256_GUID",
 		EFI_CERT_SHA256_GUID,
 	},
 	{
-		"EFI_CERT_X509_GUID",
+		NULL, "EFI_CERT_X509_GUID",
 		EFI_CERT_X509_GUID,
 	},
 	{
-		"EFI_CERT_TYPE_PKCS7_GUID",
+		NULL, "EFI_CERT_TYPE_PKCS7_GUID",
 		EFI_CERT_TYPE_PKCS7_GUID,
 	},
 #endif
 #if defined(CONFIG_CMD_EFIDEBUG) || defined(CONFIG_EFI)
-	{ "EFI_LZMA_COMPRESSED", EFI_LZMA_COMPRESSED },
-	{ "EFI_DXE_SERVICES", EFI_DXE_SERVICES },
-	{ "EFI_HOB_LIST", EFI_HOB_LIST },
-	{ "EFI_MEMORY_TYPE", EFI_MEMORY_TYPE },
-	{ "EFI_MEM_STATUS_CODE_REC", EFI_MEM_STATUS_CODE_REC },
-	{ "EFI_GUID_EFI_ACPI1", EFI_GUID_EFI_ACPI1 },
+	{ NULL, "EFI_LZMA_COMPRESSED", EFI_LZMA_COMPRESSED },
+	{ NULL, "EFI_DXE_SERVICES", EFI_DXE_SERVICES },
+	{ NULL, "EFI_HOB_LIST", EFI_HOB_LIST },
+	{ NULL, "EFI_MEMORY_TYPE", EFI_MEMORY_TYPE },
+	{ NULL, "EFI_MEM_STATUS_CODE_REC", EFI_MEM_STATUS_CODE_REC },
+	{ NULL, "EFI_GUID_EFI_ACPI1", EFI_GUID_EFI_ACPI1 },
 #endif
+#endif /* EFI_PARTITION */
 #endif /* !USE_HOSTCC */
 };
 
@@ -284,7 +286,8 @@ int uuid_guid_get_bin(const char *guid_str, unsigned char *guid_bin)
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(list_guid); i++) {
-		if (!strcmp(list_guid[i].string, guid_str)) {
+		if (list_guid[i].string &&
+		    !strcmp(list_guid[i].string, guid_str)) {
 			memcpy(guid_bin, &list_guid[i].guid, 16);
 			return 0;
 		}
@@ -298,6 +301,8 @@ const char *uuid_guid_get_str(const unsigned char *guid_bin)
 
 	for (i = 0; i < ARRAY_SIZE(list_guid); i++) {
 		if (!memcmp(list_guid[i].guid.b, guid_bin, 16)) {
+			if (list_guid[i].description)
+				return list_guid[i].description;
 			return list_guid[i].string;
 		}
 	}
@@ -312,10 +317,9 @@ int uuid_str_to_bin(const char *uuid_str, unsigned char *uuid_bin,
 	uint64_t tmp64;
 
 	if (!uuid_str_valid(uuid_str)) {
-#ifdef CONFIG_PARTITION_TYPE_GUID
-		if (!uuid_guid_get_bin(uuid_str, uuid_bin))
+		if (IS_ENABLED(CONFIG_PARTITION_TYPE_GUID) &&
+		    !uuid_guid_get_bin(uuid_str, uuid_bin))
 			return 0;
-#endif
 		return -EINVAL;
 	}
 
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
