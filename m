Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EABE725F07
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 10:07:13 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B28BAC628C7
	for <lists+uboot-stm32@lfdr.de>; Wed, 22 May 2019 08:07:13 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B7256C628C1
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 May 2019 08:07:11 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4M86k0W002750; Wed, 22 May 2019 10:07:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=FizpfV3SWd/EEHWsr+yjXpu4IEOeXhHayqE0Dvi6cMU=;
 b=CnYhqaJNEi8i7guT7t3DgI1qNaCl6bHsWSOPy6Dj2MBSwvI6Myw5QrwcQWLNxOloycfq
 Q3uFliWZnjZH0rxlGvk29DtEFZ6KX/PFiL/bwAbPKz2yIh9TDMxmOQKT2q9dlViAUCUi
 +dNEjmhIdhnh7DFuHUJQnIO8yp29ciRqs1UfDVVV3nS9vn90uD8Vbg8lguOCuhduNuKs
 kkDBybuF4kXRS3n1wbZmbsmicxNrV+GO9QIrFhRlL4NIuw9fH3p3pWuUiQMGq7ndLENW
 K6srWwiCGAn0Otf9wjCExl6oYk5PScApspvf/wBC+TGFuJfVZtevjf8ng9EeJXUnPYQC 1Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sj77477q9-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 22 May 2019 10:07:10 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B23441;
 Wed, 22 May 2019 08:07:09 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas24.st.com [10.75.90.94])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 031A318B2;
 Wed, 22 May 2019 08:07:09 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.44) by Safex1hubcas24.st.com
 (10.75.90.94) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May
 2019 10:07:08 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 22 May 2019 10:07:08
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Wed, 22 May 2019 10:06:45 +0200
Message-ID: <1558512409-32376-4-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
References: <1558512409-32376-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-22_03:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH 3/7] remoteproc: add da_to_pa ops
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

This patch introduces da_to_pa function to allow translation
between device address (remote processor view) and physical
address (main processor view).

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 include/remoteproc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/remoteproc.h b/include/remoteproc.h
index a59dba8..58df11a 100644
--- a/include/remoteproc.h
+++ b/include/remoteproc.h
@@ -63,6 +63,8 @@ struct dm_rproc_uclass_pdata {
  *		Return 0 on success, 1 if not running, -ve on others errors
  * @ping:	Ping the remote device for basic communication check(optional)
  *		Return 0 on success, 1 if not responding, -ve on other errors
+ * @da_to_pa:   Return translated physical address (device address different
+ *              from physical address)
  */
 struct dm_rproc_ops {
 	int (*init)(struct udevice *dev);
@@ -72,6 +74,7 @@ struct dm_rproc_ops {
 	int (*reset)(struct udevice *dev);
 	int (*is_running)(struct udevice *dev);
 	int (*ping)(struct udevice *dev);
+	ulong (*da_to_pa)(struct udevice *dev, ulong da);
 };
 
 /* Accessor */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
