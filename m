Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4C514BAE8
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 15:42:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 820BFC36B0A
	for <lists+uboot-stm32@lfdr.de>; Tue, 28 Jan 2020 14:42:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4E92DC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jan 2020 14:42:24 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00SESbvK013015; Tue, 28 Jan 2020 15:42:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=EBkRCegPz0Sg3vufmdeXtUbBweiwSk0FnCReEWCSZEQ=;
 b=vguM8ToO+3/A8dMYt1TcwuTppeBjOwZ7TKYRiCFZf+ECovHX3wpujIaMnMTVzt7qX8ZS
 u2oYwU9gmRtSNOej7NgK/SvTmgrfytLfI64EixLjXnJhvEHqEyfWwaT60roQGYxcD2wQ
 fTncpo2WBr9cjPory40C3JMWoVvzkm6xN3fnj4fwi5sJ57Z/EboU7fXL8a9YpBCvHMlY
 83ifhxieJGAZcPN6n/5gcp4hHr2yY4633If6iPqg552nBtnwrESAVYqoM3ZK799qHsGS
 /hG9i4yxrd19WnccnZv4EV2iUJ1HFriYn8LBsf0xLf/j12KKJH+NlupD9HpJ82PvyOd+ 2A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xrdekebt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jan 2020 15:42:21 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8DED7100038;
 Tue, 28 Jan 2020 15:42:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 616F6220921;
 Tue, 28 Jan 2020 15:42:16 +0100 (CET)
Received: from localhost (10.75.127.50) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jan 2020 15:42:15 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Tue, 28 Jan 2020 15:42:13 +0100
Message-ID: <20200128144214.23838-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG6NODE3.st.com (10.75.127.18) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-28_03:2020-01-28,
 2020-01-28 signatures=0
Cc: Antonio Borneo <antonio.borneo@st.com>,
 uboot-stm32@st-md-mailman.stormreply.com,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] tools: mkimage: fix STM32 image format for
	big endian hosts
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

From: Antonio Borneo <antonio.borneo@st.com>

Two header fields are not properly converted to little endian
before assignment, resulting in incorrect header while executing
mkimage on big endian hosts.

Convert the value of the header fields image_checksum and
edcsa_algorithm to little endian before the assignment.

Signed-off-by: Antonio Borneo <antonio.borneo@st.com>
Reviewed-by: Patrick DELAUNAY <patrick.delaunay@st.com>
Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 tools/stm32image.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/stm32image.c b/tools/stm32image.c
index ff3ec5f3f2..18357c0518 100644
--- a/tools/stm32image.c
+++ b/tools/stm32image.c
@@ -45,7 +45,7 @@ static void stm32image_default_header(struct stm32_header *ptr)
 	ptr->magic_number = HEADER_MAGIC;
 	ptr->header_version[VER_MAJOR_IDX] = HEADER_VERSION_V1;
 	ptr->option_flags = HEADER_DEFAULT_OPTION;
-	ptr->ecdsa_algorithm = 1;
+	ptr->ecdsa_algorithm = cpu_to_le32(1);
 	ptr->binary_type = HEADER_TYPE_UBOOT;
 }
 
@@ -131,7 +131,8 @@ static void stm32image_set_header(void *ptr, struct stat *sbuf, int ifd,
 	stm32hdr->image_entry_point = cpu_to_le32(params->ep);
 	stm32hdr->image_length = cpu_to_le32((uint32_t)sbuf->st_size -
 					     sizeof(struct stm32_header));
-	stm32hdr->image_checksum = stm32image_checksum(ptr, sbuf->st_size);
+	stm32hdr->image_checksum =
+		cpu_to_le32(stm32image_checksum(ptr, sbuf->st_size));
 }
 
 /*
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
