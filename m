Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 637C6ADAE78
	for <lists+uboot-stm32@lfdr.de>; Mon, 16 Jun 2025 13:29:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17D29C36B17;
	Mon, 16 Jun 2025 11:29:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 072B9C36B12
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Jun 2025 11:29:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GBBdxB024543;
 Mon, 16 Jun 2025 13:29:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 eTNAD0o0p8VuKcqxv1CmwbtvqaQcZN/sMNQeQzVuNlM=; b=iO8M75BuN1C7K1Wk
 W62HlPhRhKQ6biLbtxxTiO88R7NKMdyDnpszmhfHJYVjOD/6YWb72/fYlLlotQ8O
 jojRheWNxndRGziwU8aWDoak4SCq6EDyZPs4/XHclk8OSroEsVuCQMbtK8QzYXnu
 i0+b3l7TEpOzwBC1/ADwgMmhdJqf6CZ04zJfNwb7j/gdumAZMz+6ahnvI5qFgKrd
 S4WKduNS7zu6TSIAvz4+Yi/8twCXJKx47VL9Sqt1/FZHVoV7bwkVcHhMTWSARWnH
 UVZP/bRi3UUPg1jevP+Q6ZXMEaXhyxMAJM3wtcj7i25N0YfCo92kDYSDPScvKXXy
 WRrYOw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47afw1gy23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Jun 2025 13:29:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C16B940057;
 Mon, 16 Jun 2025 13:28:23 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3996CAFAC2F;
 Mon, 16 Jun 2025 13:27:56 +0200 (CEST)
Received: from localhost (10.48.86.182) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 13:27:55 +0200
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 16 Jun 2025 13:27:48 +0200
Message-ID: <20250616112749.17311-2-patrick.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616112749.17311-1-patrick.delaunay@foss.st.com>
References: <20250616112749.17311-1-patrick.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.182]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_05,2025-06-13_01,2025-03-28_01
Cc: Tom Rini <trini@konsulko.com>, caleb.connolly@linaro.org,
 jerome.forissier@linaro.org, ilias.apalodimas@linaro.org,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>
Subject: [Uboot-stm32] [PATCH v4 2/3] doc: cmd: gpt: add information on type
	partition
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

Add information on type partition, copied from README.gpt.

I also correct issue for gpt_parts variable and add example of
"gpt read" usage.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---

(no changes since v1)

 doc/usage/cmd/gpt.rst | 93 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 84 insertions(+), 9 deletions(-)

diff --git a/doc/usage/cmd/gpt.rst b/doc/usage/cmd/gpt.rst
index 8534f78cbac0..13e8783be9b8 100644
--- a/doc/usage/cmd/gpt.rst
+++ b/doc/usage/cmd/gpt.rst
@@ -54,7 +54,7 @@ partition string
 
     * name=<NAME> - The partition name, required
     * start=<BYTES> - The partition start offset in bytes, required
-    * size=<BYTES> - The partition size in bytes or "-" to expand it to the whole free area
+    * size=<BYTES> - The partition size in bytes or "-" for the last partition to expand it to the whole free area
     * bootable - Set the legacy bootable flag
     * uuid=<UUID> - The partition UUID, optional if CONFIG_RANDOM_UUID=y is enabled
     * type=<UUID> - The partition type GUID, requires CONFIG_PARTITION_TYPE_GUID=y
@@ -63,6 +63,23 @@ partition string
     If 'uuid' is not specified, but CONFIG_RANDOM_UUID is enabled, a random UUID
     will be generated for the partition
 
+    If 'type' is not specified or without CONFIG_PARTITION_TYPE_GUID=y,
+    the used partition type GUID is PARTITION_BASIC_DATA_GUID.
+
+    Some strings can be also used at the place of the known partition type GUID:
+	* "mbr" = LEGACY_MBR_PARTITION_GUID (024DEE41-33E7-11D3-9D69-0008C781F39F)
+	* "msft" = PARTITION_MSFT_RESERVED_GUID (E3C9E316-0B5C-4DB8-817D-F92DF00215AE)
+	* "data" = PARTITION_BASIC_DATA_GUID (EBD0A0A2-B9E5-4433-87C0-68B6B72699C7)
+	* "linux" = PARTITION_LINUX_FILE_SYSTEM_DATA_GUID (0FC63DAF-8483-4772-8E79-3D69D8477DE4)
+	* "raid" = PARTITION_LINUX_RAID_GUID (A19D880F-05FC-4D3B-A006-743F0F84911E)
+	* "swap" = PARTITION_LINUX_SWAP_GUID (0657FD6D-A4AB-43C4-84E5-0933C84B4F4F)
+	* "lvm" = PARTITION_LINUX_LVM_GUID (E6D6D379-F507-44C2-A23C-238F2A3DF928)
+	* "u-boot-env" = PARTITION_U_BOOT_ENVIRONMENT(3DE21764-95BD-54BD-A5C3-4ABE786F38A8)
+	* "system" = PARTITION_SYSTEM_GUID (C12A7328-F81F-11D2-BA4B-00A0C93EC93B)
+
+    The GPT partitions layout and associated 'type' are also printed with the
+    :doc:`part command <part>` command by typing "part list".
+
 gpt enumerate
 ~~~~~~~~~~~~~
 
@@ -162,16 +179,17 @@ Examples
 
 Create 6 partitions on a disk::
 
-    => setenv gpt_parts 'uuid_disk=bec9fc2a-86c1-483d-8a0e-0109732277d7;
-        name=boot,start=4M,size=128M,bootable,type=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7,
-        name=rootfs,size=3072M,type=0fc63daf-8483-4772-8e79-3d69d8477de4;
-        name=system-data,size=512M,type=0fc63daf-8483-4772-8e79-3d69d8477de4;
-        name=[ext],size=-,type=0fc63daf-8483-4772-8e79-3d69d8477de4;
-        name=user,size=-,type=0fc63daf-8483-4772-8e79-3d69d8477de4;
-        name=modules,size=100M,type=0fc63daf-8483-4772-8e79-3d69d8477de4;
-        name=ramdisk,size=8M,type=0fc63daf-8483-4772-8e79-3d69d8477de4
+    => setenv gpt_parts 'uuid_disk=bec9fc2a-86c1-483d-8a0e-0109732277d7;\
+    name=boot,start=4M,size=128M,bootable,type=ebd0a0a2-b9e5-4433-87c0-68b6b72699c7;\
+    name=rootfs,size=3072M,type=0fc63daf-8483-4772-8e79-3d69d8477de4;\
+    name=system-data,size=512M,type=0fc63daf-8483-4772-8e79-3d69d8477de4;\
+    name=user,size=512M,type=0fc63daf-8483-4772-8e79-3d69d8477de4;\
+    name=modules,size=100M,type=0fc63daf-8483-4772-8e79-3d69d8477de4;\
+    name=ramdisk,size=8M,type=0fc63daf-8483-4772-8e79-3d69d8477de4;\
+    name=[ext],size=-,type=0fc63daf-8483-4772-8e79-3d69d8477de4'
     => gpt write mmc 0 $gpt_parts
 
+Last partition "[ext]" with '-' is extended up to the end of the disk
 
 Verify that the device matches the partition layout described in the variable
 $gpt_parts::
@@ -228,3 +246,60 @@ Swap the order of the 'boot' and 'rootfs' partition table entries::
     => gpt setenv mmc 0 boot
     => echo ${gpt_partition_entry}
     2
+
+Other example: a disk with known partition types::
+
+    => setenv gpt_parts 'name=u-boot,size=32M,type=data;\
+    name=env,size=1M,type=u-boot-env;
+    name=ESP,size=128M,type=system;
+    name=rootfs,size=3072M,type=linux;
+    name=swap,size=100M,type=swap;
+    name=user,size=-,type=linux'
+    => gpt write mmc 0 $gpt_parts
+
+    => part list mmc 0
+    Partition Map for mmc device 0  --   Partition Type: EFI
+    Part	Start LBA	End LBA		Name
+    	Attributes
+    	Type GUID
+    	Partition GUID
+    1	0x00000022	0x00010021	"u-boot"
+    	attrs:	0x0000000000000000
+    	type:	ebd0a0a2-b9e5-4433-87c0-68b6b72699c7
+    		(data)
+    	guid:	502d48f6-81c0-488f-bdc0-ad602498f3ce
+      2	0x00010022	0x00010821	"env"
+    	attrs:	0x0000000000000000
+    	type:	3de21764-95bd-54bd-a5c3-4abe786f38a8
+    		(u-boot-env)
+    	guid:	9dc62338-459a-485e-bd8f-b3fbf728d9c0
+      3	0x00010822	0x00050821	"ESP"
+    	attrs:	0x0000000000000000
+    	type:	c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+    		(EFI System Partition)
+    	guid:	8a3a1168-6af8-4ba7-a95d-9cd0d14e1b3d
+      4	0x00050822	0x00650821	"rootfs"
+    	attrs:	0x0000000000000000
+    	type:	0fc63daf-8483-4772-8e79-3d69d8477de4
+    		(linux)
+    	guid:	411ffebc-8a19-469d-99a9-0982409a6851
+      5	0x00650822	0x00682821	"swap"
+    	attrs:	0x0000000000000000
+    	type:	0657fd6d-a4ab-43c4-84e5-0933c84b4f4f
+    		(swap)
+    	guid:	f8ec0410-95ec-4e3e-8b98-fb8cf271a201
+      6	0x00682822	0x01dacbde	"user"
+    	attrs:	0x0000000000000000
+    	type:	0fc63daf-8483-4772-8e79-3d69d8477de4
+    		(linux)
+    	guid:	c5543e1c-566d-4502-99ad-20545007e673
+
+Modifying GPT partition layout from U-Boot::
+
+    => gpt read mmc 0 current_partitions
+    => env edit current_partitions
+        edit: uuid_disk=[...];name=part1,start=0x4000,size=0x4000,uuid=[...];
+        name=part2,start=0xc000,size=0xc000,uuid=[...];[ . . . ]
+
+    => gpt write mmc 0 $current_partitions
+    => gpt verify mmc 0 $current_partitions
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
