Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B03A7212AD9
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 19:08:59 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBCE7C36B26
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 17:08:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9F518C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 17:08:57 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062H5LM1031083; Thu, 2 Jul 2020 19:08:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=yuucvNAG+MdRYMUq2xkitHb7/9EhKF0YXFXioUBsvsY=;
 b=IJ4H8BGzjfzaFsIPlZgPlOziw+BCoGWnCEB3V3X04T8iifHdD3jfW11k/mz0b1tnRVWZ
 tQM4u/SlPaq19VSrru3fdAYp6ASvd0Mk+R/Ip026/52PKKlvRGKcLo6ro8YLO36TAszK
 +YintLT+9hBzN4+2Skr/4+S3RbsHKrE2UR3mvd58lPwjm/N+/AISFXmKI7AjYo9C5DRq
 gpaGRoyk6uKQOqcH+xfDd0vMZ8yRTRHo8WcRYUe2xdHaqO/Jn9+lSEGgzyr76neSJqo9
 taGpIicgkBCmBrspaXTxsf4eWY40yw8KfIIgHhSSrAn+aDhFO6IPA1e7bfPRLOLIDV6e 1g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31wu8a1uu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 19:08:53 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0A4B010002A;
 Thu,  2 Jul 2020 19:08:53 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3DDF2CA5D0;
 Thu,  2 Jul 2020 19:08:52 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 2 Jul 2020 19:08:52 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Jul 2020 19:08:24 +0200
Message-ID: <20200702170824.16293-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] patman: Detect unexpected END
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

Detect unexpected 'END' line when a section is not detected.

This patch detect issue when tag name for section start is misspelled,
for example 'Commit-note:' for 'Commit-notes:'

  Commit-note:
  ....
  END

Then 'Commit-note:' is removed silently by re_remove = "Commit-\w*:"
but 'END' is kept in commit message.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 tools/patman/patchstream.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/patman/patchstream.py b/tools/patman/patchstream.py
index 4fe465e9ab..a575c09b47 100644
--- a/tools/patman/patchstream.py
+++ b/tools/patman/patchstream.py
@@ -260,6 +260,10 @@ class PatchStream:
             else:
                 self.section.append(line)
 
+        # If we are not in a section, it is an unexpected END
+        elif line == 'END':
+                raise ValueError("'END' wihout section")
+
         # Detect the commit subject
         elif not is_blank and self.state == STATE_PATCH_SUBJECT:
             self.commit.subject = line
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
