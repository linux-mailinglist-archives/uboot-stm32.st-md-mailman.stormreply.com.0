Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 315466B0202
	for <lists+uboot-stm32@lfdr.de>; Wed,  8 Mar 2023 09:50:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D536FC69067;
	Wed,  8 Mar 2023 08:50:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C65E3C65E42
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Mar 2023 08:50:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32870P9R019779; Wed, 8 Mar 2023 09:49:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=JViWDgpgLIZboDTc4b1qE+ISFZ2N2VBSXtHnm/2WTIM=;
 b=3GwxY8Li1xVc6d2IotTeZgoAtwHTA0vaCP4TYyH8b8V5+aA6LTxcVp1+d7PSsHhEeyB9
 WZOJCbjb2RjkWYTFJh2lujndA0lk7X/RFLeTYxIzMYOtAU0Gst+kNlobwdGvY0vAi9Bx
 kIHWLF4FESD7txgOXZm5iu6HrVF6JEQD3SB5mS+81F8CepuW4QOZnCPrcjNupXKF3c7A
 oPRjHoRAdsoPYx5nmK3i00ExC0qCIeE4kPddjxjuhkaNcRb6Sw56qOjPwk5bDTUO802i
 7JXnlYns/Qr2plxTKCkOfQMsjK5rmPqfnYTsiebLAfUvMQYasmYQqQ3Jgx9lLb4oifNX sA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3p6fdrjkxe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Mar 2023 09:49:58 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16A4E10002A;
 Wed,  8 Mar 2023 09:49:57 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3C4B210F82;
 Wed,  8 Mar 2023 09:49:56 +0100 (CET)
Received: from localhost (10.48.0.157) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Wed, 8 Mar
 2023 09:49:56 +0100
From: Patrick Delaunay <patrick.delaunay@foss.st.com>
To: <u-boot@lists.denx.de>
Date: Wed, 8 Mar 2023 09:49:54 +0100
Message-ID: <20230308094912.1.I852b2b0fb85539e986a45dcfaf765f92e0924536@changeid>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.48.0.157]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-08_04,2023-03-08_01,2023-02-09_01
Cc: Mikhail Ilin <ilin.mikhail.ol@gmail.com>, Simon Glass <sjg@chromium.org>,
 U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Stefan Roese <sr@denx.de>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
Subject: [Uboot-stm32] [PATCH] fs: ext4: check the minimal partition size to
	mount
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

No need to mount a too small partition to handle a EXT4 file system.

This patch add a test on partition size before to read the
SUPERBLOCK_SIZE buffer and avoid error latter in fs_devread() function.

Signed-off-by: Patrick Delaunay <patrick.delaunay@foss.st.com>
---
This patch avoids traces when EFI try to detect FS type on one GPT
partition with only one LBA (512 octetcs):

  fs_devread read outside partition 2
  Failed to mount ext2 filesystem..

FyleSytem type is searched by efi_disk_create_part() / efi_fs_exists()

Even if these traces are removed by commit f337fb9ea8b8 ("fs: Quieten down
the filesystems more"), if think it should be good to avoid to read
outside partition at the start of this function by a simple test.


 fs/ext4/ext4_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ext4/ext4_common.c b/fs/ext4/ext4_common.c
index f50de7c089e6..9a9c520e22ca 100644
--- a/fs/ext4/ext4_common.c
+++ b/fs/ext4/ext4_common.c
@@ -2373,6 +2373,10 @@ int ext4fs_mount(unsigned part_length)
 	struct ext2_data *data;
 	int status;
 	struct ext_filesystem *fs = get_fs();
+
+	if (part_length < SUPERBLOCK_SIZE)
+		return 0;
+
 	data = zalloc(SUPERBLOCK_SIZE);
 	if (!data)
 		return 0;
-- 
2.25.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
