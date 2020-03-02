Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC001756A4
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 10:12:53 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8236C36B0A
	for <lists+uboot-stm32@lfdr.de>; Mon,  2 Mar 2020 09:12:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0D5FC36B09
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2020 09:12:50 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02297Yjn002473; Mon, 2 Mar 2020 10:12:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=b4CGAr6Dq5fwwqa4fn+dSzwh/ylkJF3GYzbwJesWj/o=;
 b=CTjFZNAiq670TL4nhYu7rrpjxTFEK90gjzhLiwZhpZ4WxlcjZWELK05S4l5+lKj0YPHC
 4E5AeRbQ9w2uKhH+ufDLx7bWQdihJSsBVb6hyjm2hrgvQAGMVMMdhhLGkAsU0o8/S4c+
 Bhxn/H1hTlAwDEbC6CJkqHVv1+qpXfpSDpEWRWriiRlZm9E8METNzDlGdBmLPXX4iGl3
 GYPZeH6HRmbXJYee77ZMuGzPkztc9Jz3G6bmYvmjMWiAj5k4bAhLzJTBoOx7FZURUfG7
 ovYe1bwXznv33rRb2tbtAxRMmeVlepGEcHkFEVRR3dmhQllXNZhSZgog1/homYVWd820 Ew== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2yfem0jdgr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 Mar 2020 10:12:47 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3D39310003A;
 Mon,  2 Mar 2020 10:12:44 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3220A2A8F56;
 Mon,  2 Mar 2020 10:12:44 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG6NODE3.st.com (10.75.127.18)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 2 Mar 2020 10:12:43 +0100
From: Patrick Delaunay <patrick.delaunay@st.com>
To: <u-boot@lists.denx.de>
Date: Mon, 2 Mar 2020 10:12:41 +0100
Message-ID: <20200302091241.10371-1-patrick.delaunay@st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG6NODE2.st.com (10.75.127.17) To SFHDAG6NODE3.st.com
 (10.75.127.18)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_02:2020-02-28,
 2020-03-02 signatures=0
Cc: U-Boot STM32 <uboot-stm32@st-md-mailman.stormreply.com>,
 Simon Glass <sjg@chromium.org>, Thomas Hebb <tommyhebb@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Patrick Delaunay <patrick.delaunay@st.com>
Subject: [Uboot-stm32] [PATCH] doc: spl: update reference to
	driver-model/README.txt
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

Update the reference in doc/README.SPL to a no more existing file:
"driver-model/README.txt", it is changed to "doc/driver-model/design.rst".

Adding the directory path /doc/ allows to check this reference with
'make refcheckdocs'.

Signed-off-by: Patrick Delaunay <patrick.delaunay@st.com>
---

 doc/README.SPL | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/doc/README.SPL b/doc/README.SPL
index 929b9672b0..2beb6d8f11 100644
--- a/doc/README.SPL
+++ b/doc/README.SPL
@@ -81,7 +81,7 @@ fdtgrep is also used to remove:
   ('u-boot,dm-pre-reloc', 'u-boot,dm-spl' and 'u-boot,dm-tpl')
 
 All the nodes remaining in the SPL devicetree are bound
-(see driver-model/README.txt).
+(see doc/driver-model/design.rst).
 
 Debugging
 ---------
-- 
2.17.1

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
