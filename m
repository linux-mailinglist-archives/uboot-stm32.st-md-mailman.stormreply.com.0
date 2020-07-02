Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 07503212B9E
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 19:53:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B9DAEC36B26
	for <lists+uboot-stm32@lfdr.de>; Thu,  2 Jul 2020 17:53:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5CF98C36B24
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jul 2020 17:53:00 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062HmxPT020088; Thu, 2 Jul 2020 19:52:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=Ly12g8/pk9IyF3omU0QE6HgklQS3IUiBYa3FVMQolag=;
 b=vDOyARriWfOQYpGqAPWhdd7qG+B3aZv+TQ3cQqkgxFemYDD06Jo5ex3VoIuxabsPNzPV
 7ozRnUH7xgeVKY+dVnDXBeOrp3EPxi9oWz7hvuCT1yBKBRYlDlWw447pRSHirFd+2Pxx
 UwAez8f6odeEfKUsbEn8WjSJuEx4MoYmSQoHFQ1jazGaenoETv+NYGowZLc0Ga3oEyx1
 aSTE2QNGSI4mg+4reMVRG3EqoGMWD1BInsFNJPV/HRdbFfhwrz2dxnlfbzHXsLBZRIcF
 if17PdE+EjpVMXbCzugzSf3H8UcXIVcUHY8dlLS7jPEBVDV1iRCwk6yDJZuDxd2iUz3U Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31ww0ghp4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 19:52:57 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9954610002A;
 Thu,  2 Jul 2020 19:52:56 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DE682C38D0;
 Thu,  2 Jul 2020 19:52:56 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 2 Jul 2020 19:52:56 +0200
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Thu, 2 Jul 2020 19:52:54 +0200
Message-ID: <20200702175254.22954-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG7NODE1.st.com (10.75.127.19) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] Add information for skipped commit options
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

The unsupported Commit-xxx option are silently skipped
and removed as 're_remove=Commit-\w*', this patch adds
warning message in this case to detect misspelled issue
for the 2 supported options:
  Commit-notes:
  Commit-changes:

For example: the final 's' is missing (Commit-note:)

NB: no issue for Series-xxx option as only the supported
    options are accepted (see valid_series in series.py)

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 tools/patman/patchstream.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/patman/patchstream.py b/tools/patman/patchstream.py
index a575c09b47..7efab8c2dd 100644
--- a/tools/patman/patchstream.py
+++ b/tools/patman/patchstream.py
@@ -342,6 +342,9 @@ class PatchStream:
             elif name == 'changes':
                 self.in_change = 'Commit'
                 self.change_version = self.ParseVersion(value, line)
+            else:
+                self.warn.append('Line %d: Ignoring Commit-%s' %
+                    (self.linenum, name))
 
         # Detect the start of a new commit
         elif commit_match:
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
