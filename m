Return-Path: <uboot-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+uboot-stm32@lfdr.de
Delivered-To: lists+uboot-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 339402B4F1
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 May 2019 14:23:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2DC0C06B61
	for <lists+uboot-stm32@lfdr.de>; Mon, 27 May 2019 12:23:28 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C64EC5B65C
 for <uboot-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 May 2019 12:23:25 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4RCLbcb001507; Mon, 27 May 2019 14:23:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=VnelWbA6LXHbjZJTIep7AAa6pdMx5MHhhAPfhn5z/1I=;
 b=w9fOE8QbQkk9mOe32CaO0nODtWWjmB8JiMLjQKqVEDpDhwyzSIMXatDkOS/aGZq9lDzW
 1LuBkCNmlsWjF1e4WGajCHHCzeMvIjD7DdxsUaIyeuCSrt+e0BBpH82xFhmLEE4TbNeI
 7sahQZFI7cK3vZMecB9ZbHTgiOsFFnLCXaTQAxElm7PIqljDGuZOy5FHXISGNYdPjKIA
 zY20cn9nbmB5Zg/Mh0DfYVZvGxIbjHzViFBRT4neufgrPkJuIu64S1kVFRI3xiaI96TP
 OvxG38yGyfQVMPmF+O520B3HYJpP8DludCRv6mExOux8zoxweF1+PtLPESIWXzBDL8Nx Tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2spuftjv6m-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 27 May 2019 14:23:24 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3D9C31;
 Mon, 27 May 2019 12:23:23 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas23.st.com [10.75.90.46])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 99F252A57;
 Mon, 27 May 2019 12:23:23 +0000 (GMT)
Received: from SAFEX1HUBCAS21.st.com (10.75.90.45) by SAFEX1HUBCAS23.st.com
 (10.75.90.46) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May
 2019 14:23:23 +0200
Received: from localhost (10.201.23.25) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 27 May 2019 14:23:23
 +0200
From: Fabien Dessenne <fabien.dessenne@st.com>
To: Simon Glass <sjg@chromium.org>, Patrick Delaunay <patrick.delaunay@st.com>,
 Christophe Kerello <christophe.kerello@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, Andreas Dannenberg <dannenberg@ti.com>,
 Loic Pallardy <loic.pallardy@st.com>
Date: Mon, 27 May 2019 14:23:13 +0200
Message-ID: <1558959797-15299-4-git-send-email-fabien.dessenne@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558959797-15299-1-git-send-email-fabien.dessenne@st.com>
References: <1558959797-15299-1-git-send-email-fabien.dessenne@st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.23.25]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-27_07:, , signatures=0
Cc: uboot-stm32@st-md-mailman.stormreply.com, u-boot@lists.denx.de,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>,
 Fabien Dessenne <fabien.dessenne@st.com>
Subject: [Uboot-stm32] [PATCH v2 3/7] remoteproc: add device_to_virt ops
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

Introduce the device_to_virt function to allow translation between
device address (remote processor view) and virtual address (main
processor view).

Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
---
 include/remoteproc.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/remoteproc.h b/include/remoteproc.h
index aa90a67..aef6ff2 100644
--- a/include/remoteproc.h
+++ b/include/remoteproc.h
@@ -113,6 +113,18 @@ struct dm_rproc_ops {
 	 * @return 0 on success, 1 if not responding, -ve on other errors.
 	 */
 	int (*ping)(struct udevice *dev);
+
+	/**
+	 * device_to_virt() - Return translated virtual address (optional)
+	 *
+	 * Translate a device address (remote processor view) to virtual
+	 * address (main processor view).
+	 *
+	 * @dev:	Remote proc device
+	 * @da:		Device address
+	 * @return virtual address.
+	 */
+	void * (*device_to_virt)(struct udevice *dev, ulong da);
 };
 
 /* Accessor */
-- 
2.7.4

_______________________________________________
Uboot-stm32 mailing list
Uboot-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/uboot-stm32
